package com.rainbow.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;






import com.opensymphony.xwork2.Action;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReceiptDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Receipt;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.AppReceipt;
import com.rainbow.server.DetailReceipt;
import com.rainbow.server.UserApps;
import com.rainbow.util.PageUtil;

/**
 * @author STerOTto
 * @version 2014-8-7 15:35:50
 */
public class AdminReportAction {
	private UserDAO userDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private ReceiptDAO receiptDAO;

	private int userId;
	private int appId;
	private String payType;
	private String startTime;
	private String endTime;
	private String companyOrName;
	private String orderIdOrAppName;
	private int currentPage = 1;
	private String appName;

	/**
	 * ��ҵ������ʼ��
	 * 
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String adminReportInit() {
		int jointAppCount = appInfoDAO.findAllJointNum(1);// ����Ӧ������
		int receiptCount = 0;// ������
		double cmyxPaySum = 0; // �ܽ��

		int total = 0;

		PageUtil page;

		List<User> userList = new ArrayList<User>();
		if (companyOrName == null || "������ҵ����".equals(companyOrName)
				|| "".equals(companyOrName)) {
			total = userDAO.findDiviedUserApprovedNum(1);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findDiviedUserApproved(1, currentPage,
					page.getPageSize());
		} else {
			total = userDAO.findByUserCompanyOrNameNum(1, companyOrName);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findByUserCompanyOrName(1, companyOrName,
					currentPage, page.getPageSize());
		}
		List<UserApps> userAppsList = new ArrayList<UserApps>();
		for (User user : userList) {
			List<App> appList = new ArrayList<App>();
			List<AppInfo> appInfo = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				appList.add(new App(info, sou, aut));
			}
			List<Receipt> receiptList = receiptDAO.findByCp_id(user.getCp_id());
			double paySum = 0;
			for (Receipt receipt : receiptList) {
				receiptCount++;
				paySum += receipt.getPrice();
				cmyxPaySum += receipt.getPrice();
			}
			UserApps userApps = new UserApps();
			userApps.setUser(user);
			userApps.setApp(appList);
			userApps.setReceiptList(receiptList);
			userApps.setPaySum(paySum);
			userAppsList.add(userApps);
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("jointAppCount", jointAppCount);
		session.setAttribute("receiptCount", receiptCount);
		session.setAttribute("cmyxPaySum", String.valueOf(cmyxPaySum));
		session.setAttribute("userAppsList", userAppsList);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", page);

		return Action.SUCCESS;
	}

	/**
	 * ����Ա��ѯ���
	 * 
	 * @return
	 * @throws IOException
	 */
	public void adminEarnings() throws IOException {
		double earningsSum = 0;
		List<Receipt> receiptList = new ArrayList<Receipt>();
		if ("ȫ��֧��".equals(payType)) {
			receiptList = receiptDAO.findByTime(startTime, endTime);
		} else {
			String typeReg = "";
			switch (payType) {
			case "�̴�":
				typeReg = "00";
				break;
			case "֧����":
				typeReg = "01";
				break;
			default:
				typeReg = "02";
				break;
			}
			receiptList = receiptDAO.findByTypeAndTime(typeReg, startTime,
					endTime);
		}
		for (Receipt receipt : receiptList)
			earningsSum += receipt.getPrice();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(String.valueOf(earningsSum));

	}

	/**
	 * ����Ա�����û�����˾��ģ����ѯ��
	 * 
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String adminSearchUserReport() {
		int total = 0;

		PageUtil page;

		List<User> userList = new ArrayList<User>();
		if (companyOrName == null || "������ҵ����".equals(companyOrName)
				|| "".equals(companyOrName)) {
			total = userDAO.findDiviedUserApprovedNum(1);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findDiviedUserApproved(1, currentPage,
					page.getPageSize());
		} else {
			total = userDAO.findByUserCompanyOrNameNum(1, companyOrName);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findByUserCompanyOrName(1, companyOrName,
					currentPage, page.getPageSize());
		}
		List<UserApps> userAppsList = new ArrayList<UserApps>();
		for (User user : userList) {
			List<App> appList = new ArrayList<App>();
			List<AppInfo> appInfo = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				appList.add(new App(info, sou, aut));
			}
			List<Receipt> receiptList = receiptDAO.findByCp_id(user.getCp_id());
			double paySum = 0;
			for (Receipt receipt : receiptList) {
				paySum += receipt.getPrice();
			}
			UserApps userApps = new UserApps();
			userApps.setUser(user);
			userApps.setApp(appList);
			userApps.setReceiptList(receiptList);
			userApps.setPaySum(paySum);
			userAppsList.add(userApps);
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("userAppsList", userAppsList);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", page);

		return Action.SUCCESS;
	}

	/*
	 * �����ǹ���Ա�鿴ĳ��cp������˵���� ����userId�ҵ�user���ж�Ӧ��ѯ
	 */
	/**
	 * �����ʼ��
	 * 
	 * @return
	 */
	public String adminInitializeUserReport() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = userDAO.find(userId);
		int cpTotalNum = 0;
		cpTotalNum = appInfoDAO.findByUserIdAndThroughNum(user.getCp_id(), 1);// cpͨ����˵�Ӧ�õ�����

		int cpOrderNum = 0;
		cpOrderNum = receiptDAO.findByCp_idNum(user.getCp_id());// cp�Ķ�������
		
		double paySun = 0.0;
		double searchPaySun = 0.0;
		/*
		 * ��ѯcpÿ��Ӧ�õ��˵�
		 */
		List<AppReceipt> appReceiptList = new ArrayList<AppReceipt>();
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		List<AppInfo> appInfo = appInfoDAO.findUserJointApp(user.getCp_id(), 1);
		for (AppInfo info : appInfo) {
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			AppReceipt appReceipt = new AppReceipt();
			appReceipt.setApp(new App(info, sou, aut));
			appReceipt.setUser(user);

			List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
					info.getCp_id(), info.getApp_id());
			appReceipt.setReceiptList(receiptList);

			int orderSun = 0;
			int payment = 0;
			for (Receipt receipt : receiptList) {
				orderSun++;
				payment += receipt.getPrice();
				paySun += receipt.getPrice();
				DetailReceipt detailReceipt = new DetailReceipt();
				detailReceipt.setApp(new App(info, sou, aut));
				detailReceipt.setUser(user);
				detailReceipt.setReceipt(receipt);
				detailReceiptList.add(detailReceipt);
			}
			appReceipt.setOrderSun(orderSun);
			appReceipt.setPayment(payment);
			appReceiptList.add(appReceipt);
		}
		/*
		 * appReceiptListΪcp��ȫ��Ӧ�� reportListΪ����cp�Ĳ�ѯ������ѯ���ı��� ��ʼ��������ͬ
		 */

		searchPaySun = paySun;
		session.setAttribute("user", user);
		session.setAttribute("cpTotalNum", cpTotalNum);
		session.setAttribute("cpOrderNum", cpOrderNum);
		session.setAttribute("paySun", String.valueOf(paySun));
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("detailReceiptList", detailReceiptList);
		session.setAttribute("appReceiptList", appReceiptList);

		return Action.SUCCESS;
	}

	/**
	 * ���ݶ����Ż�Ӧ�����Ʋ�ѯ
	 */
	public String adminSearchByOrderOrAppName() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		double searchPaySun = 0;
		// �����Ӧ����
		List<AppInfo> appInfo = appInfoDAO.findUserJointAppByAppName(
				user.getCp_id(), 1, orderIdOrAppName);
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				DetailReceipt detailReceipt = new DetailReceipt();
				List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
						info.getCp_id(), info.getApp_id());
				for (Receipt receipt : receiptList) {
					searchPaySun += receipt.getPrice();
					detailReceipt.setApp(new App(info, sou, aut));
					detailReceipt.setUser(user);
					detailReceipt.setReceipt(receipt);
					detailReceiptList.add(detailReceipt);
				}
			}
			// ������Ƕ�����
			Receipt receipt = receiptDAO.findByOrder_id(orderIdOrAppName);		
			if (receipt != null) {
				DetailReceipt detailReceipt = new DetailReceipt();
				searchPaySun += receipt.getPrice();	
				AppInfo info = appInfoDAO.findByCp_idAndApp_id(
						receipt.getCp_id(), receipt.getApp_id());
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				detailReceipt.setApp(new App(info, sou, aut));
				detailReceipt.setUser(user);
				detailReceipt.setReceipt(receipt);
				detailReceiptList.add(detailReceipt);
			}
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("detailReceiptList", detailReceiptList);
		return Action.SUCCESS;
	}

	/**
	 * ��������Excel
	 */
	@SuppressWarnings("unchecked")
	public void adminDownReportToExcel() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		detailReceiptList = (List<DetailReceipt>) session.getAttribute("detailReceiptList");
		Date dt = new Date();
		// ����aa��ʾ�����硱�����硱 HH��ʾ24Сʱ�� �������hh��ʾ12Сʱ��
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "CMYX" + sdf.format(dt) + ".xsl";
		try {
			// ���ļ�������������������������
			fileName = encodingFileName(fileName);
			// ����response��Ӧ���ԣ�����Ϊ����
			response.reset();
			response.setContentType("application/vnd.ms-excel; charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ fileName);
			// ���response�е������
			OutputStream out = response.getOutputStream();
			String head = "��ҵ����\tӦ������\t�µ�ʱ��\t������\t֧�����\t֧������\t�ֳɱ���%\tͨ������%\n";
			out.write(head.getBytes("gbk"));
			if (detailReceiptList != null)
				for (DetailReceipt detailReceipt : detailReceiptList) {
					String type = getType(detailReceipt.getReceipt().getOrder_id());
					float channel = 0;
					switch(type){
					case "�̴�":channel = detailReceipt.getApp().getAppAut().getChannel_message();break;
					case "֧����":channel = detailReceipt.getApp().getAppAut().getChannel_alipay();break;
					default:channel = detailReceipt.getApp().getAppAut().getChannel_bank();break;
					}
						String line = detailReceipt.getUser().getCorporatename()
								+ "\t"
								+ detailReceipt.getApp().getAppInfo().getAppName()
								+ "\t��" + detailReceipt.getReceipt().getReceipt_time() + "��\t��"
								+ detailReceipt.getReceipt().getOrder_id() + "��\t"
								+ detailReceipt.getReceipt().getPrice() + "\t"
								+ type + "\t"
								+detailReceipt.getApp().getAppAut().getDivided()+"\t"
								+channel+"\n";
						out.write(line.getBytes("gbk"));
				}
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * ���ݶ����Ż�ȡ֧������
	 * 
	 * @param Order_id
	 * @return
	 */
	public String getType(String Order_id) {
		String reg1 = "^[0-9]{12}00[0-9]*$";
		String reg2 = "^[0-9]{12}01[0-9]*$";
		if (Pattern.matches(reg1, Order_id))
			return "�̴�";
		else if (Pattern.matches(reg2, Order_id))
			return "֧����";
		else
			return "����";
	}

	/**
	 * ����appName����
	 */
	public String adminSearchByAppName() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		double searchPaySun = 0;
		List<AppInfo> appInfo = new ArrayList<AppInfo>();
		if ("ȫ��Ӧ��".equals(appName)) {
			// ����ȫ��Ӧ��
			appInfo = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
		} else {
			// ����Ϸ������
			appInfo = appInfoDAO.findUserJointAppByAppName(
					user.getCp_id(), 1, appName);
		}
		for (AppInfo info : appInfo) {
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
					info.getCp_id(), info.getApp_id());
			for (Receipt receipt : receiptList) {
				searchPaySun += receipt.getPrice();
				DetailReceipt detailReceipt = new DetailReceipt();
				detailReceipt.setApp(new App(info, sou, aut));
				detailReceipt.setUser(user);
				detailReceipt.setReceipt(receipt);
				detailReceiptList.add(detailReceipt);	
			}
		}
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("detailReceiptList", detailReceiptList);
		return Action.SUCCESS;
	}
	
	/**
	 * �鿴app�����鶩��
	 * @return
	 */
	public String adminShowAppReportDetail(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		double searchPaySun = 0;
		AppInfo info = appInfoDAO.findById(appId);
		AppSource sou = appSouDAO.findById(info.getId());
		AppAuthority aut = appAutDAO.findById(info.getId());
		List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
				info.getCp_id(), info.getApp_id());
		for (Receipt receipt : receiptList) {
			searchPaySun += receipt.getPrice();
			DetailReceipt detailReceipt = new DetailReceipt();
			detailReceipt.setApp(new App(info, sou, aut));
			detailReceipt.setUser(user);
			detailReceipt.setReceipt(receipt);
			detailReceiptList.add(detailReceipt);	
		}
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("detailReceiptList", detailReceiptList);
		 return Action.SUCCESS;
	 }
	/**
	 * ����ʱ��β�ѯ����
	 */
	public String adminSearchByTime(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		double searchPaySun = 0;
		List<Receipt> receiptList = new ArrayList<Receipt>();
		if("ȫ��֧��".equals(payType)){
			receiptList = receiptDAO.findByCp_idAndTime(user.getCp_id(), startTime, endTime);
			
		}
		else{
			String typeReg="";
			switch(payType){
			case "�̴�":typeReg="00";break;
			case "֧����":typeReg="01";break;
			default :typeReg="02";break;
			}
			receiptList = receiptDAO.findByCp_idAndTypeAndTime(user.getCp_id(), typeReg, startTime, endTime);
		}
		for(Receipt receipt:receiptList){
			searchPaySun += receipt.getPrice();
			AppInfo info = appInfoDAO.findByCp_idAndApp_id(receipt.getCp_id(), receipt.getApp_id());
			AppSource sou = appSouDAO.findById(info.getId());
			AppAuthority aut = appAutDAO.findById(info.getId());
			DetailReceipt detailReceipt = new DetailReceipt();
			detailReceipt.setApp(new App(info, sou, aut));
			detailReceipt.setUser(user);
			detailReceipt.setReceipt(receipt);
			detailReceiptList.add(detailReceipt);
		}
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("detailReceiptList", detailReceiptList);
		return Action.SUCCESS;
	}

	/**
	 * ���������� �ո�����
	 * 
	 * @param fileName
	 * @return
	 */
	public static String encodingFileName(String fileName) {
		String returnFileName = "";
		String bowser = "";
		if (ServletActionContext.getRequest().getHeader("USER-AGENT")
				.toLowerCase().indexOf("firefox") > 0)
			bowser = "firefox";
		else
			bowser = "IE";

		try {
			if ("firefox".equals(bowser)) {
				returnFileName = new String(fileName.getBytes("UTF-8"),
						"ISO8859-1");
				returnFileName = StringUtils.replace(returnFileName, " ", "");
			} else {
				returnFileName = URLEncoder.encode(fileName, "UTF-8");
				returnFileName = StringUtils
						.replace(returnFileName, "+", "%20");
				if (returnFileName.length() > 150) {
					returnFileName = new String(fileName.getBytes("GB2312"),
							"ISO8859-1");
					returnFileName = StringUtils.replace(returnFileName, " ",
							"%20");
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();

		}
		return returnFileName;
	}
	/*
	 * ����Ա��ѯĳ��cp�˵� end
	 */
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCompanyOrName() {
		return companyOrName;
	}

	public void setCompanyOrName(String companyOrName) {
		this.companyOrName = companyOrName;
	}

	public String getOrderIdOrAppName() {
		return orderIdOrAppName;
	}

	public void setOrderIdOrAppName(String orderIdOrAppName) {
		this.orderIdOrAppName = orderIdOrAppName;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public AdminReportAction(UserDAO userDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO, ReceiptDAO receiptDAO) {
		super();
		this.userDAO = userDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.receiptDAO = receiptDAO;
	}

}
