

//******************������**********************//



	
	


//**************radio*****************//
	
	var radioArr = new Array();
	function isCheck(obj){
		var hasCheck = false;
		
		for(var i=0; i<radioArr.length; i++){
			if(radioArr[i]==obj){
				radioArr[i].checked = false;
				radioArr.splice(i,1); //�Ƴ�����
				hasCheck = true;
				break;
			}
		}

		if(!hasCheck){
			initRadioArr();
		}
		//alert(radioArr.join("-"));
	}
	//��ʼ��ѡ�е�radio
	function initRadioArr(){
		radioArr = new Array();

		//�ɸ���ʵ������޸�radio�ķ�Χ��
		var radios = document.getElementsByTagName("input");
		for(var i=0; i<radios.length; i++){
			if(radios[i].type.toLowerCase()=="radio" && radios[i].checked){
				radioArr.push(radios[i]);
			}
		}
	}

    
	
	
	
	
	
//*******************ҳ���л�********************//
	
	
    function showPage(page){
     var div = document.getElementById(page);
     if(div != null){
      div.style.visibility = "visible";
      div.style.display = "inline";
     }
    }
    
    function hidePage(page){
     var div = document.getElementById(page);
     if(div != null){
      
      div.style.visibility = 'hidden';
      div.style.display = 'none';
     }
    }
    
    /**��ҳ
     * @param hiddenPage
     * @param shownPage
     */
    function switchPage(hiddenPage , shownPage){
     hidePage(hiddenPage);
     showPage(shownPage);
    }
    
    
    
    
    
    
    //*************************ͼƬ���*********************//
    
    
    jQuery.fn.extend({
    	uploadPreview: function (opts) {
    	var _self = this, _this = $(this);
    	opts = jQuery.extend({
    	Img: "ImgPr", Width: 100, Height: 100, ImgType: ["gif", "jpeg", "jpg", "bmp", "png"], Callback: function () { }
    	}
    	, opts || {});
    	_self.getObjectURL = function (file) {
    	var url = null;
    	if (window.createObjectURL != undefined) {
    	url = window.createObjectURL(file);
    	}
    	else if (window.URL != undefined) {
    	url = window.URL.createObjectURL(file);
    	}
    	else if (window.webkitURL != undefined) {
    	url = window.webkitURL.createObjectURL(file);
    	}
    	return url;
    	};
    	_this.change(function () {
    	if (this.value) {
    	if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
    	alert("ѡ���ļ�����,ͼƬ���ͱ�����" + opts.ImgType.join("��") + "�е�һ��");
    	this.value = "";
    	return false;
    	}
    	if ($.browser.msie) {
    	try {
    	$("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]));
    	}
    	catch (e) {
    	var src = "";
    	var obj = $("#" + opts.Img);
    	var div = obj.parent("div")[0];
    	_self.select();
    	if (top != self) {
    	window.parent.document.body.focus();
    	}
    	else {
    	_self.blur();
    	}
    	src = document.selection.createRange().text;
    	document.selection.empty();
    	obj.hide();
    	obj.parent("div").css({
    	'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)'
    	});
    	div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src;
    	}
    	}
    	else {
    	$("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]));
    	
    	}
    	opts.Callback();
    	}
    	});
    	}
    	});


    

    
    