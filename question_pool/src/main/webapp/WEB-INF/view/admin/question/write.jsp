<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function(){
		$('input[type="RADIO"]').click(function(){
	 	   if ($(this).is(':checked')){
		   		var radioVal = $(this).val();
		   		console.log(radioVal);
			}
		});
	});
</script>
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
							<input type="RADIO" name="example" value="a">&nbsp;&nbsp;&nbsp;
							(A) <input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="example" value="b">&nbsp;&nbsp;&nbsp;
							(B) <input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="example" value="c">&nbsp;&nbsp;&nbsp;
							(C) <input type="text" name="example_content" style="width:500px;"><br><br>
							<input type="RADIO" name="example" value="d">&nbsp;&nbsp;&nbsp;
							(D) <input type="text" name="example_content" style="width:500px;"><br><br>
						</div>
						<input type="submit" value="등록" style="width:150px;height:30px;float:right;">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function goSaveSchool(){
	if($("#school_name").val()==''){
		alert("학교입력");
		$("#school_name").focus();
		return;
	}
	$("#frm").submit();
}
function goSaveExam(){
	
	
	if($("#year").val()==''){
		alert("년도입력");
		$("#year").focus();
		return;
	}
	if($("#number_of_questions").val()==''){
		alert("문항수입력");
		$("#number_of_questions").focus();
		return;
	}
	if($("#exam_time").val()==''){
		alert("시험시간입력");
		$("#exam_time").focus();
		return;
	}
	$("#frm").submit();
}
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>학교등록</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="insertschool.do" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">학교명</label></th>
										<td colspan="10">
											<input type="text" id="school_name" name="school_name" class="w100" />	
										</td>
									</tr>
									</tbody>
									</table>
									</form>
										<div class="btn">
										<div class="btnRight">
										<a class="btns" style="cursor:pointer;" href="javascript:goSaveSchool();"><strong>저장</strong></a>
										</div>
										</div>
									<form method="post" name="frm1" id="frm1" action="insertexams.do" enctype="multipart/form-data">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
								<c:forEach var="vo" items="${list}">
                           		<tr>
                                <td>${vo.school_no}</td>
                                </tr>
                                </c:forEach>
									<tr>
										
										<th scope="row"><label for="">년도</label></th>
										<td colspan="10">
											<input type="text" id="year" name="year" class="w100" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">문항 수</label></th>
										<td colspan="10">
											<input type="text" id="number_of_questions" name="number_of_questions" class="w100"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">시험 시간</label></th>
										<td colspan="10">
											<input type="text" id="exam_time" name="exam_time" class="w100"/>	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="school.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:goSaveExam();"><strong>저장</strong></a>
									
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>