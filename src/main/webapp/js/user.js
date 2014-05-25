document.write("<script language='javascript' src='theme/js/common.js'></script>");
$(function(){
	//修改密码
	var currentPswd,newPswd,rePswd,reg = /[a-z0-9]{6,18}/i,msg = ["当前密码输入有误","密码需为6-18位数字或字母","两次密码输入不一致"];
	var uid = $('#uid').val();
	var flag = false;
	var msgCon1 = ""
	var msgCon2 = "";
	var msgCon3 = "";
	$("#current-pswd").blur(function(){
		var msgIcon = $(this).parent().siblings(".msg").children("i");
		msgCon = $(this).parent().siblings(".msg").find(".msg-con");
		currentPswd = $(this).val();
		//alert(currentPswd);
		$.ajax({  
			type: "POST", 
			url: "/luole/user/pwd/validate",
			data:{uid:uid,password:currentPswd},
			dataType: 'json', 
			success: function(data,textStatus){
				if(data.status == 0 && data.statusText=="ok"){
					//alert(data.statusText);
					flag = true;
					if(msgIcon.hasClass("msg-error")){
						msgIcon.removeClass("msg-error")
					}
					msgIcon.addClass("msg-ok");
					msgCon.text("");
					msgCon1 = "";
				}else{
					flag = false;
					if(msgIcon.hasClass("msg-ok")){
						msgIcon.removeClass("msg-ok");
					}
					msgIcon.addClass("msg-error");
					msgCon.text(msg[0]);
					msgCon1 = msgCon.text();
					//alert(data.statusText);
				}
			}
       });
	});
	$("#new-pswd").blur(function(){
		var msgIcon = $(this).parent().siblings(".msg").children("i"),
			msgCon = $(this).parent().siblings(".msg").find(".msg-con");
		newPswd = $(this).val();
		if(!reg.test(newPswd)){	
			if(msgIcon.hasClass("msg-ok")){
				msgIcon.removeClass("msg-ok");
			}
			msgIcon.addClass("msg-error");
			msgCon.text(msg[1]);
			msgCon2 = msgCon.text();
			flag = false;
		}else{
			if(msgIcon.hasClass("msg-error")){
				msgIcon.removeClass("msg-error")
			}
			msgIcon.addClass("msg-ok");
			msgCon.text("");
			msgCon2 = "";
			flag = true;
		}
	});
	$("#re-pswd").blur(function(){
		var msgIcon = $(this).parent().siblings(".msg").children("i"),
			msgCon = $(this).parent().siblings(".msg").find(".msg-con");
		rePswd = $(this).val();
		newPswd = $('#new-pswd').val();
		if(newPswd == undefined || newPswd == "" || newPswd != rePswd){
			if(msgIcon.hasClass("msg-ok")){
				msgIcon.removeClass("msg-ok")
			}
			msgIcon.addClass("msg-error");
			msgCon.text(msg[2]);
			msgCon3 = msgCon.text();
			flag = false;
		}else{
			if(msgIcon.hasClass("msg-error")){
				msgIcon.removeClass("msg-error")
			}
			msgIcon.addClass("msg-ok");
			msgCon.text("");
			msgCon3 = "";
			flag = true;
		}
	});