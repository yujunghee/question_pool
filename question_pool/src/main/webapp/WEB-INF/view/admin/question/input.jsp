<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<!-- 문제등록/수정페이지 -->
<div id="wrap">
	<div id="canvas">
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container" style="width:1200px;">
			<form name="frm" id="frm" action="insert.do" method="post" enctype="multipart/form-data">
				<div id="content">
					<div class="con_tit">
						<h2>문제등록/수정</h2>
					</div>
					<div class="con">
						<h2>문제번호 : nn번</h2><br>
						지문<textarea name="passage" id="passage	" rows="20" cols="70"></textarea>
						참조번호<textarea name="question_ref" id="question_ref" rows="5" cols="10"></textarea><br>
						문제<textarea name="question_content" id="question_content" rows="20" cols="70"></textarea>
						해설<textarea name="explanation" id="explanation" rows="20" cols="70"></textarea><br>
						<div class="ex">
							<br><br>
							<input type="RADIO" name="a" value="a">&nbsp;&nbsp;&nbsp;
							(A) <input type="text" name="example_a" style="width:500px;"><br><br>
							<input type="RADIO" name="b" value="b">&nbsp;&nbsp;&nbsp;
							(B) <input type="text" name="example_b" style="width:500px;"><br><br>
							<input type="RADIO" name="c" value="c">&nbsp;&nbsp;&nbsp;
							(C) <input type="text" name="example_c" style="width:500px;"><br><br>
							<input type="RADIO" name="d" value="d">&nbsp;&nbsp;&nbsp;
							(D) <input type="text" name="example_d" style="width:500px;"><br><br>
						</div>
						<input type="submit" value="등록" style="width:150px;height:30px;float:right;">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>