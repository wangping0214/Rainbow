package com.rainbow.action;

import java.io.IOException;
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
import com.rainbow.dao.MessageDAO;
import com.rainbow.dao.OtherPaymentDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.MessagePayment;
import com.rainbow.entity.OtherPayment;
import com.rainbow.entity.Review;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.util.AppTmp;
import com.rainbow.util.OpeFunction;
import com.rainbow.util.PageUtil;

/**
 * @author Administrator
 *
 */
public class DevAction {
	//��ʼ������ֹע���ʵ��
	private AppAuthority appAut = new AppAuthority();
	private AppInfo appInfo = new AppInfo();
	private AppSource appSou = new AppSource();
	private AppTmp appTmp;	//���ڽ����ļ�����ʱ��Ϣ
	private App subApp = new App();    //����ύʱ�ȱ��ؽ�����Ϣ��������Ϣ��д��֮������APPӦ����Ϣ���������ݿ���
	private String userName;			//�û���
	private int userType = 1; 			//�û����� inuser -1;ingroup 0; common 1;

	private UserDAO userDAO;
	private AppAutDAO appAutDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private ReviewDAO reviewDAO;
	private MessageDAO messageDAO;
	private OtherPaymentDAO otherPaymentDAO;

	private OpeFunction opeFun;//��װ��һЩ�����ĺ���
	
	private int joint;//�Ƿ����� 1����ʾ���� ��0����ʾӦ���ƹ㡣
	private int shelf;//�Ƿ��ϼܣ�-2ǿ���¼ܣ�-1���¼ܣ�0�ȴ�������1���ϼ�
	private int currentPage;
	
	/**�˵��ϵ����Ӧ���ϴ��������sesseion
	 * @return
	 */
	public String devUploadAppOfMenu(){
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		httpSession.removeAttribute("app");
		App app = new App();
		httpSession.setAttribute("app", app);
		return Action.SUCCESS;
	}
	/**
	 * ����Ա�ϴ�Ӧ�õ��Ƿ���������Ӫ
	 * @return
	 */
	public String devJointSub(){
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		httpSession.setAttribute("joint", joint);
		return Action.SUCCESS;
	}

	/**
	 * �ϴ���Ӧ�û�༭Ӧ�õ��ύ
	 * 
	 * @return
	 * @throws IOException
	 */

	@SuppressWarnings("static-access")
	public String devAppUpLoad() throws IOException {
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		String userName=(String) httpSession.getAttribute("username");
		System.out.println("userName"+userName);
		User user = userDAO.findByUser(userName);
		
		appInfo.setCp_id(user.getCp_id());		

		appInfo.setUserName(userName);
		appInfo.setIsThrough(0);

		String str = "";
		if(appTmp.getAdv()!=null)
			str += "0";
		else
			str += "1";
		if(appTmp.getVir()!=null)
			str+="|0";
		else
			str+="|1";
		if(appTmp.getPri()!=null)
			str+="|0";
		else
			str+="|1";
		if(appTmp.getOff()!=null)
			str+="|0";
		else
			str+="|1";
		appInfo.setSecurity(str);
		if (appTmp.getPackgeContent() != null){
			appSou.setPackgeSize(opeFun.fileSize(appTmp.getPackgeContent()));
			appSou.setPackgeSize(opeFun.fileSize(appTmp.getPackgeContent()));
			appSou.setPackge(opeFun.fileToServer("/file/"+userName+"/packge",
					appTmp.getPackgeContent(),
					appTmp.getPackgeContentFileName(),
					appTmp.getPackgeContentContentType(),
					false));
		}
		if (appTmp.getLogo1Content() != null)
			appSou.setLogo1(opeFun.fileToServer("/file/"+userName+"/logo1",
					appTmp.getLogo1Content(), 
					appTmp.getLogo1ContentFileName(),
					appTmp.getLogo1ContentContentType(),
					true));
		if (appTmp.getLogo2Content() != null)
			appSou.setLogo2(opeFun.fileToServer("/file/"+userName+"/logo2",
					appTmp.getLogo2Content(), 
					appTmp.getLogo2ContentFileName(),
					appTmp.getLogo2ContentContentType(),
					true));
		if (appTmp.getGamePhotoContent1() != null)
			appSou.setGamePhoto1(opeFun.fileToServer("/file/"+userName+"/gamePhoto",
					appTmp.getGamePhotoContent1(),
					appTmp.getGamePhotoContent1FileName(),
					appTmp.getGamePhotoContent1ContentType(),
					true));
		if (appTmp.getGamePhotoContent2() != null)
			appSou.setGamePhoto2(opeFun.fileToServer("/file/"+userName+"/gamePhoto",
					appTmp.getGamePhotoContent2(),
					appTmp.getGamePhotoContent2FileName(),
					appTmp.getGamePhotoContent2ContentType(),
					true));
		
		if (appTmp.getGamePhotoContent3() != null)
			appSou.setGamePhoto3(opeFun.fileToServer("/file/"+userName+"/gamePhoto",
					appTmp.getGamePhotoContent3(),
					appTmp.getGamePhotoContent3FileName(),
					appTmp.getGamePhotoContent3ContentType(),
					true));
		if (appTmp.getGamePhotoContent4() != null)
			appSou.setGamePhoto4(opeFun.fileToServer("/file/"+userName+"/gamePhoto",
					appTmp.getGamePhotoContent4(),
					appTmp.getGamePhotoContent4FileName(),
					appTmp.getGamePhotoContent4ContentType(),
					true));
		if (appTmp.getGamePhotoContent5() != null)
			appSou.setGamePhoto5(opeFun.fileToServer("/file/"+userName+"/gamePhoto",
					appTmp.getGamePhotoContent5(),
					appTmp.getGamePhotoContent5FileName(),
					appTmp.getGamePhotoContent5ContentType(),
					true));
		System.out.println(opeFun.getNowTime());
		appInfo.setUpTime(opeFun.getNowTime());
		appInfo.setJoint((int) httpSession.getAttribute("joint"));//�����Ƿ�������Ӫ
		httpSession.removeAttribute("app");
		if (appTmp.getChangeId() == 0) {
			httpSession.setAttribute("appName", appInfo.getAppName());
			appInfoDAO.save(appInfo);
			appSouDAO.save(appSou);
			appAutDAO.save(appAut);
			return "upload_sec";
		} else {
			httpSession.setAttribute("appName", appInfo.getAppName());
			appInfoDAO.update(appTmp.getChangeId(), appInfo);
			appSouDAO.update(appTmp.getChangeId(), appSou);
			appAutDAO.update(appTmp.getChangeId(), appAut);
			return "edit_sec";
		}

	}
	/**
	 * ����id�ҵ��༭��Ӧ��
	 * 
	 * @return
	 */
	public String devEditApp() {
		AppInfo info = appInfoDAO.findById(appTmp.getEditId());
		AppSource source = appSouDAO.findById(appTmp.getEditId());
		AppAuthority authority = appAutDAO.findById(appTmp.getEditId());
		App app = new App(info,source,authority);
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		httpSession.setAttribute("app", app);

		return Action.SUCCESS;
	}

	
	/**�û������Ƿ��ϼ�
	 * @return
	 * -2ǿ���¼ܣ�-1���¼ܣ�0��������1���ϼ�
	 */
	@SuppressWarnings({ "unchecked", "rawtypes"})
	public String devIsShelf() {
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		userName=(String) httpSession.getAttribute("username");
		int total = appInfoDAO.findByShelfAndIsThroughNum(userName,1,appTmp.getIsShelf());
		PageUtil page = new PageUtil(appTmp.getIsShelfCurrentPage(), total);
		page.setPageSize(10);
		List<AppInfo> appIsShelf = appInfoDAO.findByShelfAndIsThrough(userName,1, appTmp.getIsShelf(),
				appTmp.getIsShelfCurrentPage(), page.getPageSize());
		List<App> app = new ArrayList<App>();
		for (int i = 0; i < appIsShelf.size(); i++) {
			AppInfo info = appIsShelf.get(i);
			AppSource source = appSouDAO.findById(info.getId());
			AppAuthority authority = appAutDAO.findById(info.getId());
			app.add(new App(info,source,authority));
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", app);
		request.put("page", page);
		String str="";
		switch(appTmp.getIsShelf()){
		case -1:
			str = "drop";
			break;
		case 0:
			str = "wait_publish";
			break;
		case 1:
			str = "isShelf";
			break;
		}
		return str;
	}
	
	/**�û����Լ���Ӧ�����ó��¼�
	 * @return
	 */
	public String devSetWithdrawn(){
		AppInfo info = appInfoDAO.findById(appTmp.getSetWithdrawnId());
		info.setShelf(-1);
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		httpSession.setAttribute("appName", info.getAppName());
		appInfoDAO.update(appTmp.getSetWithdrawnId(), info);
		return Action.SUCCESS;
	}
	
	
	/**�û����Լ���Ӧ�����ó��ϼ�
	 * @return
	 */
	public String devSetIsShelf(){
		AppInfo info = appInfoDAO.findById(appTmp.getSetIsShelfId());
		info.setShelf(1);
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		httpSession.setAttribute("appName", info.getAppName());
		appInfoDAO.update(appTmp.getSetIsShelfId(), info);
		return Action.SUCCESS;
	}
	
	/**�û�ɾ���Լ���Ӧ��
	 * @return
	 */
	public String devDeleteApp(){
		AppInfo appInfo = appInfoDAO.findById(appTmp.getDeleteAppId());
		
		List<MessagePayment> mesPay =  messageDAO.findByAppIdCpId(appInfo.getApp_id(), appInfo.getCp_id());
		for(int i = 0;i<mesPay.size(); i++){
			MessagePayment mes = mesPay.get(i);
			OtherPayment other = otherPaymentDAO.findById(mes.getId());
			messageDAO.delete(mes);
			otherPaymentDAO.delete(other);
		}
		List<Review> review = reviewDAO.findByAppId(appTmp.getDeleteAppId());
		for(int i=0;i<review.size();i++)
			reviewDAO.delete(review.get(i));
		appInfoDAO.delete(appTmp.getDeleteAppId());
		appSouDAO.delete(appTmp.getDeleteAppId());
		appAutDAO.delete(appTmp.getDeleteAppId());

		return Action.SUCCESS;
	}
	
	/**�����û����Ƿ�ͨ�������
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String devIsThrough(){
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		userName=(String) httpSession.getAttribute("username");
		int total = appInfoDAO.findByIsThroughNum(userName, appTmp.getIsThrough());
		PageUtil page = new PageUtil(appTmp.getIsThroughCurrentPage(), total);
		page.setPageSize(10);
		List<AppInfo> appIsThrough = appInfoDAO.findByIsThrough(userName,appTmp.getIsThrough(),
				appTmp.getIsThroughCurrentPage(), page.getPageSize());
		List<App> app = new ArrayList<App>();
		for (int i = 0; i < appIsThrough.size(); i++) {
			AppInfo info = appIsThrough.get(i);
			AppSource source = appSouDAO.findById(info.getId());
			AppAuthority authority = appAutDAO.findById(info.getId());
			app.add(new App(info,source,authority));
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", app);
		request.put("page", page);
		String str="waitThrough";
		switch(appTmp.getIsThrough()){
		case 0:
			str = "waitThrough";
			break;
		case -1:
			str = "notThrough";
			break;
		}
		return str;
	}
	/**�û���˹����û�ֻ�ܲ鿴Ӧ����Ϣ�������Ҫ�༭Ӧ����Ϣ�����༭ҳȥ�༭
	 * @return
	 */
	public String devAuditManagement(){
		AppInfo info = appInfoDAO.findById(appTmp.getAuditManagementId());
		AppSource appSou = appSouDAO.findById(appTmp.getAuditManagementId());
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		httpSession.setAttribute("info", info);
		httpSession.setAttribute("appSou", appSou);
		
		return Action.SUCCESS;
	}
	
	
	
	/**����ز�
	 * @return
	 */
	public String devAuditSou(){
		return Action.SUCCESS;
	}
	/**�˵����Ӧ��&��Ϸʱ�ҵ��û�δͨ����˵�Ӧ��
	 * @return
	 */
	public String menuDevAppAndGame(){
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		userName=(String) httpSession.getAttribute("username");
		int userTotal = appInfoDAO.findByIsThroughNum(userName, 0);
		System.out.println("userName"+userName+"userTotal"+userTotal);
		httpSession.setAttribute("userTotal", userTotal);
		String str ="";
		switch(userType){
		case -1:
			str = "inuser";
			break;
		case 0:
			str = "ingroup";
			break;
		case 1:
			str = "common";
			break;
		default:
			str = "inuser";
			break;
		}
		return str;
		
	}
	/**�û��ϴ���Ӧ��δͨ����˵����ɣ�������ֻ�ܿ����ɺ�ɾ����Ӧ��
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String theReasonsNotThrough(){
		AppInfo info = appInfoDAO.findById(appTmp.getEditId());
		AppSource source = appSouDAO.findById(appTmp.getEditId());
		AppAuthority authority = appAutDAO.findById(appTmp.getEditId());
		App app = new App(info,source,authority);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", app);
		return Action.SUCCESS;
	}
	
	/**
	 * cp����Ӧ�ù���
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String devShowJoint(){
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		userName=(String) httpSession.getAttribute("username");
		int total = appInfoDAO.findJointNum(userName,shelf, joint);
		PageUtil page = new PageUtil(currentPage, total);
		page.setPageSize(10);
		List<AppInfo> appInfo = appInfoDAO.findByJoint(userName,shelf, joint, currentPage, page.getPageSize());
		List<App> app = new ArrayList<>();
		for(int i = 0 ; i<appInfo.size() ; i++){
			AppInfo info = appInfo.get(i);
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			app.add(new App(info,sou,aut));
		}
		@SuppressWarnings("rawtypes")
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", app);
		request.put("page", page);
		switch(shelf){
		case -2:return "dropForce";
		case -1:return "drop"; 
		case 0:return "waitPublish";
		default:return "shelf";
		
		}
		
	}
	
	/**get set ����
	 * 
	 * @return
	 */
	
	
	public AppAuthority getAppAut() {
		return appAut;
	}

	public int getShelf() {
		return shelf;
	}
	public void setShelf(int shelf) {
		this.shelf = shelf;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public App getSubApp() {
		return subApp;
	}

	public void setSubApp(App subApp) {
		this.subApp = subApp;
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

	public AppSource getAppSou() {
		return appSou;
	}

	public void setAppSou(AppSource appSou) {
		this.appSou = appSou;
	}

	public OpeFunction getOpeFun() {
		return opeFun;
	}

	public void setOpeFun(OpeFunction opeFun) {
		this.opeFun = opeFun;
	}
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getJoint() {
		return joint;
	}
	public void setJoint(int joint) {
		this.joint = joint;
	}
	public DevAction(UserDAO userDAO, AppAutDAO appAutDAO,
			AppInfoDAO appInfoDAO, AppSouDAO appSouDAO, ReviewDAO reviewDAO,
			MessageDAO messageDAO, OtherPaymentDAO otherPaymentDAO) {
		super();
		this.userDAO = userDAO;
		this.appAutDAO = appAutDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.reviewDAO = reviewDAO;
		this.messageDAO = messageDAO;
		this.otherPaymentDAO = otherPaymentDAO;
	}
	
	

}
