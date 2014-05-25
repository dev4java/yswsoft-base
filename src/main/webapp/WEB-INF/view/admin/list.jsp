<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/inc/globalConfig.jsp" %>
<!DOCTYPE html>    
<html>
<%@include file="/WEB-INF/view/util/header.jsp" %>
<script src="${path }/js/pngfix.js" type="text/javascript"></script>
<script src="${path }/js/login.js" type="text/javascript"></script>
<link href="${path }/css/common.css" rel="stylesheet">
<script src="${path }/js/jquery.md5.js" type="text/javascript"></script>
<script src="${path }/js/all.js" type="text/javascript"></script>
	<script>
		//detail
			function detail(obj){
				if(obj=="" || obj==null){
					return false;
				}
				window.location.href="/collection/admin/show?uid="+obj;
			}
		
		/*删除信息*/
			function del(obj){
				$("#huid").val(obj);
				$(".mask,#propt-remove").css("display","block");
			}
		//del
			function delstu(){
			var obj=$("#huid").val();
			var didv=$("#xtid tr").length - 1;
			$("#did").val(didv);
			/* var pageNo    =$("#curNoid").val();//当前页码
			var pcurTotal =$("#totalid").val();//总页码 
			if(pcurTotal<pageNo){
				pageNo=pcurTotal;
			} */
			
				if(obj=="" || obj==null){
					return false;
				}
				$.ajax({  
		            type: "POST", 
		            url: "/collection/admin/delete", 
		            cache: false, //将不会从浏览器缓存中加载请求信息。 
		            data:{'uid':obj},    
		            dataType: 'json', 
		            success: function(data,statusText){
		              if(data.status==0){		    
		            	  if(didv==1){
		            		  var url="/collection/admin/list?pageNo=1&pageSize=10&flag=next";
			            	  window.location.href=url; 
		            	  }else{
		            		  window.location.reload();
		            	  }
		            	 
		              }else{
		            	 $("#errid").css("display","block");
		              }
		            }, 
		            error: function(XMLHttpRequest, textStatus, errorThrown){ 
		                  alert( "系统异常!");
		                  alert( textStatus);
		                  alert( XMLHttpRequest);
		                  alert( errorThrown);
		            } 
		           }); 
			}
	//--------------------------------------------------------------------------------
	var pageSize = 10;//每页10条
	//var pageSize = 2;//每页10条
	var pageNo=$("#curNoid").val();//当前页码
	var curTotal = ${page.totalPageCount};//总页码 
	
	function submitForm(pageNo,flag){
		var total = ${page.totalCount};
		if (total == 0)return;
		var action = $("#jumpForm").attr("action");
		if(curTotal<pageNo){
			pageNo=curTotal;
		}
		action = action + "?pageNo=" + pageNo + "&pageSize=" + pageSize+"&flag="+flag;
		//alert(action);
        $("#jumpForm").attr("action",action);
        $("#jumpForm").submit();
	}
	//go()
	function go(obj){
		var flag="curr";
		pageNo=parseInt(obj);
		/* var action = $("#jumpForm").attr("action");
        action = action + "?pageNo=" + pageNo + "&pageSize=" + pageSize;
        alert("-----"+action);
        $("#jumpForm").attr("action",action);
        $("#jumpForm").submit(); */
		submitForm(pageNo,flag);
	};
	jQuery(document).ready(function() { 
			$("#loginBtn").click("click",function(e){
			var username=$("#username").val();
			var ud=$("#userpswd").val();
			var pwd = $.md5(ud);
			if(username==null ||username=="" || ud==""|| ud==null){
				//nullid nullid
				 $("#nullid").css("display","block");
				return false;
			}else{
				$("#nullid").css("display",":;");
			}
			$.ajax({  
	            type: "POST", 
	            url: "/admin/login", 
	            cache: false, //将不会从浏览器缓存中加载请求信息。 
	            data:{'name':username,'password':pwd},    
	            dataType: 'json', 
	            success: function(data,statusText){
	              if(data.status==0){
	            	  window.location.href="/admin/list";
	              }else{
	            	 $("#errid").css("display","block");
	              }
	            }, 
	            error: function(XMLHttpRequest, textStatus, errorThrown){ 
	                  alert( "系统异常!");
	                  alert( textStatus);
	                  alert( XMLHttpRequest);
	                  alert( errorThrown);
	            } 
	           }); 
			
		}); 
		//--------------------------分页begin--------------------------
			pageNo=$("#curNoid").val();//当前页码
			//alert("pageNo="+pageNo+" curTotal="+curTotal);
			//上一页
			$("#upid").click("click",function(e){
				var flag="up";
				if(pageNo==1){
					alert("当前已经是第一页");
					return false;
				}else{
					pageNo=parseInt(pageNo)-1;
				}
				/* var action = $("#jumpForm").attr("action");
		        action = action + "?pageNo=" + pageNo + "&pageSize=" + pageSize;
		        alert("-----"+action);
		        //$("#jumpForm").attr("action",action);
		        //$("#jumpForm").submit(); */
				submitForm(pageNo,flag);
			});
			
			//下一页
			$("#nextid").click("click",function(e){
				//alert("pageNo="+pageNo+" curTotal="+curTotal);
				var flag="next";
				if(pageNo>=curTotal){
					alert("当前已经是最后一页");
					return false;
				}else{
					pageNo=parseInt(pageNo)+1;
				}
				/* var action = $("#jumpForm").attr("action");
		        action = action + "?pageNo=" + pageNo + "&pageSize=" + pageSize;
		        alert("-----"+action);
		        $("#jumpForm").attr("action",action);
		        $("#jumpForm").submit(); */
				submitForm(pageNo,flag);
			});
			
			//首页
			$("#homeid").click("click",function(e){
				//alert("pageNo="+pageNo+" curTotal="+curTotal);
				var flag="next";
				pageNo=1;
				submitForm(pageNo,flag);
			});
			//尾页
			$("#endid").click("click",function(e){
				//alert("pageNo="+pageNo+" curTotal="+curTotal);
				var flag="next";
				pageNo=curTotal;
				submitForm(pageNo,flag);
			});
			
			//--------------------------分页end--------------------------
	});
//--------------------------------------------------------------------------------
	</script>
<body>
	<div class="wrap png-bg">
		<!--header begin-->
			<%@include file="/WEB-INF/view/admin/util/banner.jsp" %>
		<!--header end-->
		<!--content begin-->
<!--content begin-->
		<div id="content" class="png-bg">
			<div class="content-wrap1">
				<h2 class="app-tit">申请信息查询</h2>
				<div class="app-wrap">
					<ul class="tab-list clearfix">
						<li class="current">小学</li>
						<li style="display:none;">初中</li>
					</ul>
					<!--小学申请信息 begin-->
					<div class="app-con">
						<p class="return-info clearfix"><a href="/collection/admin/download">下载全部数据</a></p>
						<div class="table_wrap">
							<table id="xtid">
								<tr class="table-head">
									<th class="w185">学生姓名</th>
									<th class="w170">生日</th>
									<th class="w146">是否租住</th>
									<th class="w420">家庭住址</th>
									<th>操作</th>
								</tr>
								
								<c:forEach var="stu" items="${list}" >
								<tr>
									<td><span>${stu.name}</span></td>
									<td><span>${stu.birthday}</span></td>
									<c:choose>
										<c:when test="${stu.stuanswer=='是'}">
											<td class="rent">
										</c:when>
										<c:otherwise>
											<td>
										</c:otherwise>
									</c:choose>
										<span>${stu.stuanswer}</span>
									</td>
									<td><span>${stu.address}</span></td>
									<td class="oper">
										<a href="javascript:detail(${stu.id});">查看详情</a>&nbsp;|&nbsp;
										<a href="#" onclick="del(${stu.id});" class="rem-link">删除</a>
									</td>
								</tr>
								</c:forEach>
								
							</table>
						</div>
						<div class="page-wrap">
						<form action="<%= request.getContextPath()%>${_url}" id="jumpForm" name="jumpForm" method="post">
							<div class="page">
								${pageHtml }
								<input type="hidden" id="curNoid" value="${page.currentPageNo}" />
								<input type="hidden" id="totalid" value="${page.totalPageCount}" />
								<input type="hidden" id="did" value="" />
									<!-- <a class="home" href="javascript:void(0)" id="homeid">首页</a>
									<a class="prev" href="javascript:void(0)" id="upid">上一页</a>
									<a class="next" href="" id="nextid" id="nextid">下一页</a>
									<a class="end" href="endid">末页</a> -->
								
							</div>
							</form>
						</div>
						
					</div>
					<!--小学申请表 end-->
					<!--中学申请表 begin-->
					<!-- <div class="app-con" style="display:none;">
						<p class="return-info clearfix"><a href="javascript:;">下载全部数据</a></p>
						<div class="table_wrap">
							<table>
								<tr class="table-head">
									<th class="w185">学生姓名</th>
									<th class="w170">生日</th>
									<th class="w146">是否租住</th>
									<th class="w420">家庭住址</th>
									<th>操作</th>
								</tr>
								<tr>
									<td><span>郑晓丽</span></td>
									<td><span>2008-2-12</span></td>
									<td class="rent"><span>是</span></td>
									<td><span>丰台区马家堡西路14号院公益西桥旭日家园</span></td>
									<td class="oper"><a href="javascript:void(0)">查看详情</a>&nbsp;|&nbsp;<a href="javascript:void(0)" class="rem-link">删除</a></td>
								</tr>
								
								
							</table>
						</div>
						<div class="page-wrap">
							<div class="page">
								<a class="home" href="">首页</a>
								<a class="prev" href="">上一页</a>
								<a class="number" href="#">1</a>
								<span class="number">...</span>
								<a class="number" href="#">6</a>
								<a class="number" href="#">7</a>
								<a class="number" href="#">8</a>
								<a class="number" href="#">9</a>
								<a class="number number-cur" href="#">10</a>
								<a class="number" href="#">11</a>
								<a class="number" href="#">12</a>
								<span class="number">...</span>
								<a class="number" href="#">17</a>
								<a class="next" href="">下一页</a>
								<a class="end" href="">末页</a>
							</div>
						</div>
					</div> -->
					<!--中学申请表 end-->
				</div>
			</div>
		</div>
		<!--content end-->
		
		<!--content end-->
		<!--footer begin-->
			<%@include file="/WEB-INF/view/util/foot.jsp" %>
		<!--footer end-->
	<!--删除信息弹窗 begin-->
		<div class="propt" id="propt-remove" style="display:none;">
			<input type="hidden"  id="huid" />
			<p class="propt-msg">确定删除该信息吗？</p>
			<p class="propt-btn-wrap"><a href="#"  onclick="delstu();" class="propt-rem-btn">删&nbsp;除</a><a href="javascript:;" class="propt-cancel-btn">取&nbsp;消</a></p>
		</div>
		<!--删除信息弹窗 end-->
		<!--mask-->
		<div class="mask png-bg" style="display:none;"></div>
	</div>
</body>
</body>
</html>
