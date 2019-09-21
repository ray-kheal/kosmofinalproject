/*
Author: Branding, Development & UX Lab
Author URI: http://www.showgle.co.kr
Description: javascript, jquery
Version: 1.0.0
*/
$(function(){
	selectChange();
	sgTab();
	listDel();
	chkAll();

	floatBanner.init();
});

$(window).load(function(){
	/* 메인 슬라이더 */
	if($('.mainSlider').length > 0){
		if($('.mainSlider li').length >1){
			$('.mainSlider').bxSlider({
				controls:false,
				auto:true
			});
		}
	}
	if($('.main_theme_slider').length > 0){
		if($('.main_theme_slider li').length >1){
			var themeSlider =$('.main_theme_slider').bxSlider({
				controls:true,
				auto:true,
				autoHover:true,
				onSlideBefore:function(){
					themeSlider.stopAuto();
					themeSlider.startAuto();
					var idx = themeSlider.getCurrentSlide();
					var tit = $(".theme_title");
					tit.find("li.on").removeClass("on");
					tit.find("li:eq("+idx+")").addClass("on");
				}
			});
		}
	}
	if($('#mainSketch .sketchList').length > 0){
		if($('.sketchList li').length >1){
			$('.sketchList').bxSlider({
				controls:true,
				pager:false,
				auto:false,
				slideWidth: 171,
				minSlides:5,
				maxSlides:5,
				moveSlides:1,
				slideMargin:26,
			})
		}
	}
	// if($('#sgTvList').length > 0){
	// 	if($('#sgTvList li').length >1){
	// 		$('#sgTvList ul').bxSlider({
	// 			controls:false,
	// 			auto:true
	// 		})
	// 	}
	// }
	if($('#reqCrtList').length > 0){
		if($('#reqCrtList>li').length >1){
			$('#reqCrtList').bxSlider({
				controls:false,
				auto:true,
				autoHover:true,
				pager:false,
				slideWidth: 284,
				minSlides:2,
				maxSlides:2,
				moveSlides:1,
				slideMargin:2
			})
		}
	}
})

/* 리스트 삭제 버튼 활성화(li태그 삭제버튼) */
function listDel(){
	var listnum = false;
	$(".btn_listDel").on("click",function(){
		if(event.preventDefault) event.preventDefault();
		if($(this).closest("li").hasClass("addnumlist")) listnum=true;
		$(this).closest("li").detach();
		if(listnum) v_count_get();
	})
}
/* 전체 선택 */
function chkAll(){
	$(".chkAll").on("change",function(){
		var chk = false;
		$(this).is(":checked") ? chk = true : chk = false;
		if(chk){
			$(".chkList").prop("checked",true);
		}else{
			$(".chkList").prop("checked",false);
		}
	})
}

function selectChange(){
	$("#showWrap").on('change', 'select.selectBox', function(event) {
		event.preventDefault();
		/* Act on the event */
		var select_name = $(this).children("option:selected").text();
        $(this).closest(".select_box").find("label").text(select_name);
	});
}

// quick_request toggle button
function quickReq(){
	var _t = $("#quickRequest");
	_t.hasClass("on") ? _t.removeClass("on") :_t.addClass("on");
}

// page balckmask
function bgmask(opt){
	if(opt=='close'){
		$("#bgmask").detach();
	}else{
		var bg = "<div id='bgmask'></div>"
		$("#showWrap").append(bg);
	}
	
}

var layPop = {
    open:function(obj){
        $(".layPop"+"."+obj).show();
        $("#popBg").show();
    },
    close:function(obj){
        $(".layPop"+"."+obj).hide();
        $("#popBg").hide();
    }
}
       
function sgTab(){
	$("#tab li a").on("click",function(){
		if($(this).attr("href")=="#"){
			if(event.preventDefault) event.preventDefault();
			if(!$(this).parent().hasClass("on")){
				$("#tab li.on").removeClass("on");
				$("#tab").parent().find(".innerCont.on").removeClass("on");
				$(this).parent().addClass("on");
				var idx = $(this).parent().index();
				$("#tab").parent().find(".innerCont:eq("+idx+")").addClass("on");
			}
		}else{
			location.href=$(this).attr("href");
		}
	})
}


function scrollTo(obj){
	var _t = $("#"+obj).offset().top;
	  $('html, body').animate({scrollTop : _t}, 0);
}

var top_banner = $(".showgle_top_banner");
var floatBanner = {
	init:function(){
		if(top_banner.hasClass("on")){
			var float_top = 163+top_banner.height();
			$('#floating').css({'top':float_top})
		}
		var _h = $(window).height();
		var _ch = $("#flaotCont").height();
		if(_h > _ch){
			$("#flaotCont").css({'height':_h})
		}
		$(".btnWrap a.btn_open").click(function(){
			if(event.preventDefault) event.preventDefault();
			floatBanner.open();
			
		})
		$(".btnWrap a.btn_close").click(function(){
			if(event.preventDefault) event.preventDefault();
			floatBanner.close();
		})
		$("#btnTop").click(function(){
			$('html, body').animate({scrollTop : 0}, 0);
		})
	},
	close:function(){
		$('#floating').css({'right':-130})
	},
	open:function(){
		$('#floating').css({'right':0})
	}
}

$(window).scroll(function(){

	floatTop = $(window).scrollTop();
	if(floatTop<10){
		floatTop=163;
		if(top_banner.hasClass("on")){
			floatTop = floatTop + top_banner.height();
		}
	}else{
		floatTop=0;
	}
	
	$('#floating').css({'top':floatTop})
})




	

