<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					<table class="list">					    
					    <thead>
							<tr>									
								<th scope="col" class="first" style="width: 8%;">게시판</th>
								<th scope="col">내용</th> 
								<th scope="col" class="last" style="width: 9%;">작성일</th>								 
							</tr>
						</thead>
					    <tbody>
					    <c:if test="${empty cList}">
					        <tr>
					            <td class="first" colspan="4">등록된 댓글이 없습니다.</td>
					        </tr>
					    </c:if>                    
					    <c:if test="${!empty cList}">
					    	<c:forEach var="vo" items="${cList }">					    						    	            
					        <c:if test="${vo.tablename == 'notice'}">	
					        	<tr onclick="location.href='/question_pool/user/board/${vo.tablename}/view.do?notice_no=${vo.notice_no }'" style="cursor: pointer;">
				        	</c:if>
					        <c:if test="${vo.tablename == 'testdate'}">	
					        	<tr onclick="location.href='/question_pool/user/board/${vo.tablename}/view.do?td_no=${vo.td_no }'" style="cursor: pointer;">
				        	</c:if>
					        <c:if test="${vo.tablename == 'community'}">	
					        	<tr onclick="location.href='/question_pool/user/board/${vo.tablename}/view.do?community_no=${vo.community_no }'" style="cursor: pointer;">
				        	</c:if>
					            <td>
					            <c:if test="${vo.tablename == 'notice'}">
					            	공지사항
					            </c:if>
					            <c:if test="${vo.tablename == 'testdate'}">
					            	시험일정
					            </c:if>
					            <c:if test="${vo.tablename == 'community'}">
					            	자유게시판
					            </c:if>
					            </td>
					            <td class="txt_l" style="text-align: left; width: 73%" >
					                ${vo.content }                 
					            </td>
					            <td class="date" style="width: 11%; text-align: center;"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>			            
					        </tr>        
					        </c:forEach>
					    </c:if>                    
					    </tbody>
					</table>
