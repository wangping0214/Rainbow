package com.rainbow.util;

import java.io.File;



/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class AppTmp {
	/**
	 * 新apk上传
	 *
	 */
	private String fee;
	private String adv;
	private String vir;
	private String pri;
	private String off;
	private File packgeContent;
	private String packgeContentFileName;
	private String packgeContentContentType;
	
	private File logo1Content;
	private String logo1ContentFileName;
	private String logo1ContentContentType;
	
	private File logo2Content;
	private String logo2ContentFileName;
	private String logo2ContentContentType;
	
	private File gamePhotoContent1;
	private String gamePhotoContent1FileName;
	private String gamePhotoContent1ContentType;
	private File gamePhotoContent2;
	private String gamePhotoContent2FileName;
	private String gamePhotoContent2ContentType;
	private File gamePhotoContent3;
	private String gamePhotoContent3FileName;
	private String gamePhotoContent3ContentType;
	private File gamePhotoContent4;
	private String gamePhotoContent4FileName;
	private String gamePhotoContent4ContentType;
	private File gamePhotoContent5;
	private String gamePhotoContent5FileName;
	private String gamePhotoContent5ContentType;
	
	/**
	 * 后台当前页数
	 *
	 */
	private int isShelfCurrentPage=1;
	private int toBeReleasedCurrentPage = 1;
	private int hadWithdrawnCurrentPage = 1;
	private int forcedOffShelfCurrentPage = 1;
	private int isThroughCurrentPage = 1;
	private int rankCurrentPage =1;
	
	/**
	 * 前台页数
	 */
	private int showByTypeCurrentPage = 1;
	private int showByClassificationCurrentPage =1;
	private int showByRecomLevelCurrentPage = 1;
	private int showByCategoryCurrentPage = 1;
	private int showByScoreAndDownCurrentPage =1;
	
	/**
	 * 编辑ID
	 *
	 */
	private int editId;
	private int changeId;
	private int isShelf;
	private int setWithdrawnId;
	private int setIsShelfId;
	private int auditManagementId;
	private int rankSubmitId;
	private int showInfoId;
	
	/**
	 * 页面类型
	 */
	private int deleteAppId;
	private int isThrough;
	
	
	
	public int getShowInfoId() {
		return showInfoId;
	}

	public void setShowInfoId(int showInfoId) {
		this.showInfoId = showInfoId;
	}

	public int getRankSubmitId() {
		return rankSubmitId;
	}

	public void setRankSubmitId(int rankSubmitId) {
		this.rankSubmitId = rankSubmitId;
	}

	public int getRankCurrentPage() {
		return rankCurrentPage;
	}

	public void setRankCurrentPage(int rankCurrentPage) {
		this.rankCurrentPage = rankCurrentPage;
	}

	public int getShowByScoreAndDownCurrentPage() {
		return showByScoreAndDownCurrentPage;
	}

	public void setShowByScoreAndDownCurrentPage(int showByScoreAndDownCurrentPage) {
		this.showByScoreAndDownCurrentPage = showByScoreAndDownCurrentPage;
	}

	public int getShowByCategoryCurrentPage() {
		return showByCategoryCurrentPage;
	}

	public void setShowByCategoryCurrentPage(int showByCategoryCurrentPage) {
		this.showByCategoryCurrentPage = showByCategoryCurrentPage;
	}

	public int getShowByRecomLevelCurrentPage() {
		return showByRecomLevelCurrentPage;
	}

	public void setShowByRecomLevelCurrentPage(int showByRecomLevelCurrentPage) {
		this.showByRecomLevelCurrentPage = showByRecomLevelCurrentPage;
	}

	public int getShowByClassificationCurrentPage() {
		return showByClassificationCurrentPage;
	}

	public void setShowByClassificationCurrentPage(
			int showByClassificationCurrentPage) {
		this.showByClassificationCurrentPage = showByClassificationCurrentPage;
	}

	public int getShowByTypeCurrentPage() {
		return showByTypeCurrentPage;
	}

	public void setShowByTypeCurrentPage(int showByTypeCurrentPage) {
		this.showByTypeCurrentPage = showByTypeCurrentPage;
	}

	public int getAuditManagementId() {
		return auditManagementId;
	}

	public void setAuditManagementId(int auditManagementId) {
		this.auditManagementId = auditManagementId;
	}

	public int getIsShelf() {
		return isShelf;
	}

	public void setIsShelf(int isShelf) {
		this.isShelf = isShelf;
	}

	public int getIsThroughCurrentPage() {
		return isThroughCurrentPage;
	}

	public void setIsThroughCurrentPage(int isThroughCurrentPage) {
		this.isThroughCurrentPage = isThroughCurrentPage;
	}

	public int getIsThrough() {
		return isThrough;
	}

	public void setIsThrough(int isThrough) {
		this.isThrough = isThrough;
	}

	public int getDeleteAppId() {
		return deleteAppId;
	}

	public void setDeleteAppId(int deleteAppId) {
		this.deleteAppId = deleteAppId;
	}

	public int getSetIsShelfId() {
		return setIsShelfId;
	}

	public void setSetIsShelfId(int setIsShelfId) {
		this.setIsShelfId = setIsShelfId;
	}

	public int getSetWithdrawnId() {
		return setWithdrawnId;
	}

	public void setSetWithdrawnId(int setWithdrawnId) {
		this.setWithdrawnId = setWithdrawnId;
	}

	public File getGamePhotoContent1() {
		return gamePhotoContent1;
	}
	
	public String getGamePhotoContent1FileName() {
		return gamePhotoContent1FileName;
	}

	public void setGamePhotoContent1FileName(String gamePhotoContent1FileName) {
		this.gamePhotoContent1FileName = gamePhotoContent1FileName;
	}

	public String getGamePhotoContent1ContentType() {
		return gamePhotoContent1ContentType;
	}

	public void setGamePhotoContent1ContentType(String gamePhotoContent1ContentType) {
		this.gamePhotoContent1ContentType = gamePhotoContent1ContentType;
	}

	public File getGamePhotoContent2() {
		return gamePhotoContent2;
	}

	public void setGamePhotoContent2(File gamePhotoContent2) {
		this.gamePhotoContent2 = gamePhotoContent2;
	}

	public String getGamePhotoContent2FileName() {
		return gamePhotoContent2FileName;
	}

	public void setGamePhotoContent2FileName(String gamePhotoContent2FileName) {
		this.gamePhotoContent2FileName = gamePhotoContent2FileName;
	}

	public String getGamePhotoContent2ContentType() {
		return gamePhotoContent2ContentType;
	}

	public void setGamePhotoContent2ContentType(String gamePhotoContent2ContentType) {
		this.gamePhotoContent2ContentType = gamePhotoContent2ContentType;
	}

	public File getGamePhotoContent3() {
		return gamePhotoContent3;
	}

	public void setGamePhotoContent3(File gamePhotoContent3) {
		this.gamePhotoContent3 = gamePhotoContent3;
	}

	public String getGamePhotoContent3FileName() {
		return gamePhotoContent3FileName;
	}

	public void setGamePhotoContent3FileName(String gamePhotoContent3FileName) {
		this.gamePhotoContent3FileName = gamePhotoContent3FileName;
	}

	public String getGamePhotoContent3ContentType() {
		return gamePhotoContent3ContentType;
	}

	public void setGamePhotoContent3ContentType(String gamePhotoContent3ContentType) {
		this.gamePhotoContent3ContentType = gamePhotoContent3ContentType;
	}

	public File getGamePhotoContent4() {
		return gamePhotoContent4;
	}

	public void setGamePhotoContent4(File gamePhotoContent4) {
		this.gamePhotoContent4 = gamePhotoContent4;
	}

	public String getGamePhotoContent4FileName() {
		return gamePhotoContent4FileName;
	}

	public void setGamePhotoContent4FileName(String gamePhotoContent4FileName) {
		this.gamePhotoContent4FileName = gamePhotoContent4FileName;
	}

	public String getGamePhotoContent4ContentType() {
		return gamePhotoContent4ContentType;
	}

	public void setGamePhotoContent4ContentType(String gamePhotoContent4ContentType) {
		this.gamePhotoContent4ContentType = gamePhotoContent4ContentType;
	}

	public File getGamePhotoContent5() {
		return gamePhotoContent5;
	}

	public void setGamePhotoContent5(File gamePhotoContent5) {
		this.gamePhotoContent5 = gamePhotoContent5;
	}

	public String getGamePhotoContent5FileName() {
		return gamePhotoContent5FileName;
	}

	public void setGamePhotoContent5FileName(String gamePhotoContent5FileName) {
		this.gamePhotoContent5FileName = gamePhotoContent5FileName;
	}

	public String getGamePhotoContent5ContentType() {
		return gamePhotoContent5ContentType;
	}

	public void setGamePhotoContent5ContentType(String gamePhotoContent5ContentType) {
		this.gamePhotoContent5ContentType = gamePhotoContent5ContentType;
	}

	public void setGamePhotoContent1(File gamePhotoContent1) {
		this.gamePhotoContent1 = gamePhotoContent1;
	}

	public int getChangeId() {
		return changeId;
	}
	public void setChangeId(int changeId) {
		this.changeId = changeId;
	}
	public int getEditId() {
		return editId;
	}
	public void setEditId(int editId) {
		this.editId = editId;
	}
	public int getForcedOffShelfCurrentPage() {
		return forcedOffShelfCurrentPage;
	}
	public void setForcedOffShelfCurrentPage(int forcedOffShelfCurrentPage) {
		this.forcedOffShelfCurrentPage = forcedOffShelfCurrentPage;
	}
	public int getHadWithdrawnCurrentPage() {
		return hadWithdrawnCurrentPage;
	}
	public void setHadWithdrawnCurrentPage(int hadWithdrawnCurrentPage) {
		this.hadWithdrawnCurrentPage = hadWithdrawnCurrentPage;
	}
	public int getToBeReleasedCurrentPage() {
		return toBeReleasedCurrentPage;
	}
	public void setToBeReleasedCurrentPage(int toBeReleasedCurrentPage) {
		this.toBeReleasedCurrentPage = toBeReleasedCurrentPage;
	}
	public int getIsShelfCurrentPage() {
		return isShelfCurrentPage;
	}
	public void setIsShelfCurrentPage(int isShelfCurrentPage) {
		this.isShelfCurrentPage = isShelfCurrentPage;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getAdv() {
		return adv;
	}
	public void setAdv(String adv) {
		this.adv = adv;
	}
	public String getVir() {
		return vir;
	}
	public void setVir(String vir) {
		this.vir = vir;
	}
	public String getPri() {
		return pri;
	}
	public void setPri(String pri) {
		this.pri = pri;
	}
	public String getOff() {
		return off;
	}
	public void setOff(String off) {
		this.off = off;
	}
	public File getPackgeContent() {
		return packgeContent;
	}
	public void setPackgeContent(File packgeContent) {
		this.packgeContent = packgeContent;
	}
	public String getPackgeContentContentType() {
		return packgeContentContentType;
	}
	public void setPackgeContentContentType(String packgeContentContentType) {
		this.packgeContentContentType = packgeContentContentType;
	}
	public String getPackgeContentFileName() {
		return packgeContentFileName;
	}
	public void setPackgeContentFileName(String packgeContentFileName) {
		this.packgeContentFileName = packgeContentFileName;
	}
	public File getLogo1Content() {
		return logo1Content;
	}
	public void setLogo1Content(File logo1Content) {
		this.logo1Content = logo1Content;
	}
	public String getLogo1ContentContentType() {
		return logo1ContentContentType;
	}
	public void setLogo1ContentContentType(String logo1ContentContentType) {
		this.logo1ContentContentType = logo1ContentContentType;
	}
	public String getLogo1ContentFileName() {
		return logo1ContentFileName;
	}
	public void setLogo1ContentFileName(String logo1ContentFileName) {
		this.logo1ContentFileName = logo1ContentFileName;
	}
	public File getLogo2Content() {
		return logo2Content;
	}
	public void setLogo2Content(File logo2Content) {
		this.logo2Content = logo2Content;
	}
	public String getLogo2ContentContentType() {
		return logo2ContentContentType;
	}
	public void setLogo2ContentContentType(String logo2ContentContentType) {
		this.logo2ContentContentType = logo2ContentContentType;
	}
	public String getLogo2ContentFileName() {
		return logo2ContentFileName;
	}
	public void setLogo2ContentFileName(String logo2ContentFileName) {
		this.logo2ContentFileName = logo2ContentFileName;
	}
	

	

}
