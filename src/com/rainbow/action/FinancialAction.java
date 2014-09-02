package com.rainbow.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.AdminDAO;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReceiptDAO;
import com.rainbow.dao.TaxRateDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.Admin;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Receipt;
import com.rainbow.entity.TaxRate;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.Financial;
import com.rainbow.server.FinancialSev;
import com.rainbow.util.PageUtil;

/**
 * �������
 * 
 * @author STerOTto
 *
 */
public class FinancialAction {
	private UserDAO userDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private ReceiptDAO receiptDAO;
	private TaxRateDAO taxRateDAO;
	private AdminDAO adminDAO;

	private int appId;
	private String year;
	private String month;
	private String status;
	private int currentPage = 1;
	private String userOrAppName;
	
	private String userName;
	private String password;
	
	/**
	 * �����¼
	 * @throws IOException
	 */
	public void financialLogin() throws IOException{
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Admin financial = adminDAO.findUserNameAndPassword(userName, password);
		if(financial==null)
			response.getWriter().println("0");
		else
			response.getWriter().println("1");
		session.setAttribute("financial", financial);
	}

	/**
	 * �����ʼ����Ĭ����ʾ���걾�£�״̬Ϊȫ�� �ɸ���ʱ���ѯ
	 * 
	 * @return
	 */
	public String initFinancial() {
		// ��ʼ���ݴ���
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year)) {
			// Ĭ��Ϊ����
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month)) {
			month = String.format("%02d", now.get(Calendar.MONTH) + 1);
		} else {
			month = month.substring(0, month.length() - 1);
			month = String.format("%02d", Integer.valueOf(month));
		}
		int check_out = -1;
		if (status == null || "".equals(status)) {
			// Ĭ�Ͻ���״̬Ϊȫ��
			status = "ȫ��";
			check_out = -1;
		} else {
			switch (status) {
			case "ȫ��":
				check_out = -1;
				break;
			case "�ѽ���":
				check_out = 1;
				break;
			default:
				check_out = 0;
				break;
			}
		}
		DecimalFormat df = new DecimalFormat(".##");//���ݸ�ʽ
		// δ������
		int no_check_out = 0;
		List<User> allUserList = userDAO.findDiviedUserApproved(1);
		for (User user : allUserList) {
			List<AppInfo> appInfoList = appInfoDAO.findUserJointApp(
					user.getCp_id(), 1);
			for (AppInfo info : appInfoList) {
				List<Receipt> receiptList = new ArrayList<Receipt>();
				receiptList = receiptDAO.findByUserAppYearMonth(
						user.getCp_id(), info.getApp_id(), year + "-" + month);
				if (receiptList.size() > 0
						&& receiptList.get(0).getCheck_out() == 0) {
					no_check_out++;
				}
			}
		}
		// ��ҳ��ѯ��ʼ��
		List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
		int total;
		PageUtil page;
		List<User> userList;
		// ����appName��ѯAPP
		AppInfo appInfo = appInfoDAO.findJointAppByAppName(1, userOrAppName);
		// δ������ҵ/Ӧ������
		if (userOrAppName == null || "".equals(userOrAppName)
				|| "������ҵ/Ӧ������".equals(userOrAppName)) {
			total = userDAO.findDiviedUserApprovedNum(1);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findDiviedUserApproved(1, currentPage,
					page.getPageSize());
		}
		// ��������ҵ/Ӧ������
		else {
			// ��ѯ��ҵ
			total = userDAO.findByUserCompanyOrNameNum(1, userOrAppName);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findByUserCompanyOrName(1, userOrAppName,
					currentPage, page.getPageSize());
		}
		// ���������ҵ���ƻ���δ�����ѯ���������appNameδ��ѯ��APP
		if (null == appInfo) {
			// δ�ҵ���ҵ
			if (userList == null)
				return Action.ERROR;
			for (User user : userList) {
				FinancialSev financialSev = new FinancialSev();
				financialSev.setUser(user);
				List<Financial> financialList = new ArrayList<Financial>();
				List<AppInfo> appInfoList = appInfoDAO.findUserJointApp(
						user.getCp_id(), 1);
				for (AppInfo info : appInfoList) {
					Financial financial = new Financial();
					AppSource sou = appSouDAO.findById(info.getId());
					AppAuthority aut = appAutDAO.findById(info.getId());
					App app = new App(info, sou, aut);
					financial.setApp(app);

					List<Receipt> receiptList = new ArrayList<Receipt>();
					receiptList = receiptDAO.findByUserAppYearMonth(
							user.getCp_id(), info.getApp_id(), year + "-"
									+ month);
					financial.setReceiptList(receiptList);
					if (receiptList.size() > 0) {
						financial.setCheck_out(receiptList.get(0)
								.getCheck_out());
					} else
						financial.setCheck_out(1);
					TaxRate taxRate = taxRateDAO.findByYearMonth(year + "-"
							+ month);
					if (taxRate == null)
						return Action.ERROR;
					financial.setTaxRate(taxRate);

					double sum = 0.0;
					double massageSum = 0.0;
					double alipaySum = 0.0;
					double bankSum = 0.0;
					double paySum = 0.0;
					for (Receipt receipt : receiptList) {
						switch (getType(receipt.getOrder_id())) {
						case 0:
							massageSum += receipt.getPrice();
							break;
						case 1:
							alipaySum += receipt.getPrice();
							break;
						default:
							bankSum += receipt.getPrice();
							break;
						}
					}
					sum = massageSum + alipaySum + bankSum;
					paySum = (massageSum
							* (1 - taxRate.getChannel_message() / 100)
							+ alipaySum
							* (1 - taxRate.getChannel_alipay() / 100) + bankSum
							* (1 - taxRate.getChannel_bank() / 100))
							* (1 - taxRate.getTax_rate() / 100)
							* (app.getAppAut().getDivided() / 100);

					
					financial.setSum(Double.valueOf(df.format(sum)));
					financial.setMassageSum(Double.valueOf(df.format(massageSum)));
					financial.setAlipaySum(Double.valueOf(df.format(alipaySum)));
					financial.setBankSum(Double.valueOf(df.format(bankSum)));
					financial.setPaySum(Double.valueOf(df.format(paySum)));

					financialList.add(financial);
				}
				financialSev.setFinancialList(financialList);
				financialSevList.add(financialSev);
			}
		}
		// ����appName��ѯ��APP
		else {
			FinancialSev financialSev = new FinancialSev();
			User user = userDAO.findByCp_id(appInfo.getCp_id());
			financialSev.setUser(user);
			List<Financial> financialList = new ArrayList<Financial>();
			Financial financial = new Financial();
			AppSource sou = appSouDAO.findById(appInfo.getId());
			AppAuthority aut = appAutDAO.findById(appInfo.getId());
			App app = new App(appInfo, sou, aut);
			financial.setApp(app);

			List<Receipt> receiptList = new ArrayList<Receipt>();
			receiptList = receiptDAO.findByUserAppYearMonth(appInfo.getCp_id(),
					appInfo.getApp_id(), year + "-" + month);
			financial.setReceiptList(receiptList);
			if (receiptList.size() > 0) {
				financial.setCheck_out(receiptList.get(0).getCheck_out());
			} else
				financial.setCheck_out(1);
			TaxRate taxRate = taxRateDAO.findByYearMonth(year + "-" + month);
			if (taxRate == null)
				return Action.ERROR;
			financial.setTaxRate(taxRate);

			double sum = 0.0;
			double massageSum = 0.0;
			double alipaySum = 0.0;
			double bankSum = 0.0;
			double paySum = 0.0;
			for (Receipt receipt : receiptList) {
				switch (getType(receipt.getOrder_id())) {
				case 0:
					massageSum += receipt.getPrice();
					break;
				case 1:
					alipaySum += receipt.getPrice();
					break;
				default:
					bankSum += receipt.getPrice();
					break;
				}
			}
			sum = massageSum + alipaySum + bankSum;
			paySum = (massageSum * (1 - taxRate.getChannel_message() / 100)
					+ alipaySum * (1 - taxRate.getChannel_alipay() / 100) + bankSum
					* (1 - taxRate.getChannel_bank() / 100))
					* (1 - taxRate.getTax_rate() / 100)
					* (app.getAppAut().getDivided() / 100);

			financial.setSum(Double.valueOf(df.format(sum)));
			financial.setMassageSum(Double.valueOf(df.format(massageSum)));
			financial.setAlipaySum(Double.valueOf(df.format(alipaySum)));
			financial.setBankSum(Double.valueOf(df.format(bankSum)));
			financial.setPaySum(Double.valueOf(df.format(paySum)));

			financialList.add(financial);
			financialSev.setFinancialList(financialList);
			financialSevList.add(financialSev);

		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("status", status);
		session.setAttribute("check_out", check_out);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
		session.setAttribute("financialSevList", financialSevList);
		session.setAttribute("userOrAppName", userOrAppName);
		session.setAttribute("no_check_out", no_check_out);
		session.setAttribute("page", page);
		return Action.SUCCESS;
	}

	/**
	 * ����appĳ�µĶ���
	 * 
	 * @throws IOException
	 */
	public void checkOutAppFinancial() throws IOException {
		// ����APP
		AppInfo info = appInfoDAO.findById(appId);
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year)) {
			// Ĭ��Ϊ����
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month)) {
			month = String.format("%02d", now.get(Calendar.MONTH) + 1);
		} else {
			month = month.substring(0, month.length() - 1);
			month = String.format("%02d", Integer.valueOf(month));
		}
		List<Receipt> receiptList = receiptDAO.findByUserAppYearMonth(
				info.getCp_id(), info.getApp_id(), year + "-" + month);
		for (Receipt receipt : receiptList) {
			receipt.setCheck_out(1);
			receiptDAO.update(receipt);
		}
		// δ��������1
		HttpSession session = ServletActionContext.getRequest().getSession();
		int no_check_out = (int) session.getAttribute("no_check_out");
		no_check_out--;
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println(String.valueOf(no_check_out));
		session.setAttribute("no_check_out", no_check_out);
	}

	/**
	 * ���ݶ�����ȡ֧������
	 * 
	 * @param Order_id
	 * @return
	 */
	public int getType(String Order_id) {
		String reg1 = "^[0-9]{12}00[0-9]*$";
		String reg2 = "^[0-9]{12}01[0-9]*$";
		if (Pattern.matches(reg1, Order_id))
			return 0;// �̴�
		else if (Pattern.matches(reg2, Order_id))
			return 1;// ֧����
		else
			return 2;// ����
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getUserOrAppName() {
		return userOrAppName;
	}

	public void setUserOrAppName(String userOrAppName) {
		this.userOrAppName = userOrAppName;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public FinancialAction(UserDAO userDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO, ReceiptDAO receiptDAO,
			TaxRateDAO taxRateDAO,AdminDAO adminDAO) {
		super();
		this.userDAO = userDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.receiptDAO = receiptDAO;
		this.taxRateDAO = taxRateDAO;
		this.adminDAO = adminDAO;
	}

}
