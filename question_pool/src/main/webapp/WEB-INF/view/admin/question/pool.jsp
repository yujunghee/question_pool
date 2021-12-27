<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<script>
</script>
</head>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<!-- E N D :: headerArea-->
			<!-- 학교/연도/회차 선택 페이지 -->
			<form name="frm" id="frm" action="" enctype="multipart/form-data">
			<input type="hidden" name="school_no" value="${qlist.school_no }">
				<select name="school_no">
					<c:forEach var="vo" items="${list}">
						<option value="${vo.school_no}">${vo.school_name}</option>
					</c:forEach>
				</select> 
				<select name="year">
					<c:forEach var="vo" items="${qlist}">
						<option value="${vo.year}">${vo.year}</option>
					</c:forEach>
				</select> 
				<a class="btn" href="javascript:goSave();">저장</a>
			</form>
			<!-- 임시로 버튼만 만들어둠 -->
			<a href="edit.do"><input type="button" value="문제수정"
				style="width: 60px; height: 40px;"></a>
			<!-- 임시로 버튼만 만들어둠 -->
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>