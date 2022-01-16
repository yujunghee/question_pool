<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script>
function loginCheck() {
	if ($("#user_email").val() == '') {
		alert('이메일을 입력해 주세요');
		$("#user_email").focus();
		return false;
	}
	if ($("#user_pwd").val() == '') {
		alert('비밀번호를 입력해 주세요');
		$("#user_pwd").focus();
		return false;
	}
}

function userid_chk() {
	var f=document.board;
	var useridname = CookieVal("cookie_userid");
	
	if (useridname=="null"){	
		f.id.focus();
		f.id.value="";
	} else {
		f.password.focus();
		f.id.value=useridname;
		f.reg.checked=true;
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}

</script>
<style>
      *{
          margin: 0 auto;
          padding: 0;
          box-sizing: border-box;
        }
#login{
	      width: 1500px;
      higth:100%;	
      text-align: center;
      margin: 0 auto;
      padding: 100px 0px 0px 0px;
      border: 0ch ;
      }
#bor{
	 padding: 10px;
}
</style>
</head>
<body onload="userid_chk();">
<div id="login">
	<div class="title">
		<h1><span>Ladder Up</span></h1>
	</div>
	<div class="login"> 
	<form name="board" id="board" method="post" action="login.do" onsubmit="return loginCheck();">
		<fieldset>
			
			<div class="bgBox">
				<div class="infoBox">
					<dl>
						<dt>
							<label for="user_eamil"><strong>이메일</strong></label>
						</dt>
						<dd>
							<input type="text" id="user_email" name="user_email" value="" title="이메일을 입력해주세요." style="ime-mode:inactive"/>
						</dd>
					</dl>
					<dl>
						<dt>
							<label for="password"><strong>비밀번호</strong></label>
						</dt>
						<dd>
							<input type="password" id="user_pwd" name="user_pwd" value="" title="비밀번호를 입력해주세요." />
						</dd>
					</dl>
				</div>
				<!-- //infoBox -->
				<input type="image" src="<%=request.getContextPath()%>/img/admin/member_login_btn.gif" alt="로그인" class="loginBtn" />
			</div>
			<!-- //bgBox -->
			<div class="joinList">
				<input type="checkbox" name="reg" id="reg"/> <label for="reg">아이디 저장</label>
			</div>
			<div>
			                        <a href="join.do" class="btn">회원가입</a> 
                                    <a href="searchId.do" class="btn">이메일/비밀번호 찾기</a>
			</div>
			<!-- //joinList -->
			<input type="hidden" name="url" id="url" value="<%//=url%>"/>
			<input type="hidden" name="param" id="param" value="<%//=param%>"/>
			<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
		</fieldset>
	</form>
	</div>
</div>
</body>
</html>
