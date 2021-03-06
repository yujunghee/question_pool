<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="/question_pool/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/question_pool/js/common.js"></script>
<script src="https://malsup.github.io/jquery.form.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	var oEditors;
	$(function(){
		oEditors = setEditor("td_content");
	});
	function goSave() {
		if ($("#td_title").val() == '') {
			alert("제목을 입력하세요");
			$("#td_title").focus();
			return;
		}
		var data = $("#frm").serialize();
		oEditors.getById['td_content'].exec("UPDATE_CONTENTS_FIELD",[]);
		$("#frm").submit();		
	}
	$(function(){
		$("#frm").ajaxForm({
			url:'update.do',
			success:function(res) {
				alert('정상적으로 수정되었습니다.');
				location.href='view.do?td_no=${data.td_no}';
			}
		});
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
					<h2>시험일정 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="update.do" enctype="multipart/form-data">
							<input type="hidden" name=td_no value="${data.td_no }">
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
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="10">
											<input type="text" id="td_title" name="td_title" class="w100" title="제목을 입력해주세요" value="${data.td_title }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											<textarea id="td_content" name="td_content" title="내용을 입력해주세요" style="width:100%;">${data.td_content }</textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
											<input type="checkbox" name="delCheck" value="1">기존파일삭제(${data.td_file_org})<br>
											<input type="file" id="file" name="file" class="w100" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />							
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="testdate.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;"href="javascript:goSave();"><strong>저장</strong></a>
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