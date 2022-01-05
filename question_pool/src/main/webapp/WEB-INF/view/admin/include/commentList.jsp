<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="list">
    <colgroup>
        <col width="80px" />
        <col width="*" />
        <col width="100px" />
        <col width="100px" />
    </colgroup>
    <tbody>
    <c:if test="${empty cList}">
        <tr>
            <td class="first" colspan="4">등록된 댓글이 없습니다.</td>
        </tr>
    </c:if>                    
    <c:if test="${empty clist}">
    	<c:forEach var="vo" items="${cList }">            
        <tr>
            <td></td>
            <td class="txt_l" style="text-align: left;">
                ${vo.content }                
            </td>
            <td class="writer">
                ${vo.name }
            </td>
            <td class="date" width="8%"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>
            <td>            			                                   
			  	<a class="btns" style="cursor:pointer;" href="javascript:goDel(${vo.c_no });"><strong>답변삭제</strong></a>
            </td>
        </tr>        
        </c:forEach>
    </c:if>                    
    </tbody>
</table>
