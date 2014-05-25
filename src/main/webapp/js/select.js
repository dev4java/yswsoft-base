document.write("<script language='javascript' src='${path}/js/common.js'></script>");
var id;
&function(){
	if($(this).attr("id") == "book"){
				$(".Bnumber").removeClass("undis");
				$(".Bauthor").removeClass("undis");
				$(".Bname").removeClass("undis");
				$(".Bprice").removeClass("undis");
				$(".number").removeClass("undis");
				
			}else{
				$(".Bnumber").addClass("undis");
				$(".Bauthor").addClass("undis");
				$(".Bname").addClass("undis");
				$(".Bprice").addClass("undis");
				$(".number").addClass("undis");
				
			}



};