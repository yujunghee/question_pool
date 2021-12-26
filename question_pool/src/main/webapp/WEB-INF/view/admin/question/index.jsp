<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
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
					<h2>문제등록-[ㅇㅇ대학교 ㅇㅇ년도 ㅇㅇ학기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="" enctype="multipart/form-data">
							<c:forEach var="qv" items="${qlist}">
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
										<th scope="row"><label for="">문제번호</label></th>
										<td colspan="10">
											${qv.question_realnum }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">문제</label></th>
										<td colspan="10">
											${fn:replace(qv.question_content,'$','<u>')}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">참조번호</label></th>
										<td colspan="10">
											${qv.question_ref }
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
												<c:if test="${ev.question_no eq qv.question_no}">
												<input type="RADIO" name="example" value="a">&nbsp; 
												(${ev.example}) ${ev.example_content}<br>
												</c:if>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">해설</label></th>
										<td colspan="10">
											${qv.explanation}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
											<input type="file" id="filename_tmp" name="filename_tmp" class="w100" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
								</tbody>
							</table>
							</c:forEach>
							<div class="btn">
								<div class="btnRight">
									<input type="submit" class="btns" value="등록" style="width:250px;height:50px;">
								</div>
							</div>
							</form>
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