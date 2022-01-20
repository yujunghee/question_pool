<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<style>
.list{
	font-size:20px;
	font-weight: bold;
}
li{
	padding:10px;
}
</style>
<body> 
<div id="wrap">
	<div id="canvas">
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>내가 푼 문제 조회하기</h2>
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<div class="con">
					<ul class="list">
						<c:forEach var="ev" items="${elist}">
							<a href="/question_pool/user/question/score.do?exam_no=${ev.exam_no}">
							<li><img src="/question_pool/img/user/pencil.png" width="30px;">${ev.school_name} ${ev.year}년도 ${ev.semester}학기</li>
							</a>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>