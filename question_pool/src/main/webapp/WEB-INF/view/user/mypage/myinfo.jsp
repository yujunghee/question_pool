<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/reset.css"/>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/common.css"/>
    <link rel="stylesheet" href="/question_pool/css/user/userJoin/contents.css"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function zipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    addr += extraAddr; 
                
                }

                document.getElementById('zipcode').value = data.zonecode; 
                document.getElementById("addr1").value = addr; 
                document.getElementById("addr2").focus();
            }
        }).open();
    }	
	</script>
</head>
    <body>
        <div class="wrap"><input type="hidden" name="user_no" value="${data.user_no}">
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">내 정보 수정</h3>
                    <form name="frm" id="frm" action="process.do" method="post">
                    <table class="board_write">
                        <caption>내 정보 수정</caption>
                        <colgroup>
                            <col width="20%" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <input type="text" name="user_email" id="user_email" readonly value="${data.user_email }" class="inNextBtn" style="float:left;" >
                                </td>
                            </tr>
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
                                <td><input type="text" name="user_name" id="user_name" value="${data. user_name }"style="float:left;"> </td>
                            </tr>
                             <tr>
                                <th>*별명</th>
                                <td><input type="text" name="user_nick" id="user_nick" value="${data. user_nick }"style="float:left;"> </td>
                            </tr>
                            <tr>
                                <th>*휴대폰 번호</th>
                                <td>
                                    <input type="text" name="user_tel" id="user_tel" value="${data.user_tel }"  maxlength="15" style="float:left;"><span class="ptxt"> 숫자만 입력해 주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3">주소</th>
                                <td>
                                    <input type="text" name="zipcode" id="zipcode" value="${data. zipcode }"class="inNextBtn" style="float:left;">
                                    <span class="email_check"><a href="javascript:zipcode();" class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="addr1" id="addr1" value="${data. addr1 }" style="float:left;width:500px;">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="addr2" id="addr2" value="${data. addr2 }" style="float:left;width:500px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                    <div class="btnSet clear">
                        <div><a href="edit.do?user_no=${data. user_no }" class="btn"><strong>수정</strong></a> <a href="javascript:;" class="btn" onclick="history.back();">탈퇴</a></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>