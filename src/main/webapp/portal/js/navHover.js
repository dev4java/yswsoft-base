$(function(){
	$(function(){
		var browser = 0;
		if(window.XMLHttpRequest){//Mozilla, Safari,IE7
			if(!window.ActiveXObject){// Mozilla,Safari,
				broeser = 1;
			}else{
				broeser = 1;
			}
		}else{
			broeser = 0;
		}
		$('.nav-list .item').hover(function(){
			if(broeser == 1){
				$(this).addClass('item-active current').children('.nav-list').slideDown(200).show();
			}else{
				$(this).addClass('item-active current').children('.nav-list').show();
			}
		},
		function(){
			if(broeser == 1){
				$(this).removeClass('item-active current').children('.nav-list').slideUp(100).hide();
			}else{
				$(this).removeClass('item-active current').children('.nav-list').hide();
			}
			
		});
	});
});