package com.rainbow.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rainbow.dao.UniqueIdDAO;
import com.rainbow.entity.UniqueId;

/**
 * 
 * @author STerOtto
 * @version 2014-6-28 23:29:20 用于生成cp_id 和 app_id 的单例
 * 
 */

public class IdGenerator
{
	/**
	 * The priority of log level increases from top to bottom, a log priority is
	 * set to filter the logs with less priority than the setting one.
	 * logger.debug(""); logger.info(""); logger.warn(""); logger.error("");
	 * logger.fatal("");
	 */
	private static final Log logger = LogFactory.getLog(IdGenerator.class);
	private static final String CP_ID_SEED_NAME = "cp_id_seed";
	private static final int CP_ID_LENGTH = 8;
	private static final long PERSIST_INTERVAL = 600000;	//persist every 10 mins
	private class PersistTask implements Runnable
	{
		@Override
		public void run()
		{
			update();
		}
	}
	
	private static final IdGenerator _instance;
	
	static
	{
		_instance = new IdGenerator();
	}

	public static IdGenerator getInstance()
	{
		return _instance;
	}

	private AtomicLong _cpIdSeed;
	private ReentrantLock _mapLock;
	private Map<String, AtomicLong> _appIdSeedMap;

	private UniqueIdDAO _uniqueIdDAO; // cp_id
	private ScheduledFuture<?>	_future;

	/**
	 * 构造函数
	 */
	private IdGenerator()
	{
		_mapLock = new ReentrantLock();
		_appIdSeedMap = new HashMap<String, AtomicLong>();// _appIdSeedMap初始化
	}

	/**
	 * 初始化_cpIdSeed和_appIdSeedMap
	 */
	public void initialize(Object uniqueIdDAO)
	{
		_uniqueIdDAO = (UniqueIdDAO) uniqueIdDAO;

		UniqueId cpIdSeedEntity = _uniqueIdDAO.findByName(CP_ID_SEED_NAME);
		if (cpIdSeedEntity == null)
		{
			cpIdSeedEntity = new UniqueId();
			cpIdSeedEntity.setName(CP_ID_SEED_NAME);
			cpIdSeedEntity.setValue(0L);
			_uniqueIdDAO.save(cpIdSeedEntity);
		}
		_cpIdSeed = new AtomicLong(cpIdSeedEntity.getValue());
		logger.info(String.format("Initialize cpIdSeed to %d", _cpIdSeed.get()));

		UniqueId adminAppId = _uniqueIdDAO.findByName("00000000");
		if (adminAppId == null)
		{
			// 如果没有为管理员生成一个种子则为管理员生成一个种子
			adminAppId = new UniqueId();
			adminAppId.setName("00000000");
			adminAppId.setValue(0L);
			_uniqueIdDAO.save(adminAppId);
		}

		List<UniqueId> appIdList = _uniqueIdDAO.findAll();
		for (UniqueId appIdEntity : appIdList)
		{
			if (appIdEntity.getName() != null && appIdEntity.getName().length() == CP_ID_LENGTH)
			{
				_appIdSeedMap.put(appIdEntity.getName(),
						new AtomicLong(appIdEntity.getValue()));
			}
		}
		
		_future = Scheduler.getInstance().scheduleAtFixedRate(new PersistTask(), PERSIST_INTERVAL, PERSIST_INTERVAL, TimeUnit.MILLISECONDS);
	}

	/**
	 * 获取下一个cp_id 并且为新的cp存入一个初始化种子 并且将cp_id的种子跟新
	 * 
	 * @return
	 */
	public String getNextCpId()
	{
		long cpIdSeed = _cpIdSeed.incrementAndGet();
		return String.format("%08d", cpIdSeed);
	}

	/**
	 * 获取下一个app_id
	 * 
	 * @param cpId
	 * @return
	 */
	public String getNextAppId(String cpId)
	{
		String result = null;
		try
		{
			_mapLock.lock();
		
			if (!_appIdSeedMap.containsKey(cpId))
			{
				// 如果_appIdSeedMap中不包含cpId则新建一个app_id
				_appIdSeedMap.put(cpId, new AtomicLong(0));
				UniqueId appIdSeedNew = new UniqueId();
				appIdSeedNew.setName(cpId);
				appIdSeedNew.setValue(0L);
				_uniqueIdDAO.save(appIdSeedNew);
			}
			long appIdSeedNum = _appIdSeedMap.get(cpId).incrementAndGet();
			result = String.format("%04d", appIdSeedNum);
		}
		finally
		{
			_mapLock.unlock();
		}
		return result;
	}

	/**
	 * 跟新数据库中的种子
	 */
	public void destroy()
	{
		_future.cancel(false);
		update();
	}
	
	private void update()
	{
		try
		{
			_mapLock.lock();
			
			// persist
			for (Entry<String, AtomicLong> entry : _appIdSeedMap.entrySet())// 跟新app_id种子
			{
				UniqueId appIdSeed = _uniqueIdDAO.findByName(entry.getKey());
				if (appIdSeed != null)
				{
					// 数据库中有，更新app_id的种子
					appIdSeed.setValue(entry.getValue().get());
					_uniqueIdDAO.update(appIdSeed);
					logger.info(String.format("Update appIdSeed=%d for %s", entry.getValue().get(), entry.getKey()));
				}
				else
				{
					appIdSeed = new UniqueId();
					appIdSeed.setName(entry.getKey());
					// 数据库中没有，保存新的app_id的种子
					appIdSeed.setValue(entry.getValue().get());
					_uniqueIdDAO.save(appIdSeed);
					logger.info(String.format("Save appIdSeed=%d for %s", entry.getValue().get(), entry.getKey()));
				}
			}

			UniqueId cpIdSeedEntity = _uniqueIdDAO.findByName(CP_ID_SEED_NAME);
			if (cpIdSeedEntity == null)
			{
				cpIdSeedEntity = new UniqueId();
				cpIdSeedEntity.setName(CP_ID_SEED_NAME);
				cpIdSeedEntity.setValue(_cpIdSeed.get());
				_uniqueIdDAO.save(cpIdSeedEntity);
				logger.info(String.format("Save cpIdSeed=%d", _cpIdSeed.get()));
			}
			else
			{
				cpIdSeedEntity.setValue(_cpIdSeed.get());
				_uniqueIdDAO.update(cpIdSeedEntity);
				logger.info(String.format("Update cpIdSeed=%d", _cpIdSeed.get()));
			}
		}
		finally
		{
			_mapLock.unlock();
		}
	}
}
