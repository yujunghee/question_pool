<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<style>
.submit {
	border: 1x solid #ff0080; /*---테두리 정의---*/
	background-Color: #c0c0c0; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: #000000; /*--폰트 색깔---*/
	width: 130;
	height: 30; /*--버튼 크기---*/
}
</style>
</head>
<script>
function chk(){
			$.ajax({
				url : 'showmetheexam.do',
				data : {
					exam_no : $("#exam_no").val()
				},
				async : false,
				success : function(res) {
					$("#examarea").html(res);
			}
		})
}
	function getyear(){
				$.ajax({
					url : 'showmetheyear.do',
					data : {
						school_no : $("#school_no").val()
					},
					async : false,
					success : function(res) {
						$("#yeararea").html(res);
				}
			})
		}
	function getsemester(){
		$.ajax({
			url : 'showmethesemester.do',
			data : {
				year : $("#year").val()
			},
			async : false,
			success : function(res) {
				$("#semesterarea").html(res);
		}
	})
}
	
</script>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- 학교/연도/회차 선택 페이지 -->
			<div style="text-align: center; padding: 200px 0 0 0;'">
				<h4 style="font-size: 20px;">학교선택</h4>
				<select name="school_no" id="school_no"
					style="width: 100px; height: 30px;" onclick="getyear()">
					<c:forEach var="vo" items="${list}">
						<option value="${vo.school_no}">${vo.school_name}</option>
					</c:forEach>
				</select>
			<br /> <br />
				<div id="yeararea"></div>
			<br/>
			<div id="semesterarea"></div>
			
				 <input type=button value="검색" class="submit" onclick="chk()" style="text-align:center">
			</div>
			<br/>
			<br/>
			<div style="text-align: center;" id="examarea">
			
			</div>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>