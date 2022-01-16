<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="/question_pool/user/question/index.do">
	<h4 style="font-size: 20px;">시험들</h4>
		<c:forEach var="plist" items="${dList}">
	<label><input type="radio" name="exam_no" value="${plist.exam_no}">${plist.school_name}의${plist.year}년도의${plist.semester}학기 시험</label>
		</c:forEach>
		<br/>
		<input type="submit" value="시험시작" >
		</form>
	
</body>
</html>