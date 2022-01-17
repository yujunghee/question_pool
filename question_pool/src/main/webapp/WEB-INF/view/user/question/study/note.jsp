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
					<h2>[${school.school_name} ${exam.year}년도 ${exam.semester}학기] - 총 ${exam.number_of_questions}문항/${exam.exam_time}분</h2>
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
						<form method="post" name="frm" id="frm" action="insert.do?exam_no=${exam.exam_no}" enctype="multipart/form-data" onsubmit="return conf();">
							<table width="100%" border="1">
								<thead>
									<tr>
										<th width="50%">13번</th>
										<th>메모</th>
									</tr>
								</thead>
								<tbody>	
									<tr>
										<td>문제문제</td>
										<td rowspan="3">메모장</td>
									</tr>	
									<tr>
										<td>해설</td>
									</tr>
									<tr>
										<td>답</td>
									</tr>	
									<tr>
									</tr>					
								</tbody>
							</table>
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
