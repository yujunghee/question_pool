<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		<!-- 학교/연도/회차 선택 페이지 -->
		
		<a href="write.do"><input type="button" value="문제등록" style="width:500px;height:200px;"></a> <!-- 임시로 버튼만 만들어둠 -->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>