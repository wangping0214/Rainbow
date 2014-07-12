package com.rainbow.util;

/**具体类别与对应数值
 * @author Administrator
 *
 */
public class Classification {
	private int category;
	private int classification1;
	private int classification2;
	private int classification3;
	private int classification4;
	private String strClass1;
	private String strClass2;
	private String strClass3;
	private String strClass4;
	private String strCat;
	
	public Classification(int category, int classification1,
			int classification2, int classification3, int classification4,
			String strClass1, String strClass2, String strClass3,
			String strClass4, String strCat) {
		super();
		this.category = category;
		this.classification1 = classification1;
		this.classification2 = classification2;
		this.classification3 = classification3;
		this.classification4 = classification4;
		this.strClass1 = strClass1;
		this.strClass2 = strClass2;
		this.strClass3 = strClass3;
		this.strClass4 = strClass4;
		this.strCat = strCat;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getStrCat() {
		return strCat;
	}
	public void setStrCat(String strCat) {
		this.strCat = strCat;
	}
	public int getClassification1() {
		return classification1;
	}
	public void setClassification1(int classification1) {
		this.classification1 = classification1;
	}
	public int getClassification2() {
		return classification2;
	}
	public void setClassification2(int classification2) {
		this.classification2 = classification2;
	}
	public int getClassification3() {
		return classification3;
	}
	public void setClassification3(int classification3) {
		this.classification3 = classification3;
	}
	public int getClassification4() {
		return classification4;
	}
	public void setClassification4(int classification4) {
		this.classification4 = classification4;
	}
	public String getStrClass1() {
		return strClass1;
	}
	public void setStrClass1(String strClass1) {
		this.strClass1 = strClass1;
	}
	public String getStrClass2() {
		return strClass2;
	}
	public void setStrClass2(String strClass2) {
		this.strClass2 = strClass2;
	}
	public String getStrClass3() {
		return strClass3;
	}
	public void setStrClass3(String strClass3) {
		this.strClass3 = strClass3;
	}
	public String getStrClass4() {
		return strClass4;
	}
	public void setStrClass4(String strClass4) {
		this.strClass4 = strClass4;
	}
	
}
