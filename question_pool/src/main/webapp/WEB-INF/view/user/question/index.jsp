<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	function conf(){
		//$('input:checkbox[name=example]').length;
		if(confirm('제출하시겠습니까?')){
			return true;
		}
	}
</script>
<script>
	$(function(){
	    //퀵메뉴
	    var quick_left = $(".con").position().left;
	    var quick_top = $(".con").position().top;
	    $(".quickMenu").css({
	        top:quick_top,
	        left:quick_left
	    });
	
	    //스크롤이벤트 좌표 변경
	    $(window).scroll(function(){
	        var newTop = $(window).scrollTop() + quick_top + "px";
	        //$(".quickMenu").css("top",newTop);
	        $(".quickMenu").stop().animate({
	            "top":newTop
	        },500);
	    });
	
	    //goTop을 클릭하면 맨위로 이동
	    $(".goTop").click(function(){
	        $("html").animate({scrollTop:0},300);
	    });
	
	});
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>[${school.school_name} ${exam.year}년도 ${exam.semester}학기] - 총 ${exam.number_of_questions}문항/${exam.exam_time}분</h2>
					<!--  
					<div class="quickMenu">
					     <div><img src="/question_pool/img/ico_file.png"></div>
					     <div><img src="/question_pool/img/ico_file.png"></div>
					     <div><img src="/project/img/quick_05.jpg" style="cursor:pointer;" class="goTop"></div>
					</div>
					-->
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
						<form method="post" name="frm" id="frm" action="insert.do?exam_no=${exam.exam_no}" enctype="multipart/form-data" onsubmit="conf();">
							<c:forEach var="qv" items="${qlist}" varStatus="status">
							<input type="hidden" value="${qv.question_no}">
								<p>${qv.passage }</p><br>
								
								<c:set var="string" value="${qv.question_content}"/>
								<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
								<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
								<h1 style="width:500px;">${status.count}. ${string2}</h1>
								
								<c:forEach var="ev" items="${qv.ex}" varStatus="status">
									<input type="checkbox" name="example" value="${ex[status.index]}">&nbsp;
										(${ev.example}) ${ev.example_content}<br>
								</c:forEach>
										
							<br><br>
							</c:forEach>
							
							<input type="submit" value="제출하기">
						</form>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->
</body>
</html>