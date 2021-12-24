<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type=	"text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script>

function product(pname ,pay){
	//가맹점 식별코드
	IMP.init('imp01855034');
	IMP.request_pay({
	    pg : 'nice',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : pname, //결제창에서 보여질 이름
	    amount : pay, //실제 결제되는 가격
	    buyer_email : '${data.user_email}',
	    buyer_name : '${data.user_name}', 
	    buyer_tel : '${data.user_tel}',
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

</script>
<body>  
<input type="button" value="30일권" onclick="product('30일권',100)"/><br>
<input type="button" value="60일권" onclick="product('60일권',200)"/><br>
</body>
</html>
