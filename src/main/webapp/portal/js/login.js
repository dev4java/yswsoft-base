$(function(){
	$(".login-con .login-input").blur(function(){
		if($(this).val() == ""){
			$(this).parent().removeClass("active");
		}else{
			$(this).parent().addClass("active");
		}
	});
	$(".login-con .login-input").focus(function(){
		$(this).parent().addClass("active");
	});
});