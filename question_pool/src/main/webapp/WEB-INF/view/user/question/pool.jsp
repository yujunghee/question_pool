<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<style>
.submit {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#c0c0c0;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:#000000;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
</style>
<script>
	function chk(frm){
		frm.action='/question_pool/user/question/index.do';
		frm.submit();
		return true;
	}
</script>
</head>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<!-- E N D :: headerArea-->
			<!-- 학교/연도/회차 선택 페이지 -->
			<form name="frm" id="frm" action="index.do?exam_no=${vo.exam_no}" enctype="multipart/form-data" style="text-align:center; padding:100px 0 0 0;'">
			<h4 style="font-size:20px;">학교선택</h4>
				<c:forEach var="vo" items="${list}">
                                <label><input type="radio" name="school_no" value="${vo.school_no}">
                                 ${vo.school_name}</label>
                </c:forEach>
			<br/>
			<br/>
			<br/>
			<h4 style="font-size:20px;">년도선택</h4>
                <label><input type="radio" name="year" value="2000">2000</label>
                <label><input type="radio" name="year" value="2001">2001</label>
                <label><input type="radio" name="year" value="2002">2002</label>
                <label><input type="radio" name="year" value="2003">2003</label>
			<br/>
			<br/>
			<br/>
			<h4 style="font-size:20px;">학기선택</h4>
				<label><input type="radio" name="semester" value="1">1</label>
				<label><input type="radio" name="semester" value="2">2</label>
			<br/>
			<br/>
			<br/>
			<input type="submit" value="검색" class="submit">
			</form>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>