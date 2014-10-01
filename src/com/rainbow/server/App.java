package com.rainbow.server;

import java.io.Serializable;
import java.util.List;

import com.rainbow.entity.ADV;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;
import com.rainbow.entity.TaxRate;

/**
 * app服务层
 * 包含基本信息，app资源，管理信息，app的本月税率，app评论
 * @author STerOtto
 *
 */
public class App implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AppInfo appInfo;//app的基本信息
	private AppSource appSou;//app的文件资源路径
	private AppAuthority appAut;//app的管理信息
	private TaxRate taxRate;//app的税率信息
	private List<Review> review;//app的评论信息
	
	private String appAut_recomLevel;
	private String appAut_score;
	private String appAut_amountOfDown;
	/**
	 * @param appInfo
	 * @param appSou
	 * @param appAut
	 */
	public App(AppInfo appInfo, AppSource appSou, AppAuthority appAut) {
		super();
		
		this.appInfo = appInfo;
		this.appSou = appSou;
		this.appAut = appAut;
	}
	/**
	 * 
	 */
	public App(){
		super();
		this.appInfo = new AppInfo();
		this.appSou = new AppSource();
		this.appAut = new AppAuthority();
		this.taxRate = new TaxRate();
	}
	public String getAppAut_recomLevel() {
		return appAut_recomLevel;
	}
	public void setAppAut_recomLevel(String appAut_recomLevel) {
		this.appAut_recomLevel = appAut_recomLevel;
	}
	public String getAppAut_score() {
		return appAut_score;
	}
	public void setAppAut_score(String appAut_score) {
		this.appAut_score = appAut_score;
	}
	public String getAppAut_amountOfDown() {
		return appAut_amountOfDown;
	}
	public void setAppAut_amountOfDown(String appAut_amountOfDown) {
		this.appAut_amountOfDown = appAut_amountOfDown;
	}
	public AppInfo getAppInfo() {
		return appInfo;
	}
	public void setAppInfo(AppInfo appInfo) {
		this.appInfo = appInfo;
	}
	public AppSource getAppSou() {
		return appSou;
	}
	public void setAppSou(AppSource appSou) {
		this.appSou = appSou;
	}
	public AppAuthority getAppAut() {
		return appAut;
	}
	public void setAppAut(AppAuthority appAut) {
		this.appAut = appAut;
	}
	public List<Review> getReview() {
		return review;
	}
	public void setReview(List<Review> review) {
		this.review = review;
	}
	public TaxRate getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(TaxRate taxRate) {
		this.taxRate = taxRate;
	}
	
	
}
