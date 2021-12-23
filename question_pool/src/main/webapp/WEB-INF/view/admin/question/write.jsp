<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function(){
		console.log("${adminInfo.admin_name}");
	})
</script>
<style>
	th{ font-size : 30px;}
	th,td{
		padding: 20px 50px;
	}
</style>
</head>
	<body> 
		<div id="wrap">
			<div id="canvas">
				<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
				<div id="container">
					<form name="frm" id="frm" action="insert.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="admin_no" value="${adminInfo.admin_no}">
						<div id="content">
							<div class="con_tit">
								<h2>문제등록</h2>
							</div>
							<table>
								<tr>
									<th colspan="2">ㅇㅇ대학교 ㅇㅇ년도 ㅇㅇ회차</th>
								</tr>
								<tr>
									<td>문제번호&nbsp;<input type="text" name="question_realnum"></td>
								</tr>
								<tr>
									<td>지문<br><br><textarea name="passage" id="passage" rows="15" cols="60"></textarea></td>
									<td>참조번호<br><br><input type="text" name="question_ref" id="question_ref"></td>
								</tr>
								<tr>
									<td>문제<br><br><textarea name="question_content" id="question_content" rows="15" cols="60"></textarea></td>
									<td>해설<br><br><textarea name="explanation" id="explanation" rows="15" cols="60"></textarea></td>
								</tr>
								<tr>
									<td>
									<br>
									<input type="RADIO" name="example" value="a">&nbsp;&nbsp;&nbsp;
									(A) <input type="text" name="example_content" style="width:500px;"><br><br>
									<input type="RADIO" name="example" value="b">&nbsp;&nbsp;&nbsp;
									(B) <input type="text" name="example_content" style="width:500px;"><br><br>
									<input type="RADIO" name="example" value="c">&nbsp;&nbsp;&nbsp;
									(C) <input type="text" name="example_content" style="width:500px;"><br><br>
									<input type="RADIO" name="example" value="d">&nbsp;&nbsp;&nbsp;
									(D) <input type="text" name="example_content" style="width:500px;"><br><br>
									<input type="RADIO" name="example" value="e">&nbsp;&nbsp;&nbsp;
									(E) <input type="text" name="example_content" style="width:500px;"><br><br>
									</td>
									<td>
										<input type="submit" value="등록" style="width:250px;height:50px;float:right;">
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>