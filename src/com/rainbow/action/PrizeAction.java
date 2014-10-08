package com.rainbow.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.PrizeDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Prize;
import com.rainbow.server.App;

public class PrizeAction
{
	private static final int ISSUE = 2;// ��ISSUE��
	private Prize prize;

	private PrizeDAO prizeDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;

	private int issue;// ����
	private int prizeLevel;// ������
	private String phone;// �ֻ���
	private String id_card;// ���֤��

	private String selectp;
	private String selectc;

	/**
	 * ��������ͨ�û��ύ��Ϣ ������������ Ĭ�ϲ��н�
	 * 
	 * @return
	 */
	public String prizeInfoSub()
	{
		prize.setIssue(ISSUE);
		prize.setPrize(0);// ���н�
		prize.setProvince(selectp);
		prize.setCity(selectc);
		prizeDAO.save(prize);
		return Action.SUCCESS;
	}

	/**
	 * ��ʾĳ���н�������
	 */
	@SuppressWarnings(
	{ "rawtypes", "unchecked" })
	public String showIssuePrize()
	{
		List<Prize> fristPrize = prizeDAO.findByIssuePrize(issue, 1);
		List<Prize> secondPrize = prizeDAO.findByIssuePrize(issue, 2);
		List<Prize> thridPrize = prizeDAO.findByIssuePrize(issue, 3);
		List<Prize> fourthPrize = prizeDAO.findByIssuePrize(issue, 4);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("fristPrize", fristPrize);
		request.put("secondPrize", secondPrize);
		request.put("thridPrize", thridPrize);
		request.put("fourthPrize", fourthPrize);
		return Action.SUCCESS;
	}

	/**
	 * ���ؿ��������н����ʵ�����Ӧ��
	 * 
	 * @return
	 */
	@SuppressWarnings(
	{ "rawtypes", "unchecked" })
	public String promoteToPrize()
	{
		List<App> app = new ArrayList<>();
		int total = appInfoDAO.findAllJointNum(1, 1);
		List<AppInfo> appInfoList;
		if (total <= 6)
			appInfoList = appInfoDAO.findAllJoint(1, 1, 1, total);
		else
			appInfoList = appInfoDAO.findAllJoint(1, 1, 1, 6);
		for (AppInfo appInfo : appInfoList)
		{
			AppSource appSou = appSouDAO.findById(appInfo.getId());
			AppAuthority appAut = appAutDAO.findById(appInfo.getId());
			app.add(new App(appInfo, appSou, appAut));
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("app", app);
		return Action.SUCCESS;
	}

	/**
	 * ���ĳ��
	 * 
	 * @return
	 */
	public String prizeCheckPhone()
	{
		Prize prize = prizeDAO.findByPhoneIssue(phone, ISSUE);
		if (prize == null)
			return Action.SUCCESS;
		else
			return Action.ERROR;
	}

	public String prizeCheckIdCard()
	{
		Prize prize = prizeDAO.findByIdCardIssue(id_card, ISSUE);
		if (prize == null)
			return Action.SUCCESS;
		else
			return Action.ERROR;
	}

	public Prize getPrize()
	{
		return prize;
	}

	public void setPrize(Prize prize)
	{
		this.prize = prize;
	}

	public int getIssue()
	{
		return issue;
	}

	public void setIssue(int issue)
	{
		this.issue = issue;
	}

	public int getPrizeLevel()
	{
		return prizeLevel;
	}

	public void setPrizeLevel(int prizeLevel)
	{
		this.prizeLevel = prizeLevel;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getId_card()
	{
		return id_card;
	}

	public void setId_card(String id_card)
	{
		this.id_card = id_card;
	}

	public String getSelectp()
	{
		return selectp;
	}

	public void setSelectp(String selectp)
	{
		this.selectp = selectp;
	}

	public String getSelectc()
	{
		return selectc;
	}

	public void setSelectc(String selectc)
	{
		this.selectc = selectc;
	}

	public PrizeAction(PrizeDAO prizeDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, AppAutDAO appAutDAO)
	{
		super();
		this.prizeDAO = prizeDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.appAutDAO = appAutDAO;
	}

}
