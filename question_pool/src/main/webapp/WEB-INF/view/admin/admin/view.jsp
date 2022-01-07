<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function goSave() {
	    	if ($("#user_email").val().trim() == "") {
	    		alert('이메일을 입력해 주세요');
	    		$("#user_email").focus();
	    		return;
	    	}
	    	var con = true;
	    	$.ajax({
				url : 'emailCheck.do',
				data : {
					email : $("#user_email").val()
				},
				async:false,
				success:function(aaa) {
					if (aaa.trim() == '1') {
						alert('중복된 이메일입니다. 다른 이메일을 입력해 주세요');
						$("#user_email").val("");
						$("#user_email").focus();
						con = false;
					}
				}
			})
			
	    	if (con == false) return;
	    	if ($("#user_pwd").val().trim() == '') {
	    		alert('비밀번호를 입력해 주세요');
	    		$("#user_pwd").focus();
	    		return;
	    	}
	    	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	    	if( !reg.test($("#user_pwd").val()) ) {
	    	    alert("비밀번호는 문자+숫자 조합으로 8자이상 입력해 주세요.");
	    	    //$("#pwd").val("");
	    	    $("#user_pwd").focus();
	    	    return;
	    	}
	    	if ($("#user_pwd").val() != $("#pw_check").val()) {
	    		alert("비밀번호가 일치하지 않습니다.");
	    		return;
	    	}
	    	if ($("#user_name").val().trim() == '') {
	    		alert('이름을 입력해 주세요');
	    		$("#user_name").focus();
	    		return;
	    	}
	    	
	    	$("#frm").submit();
	    }
	</script>
<style>
      *{
          margin: 0 auto;
          padding: 0;
          box-sizing: border-box;
        }
.wrap{
	      width: 1500px;
      higth:100%;	
      text-align: center;
      margin: 0 auto;
      padding: 100px 0px 0px 0px;
      border: 0ch ;
      }

</style>
</head>
<body>
    <div class="wrap">
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">question_pool</h3>
                <form name="frm" id="frm" action="insert.do" method="post">
                <table class="board_write">
                    <caption>관리자 정보수정</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="user_email" id="user_email" class="inNextBtn" style="float:left;">
                            </td>
                        <tr>
                            <th>*비밀번호</th>
                            <td><input type="password" name="user_pwd" id="user_pwd" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
                        </tr>
                        <tr>
                            <th>*비밀번호<span>확인</span></th>
                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>*이름</th>
                            <td><input type="text" name="user_name" id="user_name" style="float:left;"> </td>
                        </tr>
                        
                    </tbody>
                </table>
                        <input type="hidden" name="cmd" value="write.do"/>
                        <input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">수정</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>