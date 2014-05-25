<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/inc/globalConfig.jsp" %>
<!DOCTYPE html>    
<html>
<%@include file="/WEB-INF/view/util/header.jsp" %>
<link href="${path }/css/common.css" rel="stylesheet">
<script src="${path }/js/all.js" type="text/javascript"></script>
	<script>
	</script>
<body>
	<div class="wrap png-bg">
		<!--header begin-->
			<%@include file="/WEB-INF/view/admin/util/banner.jsp" %>
		<!--header end-->
		<!--content begin-->
		<div id="content" class="png-bg">
			<div class="content-wrap1">
				<h2 class="app-tit">申请信息查询</h2>
				<p class="return-info clearfix"><a href="/collection/admin/list">返回信息列表</a></p>
				<div class="app-wrap">
					<div class="app-con">
						<h3>申请信息详情</h3>
						<div class="module">
							<p>学生信息</p>
							<h2></h2>
							<ul>
								<li class="clearfix">
									<span class="tit">姓名</span>
									<span class="complete-info">${message.uStuName}</span>
								</li>
								<li class="clearfix">
									<span class="tit">性别</span>
									<span class="complete-info">${message.uStuSex}</span>
								</li>
								<li class="clearfix">
									<span class="tit">出生日期</span>
									<span class="complete-info">${message.uStuBirthday}</span>
								</li>
								<li class="clearfix">
									<span class="tit">户口所在地</span>
									<span class="complete-info">${message.uStuHujiAddress}</span>
								</li>
								<li class="clearfix">
									<span class="tit">家庭住址</span>
									<span class="complete-info">${message.uStuAddress}</span>
								</li>
								<c:forEach items="${message.userAnswer}" var= "userAnswers" varStatus ="status">
									<li class="clearfix">
										<span class="tit1">${userAnswers.question}</span>
										<span class="complete-info">${userAnswers.answer}</span>
									</li>
								</c:forEach>
								
							</ul>
						</div>
						<div class="module">
							<p>家长信息</p>
									<c:forEach items="${message.parent}" var= "parents" varStatus ="status">
										<c:choose>
											<c:when test="${parents.relation==2 }">
												<p class="module-tit">母亲基本信息</p>
												<ul>
													<li class="clearfix">
														<span class="tit">姓名</span>
														<span class="complete-info">${parents.name}</span>
													</li>
													<li class="clearfix">
														<span class="tit">工作单位</span>
														<span class="complete-info">${parents.company}</span>
													</li>
													<li class="clearfix">
														<span class="tit">工作职务</span>
														<span class="complete-info">${parents.jobTitle}</span>
													</li>
													<li class="clearfix">
														<span class="tit">联系方式</span>
														<span class="complete-info">${parents.telphone}</span>
													</li>
												</ul>
											</c:when>
											<c:otherwise>
											<p class="module-tit module-tit1">父亲基本信息</p>
												<ul>
													<li class="clearfix">
														<span class="tit">姓名</span>
														<span class="complete-info">${parents.name}</span>
													</li>
													<li class="clearfix">
														<span class="tit">工作单位</span>
														<span class="complete-info">${parents.company}</span>
													</li>
													<li class="clearfix">
														<span class="tit">工作职务</span>
														<span class="complete-info">${parents.jobTitle}</span>
													</li>
													<li class="clearfix">
														<span class="tit">联系方式</span>
														<span class="complete-info">${parents.telphone}</span>
													</li>
												</ul>
										</c:otherwise>	
										</c:choose>
									</c:forEach>
		
						
							
						</div>
					</div>
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
			<p><a href="javascript:;" class="close-btn">关&nbsp;闭</a></p>
		</div>
		<!--未完成全部信息弹窗 end-->
		<!--成功录入弹窗 begin-->
		<div class="propt" id="propt-success" style="display:none;">
			<p class="propt-msg">您提交的信息已经成功收录，感谢您的配合！</p>
			<p><a href="javascript:;" class="close-btn">关&nbsp;闭</a></p>
			<p class="return-home">返回<a href="javascript:;" class="">网站首页</a></p>
		</div>
		<!--成功录入弹窗 end-->
	</div>
</body>
</html>