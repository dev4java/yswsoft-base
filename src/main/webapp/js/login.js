document.write("<script language='javascript' src='${path}/js/common.js'></script>");
var id;
$(function(){
	var editName;
	//家长首页-修改关系
	$(".set-relation-option li a[name='edit-rel']").click(function(){
		$(this).parents(".set-relation-option").parent().removeClass("active");
		$("#edit-name").text(editName);
	});
	$(".relation-dropdown-btn").click(function(){
		var relOption = $(this).parent().siblings(".relation-option"),
			relSel = $(this).siblings("span"),
			/*不太明白为什么获取外部和内部的宽度和长度*/
			widthOuter = $("#edit-relation").width(),
			widthInner = widthInner = $(".edit-relation-msg").width();
		relOption.toggleClass("dis");
		relOption.children("li").hover(function(){
			$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");
		});
		relOption.children("li").children("a").click(function(){
			relSel.text($(this).text());
			relOption.removeClass("dis");
			if($(this).attr("id") == "other-rel"){
				$(".other-relation-input").removeClass("undis");
				$(".relation-label").removeClass("undis");
				
			}else{
				$(".other-relation-input").addClass("undis");
				$(".relation-label").addClass("undis");
				
			}
		});
	});
	//登录方式切换
	$(".tab_switch li").click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$(this).parent().siblings(".login-submit").css("display","none").eq($(".tab_switch li").index($(this))).css("display","block");
		if($(".tab_switch li").index($(this)) == 1){
			$(".word-tip").css("display","none");
		}else if($(".tab_switch li").index($(this)) == 0){
			$(".word-tip").css("display","block");
		}
	});
	//文本获取焦点
	$(".lginput-txt").each(function(){
		$(this).focus(function(){
			$(this).parent().addClass("active");
		}).blur(function(){
			if($(this).val() == ""){
				$(this).parent().removeClass("active");
			}
		});
	});
	$(".relation").focus(function(){
		$(this).parent().addClass("active");
	}).blur(function(){
		if($(this).val() == ""){
			$(this).parent().removeClass("active");
		}
	});
	
	//发送链接至邮箱
	$("#send-to-email").click(function(){
		$(".login-submit[name='input-email']").addClass("undis");
		$(".login-submit[name='send-link']").removeClass("undis");
	});
});