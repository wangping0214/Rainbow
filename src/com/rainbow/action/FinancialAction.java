package com.rainbow.action;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.CellView;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

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
 * 财务管理
 * 
 * @author STerOTto
 *
 */
public class FinancialAction
{
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
	 * 财务登录
	 * 
	 * @throws IOException
	 */
	public void financialLogin() throws IOException
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Admin financial = adminDAO.findUserNameAndPassword(userName, password);
		if (financial == null)
			response.getWriter().println("0");
		else
			response.getWriter().println("1");
		session.setAttribute("financial", financial);
	}

	/**
	 * 财务初始化，默认显示本年本月，状态为全部 可根据时间查询
	 * 
	 * @return
	 */
	public String initFinancial()
	{
		// 初始数据处理
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year))
		{
			// 默认为本年
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month))
		{
			month = String.format("%02d", now.get(Calendar.MONTH) + 1);
		} else
		{
			month = month.substring(0, month.length() - 1);
			month = String.format("%02d", Integer.valueOf(month));
		}
		int check_out = -1;
		if (status == null || "".equals(status))
		{
			// 默认结算状态为全部
			status = "全部";
			check_out = -1;
		} else
		{
			switch (status)
			{
			case "全部":
				check_out = -1;
				break;
			case "已结算":
				check_out = 1;
				break;
			default:
				check_out = 0;
				break;
			}
		}
		DecimalFormat df = new DecimalFormat(".##");// 数据格式
		// 未结算数
		int no_check_out = 0;
		List<User> allUserList = userDAO.findFinancialVisitableUsers(1, 1);
		for (User user : allUserList)
		{
			List<AppInfo> appInfoList = appInfoDAO.findUserJointAppVisitable(
					user.getCp_id(), 1, 1);
			for (AppInfo info : appInfoList)
			{
				List<Receipt> receiptList = new ArrayList<Receipt>();
				receiptList = receiptDAO.findByUserAppYearMonth(
						user.getCp_id(), info.getApp_id(), year + "-" + month);
				if (receiptList.size() > 0
						&& receiptList.get(0).getCheck_out() == 0)
				{
					no_check_out++;
				}
			}
		}
		// 分页查询初始化
		List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
		int total;
		PageUtil page;
		List<User> userList;
		// 根据appName查询APP
		AppInfo appInfo = appInfoDAO.findJointAppByAppName(1, userOrAppName, 1);
		// 未输入企业/应用名称
		if (userOrAppName == null || "".equals(userOrAppName)
				|| "输入企业/应用名称".equals(userOrAppName))
		{
			total = userDAO.findFinancialVisitableUsersSize(1, 1);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findFinancialVisitableUsers(1, 1, currentPage,
					page.getPageSize());
		}
		// 输入了企业/应用名称
		else
		{
			// 查询企业
			total = userDAO.findByUserCompanyOrNameVisitableSize(1,
					userOrAppName, 1);
			page = new PageUtil(currentPage, total);
			page.setPageSize(5);
			userList = userDAO.findByUserCompanyOrNameVisitable(1,
					userOrAppName, 1, currentPage, page.getPageSize());
		}
		// 输入的是企业名称或者未输入查询条件或根据appName未查询到APP
		if (null == appInfo)
		{
			// 未找到企业
			if (userList == null)
				return Action.ERROR;
			for (User user : userList)
			{
				FinancialSev financialSev = new FinancialSev();
				financialSev.setUser(user);
				List<Financial> financialList = new ArrayList<Financial>();
				List<AppInfo> appInfoList = appInfoDAO
						.findUserJointAppVisitable(user.getCp_id(), 1, 1);
				for (AppInfo info : appInfoList)
				{
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
					if (receiptList.size() > 0)
					{
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
					for (Receipt receipt : receiptList)
					{
						switch (getType(receipt.getOrder_id()))
						{
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
					financial.setMassageSum(Double.valueOf(df
							.format(massageSum)));
					financial
							.setAlipaySum(Double.valueOf(df.format(alipaySum)));
					financial.setBankSum(Double.valueOf(df.format(bankSum)));
					financial.setPaySum(Double.valueOf(df.format(paySum)));

					financialList.add(financial);
				}
				financialSev.setFinancialList(financialList);
				financialSevList.add(financialSev);
			}
		}
		// 根据appName查询到APP
		else
		{
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
			if (receiptList.size() > 0)
			{
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
			for (Receipt receipt : receiptList)
			{
				switch (getType(receipt.getOrder_id()))
				{
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
	 * 按月到处账单
	 */
	public void exportFinancial()
	{
		// 初始数据处理
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year))
		{
			// 默认为本年
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month))
		{
			month = String.format("%02d", now.get(Calendar.MONTH) + 1);
		} else
		{
			month = month.substring(0, month.length() - 1);
			month = String.format("%02d", Integer.valueOf(month));
		}
		DecimalFormat df = new DecimalFormat(".##");// 数据格式
		// 分页查询初始化
		List<FinancialSev> financialSevList = new ArrayList<FinancialSev>();
		List<User> userList;
		// 根据appName查询APP
		AppInfo appInfo = appInfoDAO.findJointAppByAppName(1, userOrAppName, 1);
		// 未输入企业/应用名称
		if (userOrAppName == null || "".equals(userOrAppName)
				|| "输入企业/应用名称".equals(userOrAppName))
		{
			userList = userDAO.findFinancialVisitableUsersAll(1, 1);
		}
		// 输入了企业/应用名称
		else
		{
			// 查询企业
			userList = userDAO.findByUserCompanyOrNameVisitableAll(1,
					userOrAppName, 1);
		}
		// 输入的是企业名称或者未输入查询条件或根据appName未查询到APP
		if (null == appInfo)
		{
			// 未找到企业
			for (User user : userList)
			{
				FinancialSev financialSev = new FinancialSev();
				financialSev.setUser(user);
				List<Financial> financialList = new ArrayList<Financial>();
				List<AppInfo> appInfoList = appInfoDAO
						.findUserJointAppVisitable(user.getCp_id(), 1, 1);
				for (AppInfo info : appInfoList)
				{
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
					if (receiptList.size() > 0)
					{
						financial.setCheck_out(receiptList.get(0)
								.getCheck_out());
					} else
						financial.setCheck_out(1);
					TaxRate taxRate = taxRateDAO.findByYearMonth(year + "-"
							+ month);
					financial.setTaxRate(taxRate);

					double sum = 0.0;
					double massageSum = 0.0;
					double alipaySum = 0.0;
					double bankSum = 0.0;
					double paySum = 0.0;
					for (Receipt receipt : receiptList)
					{
						switch (getType(receipt.getOrder_id()))
						{
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
					financial.setMassageSum(Double.valueOf(df
							.format(massageSum)));
					financial
							.setAlipaySum(Double.valueOf(df.format(alipaySum)));
					financial.setBankSum(Double.valueOf(df.format(bankSum)));
					financial.setPaySum(Double.valueOf(df.format(paySum)));

					financialList.add(financial);
				}
				financialSev.setFinancialList(financialList);
				financialSevList.add(financialSev);
			}
		}
		// 根据appName查询到APP
		else
		{
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
			if (receiptList.size() > 0)
			{
				financial.setCheck_out(receiptList.get(0).getCheck_out());
			} else
				financial.setCheck_out(1);
			TaxRate taxRate = taxRateDAO.findByYearMonth(year + "-" + month);
			financial.setTaxRate(taxRate);

			double sum = 0.0;
			double massageSum = 0.0;
			double alipaySum = 0.0;
			double bankSum = 0.0;
			double paySum = 0.0;
			for (Receipt receipt : receiptList)
			{
				switch (getType(receipt.getOrder_id()))
				{
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date dt = new Date();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setContentType("application/x-msdownload; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ "CMYX" + year + month + "Bill" + sdf.format(dt) + ".xls");
		try
		{
			OutputStream out = response.getOutputStream();
			WritableWorkbook writableWorkbook = Workbook.createWorkbook(out); // 建立excel文件
			WritableSheet writableSheet = writableWorkbook.createSheet(year
					+ month, 10); // 创建一个工作表
			WritableFont writableFont = new WritableFont(WritableFont.ARIAL,
					10, WritableFont.NO_BOLD, false,
					UnderlineStyle.NO_UNDERLINE, Colour.BLUE);
			WritableCellFormat writableCellFormat = new WritableCellFormat(
					NumberFormats.TEXT);
			writableCellFormat.setFont(writableFont);
			writableCellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			writableCellFormat.setAlignment(Alignment.CENTRE);
			CellView cv = new CellView(); // 定义一个列显示样式
			cv.setFormat(writableCellFormat);// 把定义的单元格格式初始化进去
			cv.setSize(10 * 265);// 设置列宽度（不设置的话是0，不会显示）
			writableSheet.setRowView(0, 500);
			String[] headCell = new String[]
			{ "企业名称", "联系人", "支付金额", "总金额", "是否結算" };
			for (int i = 0; i < headCell.length; i++)
			{
				writableSheet.setColumnView(i, cv);// 设置工作表中第i列的样式
				writableSheet.addCell(new Label(i, 0, headCell[i],
						writableCellFormat));
			}
			writableCellFormat = new WritableCellFormat(NumberFormats.TEXT);
			if (null != financialSevList)
			{
				int i = 0;
				for (FinancialSev financialSev : financialSevList)
				{
					String corporate = financialSev.getUser()
							.getCorporatename();
					String contact = financialSev.getUser().getRealname();
					double paySum = 0d;
					double sum = 0d;
					int check = 0;
					String isCheck = "已結算";
					for (Financial financial : financialSev.getFinancialList())
					{
						paySum += financial.getPaySum();
						sum += financial.getSum();
						if (financial.getCheck_out() == 1)
						{
							check = 1;
						}
					}
					switch (check)
					{
					case 0:
						isCheck = "未結算";
						break;
					default:
						isCheck = "已結算";
						break;
					}
					String[] lineCell = new String[]
					{ corporate, contact, df.format(paySum),
							df.format(sum), isCheck };
					for (int j = 0; j < lineCell.length; j++)
					{
						writableSheet.addCell(new Label(j, i + 1, lineCell[j],
								writableCellFormat));
					}
					i++;
				}
			}
			writableWorkbook.write();
			writableWorkbook.close();
		} catch (IOException e)
		{
		} catch (RowsExceededException e)
		{
		} catch (WriteException e)
		{
		}
	}

	/**
	 * 结算app某月的订单
	 * 
	 * @throws IOException
	 */
	public void checkOutAppFinancial() throws IOException
	{
		// 结算APP
		AppInfo info = appInfoDAO.findById(appId);
		Calendar now = Calendar.getInstance();
		if (year == null || "".equals(year))
		{
			// 默认为本年
			year = String.valueOf(now.get(Calendar.YEAR));
		}
		if (month == null || "".equals(month))
		{
			month = String.format("%02d", now.get(Calendar.MONTH) + 1);
		} else
		{
			month = month.substring(0, month.length() - 1);
			month = String.format("%02d", Integer.valueOf(month));
		}
		List<Receipt> receiptList = receiptDAO.findByUserAppYearMonth(
				info.getCp_id(), info.getApp_id(), year + "-" + month);
		for (Receipt receipt : receiptList)
		{
			receipt.setCheck_out(1);
			receiptDAO.update(receipt);
		}
		// 未计算数减1
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
	 * 根据订单获取支付类型
	 * 
	 * @param Order_id
	 * @return
	 */
	public int getType(String Order_id)
	{
		String reg1 = "^[0-9]{12}00[0-9]*$";
		String reg2 = "^[0-9]{12}01[0-9]*$";
		if (Pattern.matches(reg1, Order_id))
			return 0;// 短代
		else if (Pattern.matches(reg2, Order_id))
			return 1;// 支付宝
		else
			return 2;// 银联
	}

	public int getAppId()
	{
		return appId;
	}

	public void setAppId(int appId)
	{
		this.appId = appId;
	}

	public String getYear()
	{
		return year;
	}

	public void setYear(String year)
	{
		this.year = year;
	}

	public String getMonth()
	{
		return month;
	}

	public void setMonth(String month)
	{
		this.month = month;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	public int getCurrentPage()
	{
		return currentPage;
	}

	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}

	public String getUserOrAppName()
	{
		return userOrAppName;
	}

	public void setUserOrAppName(String userOrAppName)
	{
		this.userOrAppName = userOrAppName;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public FinancialAction(UserDAO userDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO, ReceiptDAO receiptDAO,
			TaxRateDAO taxRateDAO, AdminDAO adminDAO)
	{
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
