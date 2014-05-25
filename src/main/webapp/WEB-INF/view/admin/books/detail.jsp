<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/inc/globalConfig.jsp"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/view/util/header.jsp"%>
<link type="text/css"  rel="stylesheet" href="theme/css/librarian.css"/>
<script type="text/javascript" src="${path }/js/jquery.min.js"></script>
<script type="text/javascript" src="${path }/js/topBar.js"></script>
<script type="text/javascript" src="${path }/js/select.js"></script>

<script>
	jQuery(document).ready(function() {
		$("#saveid").click("click", function(e) {
			var lid = $("#lid").val();
			var name = $("#nameid").val();
			var price = $("#priceid").val();
			var detail = $("#detailid").val();
			var typeno = $("#typeid").val();
			var author = $("#authorid").val();
			var press = $("#pressid").val();
			var duplicate = $("#duplicateid").val();
			alert(name+"--"+price+"--"+detail+"--"+typeno+"--"+author+"--"+press+"--"+duplicate);
			//判断空 
			$.ajax({
				type : "POST",
				url : "/lms/books/mod",
				cache : false, //将不会从浏览器缓存中加载请求信息。 
				data : {
					'type':1,
					'name' : name,
					'price' : price,
					'detail' : detail,
					'typeno' : typeno,
					'author' : author,
					'press' : press,
					'duplicate' : duplicate
				},
				dataType : 'json',
				success : function(data, statusText) {
					if (data.status == 0) {
						alert("修改成功");
						window.location.href = "/lms/books/index";
					} else {
						alert("修改失败");
						window.location.href = "/lms/books/index";
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("系统异常!");
				}
			});

		});
	});

	document.onkeyup = function(e) { //onkeyup是javascript的一个事件、当按下某个键弹起 var _key;                                                 //的时触发  
		if (e == null) { // ie  
			_key = event.keyCode;
		} else { // firefox              //获取你按下键的keyCode  
			_key = e.which; //每个键的keyCode是不一样的  
		}

		if (_key == 13) { //判断keyCode是否是13，也就是回车键(回车的keyCode是13)  
			//if (validator(document.loginform)){ //这个因该是调用了一个验证函数  
			$(".login-input").blur();
			document.getElementById('loginBtn').click(); //验证成功触发一个Id为btnLogin的  
			//}                                                                        //按钮的click事件，达到提交表单的目的  
		}
	};
</script>
<body>
	<div class="wrap">
		<!--header begin-->
		<div id="header">
			<div class="logo">
				<a href="javascript:void(0);" class="png-bg"></a>
			</div>
		</div>
		<!--header end-->
		<!---topBar begin-->
		<%@include file="/WEB-INF/view/admin/util/menu.jsp"%>
		<!---topBar end->
	<!--content begin-->
		<div class="content-wrap">
			<div id="content" class="clearfix">
				<!--column_l begin-->
				<%@include file="/WEB-INF/view/admin/books/book_menu.jsp"%>
				<!--column_l end-->
				<!--column_r begin-->
				<div class="column_r column_r1">
					<!--图书修改 begin-->
					<!--book-detail beigin-->
	<div id="bkdetail-prot" class="propt ">
		<a href="javascript:;" class="propt-close png-bg"></a>
		<p class="propt-msg1 bkdetail-propt-msg">图刊详情</p>
		<div class="propt-bkdetail">
			<form>
				<ul>
					<li class="clearfix">
						<span class="bkdetail-input-tit">&nbsp;&nbsp;&nbsp;&nbsp;状态：</span>
						<span class="bkdetail-input-txt">
							<label>
								<c:choose>
										<c:when test="${book.exist==0}">
											在馆
										</c:when>
										<c:otherwise>
											借出
										</c:otherwise>
									</c:choose>
							</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">图刊编号：</span>
						<span class="bkdetail-input-txt">
							<label>000003</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">图刊名称：</span>
						<span class="bkdetail-input-txt">
							<label>${book.name}</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">&nbsp;&nbsp;分类号：</span>
						<span class="bkdetail-input-txt">
							<label>${book.typeNo}</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">&nbsp;&nbsp;&nbsp;&nbsp;作者：</span>
						<span class="bkdetail-input-txt">
							<label>${book.author}</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">&nbsp;&nbsp;出版社：</span>
						<span class="bkdetail-input-txt">
							<label>${book.press}</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">&nbsp;&nbsp;&nbsp;&nbsp;定价：</span>
						<span class="bkdetail-input-txt">
							<label>${book.price}</label>
						</span>
					</li>
					<li class="clearfix">
						<span class="bkdetail-input-tit">&nbsp;&nbsp;&nbsp;&nbsp;备注：</span>
						<span class="bkdetail-input-txt">
							<label>${book.detail}</label>
						</span>
					</li>
				</ul>
			</form>
		</div>
		<p class="propt-bkdetail-btn"><a href="javascript:;" id="addLink" class="btn btn1 propt-btn1">确定</a><a href="javascript:;" class="c-click cancel-link propt-cancel">取消</a></p>
	</div>
	<!--book-detail end-->
					<!--图书修改 end-->
				</div>
				<!--column_r end-->
			</div>
		</div>
		<!--content end-->
		<!--footer begin-->
		<%@include file="/WEB-INF/view/admin/util/foot.jsp"%>
		<!--footer end-->
		<!--topBar tips begin-->
		<%@include file="/WEB-INF/view/admin/util/topbar.jsp"%>
		<!--topBar tips end-->
	</div>
</body>
</html>

