$(function(){
	//小学、初中tab
	$(".tab-list li").click(function(){
		var index = $(".tab-list li").index($(this));
		$(this).addClass("current").siblings("li").removeClass("current");
		$(".app-con").eq(index).css("display","block").siblings(".app-con").css("display","none");
	});
	//后台管理table
	$(".table_wrap table tr").not(".table-head").hover(function(){
		$(this).addClass("hover").siblings("tr").removeClass("hover");
	},function(){
		$(this).removeClass("hover");
	});
	//关闭弹窗
	$(".propt-cancel-btn").click(function(){
		$(".mask,#propt-remove").css("display","none");
	});
	$(".propt-close-btn").click(function(){
		$(".mask,.propt").css("display","none");
	});
	//验证姓名
	$(".name").blur(function(){
		var name = $(this).val(),
			nameReg = /^[a-zA-Z|\u0391-\uFFE5]*$/;
		if(chinaSimple(name,nameReg)&& name.length <= 10 && name.length > 1){
			$(this).removeClass("input-error-txt").siblings(".input-tip").removeClass("input-error-tip");
		}else{
			$(this).addClass("input-error-txt").siblings(".input-tip").addClass("input-error-tip");
		}
	});
	//验证户口所在地和住址
	$(".locus").blur(function(){
		var locus = $(this).val(),
			locusReg = /^[a-zA-Z|\d|\u0391-\uFFE5|-]*$/;
		if(chinaSimple(locus,locusReg)&& locus.length <= 100 && locus.length > 1){
			$(this).removeClass("input-error-txt").siblings(".input-tip").removeClass("input-error-tip");
		}else{
			$(this).addClass("input-error-txt").siblings(".input-tip").addClass("input-error-tip");
		}
	});
	//验证手机号
	$(".contact-way").blur(function(){
		var tel = $(this).val(),
			telReg = /^((\(\d{3}\))|(\d{3}\-))?(1[358]\d{9})$/;
		if(chinaSimple(tel,telReg)){
			$(this).removeClass("input-error-txt").siblings(".input-tip").removeClass("input-error-tip");
		}else{
			$(this).addClass("input-error-txt").siblings(".input-tip").addClass("input-error-tip");
		}
	});
	function chinaSimple(str,reg) {
	   var strs=str.replace(/(^\s+)|(\s+$)/g, "");//去除前后的空格
		if (!strs.match(reg)) {
			return false;
		}else{
			return true;
		}
	}
	//清空默认搜素
	var val;
	$(".search-txt").focus(function(){
		$(this).parent().addClass('active');
	}).blur(function(){
		if($(this).val() == ""){
			$(this).parent().removeClass('active');
		}else{
			$(this).parent().addClass('active');
		}
	});
	$(".header-sea label").click(function(){
		$(this).siblings(".search-txt").focus();
	});
});