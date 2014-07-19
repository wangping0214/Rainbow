package com.rainbow.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicLong;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rainbow.dao.UniqueIdDAO;
import com.rainbow.entity.UniqueId;

/**
 * 
 * @author STerOtto
 * @version 2014-6-28 23:29:20 ��������cp_id �� app_id �ĵ���
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
	private Map<String, AtomicLong> _appIdSeedMap;

	private UniqueIdDAO _uniqueIdDAO; // cp_id

	/**
	 * ���캯��
	 */
	private IdGenerator()
	{
		_appIdSeedMap = new HashMap<String, AtomicLong>();// _appIdSeedMap��ʼ��
	}

	/**
	 * ��ʼ��_cpIdSeed��_appIdSeedMap
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
			// ���û��Ϊ����Ա����һ��������Ϊ����Ա����һ������
			adminAppId = new UniqueId();
			adminAppId.setName("00000000");
			adminAppId.setValue(0L);
			_uniqueIdDAO.save(adminAppId);
		}

		List<UniqueId> appIdList = _uniqueIdDAO.findAll();
		for (UniqueId appIdEntity : appIdList)
		{
			_appIdSeedMap.put(appIdEntity.getName(),
					new AtomicLong(appIdEntity.getValue()));
		}
	}

	/**
	 * ��ȡ��һ��cp_id ����Ϊ�µ�cp����һ����ʼ������ ���ҽ�cp_id�����Ӹ���
	 * 
	 * @return
	 */
	public String getNextCpId()
	{
		long cpIdSeed = _cpIdSeed.incrementAndGet();
		return String.format("%08d", cpIdSeed);
	}

	/**
	 * ��ȡ��һ��app_id
	 * 
	 * @param cpId
	 * @return
	 */
	public String getNextAppId(String cpId)
	{
		if (!_appIdSeedMap.containsKey(cpId))
		{
			// ���_appIdSeedMap�в�����cpId���½�һ��app_id
			_appIdSeedMap.put(cpId, new AtomicLong(0));
			UniqueId appIdSeedNew = new UniqueId();
			appIdSeedNew.setName(cpId);
			appIdSeedNew.setValue(0L);
			_uniqueIdDAO.save(appIdSeedNew);
		}
		long appIdSeedNum = _appIdSeedMap.get(cpId).incrementAndGet();
		return String.format("%04d", appIdSeedNum);
	}

	/**
	 * �������ݿ��е�����
	 */
	public void destroy()
	{

		// persist
		for (Entry<String, AtomicLong> entry : _appIdSeedMap.entrySet())// ����app_id����
		{
			UniqueId appIdSeed = _uniqueIdDAO.findByName(entry.getKey());
			if (appIdSeed != null)
			{
				// ���ݿ����У���Ϊ���� ��������µ�app_id������
				appIdSeed.setValue(entry.getValue().get());
				_uniqueIdDAO.update(appIdSeed);
			}
			else
			{
				appIdSeed = new UniqueId();
				appIdSeed.setName(entry.getKey());
				// ���ݿ����У���Ϊ���� ��������µ�app_id������
				appIdSeed.setValue(entry.getValue().get());
				_uniqueIdDAO.save(appIdSeed);
			}
		}

		UniqueId cpIdSeedEntity = _uniqueIdDAO.findByName(CP_ID_SEED_NAME);
		if (cpIdSeedEntity == null)
		{
			cpIdSeedEntity = new UniqueId();
			cpIdSeedEntity.setName(CP_ID_SEED_NAME);
			cpIdSeedEntity.setValue(0L);
			_uniqueIdDAO.save(cpIdSeedEntity);
		}
		cpIdSeedEntity.setValue(_cpIdSeed.get());
		_uniqueIdDAO.update(cpIdSeedEntity);
		logger.info(String.format("Persist cpIdSeed with %d", _cpIdSeed.get()));
	}
}
