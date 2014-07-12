package com.rainbow.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.server.App;
import com.rainbow.util.AppTmp;
import com.rainbow.util.PageUtil;

public class MobAction {
	//初始化，防止注入空实体
		private AppAuthority appAut = new AppAuthority();
		private AppInfo appInfo = new AppInfo();
		private AppSource appSou = new AppSource();
		private AppTmp appTmp;	//用于接收文件或临时信息
		
		private AppAutDAO appAutDAO;
		private AppInfoDAO appInfoDAO;
		private AppSouDAO appSouDAO;
		
		/**
		 * 类型查询 1表示游戏 2表示应用
		 */
		private int type;
		/**
		 * 具体分类查询
		 */
		private int classification=1;
		/**
		 * 游戏和应用分类
		 */
		private int category =1;
		private int downLoadId = 1;
		private int apkId = 1;
		/**根据应用类型显示应用
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByType(){
			String str="";
			if(type==1)
				str = "游戏";
			else
				str = "应用";
			int total = appInfoDAO.findByTypeAndShelfNum(1, str);
			PageUtil page = new PageUtil(appTmp.getShowByTypeCurrentPage(), total);
			List<AppInfo> appInfo = appInfoDAO.findByTypeAndShelf(1, str, appTmp.getShowByTypeCurrentPage(), page.getPageSize());
			List<App> app = new ArrayList<App>();
			for (int i = 0; i < appInfo.size(); i++) {
				AppInfo info = appInfo.get(i);
				AppSource source = appSouDAO.findById(info.getId());
				AppAuthority authority = appAutDAO.findById(info.getId());
				app.add(new App(info,source,authority));
			}
			Map request = (Map) ActionContext.getContext().get("request");
			
			request.put("app", app);
			request.put("page", page);
			request.put("type", type);
			if(type==1)
				return "game";
			else
				return "application";
		}
		/**前台根据分类显示游戏和应用
		 * 1"创意休闲",2"飞行射击",3"体育竞技",4"益智棋牌",5"策略经营",6"竞速动作",7"角色扮演"
		 * 8"系统安全",9"常用工具",10"摄影美化",11"影音图像",12"便捷生活",13"社交通信",14"学习阅读"
		 * 
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByCategory(){
			String str="";
			switch(category){
			case 1:str="创意休闲";break;
			case 2:str="飞行射击";break;
			case 3:str="体育竞技";break;
			case 4:str="益智棋牌";break;
			case 5:str="策略经营";break;
			case 6:str="竞速动作";break;
			case 7:str="角色扮演";break;
			case 8:str="系统安全";break;
			case 9:str="常用工具";break;
			case 10:str="摄影美化";break;
			case 11:str="影音图像";break;
			case 12:str="便捷生活";break;
			case 13:str="社交通信";break;
			case 14:str="社交通信";break;
			default:break;
			}
			int total = appInfoDAO.findByCategoryNum(1, str);
			PageUtil page = new PageUtil(appTmp.getShowByCategoryCurrentPage(), total);
			List<AppInfo> appInfo = appInfoDAO.findByCategory(1, str, appTmp.getShowByCategoryCurrentPage(), page.getPageSize());
			List<App> app = new ArrayList<App>();
			for (int i = 0; i < appInfo.size(); i++) {
				AppInfo info = appInfo.get(i);
				AppSource source = appSouDAO.findById(info.getId());
				AppAuthority authority = appAutDAO.findById(info.getId());
				app.add(new App(info,source,authority));
			}
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("app", app);
			request.put("page", page);
			request.put("category", category);
			
			return Action.SUCCESS;
		}
		
		/**根据具体类别显示游戏和应用
		 * 1 卡通,2 连连看，3  捕鱼，4  祖玛
		 * 5 射击，6  阻击 ，7 坦克， 8 飞行 
		 * 9街机， 10足球， 11篮球， 12台球
		 * 13斗地主，14 麻将， 15纸牌， 16拼图
		 * 17经营 ，18卡牌， 19塔防，20 战争
		 * 21 跑酷， 22 横版， 23 3D， 24赛车
		 * 25回合制， 26卡牌 ，27玄幻， 28武侠
		 * 29优化， 30流量 ，31安全 ，32杀毒
		 * 33浏览器， 34输入法 ，35文件， 36办公 
		 * 37主题，,38桌面， 39壁纸， 40相机
		 * 41音乐， 42视频 ，43相册 ，44播放器
		 * 45健康，46 购物， 47理财， 48旅行
		 * 49聊天， 50交友 ，51微博，52 婚恋
		 * 53电子书， 54漫画， 55新闻， 56杂志
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByClassification(){
			String str="";
			switch(classification){
			case 1:str="卡通";break;
			case 2:str="连连看";break;
			case 3:str="捕鱼";break;
			case 4:str="祖玛";break;
			case 5:str="射击";break;
			case 6:str="阻击";break;
			case 7:str="坦克";break;
			case 8:str="飞行 ";break;
			case 9:str="街机";break;
			case 10:str="足球";break;
			case 11:str="篮球";break;
			case 12:str="台球";break;
			case 13:str="斗地主";break;
			case 14:str="麻将";break;
			case 15:str="纸牌";break;
			case 16:str="拼图";break;
			case 17:str="经营";break;
			case 18:str="卡牌";break;
			case 19:str="塔防";break;
			case 20:str="战争";break;
			case 21:str="跑酷";break;
			case 22:str="横版";break;
			case 23:str="3D";break;
			case 24:str="赛车";break;
			case 25:str="回合制";break;
			case 26:str="卡牌";break;
			case 27:str="玄幻";break;
			case 28:str="武侠";break;
			case 29:str="优化";break;
			case 30:str="流量";break;
			case 31:str="安全";break;
			case 32:str="杀毒";break;
			case 33:str="浏览器";break;
			case 34:str="输入法";break;
			case 35:str="文件";break;
			case 36:str="办公";break;
			case 37:str="主题";break;
			case 38:str="桌面";break;
			case 39:str="壁纸";break;
			case 40:str="相机";break;
			case 41:str="音乐";break;
			case 42:str="视频";break;
			case 43:str="相册";break;
			case 44:str="播放器";break;
			case 45:str="健康";break;
			case 46:str="购物";break;
			case 47:str="理财";break;
			case 48:str="旅行";break;
			case 49:str="聊天";break;
			case 50:str="交友";break;
			case 51:str="微博";break;
			case 52:str="婚恋";break;
			case 53:str="电子书";break;
			case 54:str="漫画";break;
			case 55:str="新闻";break;
			case 56:str="杂志";break;
			default:str="杂志";break;
			}
			int total = appInfoDAO.findByClassificationNum(1, str);
			PageUtil page = new PageUtil(appTmp.getShowByClassificationCurrentPage(), total);
			List<AppInfo> appInfo = appInfoDAO.findByClassification(1, str, 
					appTmp.getShowByClassificationCurrentPage(), page.getPageSize());
			List<App> app = new ArrayList<App>();
			for (int i = 0; i < appInfo.size(); i++) {
				AppInfo info = appInfo.get(i);
				AppSource source = appSouDAO.findById(info.getId());
				AppAuthority authority = appAutDAO.findById(info.getId());
				app.add(new App(info,source,authority));
			}
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("app", app);
			request.put("page", page);
			request.put("classification", classification);
			return Action.SUCCESS;
		}
		
		/**前台显示推荐的应用
		 * @return
		 */
		@SuppressWarnings({ "unchecked", "rawtypes" })
		public String showByRecomLevel(){
			int total = appAutDAO.findByRecomLevelNum(0);
			PageUtil page = new PageUtil(appTmp.getShowByRecomLevelCurrentPage(), total);
			page.setPageSize(15);
			List<AppAuthority> appAut = appAutDAO.findByRecomLevel(0, appTmp.getShowByRecomLevelCurrentPage(), page.getPageSize());
			List<App> app = new ArrayList<App>();
			for(int i=0; i<appAut.size();i++){
				AppAuthority authority = appAut.get(i);
				AppInfo info = appInfoDAO.findById(authority.getId());
				AppSource source = appSouDAO.findById(authority.getId());
				app.add(new App(info,source,authority));
				
			}
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("app", app);
			request.put("page", page);
			return Action.SUCCESS;
		}
		
		/**前台根据评分和下载量排行
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByScoreAndDown(){
			int total  = appAutDAO.findByScoreAndDownNum(0);
			PageUtil page = new PageUtil(appTmp.getShowByScoreAndDownCurrentPage(), total);
			page.setPageSize(15);
			List<AppAuthority> appAut = appAutDAO.findByScoreAndDown(0, appTmp.getShowByScoreAndDownCurrentPage(), page.getPageSize());
			List<App> app = new ArrayList<App>();
			for(int i=0; i<appAut.size();i++){
				AppAuthority authority = appAut.get(i);
				AppInfo info = appInfoDAO.findById(authority.getId());
				AppSource source = appSouDAO.findById(authority.getId());
				app.add(new App(info,source,authority));			
			}
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("app", app);
			request.put("page", page);
			return Action.SUCCESS;
		}
		/**前台下载次数统计
		 * 每下载一次，下载总数加1
		 */
		public void downLoad(){
			AppAuthority appAut = appAutDAO.findById(downLoadId);
			appAut.setAmountOfDown(appAut.getAmountOfDown()+1);
			appAutDAO.update(downLoadId, appAut);
		}
		/**apk应用的具体信息
		 * @return
		 */
		public String specificInformation(){
			AppInfo info = appInfoDAO.findById(apkId);
			AppAuthority aut = appAutDAO.findById(apkId);
			AppSource sou = appSouDAO.findById(apkId);
			App app = new App(info,sou,aut);
			HttpSession httpSession = ServletActionContext.getRequest()
					.getSession();
			httpSession.setAttribute("app", app);
			return Action.SUCCESS;
		}
		
		public int getApkId() {
			return apkId;
		}
		public void setApkId(int apkId) {
			this.apkId = apkId;
		}
		public int getDownLoadId() {
			return downLoadId;
		}
		public void setDownLoadId(int downLoadId) {
			this.downLoadId = downLoadId;
		}
		public int getCategory() {
			return category;
		}
		public void setCategory(int category) {
			this.category = category;
		}
		public int getClassification() {
			return classification;
		}

		public void setClassification(int classification) {
			this.classification = classification;
		}

		public int getType() {
			return type;
		}
		public void setType(int type) {
			this.type = type;
		}
		public AppAuthority getAppAut() {
			return appAut;
		}


		public void setAppAut(AppAuthority appAut) {
			this.appAut = appAut;
		}


		public AppInfo getAppInfo() {
			return appInfo;
		}


		public void setAppInfo(AppInfo appInfo) {
			this.appInfo = appInfo;
		}


		public AppTmp getAppTmp() {
			return appTmp;
		}


		public void setAppTmp(AppTmp appTmp) {
			this.appTmp = appTmp;
		}


		/**构造函数
		 * @param appAutDAO
		 * @param appInfoDAO
		 * @param appSouDAO
		 */
		public MobAction(AppAutDAO appAutDAO, AppInfoDAO appInfoDAO,
				AppSouDAO appSouDAO) {
			super();
			this.appAutDAO = appAutDAO;
			this.appInfoDAO = appInfoDAO;
			this.appSouDAO = appSouDAO;
		}
		
}
