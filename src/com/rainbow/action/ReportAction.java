package com.rainbow.action;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
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
import com.rainbow.dao.TaxRateDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Receipt;
import com.rainbow.entity.TaxRate;
import com.rainbow.entity.User;
import com.rainbow.server.App;
import com.rainbow.server.AppReceipt;
import com.rainbow.server.DetailReceipt;
import com.rainbow.server.ReceiptTax;

/**
 * @author STerOTto
 * @version 2014-7-30 22:44:14 ����
 * ֧������ 00�̴� 01֧���� 11����
 */
public class ReportAction {
	private ReceiptDAO receiptDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	private TaxRateDAO taxRateDAO;

	private int reportId;
	private String type;
	private String startTime;
	private String endTime;
	private String orderIdOrAppName;
	private String appName;
	public int appId;

	/**
	 * �����ʼ��
	 * 
	 * @return
	 * @throws ParseException 
	 */
	public String reportInitialize() throws ParseException {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
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
			App app = new App(info, sou, aut);
			appReceipt.setApp(app);
			appReceipt.setUser(user);
			
			List<ReceiptTax> receiptTaxList = new ArrayList<ReceiptTax>();
			List<Receipt> receiptList = receiptDAO.findByCp_idAndApp_id(
					info.getCp_id(), info.getApp_id());
			for(Receipt receipt :receiptList){
				SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
				String time = matter.format(matter.parse(receipt.getReceipt_time()));
				TaxRate taxRate = taxRateDAO.findByYearMonth(time);
				ReceiptTax receiptTax = new ReceiptTax();
				receiptTax.setReceipt(receipt);
				receiptTax.setTaxRate(taxRate);
				receiptTaxList.add(receiptTax);
			}
			appReceipt.setReceiptTaxList(receiptTaxList);

			int orderSun = 0;
			int payment = 0;
			for (Receipt receipt : receiptList) {
				orderSun++;
				payment += receipt.getPrice();
				paySun += receipt.getPrice();
				DetailReceipt detailReceipt = new DetailReceipt();
				detailReceipt.setApp(new App(info, sou, aut));
				detailReceipt.setUser(user);
				SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
				String time = matter.format(matter.parse(receipt.getReceipt_time()));
				TaxRate taxRate = taxRateDAO.findByYearMonth(time);
				ReceiptTax receiptTax = new ReceiptTax();
				receiptTax.setReceipt(receipt);
				receiptTax.setTaxRate(taxRate);
				detailReceipt.setReceiptTax(receiptTax);
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
	 * @throws ParseException 
	 */
	public String searchByOrderOrAppName() throws ParseException {
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
					SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
					String time = matter.format(matter.parse(receipt.getReceipt_time()));
					TaxRate taxRate = taxRateDAO.findByYearMonth(time);
					ReceiptTax receiptTax = new ReceiptTax();
					receiptTax.setReceipt(receipt);
					receiptTax.setTaxRate(taxRate);
					detailReceipt.setReceiptTax(receiptTax);
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
				SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
				String time = matter.format(matter.parse(receipt.getReceipt_time()));
				TaxRate taxRate = taxRateDAO.findByYearMonth(time);
				ReceiptTax receiptTax = new ReceiptTax();
				receiptTax.setReceipt(receipt);
				receiptTax.setTaxRate(taxRate);
				detailReceipt.setReceiptTax(receiptTax);
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
	public void downReportToExcel() {
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
					String type = getType(detailReceipt.getReceiptTax().getReceipt().getOrder_id());
					float channel = 0;
					switch(type){
					case "�̴�":channel = detailReceipt.getReceiptTax().getTaxRate().getChannel_message();break;
					case "֧����":channel = detailReceipt.getReceiptTax().getTaxRate().getChannel_alipay();break;
					default:channel = detailReceipt.getReceiptTax().getTaxRate().getChannel_bank();break;
					}
						String line = detailReceipt.getUser().getCorporatename()
								+ "\t"
								+ detailReceipt.getApp().getAppInfo().getAppName()
								+ "\t��" + detailReceipt.getReceiptTax().getReceipt().getReceipt_time() + "��\t��"
								+ detailReceipt.getReceiptTax().getReceipt().getOrder_id() + "��\t"
								+ detailReceipt.getReceiptTax().getReceipt().getPrice() + "\t"
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
	 * @throws ParseException 
	 */
	public String searchByAppName() throws ParseException {
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
				SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
				String time = matter.format(matter.parse(receipt.getReceipt_time()));
				TaxRate taxRate = taxRateDAO.findByYearMonth(time);
				ReceiptTax receiptTax = new ReceiptTax();
				receiptTax.setReceipt(receipt);
				receiptTax.setTaxRate(taxRate);
				detailReceipt.setReceiptTax(receiptTax);
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
	 * @throws ParseException 
	 */
	public String showAppReportDetail() throws ParseException{
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
			SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
			String time = matter.format(matter.parse(receipt.getReceipt_time()));
			TaxRate taxRate = taxRateDAO.findByYearMonth(time);
			ReceiptTax receiptTax = new ReceiptTax();
			receiptTax.setReceipt(receipt);
			receiptTax.setTaxRate(taxRate);
			detailReceipt.setReceiptTax(receiptTax);
			detailReceiptList.add(detailReceipt);	
		}
		session.setAttribute("searchPaySun", String.valueOf(searchPaySun));
		session.setAttribute("detailReceiptList", detailReceiptList);
		 return Action.SUCCESS;
	 }
	/**
	 * ����ʱ��β�ѯ����
	 * @throws ParseException 
	 */
	public String searchByTime() throws ParseException{
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		List<DetailReceipt> detailReceiptList = new ArrayList<DetailReceipt>();
		double searchPaySun = 0;
		List<Receipt> receiptList = new ArrayList<Receipt>();
		if("ȫ��֧��".equals(type)){
			receiptList = receiptDAO.findByCp_idAndTime(user.getCp_id(), startTime, endTime);
			
		}
		else{
			String typeReg="";
			switch(type){
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
			SimpleDateFormat matter = new SimpleDateFormat("yyyy-MM");
			String time = matter.format(matter.parse(receipt.getReceipt_time()));
			TaxRate taxRate = taxRateDAO.findByYearMonth(time);
			ReceiptTax receiptTax = new ReceiptTax();
			receiptTax.setReceipt(receipt);
			receiptTax.setTaxRate(taxRate);
			detailReceipt.setReceiptTax(receiptTax);
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
	
	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public ReportAction(ReceiptDAO receiptDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO, TaxRateDAO taxRateDAO) {
		super();
		this.receiptDAO = receiptDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
		this.taxRateDAO = taxRateDAO;
	}


}
