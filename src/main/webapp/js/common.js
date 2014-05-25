function preventBubble(e){
	if(e && e.stopPropagation) {
		e.stopPropagation();//W3C取消冒泡事件
	}else {
		window.event.cancelBubble = true;//IE取消冒泡事件
	}
}
function proptClose(obj1,obj2){
	obj1.addClass("undis").removeClass("dis");
	obj2.css("display","none");
}
function proptDis(obj1,obj2){
	obj1.addClass("dis").removeClass("undis");
	obj2.css("display","block");
}
$(function(){
	//关闭弹窗
	$(".propt-close").click(function(){
		proptClose($(this).parents(".propt"),$(".mask"));
	});
	//取消弹窗
	$(".propt-cancel").click(function(){
		proptClose($(this).parents(".propt"),$(".mask"));
	});
	$(".cancel-link").click(function(){
		proptClose($(this).parents(".propt"),$(".mask"));
	});
});