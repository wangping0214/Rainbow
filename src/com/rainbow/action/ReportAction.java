package com.rainbow.action;

import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReceiptDAO;
import com.rainbow.dao.UserDAO;

/**
 * @author STerOTto
 * @version 2014-7-30 22:44:14
 * ±¨±í
 */
public class ReportAction
{
	private ReceiptDAO receiptDAO;
	private UserDAO userDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private AppAutDAO appAutDAO;
	
	private int reportId;
	private String type;
	private String startTime;
	private String endTime;
	private String orderIdOrAppName;
	
	
	
	public int getReportId()
	{
		return reportId;
	}
	public void setReportId(int reportId)
	{
		this.reportId = reportId;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getStartTime()
	{
		return startTime;
	}
	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}
	public String getEndTime()
	{
		return endTime;
	}
	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}
	public String getOrderIdOrAppName()
	{
		return orderIdOrAppName;
	}
	public void setOrderIdOrAppName(String orderIdOrAppName)
	{
		this.orderIdOrAppName = orderIdOrAppName;
	}
	
	
}
