<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<style>
.submit {
	border: 0.5px solid #ff0080; /*---테두리 정의---*/
	background-Color: #AB9D9D; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: #000000; /*--폰트 색깔---*/
	width: 130;
	height: 30; /*--버튼 크기---*/
}
h2 {
  position: relative;
  padding: 1rem 0.5rem;
  font-size: 50px;
}
h2::after {
  position: absolute;
  bottom: 0px;
  left: 0px;
  content: '';
  width: 100%;
  height: 6px;
  border-radius: 3px;
  background-image: -webkit-linear-gradient(right, #00b0ff 0%, #00e676 100%);
  background-image: linear-gradient(to left, #00b0ff 0%, #00e676 100%);
}
</style>
</head>
<body>
	<div id="wrap">
		<h2> 랜덤모의고사 풀기 </h2>
		<!-- canvas -->
		<div id="canvas">
			<!-- 학교/연도/회차 선택 페이지 -->
			<form action="randomIndex.do" enctype="multipart/form-data"
				style="text-align: center;">
				<div style="text-align: center; padding: 100px 0 0 0;'">
					<h4 style="font-size: 20px;">학교선택</h4>
					<select name="school_no" id="school_no"
						style="width: 100px; height: 30px;">
						<c:forEach var="vo" items="${list}">
							<option value="${vo.school_no}">${vo.school_name}</option>
						</c:forEach>
					</select>
				</div>
				<br/>
				<br/>
				<br/>
						<input type="submit" value="랜덤모의고사 시작" class="submit">
			</form>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>