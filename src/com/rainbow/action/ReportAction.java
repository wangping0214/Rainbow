package com.rainbow.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Receipt;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.AppReceipt;

/**
 * @author STerOTto
 * @version 2014-7-30 22:44:14 ����
 */
public class ReportAction {
	private ReceiptDAO receiptDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;

	private int reportId;
	private String type;
	private String startTime;
	private String endTime;
	private String orderIdOrAppName;
	private String appName;

	/**
	 * �����ʼ��
	 * 
	 * @return
	 */
	public String reportInitialize() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		int cpTotalNum = appInfoDAO.findByUserIdAndThroughNum(user.getCp_id(),
				1);// cpͨ����˵�Ӧ�õ�����
		session.setAttribute("cpTotalNum", cpTotalNum);
		int cpOrderNum = receiptDAO.findByCp_idNum(user.getCp_id());// cp�Ķ�������
		session.setAttribute("cpOrderNum", cpOrderNum);
		/*
		 * ��ѯcpÿ��Ӧ�õ��˵�
		 */
		List<AppReceipt> AppReceiptList = new ArrayList<>();
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
			}
			appReceipt.setOrderSun(orderSun);
			appReceipt.setPayment(payment);
			AppReceiptList.add(appReceipt);
		}
		List<AppReceipt> reportList = new ArrayList<AppReceipt>(AppReceiptList);
		session.setAttribute("reportList", reportList);
		session.setAttribute("AppReceiptList", AppReceiptList);

		return Action.SUCCESS;
	}

	/**
	 * ���ݶ����Ż�Ӧ�����Ʋ�ѯ
	 */
	public void searchByOrderOrAppName() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<AppReceipt> reportList = new ArrayList<AppReceipt>();
		// �����Ӧ����
		List<AppInfo> appInfo = appInfoDAO.findUserJointAppByAppName(
				user.getCp_id(), 1, orderIdOrAppName);
		if (appInfo.size() > 0) {
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				AppReceipt report = new AppReceipt();
				report.setApp(new App(info, sou, aut));
				report.setUser(user);
				List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
						info.getCp_id(), info.getApp_id());
				report.setReceiptList(receiptList);
				reportList.add(report);
			}
		} else {
			// ������Ƕ�����
			Receipt receipt = receiptDAO.findByOrder_id(orderIdOrAppName);
			if (receipt != null) {
				AppInfo info = appInfoDAO.findByCp_idAndApp_id(
						receipt.getCp_id(), receipt.getApp_id());
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				AppReceipt report = new AppReceipt();
				report.setApp(new App(info, sou, aut));
				report.setUser(user);
				List<Receipt> receiptList = new ArrayList<Receipt>();
				receiptList.add(receipt);
				report.setReceiptList(receiptList);
				reportList.add(report);
			}
		}
		session.setAttribute("reportList", reportList);
	}

	/**
	 * ��������Excel
	 */
	@SuppressWarnings("unchecked")
	public void downReportToExcel() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<AppReceipt> reportList = (List<AppReceipt>) session
				.getAttribute("reportList");
		Date dt = new Date();
		// ����aa��ʾ�����硱�����硱 HH��ʾ24Сʱ�� �������hh��ʾ12Сʱ��
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "CMYX" + sdf.format(dt) + ".xlsx";
		System.out.println(fileName);
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
			if (reportList != null)
				for (AppReceipt appReceipt : reportList) {
					for (Receipt receipt : appReceipt.getReceiptList()) {
						String line = appReceipt.getUser().getCorporatename()
								+ "\t"
								+ appReceipt.getApp().getAppInfo().getAppName()
								+ "\t" + receipt.getReceipt_time() + "\t"
								+ receipt.getOrder_id() + "\t"
								+ receipt.getPrice() + "\t"
								+ getType(receipt.getOrder_id()) + "\n";
						out.write(line.getBytes("gbk"));
					}
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
	public void searchByAppName() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<AppReceipt> reportList = new ArrayList<AppReceipt>();
		if ("ȫ��Ӧ��".equals(appName)) {
			// ����ȫ��Ӧ��
			List<AppInfo> appInfo = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				AppReceipt report = new AppReceipt();
				report.setApp(new App(info, sou, aut));
				report.setUser(user);

				List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
						info.getCp_id(), info.getApp_id());
				report.setReceiptList(receiptList);
				reportList.add(report);
			}
		} else {
			// ����Ϸ������
			List<AppInfo> appInfo = appInfoDAO.findUserJointAppByAppName(
					user.getCp_id(), 1, appName);
			for (AppInfo info : appInfo) {
				AppSource sou = appSouDAO.findById(info.getId());
				AppAuthority aut = appAutDAO.findById(info.getId());
				AppReceipt report = new AppReceipt();
				report.setApp(new App(info, sou, aut));
				report.setUser(user);
				List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
						info.getCp_id(), info.getApp_id());
				report.setReceiptList(receiptList);
				reportList.add(report);
			}
			session.setAttribute("reportList", reportList);
		}
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

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getOrderIdOrAppName() {
		return orderIdOrAppName;
	}

	public void setOrderIdOrAppName(String orderIdOrAppName) {
		this.orderIdOrAppName = orderIdOrAppName;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public ReportAction(ReceiptDAO receiptDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO) {
		super();
		this.receiptDAO = receiptDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
	}

}
