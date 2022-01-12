<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
<script>
  function cancelPay() {
    jQuery.ajax({
      "url": "{환불요청을 받을 서비스 URL}", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "{결제건의 주문번호}", // 예: ORD20180131-0000011
        "cancel_request_amount": 100, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
      }),
      "dataType": "json"
    });
  }
</script>
<style>
      *{
          margin: 0 auto;
          padding: 0;
          box-sizing: border-box;
        }
      .container{
      width: 1500px;
      higth:100%;	
      text-align: center;
      margin: 0 auto;
      padding: 100px 0px 0px 0px;
      border: 0ch ;
      }
      .pay>ul>li>ul>li{
        float: left;
        list-style: none;
        border: 1px solid #000;
        text-align: center;
        width: 16.6%;
        height: 40px;
        line-height: 40px;
        background-color: #cccccc;
        color: #000;
      }
       .payUser>ul>li>ul>li{
        float: left;
        list-style: none;
        border: 1px solid #000;
        text-align: center;
        width: 16.6%;
        height: 40px; 
        line-height: 40px;
      }
       .submit{
       	width: 100px;
        height: 20px;
      }	
</style>
<body>
<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
<div class="container">
   <div class="pay">  
        <ul class="">
            <li>
                <ul class="">
                    <li>계정</li>
                    <li>상품</li>
                    <li>금액</li>
                    <li>결제 날짜</li>
                    <li>환불사유</li>
                    <li>환불요청</li>
                </ul>
            </li>
        </ul>
    </div>
      <div class="payUser">
        <ul class="">  
            <li>
                <ul class="">
                	<c:forEach var="vo" items="${data}">
                    <li>${vo.user_email }</li>
                    <li>${vo.category }</li>
                    <li>${vo.price }</li>
                    <li>${vo.pay_date }</li>
                    <li>  </li>
                    <c:if test="${vo.refund eq 1}">
                    <li><input class="submit" type="submit" value="환불 요청" onclick="cancelPay()" ></li> 
                    </c:if>
                    <c:if test="${vo.refund eq 0}">
                    <li>  </li> 
                    </c:if>
                    </c:forEach>
                </ul>  
            </li>
        </ul>
    </div>
    </div>
</body>
</html>