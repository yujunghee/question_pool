<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="userUtil.*" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=userUtil.Property.title %></title>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

$(function(){
	$('#wrap').ready(function(){
		if('${userInfo.user_grade}'== 2){
			alert('사용기간이 만료되었습니다. 다시 결제후 이용해주세요')
		}
	})
})

function directionTop() {
	$('html, body').animate({scrollTop: 0 }, 'slow');
}
var tabWidth = 120;		// 탭넓이

// iframe height 자동 조절
function calcHeight(id){
	//find the height of the internal page
	
	var the_height=
	document.getElementById(id).contentWindow.
	document.body.scrollHeight;
	
	//change the height of the iframe
	document.getElementById(id).height=
	the_height+100;
	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById(id).style.overflow = "hidden";
}

//iframe height 자동 조절(수동)
function calcHeightManual(id, m_height){
	
	//change the height of the iframe
	document.getElementById(id).height=m_height;
	
	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById(id).style.overflow = "hidden";
}

//iframe height 자동 조절(Row추가)
function calcHeightAddRow(id){
	
	var the_height=
	document.getElementById(id).contentWindow.
	document.body.scrollHeight;
	
	//change the height of the iframe
	document.getElementById(id).height=
	the_height+100;
	
	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById(id).style.overflow = "hidden";
}


$(document).ready(function(){
    $(".gnb_menu").click(function(){
    	//alert($(this).next(".gnb_submenu").css("display"));
    	if ($(this).next(".gnb_submenu").css("display") == "none") {
    		$(".gnb_submenu").slideUp();
    	}
    	$(this).addClass("imgActive");
        $(this).next(".gnb_submenu").slideToggle();
    });
    
    clickMenu('main1', 'Main', '/user/main/index.do', true);
    
    $("#pass").bind("keydown", function(e) {
		if (e.keyCode == 13) { // enter key
			login();
			return false
		}
	});
    
});

// 즐겨찾기 메뉴 toggle
function favoriteToggle() {
	$('#favoriteList').slideToggle();
}

// 메뉴클릭 tab+iframe 추가
function clickMenu(id, title, url, reload) {
	url = '<%=userUtil.Property.contextPath%>'+url;
	var nl = "";
	if (title.indexOf("<br>") < 0) {
		nl = "class=\"line1\"";
	}
	if ($("#"+id+"_tab").length == 0) {
		$(".tab > ul:last").append("<li style='width:"+tabWidth+"px;' id=\""+id+"_tab\" onclick=\"activeTab('"+id+"');\" "+nl+">"+title+"<span><img id=\""+id+"_closeImg\" src=\"/img/tab_close_on.png\" onclick=\"delTab(event,'"+id+"')\"/></span></li>");
		$(".contents:last").append("<iframe src="+url+" id=\""+id+"_ifrm\" onload=\"calcHeight('"+id+"_ifrm');\" name=\"WrittenPublic\" title=\"\" frameborder=\"0\" scrolling=\"yes\" style=\"overflow-x:hidden; width:100%; min-height:500px; \"></iframe>");
	} else {
		if (reload) $("#"+id+"_ifrm").attr("src",url);
	}
	
	activeTab(id);
}

// tab+iframe 삭제
function delTab(e, id) {
	e.stopPropagation();
	var isCurTab = $("#"+id+"_tab").hasClass("on");	// 삭제한탭이 현재활성화된 탭인지여부 확인
	var idx = $("#"+id+"_tab").index();
	$("#"+id+"_tab").remove();	// tab 삭제
	$("#"+id+"_ifrm").remove();	// iframe 삭제
	
	$(".tab > ul").css("width",($(".tab > ul > li").length*tabWidth)+"px");
	
	// 현재탭이 한개이상 존재하고, 해당id탭이 현재활성화된탭인 경우 마지막탭 활성화
	if ($(".tab > ul > li").length >= 1 && isCurTab) {
		//var tId = $(".tab > ul > li:last").attr("id");
		var tId = "";
		if (idx == 0) {
			tId = $(".tab > ul > li").eq(0).attr("id");
		} else {
			tId = $(".tab > ul > li").eq(idx-1).attr("id");
		}
		tId = tId.substr(0, tId.indexOf("_"));
		activeTab(tId);
	} 
}

//tab+iframe 삭제 자식 iframe에서 호출될때 사용
function delTabForChild(id) {
	var isCurTab = $("#"+id+"_tab").hasClass("on");	// 삭제한탭이 현재활성화된 탭인지여부 확인
	var idx = $("#"+id+"_tab").index();
	$("#"+id+"_tab").remove();	// tab 삭제
	$("#"+id+"_ifrm").remove();	// iframe 삭제
	
	$(".tab > ul").css("width",($(".tab > ul > li").length*tabWidth)+"px");
	
	// 현재탭이 한개이상 존재하고, 해당id탭이 현재활성화된탭인 경우 마지막탭 활성화
	if ($(".tab > ul > li").length >= 1 && isCurTab) {
		//var tId = $(".tab > ul > li:last").attr("id");
		var tId = "";
		if (idx == 0) {
			tId = $(".tab > ul > li").eq(0).attr("id");
		} else {
			tId = $(".tab > ul > li").eq(idx-1).attr("id");
		}
		tId = tId.substr(0, tId.indexOf("_"));
		activeTab(tId);
	} 
}

//현재탭 삭제
function delTabCur() {
	var curTabIdx;	// 현재활성화된 탭
	$(".tab > ul > li").each(function(idx, item) {
		if ($(".tab > ul > li").eq(idx).hasClass("on")) {
			curTabIdx = idx;
		}
	});
	
	var curTabId = $(".tab > ul > li").eq(curTabIdx).attr("id");
	curTabId = curTabId.substr(0, curTabId.indexOf("_"));
	delTabForChild(curTabId);
	
}

// tab 활성화(iframe 노출)
function activeTab(id) {
	$(".tab > ul > li").removeClass("on");
	$(".tab > ul > li > span > img").attr("src", "<%=userUtil.Property.contextPath%>/img/tab_close_off.png");	// tab close img 전체 off
	$(".contents > iframe").hide();
	
	$("#"+id+"_tab").addClass("on");							// tab 활성화
	$("#"+id+"_closeImg").attr("src", "<%=userUtil.Property.contextPath%>/img/tab_close_on.png");	// tab close img on
	$("#"+id+"_ifrm").show();									// iframe 노출

	$(".gnb_menu").removeClass("on");
	$(".gnb_submenu ul > li").removeClass("on");
	$("#"+id.substr(0, id.length-1)).addClass("on");	// 대메뉴 활성화
	$("#"+id+"_submenu").addClass("on");				// 소메뉴 활성화
	
	// ul 넓이를 탭갯수만큼 넓힘(좁으면 2줄로 떨어지는 문제)
	$(".tab > ul").css("width",($(".tab > ul > li").length*tabWidth)+"px");
	tabWidthCon();	// 탭영역 조절
}

// left메뉴 노출/미노출
function menuToggle() {
	var obj = $("#menuWrap").offset();
	var time = 0;	// 효과동작에 문제가 있어 0으로 고정
	if (obj.left == 0) {
		$("#menuWrap").animate({"margin-left":"-220"}, time);
		$("#contentsWrap").animate({"width":1200},time);
		$(".tabWrap").animate({"width":1200},time);
		$(".tab").animate({"width":1120},time);
	} else {
		$("#menuWrap").animate({"margin-left":"0"}, time);		
		$("#contentsWrap").animate({"width":980},time);
		$(".tabWrap").animate({"width":980},time);
		$(".tab").animate({"width":900},time);
	}
}

// 이전탭 활성화
function goPrevTab() {
	var tabLength = $(".tab > ul > li").length;
	
	if (tabLength > 1) {
		var curTabIdx;	// 현재활성화된 탭
		$(".tab > ul > li").each(function(idx, item) {
			if ($(".tab > ul > li").eq(idx).hasClass("on")) {
				curTabIdx = idx;
			}
		});
		var prevTabIdx = 0;
		if (curTabIdx == 0) {
			prevTabIdx = tabLength-1;	// 첫번째탭이라면 마지막탭idx로 설정
		} else {
			prevTabIdx = curTabIdx-1;
		}
		
		// 이전탭 id구해서 활성화
		var tabId = $(".tab > ul > li").eq(prevTabIdx).attr("id");
		tabId = tabId = tabId.substr(0, tabId.indexOf("_"));
		activeTab(tabId);
	}
}

// 다음탭 활성화
function goNextTab() {
	var tabLength = $(".tab > ul > li").length;
	
	if (tabLength > 1) {
		var curTabIdx;	// 현재활성화된 탭
		$(".tab > ul > li").each(function(idx, item) {
			if ($(".tab > ul > li").eq(idx).hasClass("on")) {
				curTabIdx = idx;
			}
		});
		var nextTabIdx = 0;
		if (curTabIdx == tabLength-1) {
			nextTabIdx = 0;	// 마지막탭이라면 첫번째탭idx로 설정
		} else {
			nextTabIdx = curTabIdx+1;
		}
		
		// 다음탭id구해서 활성화
		var tabId = $(".tab > ul > li").eq(nextTabIdx).attr("id");
		tabId = tabId = tabId.substr(0, tabId.indexOf("_"));
		activeTab(tabId);
	}
}

// 영역밖으로 벗어난 탭을 현재 화면에 맞추어 이동
function tabWidthCon() {
	var tLength = $(".tab").width();						// 전체영역 넓이
	var tabLength = $(".tab > ul > li").length*tabWidth;	// 실제탭영역 넓이
	
	//if (tabLength > tLength) {	// 실제탭영역이 전체영역보다 클경우
		var curTabIdx;	// 현재활성화된 탭
		$(".tab > ul > li").each(function(idx, item) {
			if ($(".tab > ul > li").eq(idx).hasClass("on")) {
				curTabIdx = idx;
			}
		});
		
		var obj1 = $(".tab").offset();			// 전체영역
		var obj2 = $(".tab > ul").offset();		// 실제탭영역
		var direction = "";
		var moveVal = 0;
		var curPosition = (curTabIdx*tabWidth)+parseInt(tabWidth)+parseInt(obj2.left);
		var curLeft = parseInt(obj2.left);
		
		// 현재탭*탭넓이 + 실제탭left < 전체탭left
		if ((curPosition-tabWidth) < obj1.left) {
			if (curTabIdx == 0) {
				moveVal = obj1.left;
			} else {
				moveVal = (curPosition - tabWidth);
			}
			$(".tab > ul").offset({left:moveVal});
		}
		if (curPosition > (obj1.left+tLength)) {
			moveVal = parseFloat(obj2.left) - (curPosition - (obj1.left+tLength));
			$(".tab > ul").offset({left:moveVal});
		}
		
	//}
}

function test() {
	$("#myinfo1_submenu").trigger("click");
	$("#myinfo2_submenu").trigger("click");
	$("#myinfo3_submenu").trigger("click");
	$("#myinfo4_submenu").trigger("click");
	$("#myinfo5_submenu").trigger("click");
	$("#export1_submenu").trigger("click");
	$("#export2_submenu").trigger("click");
	$("#export3_submenu").trigger("click");
	$("#export4_submenu").trigger("click");
	$("#export5_submenu").trigger("click");
}
</script>
<style>
.sns_area {
	margin-left: 20px;
}
.sns_area a {
	margin-left: 5px;
}	
</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<div id = "imgdiv"><a href="/question_pool/user/index.do"><img src="../img/user/mainLogo.png" height="4%" width="4%" style="margin-left: 20px; margin-right: auto; display: block;"></a></div>
		<h1 style="margin-left: 80px; margin-right: auto;"><a href="<%=userUtil.Property.contextPath%>/user/index.do">Ladder Up</a><a href="javascript:;" onclick="test()">&nbsp;&nbsp;&nbsp;</a></h1>
		<ul class="topmenu">
			<c:if test="${empty userInfo }">
			<li class="login" style="font-weight: bold;"><a href="/question_pool/user/login.do">로그인</a></li>
			<li class="signup" style="font-weight: bold;"><a href="/question_pool/user/join.do">회원가입</a></li>
			</c:if>
			<c:if test="${!empty userInfo }">
			<li class="login"><a href="/question_pool/user/logout.do">로그아웃</a></li>
			<li class="mypage"><a href="javascript:;" onclick="clickMenu('main2', 'Mypage', '/user/mypage/index.do', false)" >마이페이지 (${userInfo.user_email})</a></li> 
			</c:if>			
			
	
			
		</ul>
	</div>
	<!--//header-->
	<div id="container">
		<div id="menuWrap">
			<div class="allmenu">전체메뉴
				<div class="allmenu_con">
					<dl style="width:13.666%;">
						<dt><a href="javascript:;">문제풀기</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('front1', '문제풀기', '/user/question/pool.do', false)">문제풀기</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('front2', '랜덤 모의고사', '/user/question/random.do', false)">랜덤 모의고사</a></dd>
					</dl>
					<dl style="width:13.666%;">
						<dt><a href="javascript:;">결제</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('project1', '상품보기', '/user/payment/pay.do', false)">상품보기</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('project2', '환불요청', '/user/payment/refund.do', false)">환불요청</a></dd>
					</dl>
					<dl style="width:14.666%;">
						<dt><a href="javascript:;">추가학습</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('back1', '오답노트', '/user/question/note.do', false)">오답노트</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('back2', '단어장', '/user/question/study/word.do?user_no=${userInfo.user_no}">단어장</a></dd>
					</dl>
					<dl style="width:15.666%;">
						<dt><a href="javascript:;">커뮤니티</a></dt>
						<dd class="frist"><a href="javascript:;" onclick="clickMenu('portfolio1', '공지사항', '/user/board/notice/notice.do', false)">공지사항</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('portfolio2', '시험일정', '/user/board/testdate/testdate.do', false)">시험일정</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('portfolio3', 'Q&A', '/user/board/qa/qa.do', false)">Q&A</a></dd>
						<dd><a href="javascript:;" onclick="clickMenu('portfolio4', 'FAQ', '/user/board/faq/faq.do', false)">FAQ</a></dd>
						<dd class="last"><a href="javascript:;" onclick="clickMenu('portfolio5', '자유게시판', '/user/board/community/community.do', false)">자유게시판</a></dd>
					</dl>
				</div>
			</div>
			<div class="gnb">
				<dl>
					<dt id="main" class="gnb_menu">Main</dt>
					<dd class="gnb_submenu">
						<ul>
							<li id="main1_submenu" onclick="clickMenu('main1', '메인', '/main/index.do', false)">Main</li>
						</ul>
					</dd>
					<dt id="front" class="gnb_menu">문제풀기</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="front1_submenu" onclick="clickMenu('front1', '문제풀기', '/user/question/pool.do', false)">문제풀기</li>
							<li id="front2_submenu" onclick="clickMenu('front2', '랜덤 모의고사', '/user/question/random.do', false)">랜덤 모의고사</li>
						</ul>
					</dd>
					<dt id="project" class="gnb_menu">결제</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="project1_submenu" onclick="clickMenu('project1', '상품보기', '/user/payment/pay.do', false)">상품보기</li>
							<li id="project2_submenu" onclick="clickMenu('project2', '환불요청', '/user/payment/refund.do', false)">환불요청</li>
						</ul>
					</dd>
					<dt id="back" class="gnb_menu">추가학습</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="back1_submenu" onclick="clickMenu('back1', '오답노트', '/user/question/note.do', false)">오답노트</li>
							<li id="back2_submenu" onclick="clickMenu('back2', '단어장', '/user/question/study/word.do?user_no=${userInfo.user_no}', false)">단어장</li>
						</ul>
					</dd>
					<dt id="portfolio" class="gnb_menu">커뮤니티</dt>
					<dd class="gnb_submenu">
						<ul>	
							<li id="portfolio1_submenu" onclick="clickMenu('portfolio1', '공지사항', '/user/board/notice/notice.do', false)">공지사항</li>
							<li id="portfolio2_submenu" onclick="clickMenu('portfolio2', '시험일정', '/user/board/testdate/testdate.do', false)">시험일정</li>
							<li id="portfolio3_submenu" onclick="clickMenu('portfolio3', 'Q&A', '/user/board/qa/qa.do', false)">Q&A</li>
							<li id="portfolio4_submenu" onclick="clickMenu('portfolio4', 'FAQ', '/user/board/faq/faq.do', false)">FAQ</li>
							<li id="portfolio5_submenu" onclick="clickMenu('portfolio5', '자유게시판', '/user/board/community/community.do', false)">자유게시판</li>
						</ul>
					</dd>
				</dl>
			</div>
			<div class="menuclose" onclick="menuToggle();"><img src="<%=userUtil.Property.contextPath%>/img/menu_close.png" /></div>
			<div class="copy">
				<p>(주)LadderCompany</p>
	            <p>서울특별시 종로구 삼일대로17길 51 스타골드빌딩 3층,4층,5층</p>
	            <p>02-738-5001 | 02-738-5001</p>
	            <p>대표자 김깐부</p>
	            <p>사업자번호 111-86-22222</p> 
			</div>
			<div class="sns_area">
                <a href=""><img src="/question_pool/img/facebook.png"></a>
                <a href=""><img src="/question_pool/img/twitter.png"></a>
                <a href=""><img src="/question_pool/img/youtube.png"></a>
            </div>
		</div>
		<!--//menuWrap-->
		<div id="contentsWrap">
			<div class="tabWrap">
				<div class="tab"> <!--  style="overflow:scroll;" -->
					<ul style="overflow:hidden;width:1500px;">
					</ul>
				</div>
				<div class="tabNavi">
					<ul>
						<li><img src="<%=userUtil.Property.contextPath%>/img/tab_prev.png" onclick="goPrevTab();"/></li>
						<li><img src="<%=userUtil.Property.contextPath%>/img/tab_next.png" onclick="goNextTab();"/></li>
					</ul>
				</div>
			</div>
			<!--//tab-->
			<div class="contents">
			</div>
		</div>
		<!--//contentsWrap-->
	</div>
	<div class="btnTop">
		<a href="#"><img src="<%=userUtil.Property.contextPath%>/img/btn_top.png" alt="맨위로" /></a>
	</div>
	<!--//container-->
</div>
</body>
</html>
