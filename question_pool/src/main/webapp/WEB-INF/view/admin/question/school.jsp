<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
	<form name="frm" id="frm" action="schoolinsert.do" method="post" enctype="multipart/form-data">
        <input type="text" name="school" value="학교">
        <input type="text" name="pwd" value="년도">
        <input type="text" name="when" value="회차">
        <input type="submit" value="등록">
    </form>
	<div class="footer">
		Copyrights (c) 2020 <a href="#" target="_blank">SAMPLE</a>. All Rights Reserved.  
	</div>
</body>
</html>
