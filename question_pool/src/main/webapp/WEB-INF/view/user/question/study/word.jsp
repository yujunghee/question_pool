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
</head>	
<script>
</script>
<body>
  <div class="container">
    <div class="search-header">단어장</div>
    <div class="search-content">
      <form action="/question_pool/user/question/study/insertwords.do">
       <input type="hidden" name="user_no" value="${userInfo.user_no}">
       단어 <input id="search-input" name="word" type="text" placeholder="단어">
       <br>
       뜻 <input id="search-input" name="mean" type="text" placeholder="뜻">
       <input type="submit" value="등록">
      </form>
		<table border="1" width="70%">
      	<thead>
			<tr>
				<th width="50%">단어</th>
				<th width="50%">뜻</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="list" items="${list }">                                    
          <input type="hidden" name="qa_no" value="${list.word_no }">
          <tr>			                            				                            	
              <td>${list.word }</td>
              <td>${list.mean }</td>
          </tr>
          </c:forEach>
		</tbody>
      </table>
    </div>
  </div>
</body>
</html>