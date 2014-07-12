package com.rainbow.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.context.annotation.Scope;

import com.rainbow.dao.AppIdSeedDAO;
import com.rainbow.dao.CpIdSeedDAO;
import com.rainbow.entity.AppIdSeed;
import com.rainbow.entity.CpIdSeed;

/**
 * 
 * @author STerOtto
 * @version 2014-6-28 23:29:20
 * 用于生成cp_id 和 app_id 的单例
 *
 */

public class IdGenerator {
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
	
	private CpIdSeed cpIdSeed = new CpIdSeed();
	private AppIdSeed appIdSeed = new AppIdSeed();
	
	/**
	 * 构造函数
	 */
	private IdGenerator()
	{
		
	}
	
	

	/**
	 * 初始化_cpIdSeed和_appIdSeedMap
	 */
	public void initialize(Object cpIdSeedDAO,Object appIdSeedDAO)
	{
		this.cpIdSeedDAO = (CpIdSeedDAO) cpIdSeedDAO;
		this.appIdSeedDAO = (AppIdSeedDAO) appIdSeedDAO;
		//fetch
		List<CpIdSeed> cpId = this.cpIdSeedDAO.findAll();//从数据库中取出种子
		if(cpId.size()==0){							//若cp_id的种子为空，则新加一个种子
			cpIdSeed.setCpIdSeed(0);
			this.cpIdSeedDAO.save(cpIdSeed);
		}
		else
			cpIdSeed = cpId.get(0);
		_cpIdSeed = new AtomicLong(cpIdSeed.getCpIdSeed());
		
		_appIdSeedMap = new HashMap<String, AtomicLong>();//_appIdSeedMap初始化
		AppIdSeed admin = this.appIdSeedDAO.findByName("00000000");
		if(admin==null){//如果没有为管理员生成一个种子则为管理员生成一个种子
			admin = new AppIdSeed();
			admin.setName("00000000");
			admin.setAppIdSeed(0);
			this.appIdSeedDAO.sava(admin);
		}
		List<AppIdSeed> appId = this.appIdSeedDAO.findAll();
		System.out.println("appId.size()"+appId.size());
		for(int i=0;i<appId.size();i++){			//_appIdSeedMap将数据库中的app_id种子存入_appIdSeedMap
			long appIdSeed = appId.get(i).getAppIdSeed();
			_appIdSeedMap.put(appId.get(i).getName(), new AtomicLong(appIdSeed));
		}
		
	}
	
	/**
	 * 获取下一个cp_id
	 * 并且为新的cp存入一个初始化种子
	 * 并且将cp_id的种子跟新
	 * @return
	 */
	public String getNextCpId()
	{
		long cpIdSeed = _cpIdSeed.incrementAndGet();
		AppIdSeed appIdSeed = new AppIdSeed();
		appIdSeed.setName(String.format("%08d", cpIdSeed));
		appIdSeed.setAppIdSeed(0);
		appIdSeedDAO.sava(appIdSeed);
		CpIdSeed  cpId = cpIdSeedDAO.findById(1);
		if(cpId!=null){												//跟新cp_id种子
			cpId.setCpIdSeed((int)cpIdSeed);
			cpIdSeedDAO.update(cpId);
		}
		return String.format("%08d", cpIdSeed);
	}
	
	/**
	 * 获取下一个app_id
	 * @param cpId
	 * @return
	 */
	public String getNextAppId(String cpId)
	{
		if(!_appIdSeedMap.containsKey(cpId)){//如果_appIdSeedMap中不包含cpId则新建一个app_id
			_appIdSeedMap.put(cpId, new AtomicLong(0));
			AppIdSeed appIdSeedNew = new AppIdSeed();
			appIdSeedNew.setName(cpId);
			appIdSeedNew.setAppIdSeed(0);
			this.appIdSeedDAO.sava(appIdSeedNew);
		}
		long appIdSeedNum = _appIdSeedMap.get(cpId).incrementAndGet();
		AppIdSeed appIdSeed = this.appIdSeedDAO.findByName(cpId);
		if(appIdSeed!=null){
			appIdSeed.setAppIdSeed(appIdSeedNum);
			this.appIdSeedDAO.update(appIdSeed);
		}
		return String.format("%04d",appIdSeedNum);	
	}
	
	/**
	 * 跟新数据库中的种子
	 */
	@SuppressWarnings("rawtypes")
	public void destroy()
	{
		
		//persist
		Set set = _appIdSeedMap.entrySet();
		Iterator iterator = set.iterator();
		while(iterator.hasNext()){
			Map.Entry entry = (Map.Entry) iterator.next();
			AppIdSeed appIdSeed = appIdSeedDAO.findByName(String.valueOf(entry.getKey()));
			if(appIdSeed!=null){										//数据库中有，则为跟新  否则存入新的app_id的种子
				appIdSeed.setAppIdSeed((long) entry.getValue());
				appIdSeedDAO.update(appIdSeed);
			}
			else{
				appIdSeed = new AppIdSeed();
				appIdSeed.setName(String.valueOf(entry.getKey()));
				appIdSeed.setAppIdSeed((long) entry.getValue());
				appIdSeedDAO.sava(appIdSeed);
			}
		}
		CpIdSeed  cpIdSeed = cpIdSeedDAO.findById(1);
		if(cpIdSeed!=null){												//跟新cp_id种子
			cpIdSeed.setCpIdSeed((int)_cpIdSeed.get());
			cpIdSeedDAO.update(cpIdSeed);
		}
		
	}
}
