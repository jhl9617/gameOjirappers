<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:set var="ListCount" value="${ requestScope.paging.listCount }" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetailView</title>
    <link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet">
<style type="text/css">
.page-title {
    text-align: center;
}
.container {
    text-align: center;
}
.table-fill {
    text-align: center;
}
tr:hover td {
    background: #d0dafd;
    color: #339;
}
tr:hover td a {
    color: #000000;
}
</style>
</head>
<body style="padding: 0 0 70px 0;">
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<header>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>




<section class="notice">
  <div class="page-title">
        <div class="container">
            <h2 style="color: #c7663d;">자유 게시판</h2>
        </div>
    </div>

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="bgsearchTitle.do" method="post">
                    <div class="search-wrap">
                        <input id="search" type="search" name="search" placeholder="제목으로 검색하세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <div id="write" align="center">
        <button onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/bgwriteform.do';">글작성</button>
        <br>
    </div>
  <!-- board list area -->

            <table class="table-fill">
                <thead>
                <tr>
                    <th scope="col" class="th-num">조회수</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-id">ID</th>
                    <th scope="col" class="th-num">번호</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ requestScope.list }" var="boardGen">
                <tr>
                     <c:url var="dtview" value="/boardDetailView.do">
                        <c:param name="board_no" value="${ boardGen.board_no }" />
                        <c:param name="page" value="${ currentPage }"/>
                    </c:url>
                    
                    <td>${ boardGen.board_count }</td>
                    <td>
                      <a href="${ dtview }">${ boardGen.board_title }</a>
                    </td>
                    <td><fmt:formatDate value="${ boardGen.board_date }" pattern="yyyy-MM-dd" /></td>
                    <td>${ boardGen.user_id }</td>
                    <td>${ boardGen.board_no }</td>
                </tr>
                
                
                </c:forEach>
                </tbody>
                <br>

            </table>

        >
<c:set var="url" value="/blist.do" />
        <br>
        <br>
<jsp:include page="/WEB-INF/views/common/page.jsp" /> <br>
        <c:import url="/WEB-INF/views/common/footer.jsp"/>


</section>
</body>
</html>