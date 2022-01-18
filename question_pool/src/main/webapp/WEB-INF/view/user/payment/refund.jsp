<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>Ladder Up 환불규정</h1>
		<p>안녕하세요 Ladder Up은 의 구매품목은 결제와 동시에 여러 기능을 사용할수 있음으로<br>
			환불 사유를 꼭 확인해 주시고<br>
			환불 여부는 관리자에 의해 결정됨을 알려드립니다.
		</p>
		<h3>동의하시면 환불요청을 진행해주세요.</h3>
		<form name="frm" id="frm" action="refundUpdate.do" method="post">
		<input type="hidden" id="user_no" name="user_no" value="${userInfo.user_no}">
		<select name="refund_reason">
		    <option value="1">실수로 잘못 결제함</option>
		    <option value="2">다른 사이트 이용</option>
		    <option value="3">금액이 너무 비쌈</option>
		    <option value="4">단순 변심</option>
		</select>
		<br>
		<br>
		<br>
		<br>
		<input class="submit" type="submit" value="환불 요청">
		</form>
</body>
</html>