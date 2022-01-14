<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<style>
.submit {
	border: 1x solid #ff0080; /*---테두리 정의---*/
	background-Color: #c0c0c0; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: #000000; /*--폰트 색깔---*/
	width: 130;
	height: 30; /*--버튼 크기---*/
}
</style>
<script>
	function conf(){
		if($('.example:checked').length != ${exam.number_of_questions}){
			alert('모든 답안을 체크해주세요.');
			return false;
		}else{
			if(confirm('제출하시겠습니까?')){
				return true;
			}else return false;
		}
	}
</script>
<script>
	$(function() {
		$(".example").click(function() {
			if ($(this).prop("checked")) {
				var idx = $(this).parent().find(".example").index(this);
				$(this).parent().find(".example").prop("checked",false);
				$(this).parent().find(".example").eq(idx).prop("checked",true);
			}
		})
	})
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
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
						<form method="post" name="frm" id="frm" action="insert.do?exam_no=${exam.exam_no}" enctype="multipart/form-data" onsubmit="return conf();">
							<c:forEach var="qv" items="${qlist}" varStatus="status">
							<input type="hidden" value="${qv.question_no}">
								<p>${qv.passage }</p><br>
								
								<c:set var="string" value="${qv.question_content}"/>
								<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
								<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
								
								<div class="chk" id="chk">
									<h1 style="width:500px;">${status.count}. ${string2}</h1>
								
									<c:forEach var="ev" items="${qv.ex}" varStatus="status">
									<input type="checkbox" class="example" name="example" value="${ex[status.index]}">&nbsp;
										(${ev.example}) ${ev.example_content}<br>
									</c:forEach>
								</div>
							<br><br>
							</c:forEach>
							
							<input type="submit" class="submit" value="채점하기">
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