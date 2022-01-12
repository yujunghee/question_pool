<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<style>
h1{font-size:250%;}
</style>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
						<form method="post" name="frm" id="frm" action="score.do" enctype="multipart/form-data">
						<h1> 총 ㅇㅇ문제 중 맞은 문제 ㅇㅇ개</h1><br><hr>
						
							<c:forEach var="qv" items="${qlist}" varStatus="status">
							<input type="hidden" value="${qv.question_no}">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
										<p colspan="10">${qv.passage }</p><br>
										
										<c:set var="string" value="${qv.question_content}"/>
										<c:set var="string1" value="${fn:replace(string,'#','<u>')}"/>
										<c:set var="string2" value="${fn:replace(string1,'$','</u>')}"/>
										<p style="width:500px;">${status.count}. ${string2}</p>
										
										<c:forEach var="ev" items="${qv.ex}">
												(${ev.example}) ${ev.example_content}<br>
										</c:forEach>
										<p>${qv.explanation}</p>
										<p>정답 : (${qv.answer})</p>
							<br><br>
							</c:forEach>
							
							<input type="submit" value="제출하기">
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