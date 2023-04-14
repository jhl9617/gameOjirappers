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
<title>boardListView</title>
    <link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet">
<style type="text/css">

	@font-face {
	    font-family: 'GyeonggiTitleM';      /* 글씨체: 경기천년제목 */
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	* { 
	color: Lightgray ;
	font-family: 'GyeonggiTitleM';
	}   
      
   
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

	input[type="submit"],
	input[type="button"], 
	.button {
	font-family: 'GyeonggiTitleM';
	  -moz-appearance: none;
	  -webkit-appearance: none;
	  -ms-appearance: none;
	  appearance: none;
	  -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  background-color: transparent;
	  border-radius: 8px;
	  border: 1;
	  box-shadow: 1px 1px 1px 1px #f56a6a;
	  color: Lightgray ;
	  cursor: pointer;
	  display: inline-block;
	  font-size: 0.8em;
	  font-weight: 700;
	  height: 40px;
	  width: 150px;
	  letter-spacing: 0.075em;
	  line-height: 3.5em;
	  padding: 0;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  white-space: nowrap; }
	  
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
                        <input id="search" type="search" name="search" placeholder="제목으로 검색하세요." value=""
                        style="width:365px; height:37px; font-size:13px; border-radius: 8px;">
                        <input value="검색" type="submit" class="btn btn-dark">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <div id="write" align="center">
        <input type="button" value="글작성" style="color:Lightgray; font-family:'GyeonggiTitleM' " 
        onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/bgwriteform.do';">
        <br>
    </div>
  <!-- board list area -->

            <table class="table-fill" style="height: 40px; ">
                <thead>
                <tr>
                    <th scope="col" class="th-num" style="height: 40px; ">조회수</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-id">ID</th>
                    <th scope="col" class="th-num">번호</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ requestScope.list }" var="boardGen">
                <tr style="height: 40px; ">
                     <c:url var="dtview" value="/boardDetailView.do">
                        <c:param name="board_no" value="${ boardGen.board_no }" />
                        <c:param name="page" value="${ currentPage }"/>
                    </c:url>
                    
                    <td >${ boardGen.board_count }</td>
                    <td> <a href="${ dtview }">${ boardGen.board_title }</a>  </td>
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