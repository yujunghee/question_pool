<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
function loginCheck(){
	if ( $("#user_email").val().length < 1 ) {
		alert("이메일을 입력해주세요.");
		$("#user_email").val().focus();
		return false;
	}
	if ( $("#user_pwd").val().length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		$("#user_pwd").val().focus();
		return false;
	}
	var f = document.board;
	if (f.reg.checked) {
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=null;path=/;expires="+now;
	}
	return true;
	
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
</head>
<body onload="userid_chk();">
<div id="login">
	<div class="title">
		<h1><span>사이트 이름입니다.</span></h1>
	</div>
	<div class="login"> 
	<form name="board" id="board" method="post" action="login.do" onsubmit="return loginCheck();">
		<fieldset>
			<legend>로그인</legend>
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
