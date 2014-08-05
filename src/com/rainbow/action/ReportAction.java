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
 * @version 2014-7-30 22:44:14 报表
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
	 * 报表初始化
	 * 
	 * @return
	 */
	public String reportInitialize() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		int cpTotalNum = 0;
		cpTotalNum = appInfoDAO.findByUserIdAndThroughNum(user.getCp_id(), 1);// cp通过审核的应用的总数

		int cpOrderNum = 0;
		cpOrderNum = receiptDAO.findByCp_idNum(user.getCp_id());// cp的订单总数
		
		double paySun = 0.0;
		double searchPaySun = 0.0;
		/*
		 * 查询cp每个应用的账单
		 */
		List<AppReceipt> appReceiptList = new ArrayList<AppReceipt>();
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
			}
			appReceipt.setOrderSun(orderSun);
			appReceipt.setPayment(payment);
			appReceiptList.add(appReceipt);
		}
		/*
		 * appReceiptList为cp的全部应用 reportList为根据cp的查询条件查询到的报表 初始这两个相同
		 */
		List<AppReceipt> reportList = new ArrayList<AppReceipt>(appReceiptList);
		searchPaySun = paySun;
		session.setAttribute("cpTotalNum", cpTotalNum);
		session.setAttribute("cpOrderNum", cpOrderNum);
		session.setAttribute("paySun", String.valueOf(paySun));
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("reportList", reportList);
		session.setAttribute("appReceiptList", appReceiptList);

		return Action.SUCCESS;
	}

	/**
	 * 根据订单号或应用名称查询
	 */
	public void searchByOrderOrAppName() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<AppReceipt> reportList = new ArrayList<AppReceipt>();
		double searchPaySun = 0;
		// 输入的应用名
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
				int orderSun = 0;
				int payment = 0;
				for (Receipt receipt : receiptList) {
					orderSun++;
					payment += receipt.getPrice();
					searchPaySun += receipt.getPrice();
				}
				report.setOrderSun(orderSun);
				report.setPayment(payment);
				reportList.add(report);
			}
		} else {
			// 输入的是订单号
			Receipt receipt = receiptDAO.findByOrder_id(orderIdOrAppName);
			int orderSun = 0;
			int payment = 0;
			orderSun++;
			payment += receipt.getPrice();
			searchPaySun += receipt.getPrice();	
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
				report.setOrderSun(orderSun);
				report.setPayment(payment);
				report.setReceiptList(receiptList);
				reportList.add(report);
			}
		}
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("reportList", reportList);
	}

	/**
	 * 将报表导出Excel
	 */
	@SuppressWarnings("unchecked")
	public void downReportToExcel() {
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<AppReceipt> reportList = new ArrayList<AppReceipt>();
		reportList = (List<AppReceipt>) session.getAttribute("reportList");
		Date dt = new Date();
		// 最后的aa表示“上午”或“下午” HH表示24小时制 如果换成hh表示12小时制
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "CMYX" + sdf.format(dt) + ".xlsx";
		System.out.println(fileName);
		try {
			// 对文件名作处理，避免中文乱码问题
			fileName = encodingFileName(fileName);
			// 设置response相应属性，设置为下载
			response.reset();
			response.setContentType("application/vnd.ms-excel; charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename="
					+ fileName);
			// 获得response中的输出流
			OutputStream out = response.getOutputStream();
			String head = "企业名称\t应用名称\t下单时间\t订单号\t支付金额\t支付类型\t分成比例%\t通道费率%\n";
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
	 * 根据订单号获取支付类型
	 * 
	 * @param Order_id
	 * @return
	 */
	public String getType(String Order_id) {
		String reg1 = "^[0-9]{12}00[0-9]*$";
		String reg2 = "^[0-9]{12}01[0-9]*$";
		if (Pattern.matches(reg1, Order_id))
			return "短代";
		else if (Pattern.matches(reg2, Order_id))
			return "支付宝";
		else
			return "银联";
	}

	/**
	 * 根据appName搜索
	 */
	public void searchByAppName() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<AppReceipt> reportList = new ArrayList<AppReceipt>();
		double searchPaySun = 0;
		System.out.println("appName:"+appName);
		if ("全部应用".equals(appName)) {
			// 搜索全部应用
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
				int orderSun = 0;
				int payment = 0;
				for (Receipt receipt : receiptList) {
					orderSun++;
					payment += receipt.getPrice();
					searchPaySun += receipt.getPrice();
				}
				report.setOrderSun(orderSun);
				report.setPayment(payment);
				reportList.add(report);
			}
		} else {
			// 按游戏名搜索
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
				int orderSun = 0;
				int payment = 0;
				for (Receipt receipt : receiptList) {
					orderSun++;
					payment += receipt.getPrice();
					searchPaySun += receipt.getPrice();
				}
				report.setOrderSun(orderSun);
				report.setPayment(payment);
				reportList.add(report);
			}
			session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
			System.out.println("reportList:"+reportList.size());
			session.removeAttribute("reportList");
			session.setAttribute("reportList", reportList);
		}
	}

	/**
	 * 中文名乱码 空格问题
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
