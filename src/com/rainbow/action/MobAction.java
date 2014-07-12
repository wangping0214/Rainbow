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
	//��ʼ������ֹע���ʵ��
		private AppAuthority appAut = new AppAuthority();
		private AppInfo appInfo = new AppInfo();
		private AppSource appSou = new AppSource();
		private AppTmp appTmp;	//���ڽ����ļ�����ʱ��Ϣ
		
		private AppAutDAO appAutDAO;
		private AppInfoDAO appInfoDAO;
		private AppSouDAO appSouDAO;
		
		/**
		 * ���Ͳ�ѯ 1��ʾ��Ϸ 2��ʾӦ��
		 */
		private int type;
		/**
		 * ��������ѯ
		 */
		private int classification=1;
		/**
		 * ��Ϸ��Ӧ�÷���
		 */
		private int category =1;
		private int downLoadId = 1;
		private int apkId = 1;
		/**����Ӧ��������ʾӦ��
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByType(){
			String str="";
			if(type==1)
				str = "��Ϸ";
			else
				str = "Ӧ��";
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
		/**ǰ̨���ݷ�����ʾ��Ϸ��Ӧ��
		 * 1"��������",2"�������",3"��������",4"��������",5"���Ծ�Ӫ",6"���ٶ���",7"��ɫ����"
		 * 8"ϵͳ��ȫ",9"���ù���",10"��Ӱ����",11"Ӱ��ͼ��",12"�������",13"�罻ͨ��",14"ѧϰ�Ķ�"
		 * 
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByCategory(){
			String str="";
			switch(category){
			case 1:str="��������";break;
			case 2:str="�������";break;
			case 3:str="��������";break;
			case 4:str="��������";break;
			case 5:str="���Ծ�Ӫ";break;
			case 6:str="���ٶ���";break;
			case 7:str="��ɫ����";break;
			case 8:str="ϵͳ��ȫ";break;
			case 9:str="���ù���";break;
			case 10:str="��Ӱ����";break;
			case 11:str="Ӱ��ͼ��";break;
			case 12:str="�������";break;
			case 13:str="�罻ͨ��";break;
			case 14:str="�罻ͨ��";break;
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
		
		/**���ݾ��������ʾ��Ϸ��Ӧ��
		 * 1 ��ͨ,2 ��������3  ���㣬4  ����
		 * 5 �����6  ��� ��7 ̹�ˣ� 8 ���� 
		 * 9�ֻ��� 10���� 11���� 12̨��
		 * 13��������14 �齫�� 15ֽ�ƣ� 16ƴͼ
		 * 17��Ӫ ��18���ƣ� 19������20 ս��
		 * 21 �ܿᣬ 22 ��棬 23 3D�� 24����
		 * 25�غ��ƣ� 26���� ��27���ã� 28����
		 * 29�Ż��� 30���� ��31��ȫ ��32ɱ��
		 * 33������� 34���뷨 ��35�ļ��� 36�칫 
		 * 37���⣬,38���棬 39��ֽ�� 40���
		 * 41���֣� 42��Ƶ ��43��� ��44������
		 * 45������46 ��� 47��ƣ� 48����
		 * 49���죬 50���� ��51΢����52 ����
		 * 53�����飬 54������ 55���ţ� 56��־
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		public String showByClassification(){
			String str="";
			switch(classification){
			case 1:str="��ͨ";break;
			case 2:str="������";break;
			case 3:str="����";break;
			case 4:str="����";break;
			case 5:str="���";break;
			case 6:str="���";break;
			case 7:str="̹��";break;
			case 8:str="���� ";break;
			case 9:str="�ֻ�";break;
			case 10:str="����";break;
			case 11:str="����";break;
			case 12:str="̨��";break;
			case 13:str="������";break;
			case 14:str="�齫";break;
			case 15:str="ֽ��";break;
			case 16:str="ƴͼ";break;
			case 17:str="��Ӫ";break;
			case 18:str="����";break;
			case 19:str="����";break;
			case 20:str="ս��";break;
			case 21:str="�ܿ�";break;
			case 22:str="���";break;
			case 23:str="3D";break;
			case 24:str="����";break;
			case 25:str="�غ���";break;
			case 26:str="����";break;
			case 27:str="����";break;
			case 28:str="����";break;
			case 29:str="�Ż�";break;
			case 30:str="����";break;
			case 31:str="��ȫ";break;
			case 32:str="ɱ��";break;
			case 33:str="�����";break;
			case 34:str="���뷨";break;
			case 35:str="�ļ�";break;
			case 36:str="�칫";break;
			case 37:str="����";break;
			case 38:str="����";break;
			case 39:str="��ֽ";break;
			case 40:str="���";break;
			case 41:str="����";break;
			case 42:str="��Ƶ";break;
			case 43:str="���";break;
			case 44:str="������";break;
			case 45:str="����";break;
			case 46:str="����";break;
			case 47:str="���";break;
			case 48:str="����";break;
			case 49:str="����";break;
			case 50:str="����";break;
			case 51:str="΢��";break;
			case 52:str="����";break;
			case 53:str="������";break;
			case 54:str="����";break;
			case 55:str="����";break;
			case 56:str="��־";break;
			default:str="��־";break;
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
		
		/**ǰ̨��ʾ�Ƽ���Ӧ��
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
		
		/**ǰ̨�������ֺ�����������
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
		/**ǰ̨���ش���ͳ��
		 * ÿ����һ�Σ�����������1
		 */
		public void downLoad(){
			AppAuthority appAut = appAutDAO.findById(downLoadId);
			appAut.setAmountOfDown(appAut.getAmountOfDown()+1);
			appAutDAO.update(downLoadId, appAut);
		}
		/**apkӦ�õľ�����Ϣ
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


		/**���캯��
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
