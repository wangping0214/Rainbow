package com.rainbow.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicLong;




import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.rainbow.dao.AppIdSeedDAO;
import com.rainbow.dao.CpIdSeedDAO;
import com.rainbow.entity.AppIdSeed;
import com.rainbow.entity.CpIdSeed;

/**
 * 
 * @author STerOtto
 * @version 2014-6-28 23:29:20
 * ��������cp_id �� app_id �ĵ���
 *
 */

public class IdGenerator 
{
	/**
	 * The priority of log level increases from top to bottom,
	 * a log priority is set to filter the logs with less priority
	 * than the setting one.
	 * logger.debug("");
	 * logger.info("");
	 * logger.warn("");
	 * logger.error("");
	 * logger.fatal("");
	 */
	private static final Log logger = LogFactory.getLog(IdGenerator.class);
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
	
	private CpIdSeedDAO cpIdSeedDAO;	//cp_id
	private AppIdSeedDAO appIdSeedDAO;	//app_id
	
	private CpIdSeed _cpIdSeedEntity = new CpIdSeed();
	//private AppIdSeed appIdSeed = new AppIdSeed();
	
	/**
	 * ���캯��
	 */
	private IdGenerator()
	{
		
	}
	
	

	/**
	 * ��ʼ��_cpIdSeed��_appIdSeedMap
	 */
	public void initialize(Object cpIdSeedDAO,Object appIdSeedDAO)
	{
		this.cpIdSeedDAO = (CpIdSeedDAO) cpIdSeedDAO;
		this.appIdSeedDAO = (AppIdSeedDAO) appIdSeedDAO;
		//fetch
		List<CpIdSeed> cpId = this.cpIdSeedDAO.findAll();//�����ݿ���ȡ������
		if(cpId.size()==0){							//��cp_id������Ϊ�գ����¼�һ������
			_cpIdSeedEntity.setCpIdSeed(0);
			this.cpIdSeedDAO.save(_cpIdSeedEntity);
		}
		else
		{
			_cpIdSeedEntity = cpId.get(0);
		}
		_cpIdSeed = new AtomicLong(_cpIdSeedEntity.getCpIdSeed());
		logger.info(String.format("Initialize cpIdSeed to %d", _cpIdSeed.get()));
		
		_appIdSeedMap = new HashMap<String, AtomicLong>();//_appIdSeedMap��ʼ��
		AppIdSeed admin = this.appIdSeedDAO.findByName("00000000");
		if(admin==null){//���û��Ϊ����Ա����һ��������Ϊ����Ա����һ������
			admin = new AppIdSeed();
			admin.setName("00000000");
			admin.setAppIdSeed(0);
			this.appIdSeedDAO.sava(admin);
		}
		List<AppIdSeed> appId = this.appIdSeedDAO.findAll();
		System.out.println("appId.size()"+appId.size());
		for(int i=0;i<appId.size();i++){			//_appIdSeedMap�����ݿ��е�app_id���Ӵ���_appIdSeedMap
			long appIdSeed = appId.get(i).getAppIdSeed();
			_appIdSeedMap.put(appId.get(i).getName(), new AtomicLong(appIdSeed));
		}
		
	}
	
	/**
	 * ��ȡ��һ��cp_id
	 * ����Ϊ�µ�cp����һ����ʼ������
	 * ���ҽ�cp_id�����Ӹ���
	 * @return
	 */
	public String getNextCpId()
	{
		long cpIdSeed = _cpIdSeed.incrementAndGet();
		
		AppIdSeed appIdSeed = new AppIdSeed();
		appIdSeed.setName(String.format("%08d", cpIdSeed));
		appIdSeed.setAppIdSeed(0);
		appIdSeedDAO.sava(appIdSeed);
		return String.format("%08d", cpIdSeed);
	}
	
	/**
	 * ��ȡ��һ��app_id
	 * @param cpId
	 * @return
	 */
	public String getNextAppId(String cpId)
	{
		if(!_appIdSeedMap.containsKey(cpId)){//���_appIdSeedMap�в�����cpId���½�һ��app_id
			_appIdSeedMap.put(cpId, new AtomicLong(0));
			AppIdSeed appIdSeedNew = new AppIdSeed();
			appIdSeedNew.setName(cpId);
			appIdSeedNew.setAppIdSeed(0);
			this.appIdSeedDAO.sava(appIdSeedNew);
		}
		long appIdSeedNum = _appIdSeedMap.get(cpId).incrementAndGet();
		return String.format("%04d",appIdSeedNum);	
	}
	
	/**
	 * �������ݿ��е�����
	 */
	public void destroy()
	{
		
		//persist
		for (Entry<String, AtomicLong> entry : _appIdSeedMap.entrySet())//����app_id����
		{
			AppIdSeed appIdSeed = appIdSeedDAO.findByName(entry.getKey());
			if(appIdSeed != null){
				AtomicLong atomicLong = entry.getValue(); 														//���ݿ����У���Ϊ����  ��������µ�app_id������
				appIdSeed.setAppIdSeed(atomicLong.get());
				appIdSeedDAO.update(appIdSeed);
			}
			else{
				appIdSeed = new AppIdSeed();
				appIdSeed.setName(entry.getKey());
				AtomicLong atomicLong = entry.getValue(); 														//���ݿ����У���Ϊ����  ��������µ�app_id������
				appIdSeed.setAppIdSeed(atomicLong.get());
				appIdSeedDAO.sava(appIdSeed);
			}
		}
		
		_cpIdSeedEntity.setCpIdSeed((int)_cpIdSeed.get());
		cpIdSeedDAO.update(_cpIdSeedEntity);
		logger.info(String.format("Persist cpIdSeed with %d", _cpIdSeed.get()));
	}
}
