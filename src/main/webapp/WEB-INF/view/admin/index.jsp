<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/inc/globalConfig.jsp" %>
<!DOCTYPE html>    
<html>
<%@include file="/WEB-INF/view/util/header.jsp" %>
	<link type="text/css" rel="stylesheet" href="${path }/css/librarian.css" />
	<script type="text/javascript" src="${path }/js/topBar.js"></script>
	<script type="text/javascript" src="${path }/js/search.js"></script>
	<script>

		jQuery(document).ready(function() {     
 				$("#loginBtn").click("click",function(e){
					var username=$("#login-mail").val();
					var ud=$("#login-pswd").val();
					var pwd = $.md5(ud);
					if(username==null ||username=="" || ud==""|| ud==null){
						 alert( "邮箱或密码为空");
						//nullid nullid
						// $("#nullid").css("display","block");
						return false;
					}else{
						//$("#nullid").css("display","none");
					}
					$.ajax({  
			            type: "POST", 
			            url: "/lms/base/login", 
			            cache: false, //将不会从浏览器缓存中加载请求信息。 
			            data:{'name':username,'password':pwd},    
			            dataType: 'json', 
			            success: function(data,statusText){
			              if(data.status==0){
			            	  window.location.href="/lms/admin/index";
			              }else{
			            	 //$("#errid").css("display","block");
			              }
			            }, 
			            error: function(XMLHttpRequest, textStatus, errorThrown){ 
			                  alert( "系统异常!");
			                  //alert( textStatus);
			                  //alert( XMLHttpRequest);
			                  //alert( errorThrown);
			            } 
			           }); 
					
				}); 
		});
		
		document.onkeyup = function(e){      //onkeyup是javascript的一个事件、当按下某个键弹起 var _key;                                                 //的时触发  
		    if (e == null) { // ie  
		        _key = event.keyCode;  
		    } else { // firefox              //获取你按下键的keyCode  
		        _key = e.which;          //每个键的keyCode是不一样的  
		    }  
		      
		    if(_key == 13){   //判断keyCode是否是13，也就是回车键(回车的keyCode是13)  
		     //if (validator(document.loginform)){ //这个因该是调用了一个验证函数  
		         $(".login-input").blur();
		    	 document.getElementById('loginBtn').click();    //验证成功触发一个Id为btnLogin的  
		        //}                                                                        //按钮的click事件，达到提交表单的目的  
		    }  
		};  
	</script>
<body>
<div class="wrap">
	<!--header begin-->
	<div id="header"><div class="logo"><a href="javascript:void(0);" class="png-bg"></a></div></div>
	<!--header end-->
	<!---topBar begin-->
	<%@include file="/WEB-INF/view/admin/util/menu.jsp" %>
	<!---topBar end->
	<!--content begin-->
	<div class="content-wrap">
		<div id="content" class="clearfix">
			<div class="login-tip">
			<marquee behavior=scroll>您好，管理员。今天是<span>${date}</span></marquee></div>
			<!--管理员首页展示 begin--->
			poi
			
			<!--管理员首页展示  end--->
		</div>
	</div>
	<!--content end-->
	<!--footer begin-->
	<%@include file="/WEB-INF/view/admin/util/foot.jsp" %>
</div>	
</body>
</html>