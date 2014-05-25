<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/inc/globalConfig.jsp" %>
<!DOCTYPE html>    
<html>
<%@include file="/WEB-INF/view/util/header.jsp" %>
<link href="${path }/css/common.css" type="text/css" rel="stylesheet">
<link href="${path }/css/login.css"  type="text/css" rel="stylesheet" />
<script src="${path }/js/login.js" type="text/javascript" ></script>
<script src="${path }/js/pngfix.js" type="text/javascript"></script>
<script src="${path }/js/jquery.md5.js" type="text/javascript"></script>
	<script>

		jQuery(document).ready(function() {     
 				$("#loginBtn").click("click",function(e){
					var username=$("#login-mail").val();
					var ud=$("#login-pswd").val();
					var pwd = $.md5(ud);
					 alert(username+"------ud="+ud+"-----"+pwd);
					/* if(username==null ||username=="" || pwd==""|| pwd==null){
						 alert( "邮箱或密码为空");
						//nullid nullid
						// $("#nullid").css("display","block");
						return false;
					}else{
						//$("#nullid").css("display","none");
					} */
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
			<%@include file="/WEB-INF/view/admin/util/banner.jsp" %>
		<!--header end-->
		<!--content begin-->
		<div class="content-wrap1">
		<!--登录  begin-->
		<div class="log-wrap">
			<form method="post" action="">
				<ul class="tab_switch clearfix">
					<li class="current png-bg">工号登录</li>
					<li class="last png-bg">邮箱登录</li>
				</ul>
				<!--工号登录 begin-->
				<div class="login-submit png-bg">
					<div class="input-row">
						<p><input class="lginput-txt" id="login-snumber"type="text"><label>工号</label></p>
						<div class="login-msg msg-mail">
							<span class="msg-bg png-bg"></span>
							<div class="msg msg-tip"><i class="msg-icon msg-error"></i><span class="msg-con">工号输入有误</span></div>
						</div>
					</div>
					<div class="input-row">
						<p class="last"><input class="lginput-txt last"type="password" id="login-pswd1"><label>密码</label></p>
						<div class="login-msg msg-pswd">
							<span class="msg-bg png-bg"></span>
							<div class="msg msg-tip"><i class="msg-icon msg-error"></i><span class="msg-con">密码输入有误</span></div>
						</div>
					</div>
					<p class="word-tip"><a class="c-click" href="忘记密码.html" target="_blank">忘记密码</a></p>
					<p class="log-btn"><a href="javascript:;" class="login-btn login-btn1">登录</a></p>
				</div>
				<!--工号登录 end-->
				<!---邮箱登录 begin-->
				<div class="login-submit png-bg undis">
					<div class="input-row">
						<p><input class="lginput-txt" id="login-mail" type="text"><label>邮箱</label></p>
						<div class="login-msg msg-number">
							<span class="msg-bg png-bg"></span>
							<div class="msg msg-tip"><i class="msg-icon msg-error"></i><span class="msg-con">邮箱输入有误</span></div>
						</div>
					</div>
					<div class="input-row">
						<p><input class="lginput-txt last"type="password" id="login-pswd"><label>密码</label></p>
						<div class="login-msg msg-pswd">
							<span class="msg-bg png-bg"></span>
							<div class="msg msg-tip"><i class="msg-icon msg-error"></i><span class="msg-con">密码输入有误</span></div>
						</div>
					</div>
					<p class="log-btn"><a href="javascript:;" class="login-btn login-btn1" id="loginBtn">登录</a></p>
				</div>
				<!--邮箱登录  end-->			
			</form>
	
		</div>
		<!--登录   end-->		
	</div>
		<!--content end-->
		<!--footer begin-->
		<%@include file="/WEB-INF/view/util/foot.jsp" %>
		<!--footer end-->
	</div>
</body>
</html>
