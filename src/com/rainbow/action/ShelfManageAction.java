package com.rainbow.action;

import java.util.List;

import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.MessageDAO;
import com.rainbow.dao.OtherPaymentDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.MessagePayment;
import com.rainbow.entity.OtherPayment;
import com.rainbow.entity.Review;

public class ShelfManageAction {
	

	private MessageDAO messageDAO;
	private OtherPaymentDAO otherPaymentDAO;
	private AppAutDAO appAutDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private ReviewDAO reviewDAO;

	
	private int shelf;
	private int apkId;
	private int payId;
	
	
	public void shelfManage(){
		AppInfo appInfo = appInfoDAO.findById(apkId);
		appInfo.setShelf(shelf);
		System.out.println("appInfo.getShelf()"+appInfo.getShelf());
		appInfoDAO.update(apkId, appInfo);
		//return Action.SUCCESS;
	}
	
	/**
	 * 删除联运的应用
	 * 并且删除对应应用的物品
	 */
	public void deleteJointApp(){
		AppInfo appInfo = appInfoDAO.findById(apkId);
		
		List<MessagePayment> mesPay =  messageDAO.findByAppIdCpId(appInfo.getApp_id(), appInfo.getCp_id());
		for(int i = 0;i<mesPay.size(); i++){
			MessagePayment mes = mesPay.get(i);
			OtherPayment other = otherPaymentDAO.findById(mes.getId());
			messageDAO.delete(mes);
			otherPaymentDAO.delete(other);
		}
		List<Review> review = reviewDAO.findByAppId(apkId);
		for(int i = 0;i<review.size() ; i++)
			reviewDAO.delete(review.get(i));
		
		appInfoDAO.delete(apkId);
		appAutDAO.delete(apkId);
		appSouDAO.delete(apkId);
	}
	
	
	public int getPayId() {
		return payId;
	}

	public void setPayId(int payId) {
		this.payId = payId;
	}

	public int getShelf() {
		return shelf;
	}

	public void setShelf(int shelf) {
		this.shelf = shelf;
	}

	public int getApkId() {
		return apkId;
	}

	public void setApkId(int apkId) {
		this.apkId = apkId;
	}

	public ShelfManageAction(MessageDAO messageDAO,
			OtherPaymentDAO otherPaymentDAO, AppAutDAO appAutDAO,
			AppInfoDAO appInfoDAO, AppSouDAO appSouDAO, ReviewDAO reviewDAO) {
		super();
		this.messageDAO = messageDAO;
		this.otherPaymentDAO = otherPaymentDAO;
		this.appAutDAO = appAutDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.reviewDAO = reviewDAO;
	}

	

	
	
}
