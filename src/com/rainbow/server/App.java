package com.rainbow.server;

import java.util.List;

import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;

/**
 * @author Administrator
 *
 */
public class App {
	private AppInfo appInfo;
	private AppSource appSou;
	private AppAuthority appAut;
	private List<Review> review;
	
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
	
	
}
