package com.rainbow.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;








import org.apache.struts2.ServletActionContext;

import com.rainbow.dao.AppAutDAO;
import com.rainbow.dao.AppInfoDAO;
import com.rainbow.dao.AppSouDAO;
import com.rainbow.dao.ReviewDAO;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.AppAuthority;
import com.rainbow.entity.AppInfo;
import com.rainbow.entity.AppSource;
import com.rainbow.entity.Review;
import com.rainbow.entity.User;
import com.rainbow.util.OpeFunction;

/**
 * 应用评论
 * @author STerOTto
 * @version 2014-6-26 10:11:05
 *
 */
public class ReviewAction {
	private AppAuthority appAut = new AppAuthority();
	private AppInfo appInfo = new AppInfo();
	private AppSource appSou = new AppSource();
	private Review review = new Review();
	private User user;
	
	private AppAutDAO appAutDAO;
	private AppInfoDAO appInfoDAO;
	private AppSouDAO appSouDAO;
	private ReviewDAO reviewDAO;
	private UserDAO userDAO;
	
	private HttpServletResponse response;
    private HttpServletRequest request;
    private HttpSession session;
    
    private int appAutId;
    private int appInfoId;
    private int AppSourceId;
    private int reviewId;
    
    private String content;
    /**
     * 添加新评论
     * @throws UnsupportedEncodingException 
     */
    @SuppressWarnings("static-access")
	public void addReview() throws UnsupportedEncodingException{
    	HttpSession httpSession = ServletActionContext.getRequest().getSession();
    	user = (User) httpSession.getAttribute("user");
    	if(user!=null){
    		review.setUser_id(user.getId());
    		review.setUserName(user.getUsername());
    	}
    	else{
    		review.setUser_id(0);
    		review.setUserName("匿名用户");
    	}
    	review.setContent(content);
    	review.setApp_id(appInfoId);
    	String time = new OpeFunction().getNowTime();
    	review.setTime(time);
    	
    	reviewDAO.sava(review);
    	
    	
    }
	public ReviewAction(AppAutDAO appAutDAO, AppInfoDAO appInfoDAO,
			AppSouDAO appSouDAO, ReviewDAO reviewDAO) {
		super();
		this.appAutDAO = appAutDAO;
		this.appInfoDAO = appInfoDAO;
		this.appSouDAO = appSouDAO;
		this.reviewDAO = reviewDAO;
	}
	
	public Review getReview() {
		return review;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setReview(Review review) {
		this.review = review;
	}

	public int getAppAutId() {
		return appAutId;
	}

	public void setAppAutId(int appAutId) {
		this.appAutId = appAutId;
	}

	public int getAppInfoId() {
		return appInfoId;
	}

	public void setAppInfoId(int appInfoId) {
		this.appInfoId = appInfoId;
	}

	public int getAppSourceId() {
		return AppSourceId;
	}

	public void setAppSourceId(int appSourceId) {
		AppSourceId = appSourceId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public AppAuthority getAppAut() {
		return appAut;
	}
	public void setAppAut(AppAuthority appAut) {
		this.appAut = appAut;
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
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
    
    
}
