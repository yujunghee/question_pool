<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
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
                    <li>이름</li>
                    <li>계정</li>
                    <li>상품</li>
                    <li>금액</li>
                    <li>결제 날짜</li>
                    <li>환불</li>
                </ul>
            </li>
        </ul>
    </div>
      <div class="payUser">
        <ul class="">  
            <li>
                <ul class="">
                    <li>홍길동</li>
                    <li>aaa@gmail.com</li>
                    <li>30일권</li>
                    <li>30000</li>
                    <li>2021-12-30</li>
                    <li><input class="submit" type="submit" value="환불 요청" ></li>
                </ul>  
            </li>
        </ul>
    </div>
    </div>
</body>
</html>
