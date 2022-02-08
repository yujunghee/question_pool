<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
  <link rel="stylesheet" href="/question_pool/css/user/userJoin/reset.css"/>
  <link rel="stylesheet" href="/question_pool/css/user/userJoin/common.css"/>
  <link rel="stylesheet" href="/question_pool/css/user/userJoin/contents.css"/>
<script>


</script>
<style>
</style>
</head>
<div>
		<c:if test="${!empty userInfo }">
			<li class="login"><a href="/question_pool/user/logout.do">로그아웃</a></li>
			<li class="mypage"><a href="javascript:;" onclick="clickMenu('main2', 'Mypage', '/user/mypage/index.do', false)" >마이페이지 (${userInfo.user_email})</a></li> 
		</c:if>		
	</div>	
</body>
</html>
