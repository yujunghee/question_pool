<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
.btn-btn-primary {
  background-color: #484b56;
  color: white;
  cursor: pointer;
  padding: 18px;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}
</style>

<script>
var counter = 1;
var dynamicInput = [];

function addInput(){
    var newdiv = document.createElement('div');
    newdiv.id = dynamicInput[counter];
    newdiv.innerHTML = "<textarea class='card card-body' name='myInputs[]' onkeyup='textAreaAdjust(this)' style='overflow:hidden' rows='4' cols='60'> </textarea>";
    document.getElementById('formulario').appendChild(newdiv);
}
  
  function removeInput(id){
    var elem = document.getElementById(id);
    return elem.parentNode.removeChild(elem);
  }
  
function textAreaAdjust(element) {
	  element.style.height = "1px";
	  element.style.height = (25+element.scrollHeight)+"px";
	}

</script>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script><div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>[${school.school_name} ${exam.year}년도 ${exam.semester}학기]</h2>
					<input type="hidden" value="${userInfo.user_no}">
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
<!--  						<form method="post" name="frm" id="frm" action="insert.do?exam_no=${exam.exam_no}" enctype="multipart/form-data" onsubmit="return conf();">-->
							<p>
							  <button class="btn-btn-primary"  type="button" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">문제</button>
							  <button class="btn-btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">정답 및 분석</button>
							  <button class="btn-btn-primary" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">모두 보기</button>
							</p>
							<div class="row">
							  <div class="col">
							    <div class="collapse multi-collapse" id="multiCollapseExample1">
							      <div class="card card-body">
							      문제 불러오기
							      </div>
							    </div>
							  </div>
							  <div class="col">
							    <div class="collapse multi-collapse" id="multiCollapseExample2">

							      		<form method="POST" id="formulario">
									     <div id="dynamicInput[0]">
									        <textarea class="card card-body" name="myInputs[]" onkeyup="textAreaAdjust(this)" style="overflow:hidden" rows="4" cols="60">답, 해설 불러오기
									        </textarea>
									        <br>
									   		내 메모 <input type="button" id="inputbtn" value="+" onClick="addInput();" size="5" >
									   		<input type="button" id="inputbtn" value="-" onClick="removeInput();" size="5"> 
									    </div>									  
								    </form>
								    </div>
							    </div>
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
