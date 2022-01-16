<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/view/user/include/headHtml.jsp" %>
</head>
<body> 
<div id="boardWrap">
	<!-- canvas -->
	<div id="canvas">		
		<!-- S T A R T :: containerArea-->
		<div id="container" style="width:100%;">
			<div id="content">
				<div class="pageTitle">
					<h2>Q&A</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div class="bbs">
						<div class="list">
							<p><span><strong>총 ${totCount }개</strong>  |  ${qaVo.page }/${totPage }페이지</span></p>							
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%"  cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w3"/>
									<col class="w4"/>
									<col class="" />
									<col class="w10" />
									<col class="w5" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>										
										<th scope="col" class="first" style="width: 5%;">번호</th>
										<th scope="col">제목</th> 
										<th scope="col" style="width: 10%;">작성일</th> 
										<th scope="col" style="width: 7%;">작성자</th> 
										<th scope="col" style="width: 5%;" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="8">등록된 글이 없습니다.</td>
			                            </tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="list" items="${list }">                                    
			                            <input type="hidden" name="qa_no" value="${list.qa_no }">
			                            <input type="hidden" name="user_no" value="${list.user_no }">
			                            <tr>			                            				                            	
			                                <td>${list.qa_no }</td>
			                                <td class="txt_l" onclick="location.href='view.do?qa_no=${list.qa_no }'" style="cursor: pointer;">
			                                    <a href="view.do?qa_no=${list.qa_no }">${list.qa_title } &nbsp;
			                                    <c:if test="${list.c_count > 0}">			                                    	
			                                    	<strong>[답변완료]</strong>	
			                                    </c:if>
			                                    </a>
			                                </td>
			                                <td class="date"><fmt:formatDate value="${list.qa_date }" pattern="yyyy-MM-dd"/></td>			                                
			                                <td class="writer">
			                                    ${list.user_name }
			                                </td>			                                
			                                <td class="readcount">${list.qa_readcount }</td>
			                            </tr>
			                            </c:forEach>
			                         </c:if>
								</tbody>
							</table>
							</form>							
							<br>	
							<div class="btn">
								<div class="writebtn">
									<a class="wbtn" href="write.do"><strong>글작성</strong> </a>
								</div>
							</div>							
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class="pagenate">
							${pageArea }
							</div>
							<!-- //페이징 처리 -->							
							<form name="searchForm" id="searchForm" action="qa.do"  method="get" >
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="qa_title" <c:if test="${param.searchType == 'qa_title'}">selected</c:if>>제목</option>
										<option value="qa_content" <c:if test="${param.searchType == 'qa_content'}">selected</c:if>>내용</option>
										<option value="user_name" <c:if test="${param.searchType == 'user_name'}">selected</c:if>>작성자</option>
									</select>
									<input type="text" name="searchWord" value="${param.searchWord }" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>							
							<!-- //search --> 
						</div>
						<!-- //list -->
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