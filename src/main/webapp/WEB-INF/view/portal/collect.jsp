<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/inc/globalConfig.jsp" %>
<!DOCTYPE html>    
<html>
<%@include file="/WEB-INF/view/util/header.jsp" %>
<script src="${path }/js/navHover.js" type="text/javascript"></script>
<link href="${path }/css/commonWeb.css" rel="stylesheet">
<script src="${path }/js/Calendar3.js" type="text/javascript"></script>
<script src="${path }/js/all.js" type="text/javascript"></script>


<script>
jQuery(document).ready(function() {
		$("#xxid").click("click",function(e){
			//stu
			var stuname=$(".input-txt.name").val();
			var stusex=$("input[name='sex']:checked").next("label").html();  
			var stubirthday=$(".input-txt.birthday").val();
			var stuhuju=$(".input-txt.locus").val();
			var stuhome=$(".input-txt.locus.addr").val();
			//par
			var frelation=1;
			var fname=$(".input-txt.name.fn").val();
			var fcompany=$(".input-txt.locus.fc").val();
			var fjobTitle=$(".input-txt.locus.fj").val();
			var ftelphone=$(".input-txt.contact-way.fp").val();
				
			var mrelation=2;
			var mname=$(".input-txt.name.mn").val();
			var mcompany=$(".input-txt.locus.mc").val();
			var mjobTitle=$(".input-txt.locus.mj").val();
			var mtelphone=$(".input-txt.contact-way.mp").val();
			//ans
			var scqid=$("#qid").val();
			var stuapply=$("#qdid").val();
			var stuanswer=$("input[name='addr']:checked").next("label").html();
			if($('.input-txt').hasClass('input-error-txt')){
					return false;
				}
			var inputTxt = $(".app-con").eq($(".tab-list li").index($(".tab-list li.current"))).find(".input-txt");
			if(stuname=="" || stusex=="" || stubirthday=="" ||  stuhuju=="" || stuhome=="" ||
			   frelation=="" ||fname=="" ||fcompany=="" ||fjobTitle=="" ||ftelphone=="" ||
			   mrelation=="" ||mname=="" || fcompany=="" ||mjobTitle=="" ||mtelphone=="" ||
			   scqid=="" ||stuanswer=="" ||stuapply==""){
					$("#propt-unfinished,.mask").css("display","block");
					$("#propt-unfinished").css("top",$(document).scrollTop()+200);
				return false;
			}
			var sexRadio = $(".radio-btn[name='sex']:checked").length,
			addrRadio = $(".radio-btn[name='addr']:checked").length,
			valArr = sexRadio + addrRadio;
			if(valArr !=2){
				$("#propt-unfinished,.mask").css("display","block");
				$("#propt-unfinished").css("top",$(document).scrollTop());
				return false;
			}
			$.ajax({  
	            type: "POST", 
	            url: "/collection/collection/show", 
	            cache: false, //将不会从浏览器缓存中加载请求信息。 
	            data:{'stuname':stuname,'stusex':stusex,'stubirthday':stubirthday,'stuhuju':stuhuju,'stuhome':stuhome,
	            	  'frelation':frelation,'fname':fname,'fcompany':fcompany,'fjobTitle':fjobTitle,'ftelphone':ftelphone,
	            	  'mrelation':mrelation,'mname':mname,'mcompany':mcompany,'mjobTitle':mjobTitle,'mtelphone':mtelphone,
	            	  'scqid':scqid,'stuapply':stuapply,'stuanswer':stuanswer
	            },    
	            dataType: 'json', 
	            success: function(data,statusText){
	              if(data.status==0){
	            	  //$("#propt-success").css("display","block");
	            	  inputTxt.val("");
	            	  $(".radio-btn[name='sex']:checked").removeAttr("checked");
	            	  $(".radio-btn[name='addr']:checked").removeAttr("checked");
	            	  $("#propt-success,.mask").css("display","block");
	            	  $("#propt-success").css("top",$(document).scrollTop());
	            	  //window.location.reload();
	              }else{
	            	 $("#propt-success").css("display","none");
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
</script>
<body>
	<div class="wrap png-bg">
		<%@include file="/WEB-INF/view/util/menu.jsp" %>
		<!--content begin-->
		<div id="content" class="png-bg">
			<div class="content-wrap1">
				<h2 class="app-tit">学生入学意向登记表</h2>
				<div class="app-wrap">
					<ul class="tab-list clearfix">
						<li class="current">小学</li>
						<li style="display:none;">初中 </li>
					</ul>
					<!--小学申请表 begin-->
					<div class="app-con">
						<form method="post" action="">
							<p class="tips">以下所有信息均为必填项，请各位家长朋友确认全部填写完成后再进行提交，谢谢！</p>
							<div class="module">
								<p>学生信息</p>
								<ul>
									<li class="clearfix">
										<span class="tit">姓名</span>
										<input type="text"  class="input-txt name" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z]/g,''))"/>
										<span class="input-tip">(长度不超过10个中文字符，只允许输入汉字和字母)</span>
									</li>
									<li class="clearfix">
										<span class="tit">性别</span>
										<input type="radio" name="sex" id="male" class="radio-btn" />
										<label for="male">男</label>
										<input type="radio" name="sex" id="female" class="radio-btn" />
										<label for="female">女</label>
									</li>
									<li class="clearfix">
										<%-- <span class="tit">出生日期</span>
										<span class="date">
											<input type="text" class="input-txt birthday" />
											<img class="ui-datepicker-trigger" src="${path }/imgs/calendar.gif" alt="日历" title="日历">
										</span> --%>
										<span class="tit">出生日期</span>
										<span class="datepicker date"> 
											<!--  <input type="text" name="date" id="date" class="input-txt birthday" readonly="readonly" placeholder ="日期" /> -->
											<input class="input-txt birthday" name="date" id="date" type="text" readonly="readonly" onclick="new Calendar().show(this);"  />
										</span>
									</li>
									<li class="clearfix">
										<span class="tit">户口所在地</span>
										<input type="text" class="input-txt locus" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">家庭住址</span>
										<input type="text" class="input-txt locus addr" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<!-- <li class="clearfix">
										<span class="tit1">是否为阳光新苑小区租住户</span>
										<input type="radio" name="addr" id="yes" class="radio-btn" />
										<label for="yes">是</label>
										<input type="radio" name="addr" id="no" class="radio-btn" />
										<label for="no">否</label>
									</li> -->
									<li class="clearfix">
									<c:forEach items="${question}" var= "q" varStatus ="status">
										<input type="hidden" id="qid" value="${q.id}" />
										<input type="hidden" id="qdid" value="${q.dept}" />
										<span class="tit1">${q.question}</span>
										<c:if test="${q.questType=='1'}">
										<!-- 未分类 -->
											<input type="radio" name="addr" id="yes" class="radio-btn" />
												<label for="yes">是</label>
											<input type="radio" name="addr" id="no" class="radio-btn" />
												<label for="no">否</label>
										</c:if>
									</c:forEach>
									</li>
								</ul>
							</div>
							<div class="module">
								<p>家长信息</p>
								<p class="module-tit">母亲基本信息</p>
								<ul class="info-list">
									<li class="clearfix">
										<span class="tit">姓名</span>
										<input type="text" class="input-txt name mn" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z]/g,''))"/>
										<span class="input-tip">(长度不超过10个中文字符，只允许输入汉字和字母)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作单位</span>
										<input type="text" class="input-txt locus mc" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作职务</span>
										<input type="text" class="input-txt locus mj" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">联系方式</span>
										<input type="text" class="input-txt contact-way mp" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(必须填写真实手机号码)</span>
									</li>
								</ul>
								<p class="module-tit module-tit1">父亲基本信息</p>
								<ul>
									<li class="clearfix">
										<span class="tit">姓名</span>
										<input type="text" class="input-txt name fn" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z]/g,''))"/>
										<span class="input-tip">(长度不超过10个中文字符，只允许输入汉字和字母)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作单位</span>
										<input type="text" class="input-txt locus fc" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作职务</span>
										<input type="text" class="input-txt locus fj" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">联系方式</span>
										<input type="text" class="input-txt contact-way fp" onkeyup="value=value.replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5a-zA-Z|0-9|-]/g,'')"/>
										<span class="input-tip">(必须填写真实手机号码)</span>
									</li>
								</ul>
							</div>
							<input type="button" id="xxid" value="提交申请" class="submit-btn" />
						</form>
						<p class="statement">特别声明：本系统仅是我校统计入学意向使用，不作为正式录取依据。</p>
					</div>
					<!--小学申请表 end-->
					<!--中学申请表 begin-->
					<%-- <div class="app-con" style="display:none;">
						<form method="post" action="">
							<p class="tips">以下所有信息均为必填项，请各位家长朋友确认全部填写完成后再进行提交，谢谢！</p>
							<div class="module">
								<p>学生信息</p>
								<ul>
									<li class="clearfix">
										<span class="tit">姓名</span>
										<input type="text" class="input-txt name" />
										<span class="input-tip">(长度不超过10个中文字符，只允许输入汉字和字母)</span>
									</li>
									<li class="clearfix">
										<span class="tit">性别</span>
										<input type="radio" name="sex1" id="male1" class="radio-btn" />
										<label for="male1">男</label>
										<input type="radio" name="sex1" id="female1" class="radio-btn" />
										<label for="female1">女</label>
									</li>
									<li class="clearfix">
										<span class="tit">出生日期</span>
										<span class="date">
											<input type="text" class="input-txt birthday" />
											<img class="ui-datepicker-trigger" src="${path }/imgs/calendar.gif" alt="日历" title="日历">
										</span>
									</li>
									<li class="clearfix">
										<span class="tit">户口所在地</span>
										<input type="text" class="input-txt locus" />
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">家庭住址</span>
										<input type="text" class="input-txt locus" />
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit1">是否为阳光新苑小区租住户</span>
										<input type="radio" name="addr1" id="yes1" class="radio-btn" />
										<label for="yes1">是</label>
										<input type="radio" name="addr1" id="no1" class="radio-btn" />
										<label for="no1">否</label>
									</li>
								</ul>
							</div>
							<div class="module">
								<p>家长信息</p>
								<p class="module-tit">母亲基本信息</p>
								<ul class="info-list">
									<li class="clearfix">
										<span class="tit">姓名</span>
										<input type="text" class="input-txt name" />
										<span class="input-tip">(长度不超过10个中文字符，只允许输入汉字和字母)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作单位</span>
										<input type="text" class="input-txt locus" />
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作职务</span>
										<input type="text" class="input-txt locus" />
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">联系方式</span>
										<input type="text" class="input-txt contact-way" />
										<span class="input-tip">(必须填写真实手机号码)</span>
									</li>
								</ul>
								<p class="module-tit module-tit1">父亲基本信息</p>
								<ul>
									<li class="clearfix">
										<span class="tit">姓名</span>
										<input type="text" class="input-txt name" />
										<span class="input-tip">(长度不超过10个中文字符，只允许输入汉字和字母)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作单位</span>
										<input type="text" class="input-txt locus" />
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">工作职务</span>
										<input type="text" class="input-txt locus" />
										<span class="input-tip">(最多可输入100个汉字，只允许输入汉字、字母、数字和-)</span>
									</li>
									<li class="clearfix">
										<span class="tit">联系方式</span>
										<input type="text" class="input-txt contact-way" />
										<span class="input-tip">(必须填写真实手机号码)</span>
									</li>
								</ul>
							</div>
							<input type="button" id="czid" value="提交申请" class="submit-btn" />
						</form>
						<p class="statement">特别声明：本系统仅是我校统计入学意向使用，不作为正式录取依据。</p>
					</div> --%>
					<!--中学申请表 end-->
				</div>
			</div>
		</div>
		<!--content end-->
		<!--footer begin-->
		<%@include file="/WEB-INF/view/util/foot.jsp" %>
		<!--footer end-->
		<!--未完成全部信息弹窗 begin-->
		<div class="propt" id="propt-unfinished" style="display:none;">
			<p class="propt-msg">您未完成全部信息的填写，请检查。全部填写完成后，请再次提交！</p>
			<p><a href="javascript:;" class="propt-close-btn">关&nbsp;闭</a></p>
		</div>
		<!--未完成全部信息弹窗 end-->
		<!--ie 6-->
		<div class="propt" id="ie6id" style="display:none;">
			<p class="propt-msg">您的浏览器版本太低,为了不影响您的体验,推荐使用IE7以上版本的浏览器</p>
			<p></p>
		</div>
		<!--ie 6 end-->
		<!--成功录入弹窗 begin-->
		<div class="propt" id="propt-success" style="display:none;">
			<p class="propt-msg">您提交的信息已经成功收录，感谢您的配合！</p>
			<p><a href="javascript:;" class="propt-close-btn">关&nbsp;闭</a></p>
			<p class="return-home">返回<a href="http://www.jkyftxx.com" class="">网站首页</a></p>
		</div>
		<!--成功录入弹窗 end-->
	</div>
	<!--mask-->
	<div class="mask png-bg" style="display:none;"></div>
</body>
</html>