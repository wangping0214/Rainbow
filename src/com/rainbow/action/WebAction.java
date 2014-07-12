package com.rainbow.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;
import com.rainbow.server.App;
import com.rainbow.util.AppTmp;
import com.rainbow.util.Classification;
import com.rainbow.util.PageUtil;

public class WebAction {
			//初始化，防止注入空实体
			private AppAuthority appAut = new AppAuthority();
			private AppInfo appInfo = new AppInfo();
			private AppSource appSou = new AppSource();
			private AppTmp appTmp;	//用于接收文件或临时信息
			private Classification clf ;
			
			private AppAutDAO appAutDAO;
			private AppInfoDAO appInfoDAO;
			private AppSouDAO appSouDAO;
			private ReviewDAO reviewDAO;
			
			private HttpServletResponse response;
		    private HttpServletRequest request;
		    private HttpSession session;
		    
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
			
			private int rankMoreType;//更多排名：1，应用 ；     2，游戏。
			private int rankMoreCurrentPage=1;//当前页数
			private String keyword;	//热门搜索词
			
			
			
			/**前台根据分类显示游戏和应用
			 * 1"创意休闲",2"飞行射击",3"体育竞技",4"益智棋牌",5"策略经营",6"竞速动作",7"角色扮演"
			 * 8"系统安全",9"常用工具",10"摄影美化",11"影音图像",12"便捷生活",13"社交通信",14"学习阅读"
			 * 
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String webShowByCategory(){
				String str="";
				switch(category){
				case 1:str="创意休闲";
						clf = new Classification(1,1, 2, 3, 4, "卡通", "连连看", "捕鱼", "祖玛","创意休闲");
						break;
				case 2:str="飞行射击";
						clf = new Classification(2,5, 6, 7, 8, "射击", "阻击", "坦克", "飞行","飞行射击");
						break;
				case 3:str="体育竞技";
						clf = new Classification(3,9, 10, 11, 12, "街机", "足球", "篮球", "台球","体育竞技");
						break;
				case 4:str="益智棋牌";
						clf = new Classification(4,13, 14, 15, 16, "斗地主", "麻将", "纸牌", "拼图","益智棋牌");
						break;
				case 5:str="策略经营";
						clf = new Classification(5,17, 18, 19, 20, "经营", "卡牌", "塔防", "战争","策略经营");
						break;
				case 6:str="竞速动作";
						clf = new Classification(6,21, 22, 23, 24, "跑酷", "横版", "3D", "赛车","竞速动作");
						break;
				case 7:str="角色扮演";
						clf = new Classification(7,25, 26, 27, 28, "回合制", "卡牌", "玄幻", "武侠","角色扮演");
						break;
				case 8:str="系统安全";
						clf = new Classification(8,29, 30, 31, 32, "优化", "流量", "安全", "杀毒","系统安全");
						break;
				case 9:str="常用工具";
						clf = new Classification(9,33, 34, 35, 36, "浏览器", "输入法", "文件", "办公","常用工具");
						break;
				case 10:str="摄影美化";
						clf = new Classification(10,37, 38, 39, 40, "主题", "桌面", "壁纸", "相机","摄影美化");
						break;
				case 11:str="影音图像";
						clf = new Classification(11,41, 42, 43, 44, "音乐", "视频", "相册", "播放器","影音图像");
						break;
				case 12:str="便捷生活";
						clf = new Classification(12,45, 46, 47, 48, "健康", "购物", "理财", "旅行","便捷生活");
						break;
				case 13:str="社交通信";
						clf = new Classification(13,49, 50, 51, 52, "聊天", "交友", "微博", "婚恋","社交通信");
						break;
				case 14:str="学习阅读";
						clf = new Classification(14,51, 52, 53, 54, "电子书", "漫画", "新闻", "杂志","学习阅读");
						break;
				default:break;
				}
				int total = appInfoDAO.findByCategoryNum(1, str);
				PageUtil page = new PageUtil(appTmp.getShowByCategoryCurrentPage(), total);
				page.setPageSize(16);
				List<AppInfo> appInfo = appInfoDAO.findByCategory(1, str, appTmp.getShowByCategoryCurrentPage(), page.getPageSize());
				List<App> app = new ArrayList<App>();
				for (int i = 0; i < appInfo.size(); i++) {
					AppInfo info = appInfo.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					app.add(new App(info,source,authority));
				}
				List<AppInfo> topApp = appInfoDAO.findByCategory(1, str, 1, 18);// 热门推荐
				List<App> topRecommended = new ArrayList<App>();
				for (int i = 0; i < topApp.size(); i++) {
					AppInfo info = topApp.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					topRecommended.add(new App(info,source,authority));
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("topRecommended", topRecommended);
				request.put("page", page);
				request.put("clf", clf);
				request.put("str", str);
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
			public String webShowByClassification(){
				String str="";
				switch(classification){
				case 1:str="卡通";
				clf = new Classification(1,1, 2, 3, 4, "卡通", "连连看", "捕鱼", "祖玛","创意休闲");
				break;
				case 2:str="连连看";
				clf = new Classification(1,1, 2, 3, 4, "卡通", "连连看", "捕鱼", "祖玛","创意休闲");
				break;
				case 3:str="捕鱼";
				clf = new Classification(1,1, 2, 3, 4, "卡通", "连连看", "捕鱼", "祖玛","创意休闲");
				break;
				case 4:str="祖玛";
				clf = new Classification(1,1, 2, 3, 4, "卡通", "连连看", "捕鱼", "祖玛","创意休闲");
				break;
				case 5:str="射击";
				clf = new Classification(2,5, 6, 7, 8, "射击", "阻击", "坦克", "飞行","飞行射击");
				break;
				case 6:str="阻击";
				clf = new Classification(2,5, 6, 7, 8, "射击", "阻击", "坦克", "飞行","飞行射击");
				break;
				case 7:str="坦克";
				clf = new Classification(2,5, 6, 7, 8, "射击", "阻击", "坦克", "飞行","飞行射击");
				break;
				case 8:str="飞行 ";
				clf = new Classification(2,5, 6, 7, 8, "射击", "阻击", "坦克", "飞行","飞行射击");
				break;
				case 9:str="街机";
				clf = new Classification(3,9, 10, 11, 12, "街机", "足球", "篮球", "台球","体育竞技");
				break;
				case 10:str="足球";
				clf = new Classification(3,9, 10, 11, 12, "街机", "足球", "篮球", "台球","体育竞技");
				break;
				case 11:str="篮球";
				clf = new Classification(3,9, 10, 11, 12, "街机", "足球", "篮球", "台球","体育竞技");
				break;
				case 12:str="台球";
				clf = new Classification(3,9, 10, 11, 12, "街机", "足球", "篮球", "台球","体育竞技");
				break;
				case 13:str="斗地主";
				clf = new Classification(4,13, 14, 15, 16, "斗地主", "麻将", "纸牌", "拼图","益智棋牌");
				break;
				case 14:str="麻将";
				clf = new Classification(4,13, 14, 15, 16, "斗地主", "麻将", "纸牌", "拼图","益智棋牌");
				break;
				case 15:str="纸牌";
				clf = new Classification(4,13, 14, 15, 16, "斗地主", "麻将", "纸牌", "拼图","益智棋牌");
				break;
				case 16:str="拼图";
				clf = new Classification(4,13, 14, 15, 16, "斗地主", "麻将", "纸牌", "拼图","益智棋牌");
				break;
				case 17:str="经营";
				clf = new Classification(5,17, 18, 19, 20, "经营", "卡牌", "塔防", "战争","策略经营");
				break;
				case 18:str="卡牌";
				clf = new Classification(5,17, 18, 19, 20, "经营", "卡牌", "塔防", "战争","策略经营");
				break;
				case 19:str="塔防";
				clf = new Classification(5,17, 18, 19, 20, "经营", "卡牌", "塔防", "战争","策略经营");
				break;
				case 20:str="战争";
				clf = new Classification(5,17, 18, 19, 20, "经营", "卡牌", "塔防", "战争","策略经营");
				break;
				case 21:str="跑酷";
				clf = new Classification(6,21, 22, 23, 24, "跑酷", "横版", "3D", "赛车","竞速动作");
				break;
				case 22:str="横版";
				clf = new Classification(6,21, 22, 23, 24, "跑酷", "横版", "3D", "赛车","竞速动作");
				break;
				case 23:str="3D";
				clf = new Classification(6,21, 22, 23, 24, "跑酷", "横版", "3D", "赛车","竞速动作");
				break;
				case 24:str="赛车";
				clf = new Classification(6,21, 22, 23, 24, "跑酷", "横版", "3D", "赛车","竞速动作");
				break;
				case 25:str="回合制";
				clf = new Classification(7,25, 26, 27, 28, "回合制", "卡牌", "玄幻", "武侠","角色扮演");
				break;
				case 26:str="卡牌";
				clf = new Classification(7,25, 26, 27, 28, "回合制", "卡牌", "玄幻", "武侠","角色扮演");
				break;
				case 27:str="玄幻";
				clf = new Classification(7,25, 26, 27, 28, "回合制", "卡牌", "玄幻", "武侠","角色扮演");
				break;
				case 28:str="武侠";
				clf = new Classification(7,25, 26, 27, 28, "回合制", "卡牌", "玄幻", "武侠","角色扮演");
				break;
				case 29:str="优化";
				clf = new Classification(8,29, 30, 31, 32, "优化", "流量", "安全", "杀毒","系统安全");
				break;
				case 30:str="流量";
				clf = new Classification(8,29, 30, 31, 32, "优化", "流量", "安全", "杀毒","系统安全");
				break;
				case 31:str="安全";
				clf = new Classification(8,29, 30, 31, 32, "优化", "流量", "安全", "杀毒","系统安全");
				break;
				case 32:str="杀毒";
				clf = new Classification(8,29, 30, 31, 32, "优化", "流量", "安全", "杀毒","系统安全");
				break;
				case 33:str="浏览器";
				clf = new Classification(9,33, 34, 35, 36, "浏览器", "输入法", "文件", "办公","常用工具");
				break;
				case 34:str="输入法";
				clf = new Classification(9,33, 34, 35, 36, "浏览器", "输入法", "文件", "办公","常用工具");
				break;
				case 35:str="文件";
				clf = new Classification(9,33, 34, 35, 36, "浏览器", "输入法", "文件", "办公","常用工具");
				break;
				case 36:str="办公";
				clf = new Classification(9,33, 34, 35, 36, "浏览器", "输入法", "文件", "办公","常用工具");
				break;
				case 37:str="主题";
				clf = new Classification(10,37, 38, 39, 40, "主题", "桌面", "壁纸", "相机","摄影美化");
				break;
				case 38:str="桌面";
				clf = new Classification(10,37, 38, 39, 40, "主题", "桌面", "壁纸", "相机","摄影美化");
				break;
				case 39:str="壁纸";
				clf = new Classification(10,37, 38, 39, 40, "主题", "桌面", "壁纸", "相机","摄影美化");
				break;
				case 40:str="相机";
				clf = new Classification(10,37, 38, 39, 40, "主题", "桌面", "壁纸", "相机","摄影美化");
				break;
				case 41:str="音乐";
				clf = new Classification(11,41, 42, 43, 44, "音乐", "视频", "相册", "播放器","影音图像");
				break;
				case 42:str="视频";
				clf = new Classification(11,41, 42, 43, 44, "音乐", "视频", "相册", "播放器","影音图像");
				break;
				case 43:str="相册";
				clf = new Classification(11,41, 42, 43, 44, "音乐", "视频", "相册", "播放器","影音图像");
				break;
				case 44:str="播放器";
				clf = new Classification(11,41, 42, 43, 44, "音乐", "视频", "相册", "播放器","影音图像");
				break;
				case 45:str="健康";
				clf = new Classification(12,45, 46, 47, 48, "健康", "购物", "理财", "旅行","便捷生活");
				break;
				case 46:str="购物";
				clf = new Classification(12,45, 46, 47, 48, "健康", "购物", "理财", "旅行","便捷生活");
				break;
				case 47:str="理财";
				clf = new Classification(12,45, 46, 47, 48, "健康", "购物", "理财", "旅行","便捷生活");
				break;
				case 48:str="旅行";
				clf = new Classification(12,45, 46, 47, 48, "健康", "购物", "理财", "旅行","便捷生活");
				break;
				case 49:str="聊天";
				clf = new Classification(13,49, 50, 51, 52, "聊天", "交友", "微博", "婚恋","社交通信");
				break;
				case 50:str="交友";
				clf = new Classification(13,49, 50, 51, 52, "聊天", "交友", "微博", "婚恋","社交通信");
				break;
				case 51:str="微博";
				clf = new Classification(13,49, 50, 51, 52, "聊天", "交友", "微博", "婚恋","社交通信");
				break;
				case 52:str="婚恋";
				clf = new Classification(13,49, 50, 51, 52, "聊天", "交友", "微博", "婚恋","社交通信");
				break;
				case 53:str="电子书";
				clf = new Classification(14,51, 52, 53, 54, "电子书", "漫画", "新闻", "杂志","学习阅读");
				break;
				case 54:str="漫画";
				clf = new Classification(14,51, 52, 53, 54, "电子书", "漫画", "新闻", "杂志","学习阅读");
				break;
				case 55:str="新闻";
				clf = new Classification(14,51, 52, 53, 54, "电子书", "漫画", "新闻", "杂志","学习阅读");
				break;
				case 56:str="杂志";
				clf = new Classification(14,51, 52, 53, 54, "电子书", "漫画", "新闻", "杂志","学习阅读");
				break;
				default:str="杂志";
				clf = new Classification(14,51, 52, 53, 54, "电子书", "漫画", "新闻", "杂志","学习阅读");
				break;
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
				List<AppInfo> topApp = appInfoDAO.findByCategory(1, clf.getStrCat(), 1, 18);// 热门推荐
				List<App> topRecommended = new ArrayList<App>();
				for (int i = 0; i < topApp.size(); i++) {
					AppInfo info = topApp.get(i);
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					topRecommended.add(new App(info,source,authority));
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("topRecommended", topRecommended);
				request.put("str", str);
				request.put("clf", clf);
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
			
			
			/**
			 * 今日推荐
			 * 安卓精品 推荐级别 > 评分 > 下载量
			 * 柴米推荐->评分
			 * 人气排行榜->推荐级别
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String todayRecommend(){
				Map request = (Map) ActionContext.getContext().get("request");
				/*************************安卓精品*****************************/
				List<AppAuthority> appAut = appAutDAO.findByBoutique(0,0,1,36);
				List<App> appBoutique = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appBoutique.add(new App(info,source,authority));			
				}
				/***********************************************************/
				
				/*************************柴米推荐******************************/
				appAut = appAutDAO.findByScoreAndDown(0, 1, 12);
				List<App> appRecommend = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appRecommend.add(new App(info,source,authority));			
				}
				/***********************************************************/
				
				/************************人气排行榜******************************/
				appAut = appAutDAO.findByRecomLevel(0, 1, 12);
				List<App> appRank = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appRank.add(new App(info,source,authority));			
				}
				/***********************************************************/
				
				request.put("appBoutique", appBoutique);
				request.put("appRecommend", appRecommend);
				request.put("appRank", appRank);
				return Action.SUCCESS;
				
			}
			
			/**
			 * 安卓应用排行->应用->推荐级别 > 评分 > 下载量 > 发布时间
			 * 应用人气排行
			 * 
			 * 安卓游戏排行->游戏->推荐级别 > 评分 > 下载量 > 发布时间
			 * 游戏人气排行
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String webRanklist(){
				Map request = (Map) ActionContext.getContext().get("request");
				/*************************安卓应用排行*****************************/
				List<AppAuthority> appAut = appAutDAO.findByTypeRank("应用", 0, 0, 1, 18);
				List<App> appApplication = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appApplication.add(new App(info,source,authority));			
				}
				/*************************************************************/
				
				/*************************应用人气排行*****************************/
				appAut = appAutDAO.findByTypeRank("应用", 0, 0, 1, 10);
				List<App> applicationPopularity = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					applicationPopularity.add(new App(info,source,authority));			
				}
				/*************************************************************/
				
				/*************************安卓游戏排行*****************************/
				appAut = appAutDAO.findByTypeRank("游戏", 0, 0, 1, 18);
				List<App> appGame = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					appGame.add(new App(info,source,authority));			
				}
				/*************************************************************/
				
				/*************************安卓游戏排行*****************************/
				appAut = appAutDAO.findByTypeRank("游戏", 0, 0, 1, 10);
				List<App> gamePopularity = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					gamePopularity.add(new App(info,source,authority));			
				}
				/*************************************************************/
				request.put("appApplication", appApplication);
				request.put("applicationPopularity", applicationPopularity);
				request.put("appGame", appGame);
				request.put("gamePopularity", gamePopularity);
				return Action.SUCCESS;
				
			}
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String rankMore(){
				int total;
				PageUtil page;
				List<App> app=new ArrayList<App>();
				List<AppAuthority> appAut;
				/*************************应用更多排名*******************************/
				if(rankMoreType == 1){
					total = appAutDAO.findByTypeRankNum("应用", 0, 0);
					page = new PageUtil(rankMoreCurrentPage, total);
					page.setPageSize(16);
					appAut = appAutDAO.findByTypeRank("应用", 0, 0, rankMoreCurrentPage, page.getPageSize());
					
				}
				/*************************游戏更多排名*******************************/
				else {
					total = appAutDAO.findByTypeRankNum("应用", 0, 0);
					page = new PageUtil(rankMoreCurrentPage, total);
					page.setPageSize(16);
					appAut = appAutDAO.findByTypeRank("游戏", 0, 0, rankMoreCurrentPage, page.getPageSize());
				
				}
				/***************************************************************/
				for(int i=0; i<appAut.size();i++){
					AppAuthority authority = appAut.get(i);
					AppInfo info = appInfoDAO.findById(authority.getId());
					AppSource source = appSouDAO.findById(authority.getId());
					app.add(new App(info,source,authority));			
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("page", page);
				if(rankMoreType == 1)
					return "rankMoreApp";
				else 
					return "rankMoreGame";
				
			}
			
			/**
			 * 热门搜索词排行
			 * 推荐级别 > 评分 > 下载量 > 发布时间
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String rankByKeyword(){
				
				int total = appInfoDAO.findByClassificationNum(1, keyword);
				PageUtil page = new PageUtil(rankMoreCurrentPage, total);
				page.setPageSize(16);
				System.out.println("keyword"+keyword+"\ntotal"+total);
				List<AppInfo> appInfo = appInfoDAO.findByClassification(1, keyword, 
						rankMoreCurrentPage, page.getPageSize());
				List<App> app = new ArrayList<App>();
				for (int i = 0; i < appInfo.size(); i++) {
					AppInfo info = appInfo.get(i);
					System.out.println(info.getAppName());
					AppSource source = appSouDAO.findById(info.getId());
					AppAuthority authority = appAutDAO.findById(info.getId());
					app.add(new App(info,source,authority));
					System.out.println(app.get(i).getAppInfo().getAppName());
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("app", app);
				request.put("page", page);
				session = ServletActionContext.getRequest().getSession();
				session.setAttribute("keyword", keyword);
				int type = 1;
				String []key={"优化","流量","安全","杀毒","浏览器",
								"输入法","文件","办公","主题","桌面",
								"壁纸","相机","音乐","视频","相册",
								"播放器","健康","购物","理财","旅行",
								"交友","聊天","微博","婚恋","电子书",
								"漫画","新闻","杂志"
								};
				for(int i=0;i<key.length;i++)
					if(key[i].equals(keyword))
						type = 0;
				if(type==0)
					return "rank_moreApp";
				else return "rank_moreGame";
				
			}

			/**apk应用的具体信息
			 * 根据用户下载应用的类别classification。推荐其他应用
			 * @return
			 */
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public String details(){
				//显示应用的具体信息
				AppInfo info = appInfoDAO.findById(apkId);
				AppAuthority aut = appAutDAO.findById(apkId);
				AppSource sou = appSouDAO.findById(apkId);
				App app = new App(info,sou,aut);
				List<Review> review = reviewDAO.findByAppId(apkId);
				app.setReview(review);
				HttpSession httpSession = ServletActionContext.getRequest()
						.getSession();
				httpSession.setAttribute("app", app);
				
				//推荐其他应用
				List<AppAuthority> appAut = appAutDAO.findByClassification(info.getClassification(),apkId, 0, 0, 1, 5);
				List<App> appOthers = new ArrayList<App>();
				for(int i=0; i<appAut.size();i++){
					AppAuthority appAuthority = appAut.get(i);
					AppInfo appInfo = appInfoDAO.findById(appAuthority.getId());
					AppSource appSource = appSouDAO.findById(appAuthority.getId());
					appOthers.add(new App(appInfo,appSource,appAuthority));			
				}
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("appOthers", appOthers);
				return Action.SUCCESS;
			}
			
			
			public String getKeyword() {
				return keyword;
			}

			public void setKeyword(String keyword) {
				this.keyword = keyword;
			}

			public int getRankMoreCurrentPage() {
				return rankMoreCurrentPage;
			}

			public void setRankMoreCurrentPage(int rankMoreCurrentPage) {
				this.rankMoreCurrentPage = rankMoreCurrentPage;
			}

			public int getRankMoreType() {
				return rankMoreType;
			}

			public void setRankMoreType(int rankMoreType) {
				this.rankMoreType = rankMoreType;
			}

			public Classification getClf() {
				return clf;
			}

			public void setClf(Classification clf) {
				this.clf = clf;
			}

			public int getType() {
				return type;
			}

			public void setType(int type) {
				this.type = type;
			}

			public int getClassification() {
				return classification;
			}

			public void setClassification(int classification) {
				this.classification = classification;
			}

			public int getCategory() {
				return category;
			}

			public void setCategory(int category) {
				this.category = category;
			}

			public int getDownLoadId() {
				return downLoadId;
			}

			public void setDownLoadId(int downLoadId) {
				this.downLoadId = downLoadId;
			}

			public int getApkId() {
				return apkId;
			}

			public void setApkId(int apkId) {
				this.apkId = apkId;
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
			public AppSource getAppSou() {
				return appSou;
			}
			public void setAppSou(AppSource appSou) {
				this.appSou = appSou;
			}
			public AppTmp getAppTmp() {
				return appTmp;
			}
			public void setAppTmp(AppTmp appTmp) {
				this.appTmp = appTmp;
			}

			public WebAction(AppAutDAO appAutDAO, AppInfoDAO appInfoDAO,
					AppSouDAO appSouDAO, ReviewDAO reviewDAO) {
				super();
				this.appAutDAO = appAutDAO;
				this.appInfoDAO = appInfoDAO;
				this.appSouDAO = appSouDAO;
				this.reviewDAO = reviewDAO;
			}
			
			
}
