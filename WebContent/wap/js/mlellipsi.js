/*
 * @author:tqtan
 * @date:13/10/10
 * @name:瀹炵幇澶氳鐪佺暐
 * 
*/


/*
 *	@method:node.mlellipsis(row)
 *  @node:dom鑺傜偣
 *  @row:琛屾暟
 *	
*/
Element.prototype.getText=function(){
	if(this.innerText==undefined){return this.textContent;}
	else{return this.innerText;}
}

Element.prototype.setText=function(str){
	if(this.innerText==undefined){this.textContent=str||"";}
	else{this.innerText=str||"";}
}

Element.prototype.getFinalStyle=function(property,fontSize){
	var s;
	if(window.getComputedStyle){
		s = window.getComputedStyle(this, null)[property];
	}
	else{
		s = this.currentStyle[property];
	}

	//鍏煎IEbug:IE瑙ｆ瀽getComputedStyle鎴朿urrentStyle,鐒惰€岃嫢line-height=1.5锛屽畠浼氳幏鍙栬绠楀悗鏄�1.5锛岃€屽叾浠栨祻瑙堝櫒鑾峰緱1.5*line-height
	if(fontSize!=undefined){
		s = s*fontSize + "px";
	}
	return s.substring(0,s.toString().length-2);
		
}

Element.prototype.mlellipsis=function(row){	
	//鐪佺暐鍚庡姞涓妕itle
	var str = this.getText();
	var title = this.getAttribute("title");
	if(title==null){this.setAttribute("title",str);}
	else{this.setText(title);}

	//鑾峰彇璁＄畻鍚庣殑鏍峰紡
	var fontSize = this.getFinalStyle("fontSize");
	if(/msie/i.test(navigator.userAgent)){
		var lineHeight = this.getFinalStyle("lineHeight",fontSize);
	}
	else{
		var lineHeight = this.getFinalStyle("lineHeight");
	}
	var height  = this.clientHeight;

	if(lineHeight == "norm"){
		lineHeight = Number(fontSize*1.5);
		var nowStyle = this.getAttribute("style")||"";
		this.setAttribute("style",nowStyle+";line-height:"+lineHeight+"px");
	}
	else{lineHeight = Number(lineHeight);}

	
	//鑻ラ珮搴﹁冻澶燂紝鍒欎笉鐢ㄧ渷鐣�
	var dheight = Math.floor(row*lineHeight);
	if(height >= dheight){
		str = this.getText();

		while(dheight*3<this.clientHeight){
			this.setText(str.substring(0,str.length/2));
			str = this.getText();
		}
		//鍑忓幓鏈熬鏂囧瓧
		while(dheight<this.clientHeight){
			str = this.getText();
			this.setText(str.replace(/(\s)*([a-zA-Z0-9]?|\W)(\.\.\.)?$/,"..."));
		}
	}
}

/*
 *	/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/ 姝ｅ垯:
 *	(\s)* 0鎴栧涓┖鐧�
 *	([a-zA-Z0-9]+|\W) 涓€涓垨澶氫釜瀛楁瘝鏁板瓧 鎴� 浠绘剰涓嶆槸瀛楁瘝锛屾暟瀛楋紝姹夊瓧鐨勫瓧绗�
 *	(\.\.\.)? 闆朵釜鎴栦竴涓�...
 */