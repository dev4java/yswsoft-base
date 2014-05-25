<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/inc/globalConfig.jsp" %>
<!DOCTYPE html>    
<html>
<%@include file="/WEB-INF/view/util/header.jsp" %>
<link href="${path}/css/common.css" type="text/css" rel="stylesheet">
<link type="text/css"  rel="stylesheet" href="${path }/css/librarian.css"/>
<script type="text/javascript" src="${path }/js/topBar.js"></script>
	
	<script>
	//detail
	function detail(obj){
		if(obj=="" || obj==null){
			return false;
		}
		window.location.href="/lms/books/detail?bookid="+obj;
	}
	
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
 				//--------------------------------------------------------------------------------
 				var pageSize = 5;//每页10条
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
 					submitForm(pageNo,flag);
 				};
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
	<%@include file="/WEB-INF/view/admin/util/menu.jsp"%>
	<!---topBar end->
	<!--content begin-->
	<div class="content-wrap">
		<div id="content" class="clearfix">
			<!--column_l begin-->
			<div class="column_l">
				<ul class="menu-list">
					<li><p>图刊管理</p></li>
					<li><a href="javascript:;">新书入库</a></li>
					<li><a  href="javascript:;">图刊修改</a></li>
					<li><a href="javascript:;">图刊查询</a></li>
					<li class="last"><a  class="current"  href="javascript:;">删除图刊</a></li>
				</ul>
			</div>
			<!--column_l end-->
			<!--column_r begin-->
			<div class="column_r column_r1">
				<!--图刊删除 begin-->
				<div class="revise-book">
					<div class="book-list">
						<div class="search-operate">
							<p class="detail-note">全部图刊信息</p>	
							<p class="revise-select clearfix">
								<span>图刊类型:</span>
								<span class="book-select">
									<select class="selector" >
										<option>请选择</option>
										<option id="book" value ="book">图刊</option>
										<option id="journal" value ="journal">期刊</option>
									</select>
								</span>
								<span class="item-select">
									<select>
										<option>请选择</option>
										<option value ="state">状态</option>
										<option value ="bookname">图刊编号</option>
										<option value ="title">图刊名称</option>
										<option value ="bookclass">分类号</option>
										<option value ="author">作者</option>
										<option value ="publister">出版社</option>
									</select>
								</span>
								<span>
									<input type="text" class="search-txt">
									<input type="submit" class="search-btn png-bg">
								</span>
							</p>
						</div>
						<ul class="book-all clearfix">
							<li class="book-title">
								<span class="state c-tit">状态</span>
								<span class="bookname c-tit">图刊编号</span>
								<span class="title c-tit">图刊名称</span>
								<span class="bookclass c-tit">分类号</span>
								<span class="author c-tit">作者</span>
								<span class="publister c-tit">出版社</span>
							</li>

							<c:forEach var="book" items="${books}" >
							<li class="book-item">
								<span class="state exist">
									<c:choose>
										<c:when test="${book.exist==0}">
											在馆
										</c:when>
										<c:otherwise>
											借出
										</c:otherwise>
									</c:choose>
								</span>
								<span class="bookname">${book.id}</span>
								<span class="title">${book.name}</span>
								<span class="bookclass">${book.typeNo}</span>
								<span class="author">${book.author}</span>
								<span class="publister">${book.press}</span>
								<span class="oper-link last">
									<a name="bkdetail" href="javascript:detail(${book.id});">详情</a>
								</span>
								<span class="oper-link last">
									<a name="feeds-remove" href="#" onclick="del(${book.id});">删除</a>
								</span>
							</li>
								</c:forEach>
							
						</ul>
					</div>
						<form action="<%= request.getContextPath()%>${_url}" id="jumpForm" name="jumpForm" method="post">
							<div class="page">
								${pageHtml }
								<input type="hidden" id="curNoid" value="${page.currentPageNo}" />
								<input type="hidden" id="totalid" value="${page.totalPageCount}" />
								<input type="hidden" id="did" value="" />
							</div>
							</form>

				</div>
				<!--图刊删除 end-->
			</div>
			<!--column_r end-->
		</div>
	</div>
	<!--content end-->
	<!--footer begin-->
	<%@include file="/WEB-INF/view/admin/util/foot.jsp" %>
	<%@include file="/WEB-INF/view/admin/util/topbar.jsp" %>
	<!--footer end-->
	detail
	
	<!--delete beigin-->
	<div id="remove-feeds" class="propt undis">
		<a href="javascript:;" class="propt-close png-bg"></a>
		<p class="propt-msg">图刊删除后无法恢复，您确定要删除吗？</p>
		<p class="propt-btn-wrap"><a href="javascript:;" class="btn btn1 propt-btn">确定</a><a href="javascript:;" class="btn btn2 propt-btn propt-cancel">取消</a></p>
	</div>
	<!--delete end-->
</div>	
</body>
</html>




