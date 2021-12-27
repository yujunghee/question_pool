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
	<tbody>
		<c:forEach var="qvlist" items="${qvlist}">
			<tr>
				<td><label><input type="radio" name="year"
						value="${qvlist.year}"> ${qvlist.year}</label></td>
			</tr>
		</c:forEach>
	</tbody>
</body>
</html>