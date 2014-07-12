package com.rainbow.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.rainbow.dao.MagConDAO;
import com.rainbow.dao.MagDAO;
import com.rainbow.entity.MagCon;
import com.rainbow.entity.Magazine;
import com.rainbow.util.OpeFunction;
import com.rainbow.util.PageUtil;

public class MagAction {
	private MagDAO magDAO;
	private Magazine mag;
	private MagConDAO magConDAO;
	private MagCon magCon;
	private OpeFunction opeFun;//封装的一些操作的函数

	private String jsonArrStr;
	private String jsonArrCon;
	private int currentPage1=1;
	private int currentPage2=1;
	private int editId;
	private int change=0;
	private int delId=0;
	
	
	private File uploadContent;
	private String tx_fileName;
	private String uploadContentContentType;
	private String uploadContentFileName;
	
	private String userName;

	
	
	
	
	
	
	

	//********************editor load img*****************
	
	public String fileUpload() throws IOException{
		String imgRealpath = ServletActionContext.getServletContext().getRealPath("/editorImg");//服务器路径
		if(uploadContent!=null){
			File savedir = new File(imgRealpath);
			if(!savedir.getParentFile().exists())
				savedir.getParentFile().mkdirs();
			String fileName = java.util.UUID.randomUUID().toString()+uploadContentFileName;//随机命名
			System.out.println("fileName"+fileName);
			File saveFile = new File(imgRealpath,fileName);
			FileUtils.copyFile(uploadContent, saveFile);
		}
		
		
		return Action.SUCCESS;
	}

	


	/**杂志编辑与上传
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	public String magEdit() throws Exception{
		HttpSession httpSession = ServletActionContext.getRequest()
				.getSession();
		userName=(String) httpSession.getAttribute("username");
		if(mag.getCoverContent()!=null){
			mag.setCover(opeFun.fileToServer("/file/"+userName+"/cover", 
					mag.getCoverContent(), 
					mag.getCoverContentFileName(),
					mag.getCoverContentContentType(),
					true));
			
		}
		Object[] catalogStr =  JSONArray.fromObject(jsonArrStr).toArray();
		Object[] contentStr =  JSONArray.fromObject(jsonArrCon).toArray();
		for(int i=0;i<catalogStr.length;i++){
			magCon.setJournal(mag.getJournal());
			magCon.setCatalog(catalogStr[i].toString());
			magCon.setContent(contentStr[i].toString());
			magConDAO.save(magCon);
		}
		httpSession.removeAttribute("journal");
		httpSession.removeAttribute("keyword");
		httpSession.removeAttribute("magIntroduction");
		httpSession.removeAttribute("cover");
		httpSession.removeAttribute("id");
		httpSession.removeAttribute("shelf");
		if(change==0){
			magDAO.save(mag);
			return "xinqi_sec";
		}
		else{
			magDAO.update(change,mag);
			return "edit_sec";
		}
		
	}
	
	//**********************wangQi**************************
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String wangQi(){
		int totalsizeShelf =magDAO.findShelfNum(true);
		int totalsizeNotShlef = magDAO.findShelfNum(true);
	//	System.out.println("totalsize"+totalsize);
		PageUtil pageShelf = new PageUtil(currentPage1,totalsizeShelf);
		PageUtil pageNotShelf = new PageUtil(currentPage2,totalsizeNotShlef);
		List<Magazine> magShelf = magDAO.findShelf(true,currentPage1, pageShelf.getPageSize());
		List<Magazine> magNotShelf = magDAO.findShelf(false, currentPage2, pageNotShelf.getPageSize());
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("magShelf", magShelf);
		request.put("magNotShelf", magNotShelf);
		request.put("pagerShelf", pageShelf);
		request.put("pagerNotShelf",pageNotShelf);
		return Action.SUCCESS;
		
	}
	
	
	//******************editMag*******************
	
	public String editMag(){
		Magazine mag=magDAO.findById(editId);
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		httpSession.setAttribute("journal", mag.getJournal());
		httpSession.setAttribute("magIntroduction", mag.getMagIntroduction());
		httpSession.setAttribute("cover", mag.getCover());
		httpSession.setAttribute("id", mag.getId());
		
		
		
		return Action.SUCCESS;
	}
	
	
	//*********************deleteMag*****************
	public String deleteMag(){
		magDAO.delete(delId);
		return Action.SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String wangqi_more_on(){
		List<Magazine> newmore=magDAO.find("2014",true);
		List<Magazine> oldmore=magDAO.find("2013",true);
		@SuppressWarnings("rawtypes")
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("newmore", newmore);
		request.put("oldmore", oldmore);
		return Action.SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String wangqi_more_off(){
		List<Magazine> newmore=magDAO.find("2014",false);
		List<Magazine> oldmore=magDAO.find("2013",false);
		@SuppressWarnings("rawtypes")
		Map request=(Map) ActionContext.getContext().get("request");
		request.put("newmore", newmore);
		request.put("oldmore", oldmore);
		return Action.SUCCESS;
	}
	public int getDelId() {
		return delId;
	}
	public void setDelId(int delId) {
		this.delId = delId;
	}
	public int getChange() {
		return change;
	}
	public void setChange(int change) {
		this.change = change;
	}
	public int getEditId() {
		return editId;
	}
	public void setEditId(int editId) {
		this.editId = editId;
	}
	public int getCurrentPage2() {
		return currentPage2;
	}
	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}
	public int getCurrentPage1() {
		return currentPage1;
	}
	public void setCurrentPage1(int currentPage1) {
		this.currentPage1 = currentPage1;
	}
	public String getTx_fileName() {
		return tx_fileName;
	}
	public void setTx_fileName(String tx_fileName) {
		this.tx_fileName = tx_fileName;
	}
	public File getUploadContent() {
		return uploadContent;
	}
	public void setUploadContent(File uploadContent) {
		this.uploadContent = uploadContent;
	}
	public String getUploadContentContentType() {
		return uploadContentContentType;
	}
	public void setUploadContentContentType(String uploadContentContentType) {
		this.uploadContentContentType = uploadContentContentType;
	}
	public String getUploadContentFileName() {
		return uploadContentFileName;
	}
	public void setUploadContentFileName(String uploadContentFileName) {
		this.uploadContentFileName = uploadContentFileName;
	}
	public String getJsonArrCon() {
		return jsonArrCon;
	}
	public void setJsonArrCon(String jsonArrCon) {
		this.jsonArrCon = jsonArrCon;
	}
	public String getJsonArrStr() {
		return jsonArrStr;
	}
	public void setJsonArrStr(String jsonArrStr) {
		this.jsonArrStr = jsonArrStr;
	}

	public MagAction(MagDAO magDAO, MagConDAO magConDAO) {
		super();
		this.magDAO = magDAO;
		this.magConDAO = magConDAO;

	}
	public MagDAO getMagDAO() {
		return magDAO;
	}
	public void setMagDAO(MagDAO magDAO) {
		this.magDAO = magDAO;
	}
	public Magazine getMag() {
		return mag;
	}
	public void setMag(Magazine mag) {
		this.mag = mag;
	}
	public MagConDAO getMagConDAO() {
		return magConDAO;
	}
	public void setMagConDAO(MagConDAO magConDAO) {
		this.magConDAO = magConDAO;
	}
	public MagCon getMagCon() {
		return magCon;
	}
	public void setMagCon(MagCon magCon) {
		this.magCon = magCon;
	}
	
}
