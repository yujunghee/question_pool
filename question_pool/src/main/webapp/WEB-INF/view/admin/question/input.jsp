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
						지문<textarea name="question" id="question" rows="20" cols="70"></textarea>
						참조번호<textarea name="refno" id="refno" rows="5" cols="10"></textarea><br>
						문제<textarea name=question id=question rows="20" cols="70"></textarea>
						<div class="ex" style="float:right;">
							보기<br><br>
							<input type="RADIO" name="exmaple" value="A">&nbsp;&nbsp;&nbsp;
							<input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="exmaple" value="B">&nbsp;&nbsp;&nbsp;
							<input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="exmaple" value="C">&nbsp;&nbsp;&nbsp;
							<input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="exmaple" value="D">&nbsp;&nbsp;&nbsp;
							<input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="exmaple" value="E">&nbsp;&nbsp;&nbsp;
							<input type="text" name="example_content" style="width:500px;"><br><br>
						</div>
					</div>
						
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>