<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="currentPage" value="${requestScope.currentPage }" />
<c:set var="game" value="${ requestScope.game }" />




<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>${ requestScope.game.name }</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<style type="text/css">
#updateinfo {
   display: none;
}
#deleteinfo {
   display: none;
}
#samePrice {
   display: none;
}
#sameGenre {
   display: none;
}
/* form.sform {
	display: none; /* 처음엔 안보이게 설정 클릭시 보임*/
	background: lightgray;
} */
</style>
<script type="text/javascript">
function updateinfo() {
    const updateinfo = document.getElementById('updateinfo');
    const deleteinfo = document.getElementById('deleteinfo');

    if (updateinfo.style.display === 'none') {
        updateinfo.style.display = 'block';
        deleteinfo.style.display = 'none';
    } else {
        updateinfo.style.display = 'none';
    }
    return false;
}

function deleteinfo() {
    const updateinfo = document.getElementById('updateinfo');
    const deleteinfo = document.getElementById('deleteinfo');

    if (deleteinfo.style.display === 'none') {
        deleteinfo.style.display = 'block';
        updateinfo.style.display = 'none';
    } else {
        deleteinfo.style.display = 'none';
    }
    return false;
}

function sameGenre() {
    const sameGenre = document.getElementById('sameGenre');
    const samePrice = document.getElementById('samePrice');

    if (sameGenre.style.display === 'none') {
    	sameGenre.style.display = 'block';
    	samePrice.style.display = 'none';
    } else {
    	sameGenre.style.display = 'none';
    }
    return false;
}

function samePrice() {
	const sameGenre = document.getElementById('sameGenre');
    const samePrice = document.getElementById('samePrice');

    if (samePrice.style.display === 'none') {
    	samePrice.style.display = 'block';
    	sameGenre.style.display = 'none';
    } else {
    	samePrice.style.display = 'none';
    }
    return false;
}
/* $(function(){
	//$('선택자').이벤트 함수(function(){실행코드});
	//$('선택자').on('이벤트종류',function(){실행코드});
	//작성한 이벤트 실행 코드는 이벤트가 발생될 때까지 대기 상태임
	
	//검색할 항목을 선택하면, 해당 항목에 대한 폼이 보여지게 함
	//보여지고 있는 다른 폼은 다시 안 보이게 함
	
	$('input[name=item]').on('change', function(){
		//change 이벤트가 발생한 radio 와 연결된 폼만 보여지게 하고,나머지 폼들은 안 보이게 처리함
		$('input[name=item]').each(function(index){
			//해당 index 번째 redio 가 checked 인지 확인 하고
			if($(this).is(':checked')){
				$('form.sform').eq(index).css('display','block');
			}else{
				$('form.sform').eq(index).css('display','none');
			}
		}); //each
	}); //on
	
});//document.ready */

</script>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />		<%--css 스타일 가져오기--%>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>

</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
		
<div class="inner" align="left">
         <c:if test="${sessionScope.loginUser.admin_id eq 'Y'}">
               <span class="button" onclick="updateinfo();">게임정보 업데이트</span>
               <span class="button" onclick="deleteinfo();">게임정보 삭제</span>
               <a href="${ pageContext.servletContext.contextPath }/insertAllGameInfo.do"
                  class="button"><span class="label">게임정보 갖고오기</span></a>
               <div id="updateinfo">
                  <form action="updateGameInfo.do" method="post">
                     <input name="appid"> <input type="submit" value="업데이트">
                  </form>
               </div>
               <div id="deleteinfo">
                  <form action="gdeleteData.do" method="post">
                     <input name="appid"> <input type="submit" value="삭제">
                  </form>
               </div>
             </c:if>
            <hr clear="both">

			<!-- Header -->
			<c:import url="/WEB-INF/views/common/menubar.jsp"/>
				<!-- Content -->
				<section>
				
					<header class="main">
						<h1 align="center">${ requestScope.game.name }</h1>
						<h3 align="center">
						
						<script type="text/javascript">
						function gen2(){
						var string = '${ requestScope.game.genre }';
						genre2 = string.replace(/\//g, "#").slice(0,-1);
						document.write("#"+genre2);
						}
						gen2();
						</script>

						</h3>
					</header>
				</section>
				<section>
					<!--게임사진 들어갈 부분 -->
					<header class="major">
					</header>

					<span class="image object">
					<a href="${ requestScope.game.headerimg }"><img alt="${ requestScope.game.name }의게임대표이미지" src="${ requestScope.game.headerimg }"></a>
					</span>

				</section>
				<section>
				
					<table>
					<header class="major">
						<h2> 동영상 </h2>
					</header>

					<video autoplay muted>

					  <source src="${ requestScope.game.movie }" type="video/mp4"></video>
						
					</table>
					<table>
					<!-- <header class="major">
						<h2> ㅀㄹㅇㅎ </h2>
					</header> -->
							<div style="border:1px solid black;">
							<h2 align="center">초기 가격:[${ requestScope.game.initialprice }]</h2>
							<h2 align="center">최종 가격:[${ requestScope.game.finalprice }]</h2>
							<h2 align="center">개발자:[${ requestScope.game.developer }]</h2>
							<h2 align="center">배급사:[${ requestScope.game.publisher }]</h2>
							</div>
					</table>
				</section>
				
				
				
				
				
				<section>
				
					<header class="major">
						<h2> 게임 소개글 </h2>
					</header>
				<div style="float:left;">		
					<p>${ requestScope.game.description }</p>
						<p></p>
				</div>
				
				<header class="major">
						<h2> 도전과제 링크 </h2>
					</header>
				<div style="float:left;">
					<a href="${ pageContext.servletContext.contextPath }/goChallenge.do?appid=${ requestScope.game.appid }" >도전과제 링크</a>
				</div>
				</section>	
				
				
				<section>
				<header class="major">
					<h2> 게임리스트 </h2>
				</header>
				<div class="discount">
				<table class="table-products table-hover">
				<colgroup>
					<col style="width:119px">
					<col>
					<col style="width:120px">
					<col style="width:100px">
				</colgroup>
				<thead>
				<tr>
					<th class="table-title" colspan="2">
						<a href="#">
						<span class="hide-small">Popular </span>Releases
						<svg version="1.1" width="24" height="24" viewBox="0 0 16 16" class="octicon octicon-arrow-right" aria-hidden="true">
						<path d="M8.22 2.97a.75.75 0 0 1 1.06 0l4.25 4.25a.75.75 0 0 1 0 1.06l-4.25 4.25a.751.751 0 0 1-1.042-.018.751.751 0 0 1-.018-1.042l2.97-2.97H3.75a.75.75 0 0 1 0-1.5h7.44L8.22 4.03a.75.75 0 0 1 0-1.06Z">
						</path>
						</svg>
						</a>
					</th>
					
					<center>
					<!-- 항목별 검색 기능 추가 -->
					<fieldset id="ss">
						<legend>검색할 항목을 선택하세요</legend>
						<span class="button" name="item" onclick="samePrice();">가격 같은순</span>  &nbsp;
						<span class="button" name="item" onclick="sameGenre();">같은 장르 순</span>  &nbsp;
					</fieldset>
					<!-- 검색 항목 제공 끝 -->
					<br>
					<!-- 가격 같은순 -->
					<form action="${ pageContext.servletContext.contextPath }/gpsearch.do" method="post" id="priceform" class="sform">
						<input type="hidden" name="action" value="price">
						<input type="number" name="keyword" value="${ requestScope.game.finalprice }">&nbsp;
						<input type="submit" value="검색">
					</form>
					<!-- 같은 장르 순 -->
					<form action="${ pageContext.servletContext.contextPath }/gpsearch.do" method="post" id="genderform" class="sform">
						<input type="hidden" name="action" value="gender">
						<input type="search" name="keyword"> &nbsp;
						<input type="submit" value="검색">
					</form>
				</center>
					<%-- <table align="center" border="1" cellspacing="0" cellpadding="3">
						<tr>
							<th>게임이름</th>
							<th>장르</th>
							<th>좋아요</th>
							<th>초기값</th>
							<th>마지막값</th>
							<th>할인율</th>

						</tr>

						<c:forEach items="${ requestScope.list }" var="g">
							<tr>
								<td>${ g.name }</td>
								<td>${ g.genre }</td>
								<td>${ g.positive }</td>
								<td>${ g.initialprice }</td>
								<td>${ g.finalprice }</td>
								<td>${ g.description }</td>

							</tr>
						</c:forEach>
					</table> --%>
					
					<!-- <span class="button" onclick="samePrice();">가격 같은순</span>
					
               		<span class="button" onclick="sameGenre();">같은 장르 순</span> -->
<!-- 					<th>Peak Today</th>
					<th><img src="" class="flag" alt="" width="18" height="18"> Price</th>
				</tr>
				</thead>
				<tbody>
				<tr class="app" data-appid="2050650" data-cache="1679986748">
					<td class="applogo">
					<a href="/app/2050650/charts/" tabindex="-1" aria-hidden="true">
					<img src="" alt="">
					</a>
					</td>
					<td><a href="" class="css-truncate">게임제목</a></td>
					<td class="text-center green">접속유저</td>
					<td class="text-center">할인율</td>
				</tr>
				</tbody> -->
				</table>

				</div>
				
				</section>
											
			<section>
				<header class="major">
					<h2> 유저게시판 </h2>
				</header>
				<div class="bbborad">
				<table class="table-products table-hover">
				<colgroup>
					<col style="width:119px">
					<col style="width:120px">
					<col style="width:100px">
				</colgroup>
				<thead>
				<tr>
					<th class="table-title">
						<a href="">번호</a>
					</th>
					<th>제목</th>
					<th>조회수</th>
				</tr>
				</thead>
				<tbody>
				<tr class="boraddd">

					<!-- <th><a href="" class="css-truncate">번호</a></th>
					<th class="text-center green">제목</td>
					<th class="text-center">조회수</td> -->
					
				</tr>
				</tbody>
				</table>
				</div>
			
			</section>
			<section>
					<h2>댓글 처리할거임</h2>
					<p></p>
					<p></p>

					<hr class="major" />
				</section>	
						
				
				

			</div>

<c:import url="/WEB-INF/views/common/footer.jsp"/>

		</div>
	</div>

 	<!-- Scripts -->
<!--	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script> -->
</body>
</html>