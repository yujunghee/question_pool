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

function product(pname ,pay, product_no){
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
   		 var msg = '';
	    if ( rsp.success ) {
		    	$.ajax({
		    		 type: 'POST',
					url : 'payInsert.do',
					data : {
						pay_id : rsp.imp_uid,
						user_no : ${data.user_no},
						product_no : product_no
					},
		    	})
				msg += pname+' 결제되었습니다 감사합니다.'
	    } else {
	         msg += rsp.error_msg+ '  다시 시도해주세요.';
	    }
        alert(msg); 
	});
}


</script>
<body>  
<input type="button" value="30일권" onclick="product('30일권',100, 1)"/><br>
<input type="button" value="60일권" onclick="product('60일권',200, 2)"/><br>
</body>
</html>
