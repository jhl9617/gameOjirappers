<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-14
  Date: 2023-04-04
  Time: PM 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

</head>
<body>

<%--CComment 리스트로 가져와서 댓글 보여주기--%>
<c:forEach var="comment" items="${commentList}" >
    <div class="comment">

        <div class="comment-content">
            <span class="comment-author">${comment.user_id}</span> &nbsp; &nbsp;
            <span class="comment-date" >${comment.ccomdate}</span>
            <p><h3>${comment.ccomcontent}</h3></p>
            <%--수정삭제버튼--%>
            <div class="comment-btn">
                <%--수정 누르면 commentUpdate가 작동하고 <p>${comment.ccomcontent}</p> 이 부분을 수정가능하게 바꿔주고 기존 내용을 value로 넣어주고 확인 버튼을 보이게 해줘
                확인을 누르면 updateCommuCom.do 작동--%>
                 &nbsp; <a href="">수정</a> &nbsp;

                <%--삭제 누르면 commentDelete가 작동하고 <p>${comment.ccomcontent}</p> 이 부분을 삭제--%>
                <a href="">삭제</a>
                <hr>
        </div>
    </div>
</c:forEach>


</body>
</html>
