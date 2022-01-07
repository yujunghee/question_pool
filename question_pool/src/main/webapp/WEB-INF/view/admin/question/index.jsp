<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	$(function(){
		var obj = $("#question_content");
		var len = $("#question_content").length;
		console.log(obj[0]);
		console.log(obj[1]);
		
		//str.replace("$","<u>");
	});
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
					<h2>문제목록-[${exam.school_no}대학교 ${exam.year}년도 ${exam.semester}학기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<c:forEach var="qv" items="${qlist}" varStatus="status">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
							<input type="hidden" value="${qv.question_no}">
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
										<th scope="row"><label for="">${status.count}번 문제</label></th>
										<td colspan="10" id="question_content">
											${qv.question_content}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">지문</label></th>
										<td colspan="10">
											${qv.passage }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">보기</label></th>
										<td colspan="10">
											<c:forEach var="ev" items="${elist}">
											<input type="hidden" value="${ev.example_no}">
												<c:if test="${ev.question_no eq qv.question_no}">
													(${ev.example}) ${ev.example_content}<br>
												</c:if>
											</c:forEach>
											정답 : (${qv.answer})
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">해설</label></th>
										<td colspan="10">
											${qv.explanation}
										</td>
									</tr>
									<tr>
										<td colspan="10">
											<a href="edit.do?exam_no=${exam.exam_no}&question_no=${qv.question_no}"><input type="button" value="문제수정"></a>
										</td>
									</tr>
								</tbody>
							</table>
							</c:forEach>
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