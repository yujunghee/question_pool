<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<script>
	function chk(){
		return true;
	}
	function chk2(frm){
		frm.action='/question_pool/admin/question/index.do';
		frm.submit();
		return true;
	}
</script>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<!-- E N D :: headerArea-->
			<!-- 학교/연도/회차 선택 페이지 -->
			<form name="frm" id="frm" action="" enctype="multipart/form-data" style="text-align:center; padding:250px 0 0 0">
				<select name="school_no" id="school_no">
					<c:forEach var="vo" items="${list}">
						<option value="${vo.school_no}">${vo.school_name}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="전송">
			</form>
			<form name="frm" id="frm" action="" enctype="multipart/form-data" style="text-align:center;">
				<select name="year">
					<c:forEach var="qlist" items="${qlist}">
						<option value="${qlist.year }" value="${qlist.school_no}">${qlist.year}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="전송">
			</form>
			<form name="frm" id="frm" action="/question_pool/admin/question/write.do" onsubmit="return chk();" enctype="multipart/form-data"
							style="text-align:center;">
				<select name="exam_no">
					<c:forEach var="plist" items="${plist}">
						<option value="${plist.exam_no}">${plist.semester}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="문제등록" >
				<input type="button" value="문제목록" onclick="return chk2(this.form);">
			</form>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>