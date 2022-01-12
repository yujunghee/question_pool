<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
<style>
.submit {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#c0c0c0;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:#000000;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
</style>
</head>
<script>
	function chk(){
		return true;
	}
	function chk2(frm){
		frm.action='/question_pool/admin/question/index.do';
		frm.submit();
		return true;
	}
</script>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<!-- E N D :: headerArea-->
			<!-- 학교/연도/회차 선택 페이지 -->
			
			<form name="frm" id="frm" action="" enctype="multipart/form-data" style="text-align:center; padding:200px 0 0 0;'">
			<h4 style="font-size:20px;">학교선택</h4>
				<select name="school_no" id="school_no" style="width:100px;height:30px;">
					<c:forEach var="vo" items="${list}">
						<option value="${vo.school_no}">${vo.school_name}</option>
					</c:forEach>
				</select> 

				<input type="submit" value="학교전송" class="submit">
			</form>
			<br/>
			<br/>
			<form name="frm" id="frm" action="" enctype="multipart/form-data" style="text-align:center;">
			<h4 style="font-size:20px;">년도선택</h4>
				<select name="year" style="width:100px;height:30px;">
					<c:forEach var="qlist" items="${qlist}">
						<option value="${qlist.year }" value="${qlist.school_no}">${qlist.year}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="년도전송"  class="submit">
			</form>
			<br/>
			<br/>
			<form name="frm" id="frm" action="/question_pool/admin/question/write.do" onsubmit="return chk();" enctype="multipart/form-data"
							style="text-align:center;">
			<h4 style="font-size:20px;">학기선택</h4>
				<select name="exam_no" style="width:100px;height:30px;">
					<c:forEach var="plist" items="${plist}">
						<option value="${plist.exam_no}">${plist.semester}</option>
					</c:forEach>
				</select> 
				<input type="submit" value="문제등록"   class="submit">
				<input type="button" value="문제목록" onclick="return chk2(this.form);"  class="submit">
			</form>
		</div>
		<!--//canvas -->
	</div>
	<!--//wrap -->

</body>
</html>