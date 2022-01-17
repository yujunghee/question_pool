<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<style>
.submit {
	border: 0.5px solid #ff0080; /*---테두리 정의---*/
	background-Color: #AB9D9D; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: #000000; /*--폰트 색깔---*/
	width: 130;
	height: 30; /*--버튼 크기---*/
}
h2 {
  position: relative;
  padding: 1rem 0.5rem;
  font-size: 50px;
}
h2::after {
  position: absolute;
  bottom: 0px;
  left: 0px;
  content: '';
  width: 100%;
  height: 6px;
  border-radius: 3px;
  background-image: -webkit-linear-gradient(right, #00b0ff 0%, #00e676 100%);
  background-image: linear-gradient(to left, #00b0ff 0%, #00e676 100%);
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
			<h2> 문제 풀이 </h2>
		<!-- canvas -->
		<div id="canvas" style="text-align: center; padding: 100px 0 0 100px;'">
		<table>
			<tr>
				<td>
					<h4 style="font-size: 20px;">학교선택</h4>
					<select name="school_no" id="school_no"
					style="width: 150px; height: 30px;" onclick="getyear()">
						<c:forEach var="vo" items="${list}">
							<option value="${vo.school_no}">${vo.school_name}</option>
						</c:forEach>
					</select>
				</td>
				<td>
				<div id="yeararea"></div>
				</td>
				<td>
				<div id="semesterarea"></div>
				</td>
			</tr>
			<tr>
				<td>
				<form name="frm" id="frm" action="" onclick="return chk();" enctype="multipart/form-data">
				<br/>
				<br/>
				<input type="button" value="문제 검색->" class="submit">
				</form>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<br/>
				<br/>
					<div id="examarea"></div>
				</td>
			</tr>			
		</table>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>