<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="currentPage" value="${requestScope.currentPage }" />
<c:set var="game" value="${ requestScope.game }" />




<!DOCTYPE HTML>
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
							<h2 align="center">초기 가격:[${ requestScope.game.initialprice }원]</h2>
							<h2 align="center">최종 가격:[${ requestScope.game.finalprice }원]</h2>
							<h2 align="center">개발자:[${ requestScope.game.developer }]</h2>
							<h2 align="center">배급사:[${ requestScope.game.publisher }]</h2>
							<h2 align="center"><a href="${ pageContext.servletContext.contextPath }/goChallenge.do?appid=${ requestScope.game.appid }" class="button">도전과제 링크</a></h2>
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
				</section>
				
				
				
				<section>
				<header class="major">
					<h2> 게임리스트 </h2>
				</header>				
				<div>
					<form name="search-form" autocomplete="off">
						<input type="text" name="keyword" placeholder="검색할 장르를 입력하세요" />
						<input type="button" onclick="gamegSearch()" value="검색">
					</form>
				</div>
				<table id="g" >
					
				</table>
				</section>
				<script type="text/javascript">
				function gamegSearch(){
					$.ajax({
						type: 'GET',
						url : "ggsearch.do",
						data : $("form[name=search-form]").serialize(),
						success : function(result){
							//테이블 초기화
							$('#g').empty();
							var ge = '<tr><th>게임이름</th><th>게임장르</th><th>긍정 평가</th></tr>';
							
							if(result.length>=1){								
								result.forEach(function(item){
									ge +='<tr>';
									ge += "<td>"+item.name+"</td>";
									ge += "<td>"+item.genre+"</td>";
									ge += "<td>"+item.positive+"</td>";
									ge +="</tr>";			
				        		})
				        		$('#g').append(ge);
							}
						}
					})
				}
				</script>
				<section>
				<header class="major">
					<h2> 게임리스트2 </h2>
				</header>				
				<div>
					<form name="search-form" autocomplete="off">
						<input type="number" name="keywordp" value="${ requestScope.game.finalprice }" />
						<input type="button" onclick="gamepSearch()" value="검색">
					</form>
				</div>
				<table id="p" >
					
				</table>
				</section>
				<script type="text/javascript">
				function gamepSearch(){
					$.ajax({
						type: 'GET',
						url : "gpsearch.do",
						data : $("form[name=search-form]").serialize(),
						success : function(result){
							//테이블 초기화
							$('#p').empty();
							var pr = '<tr><th>게임이름</th><th>게임장르</th><th>긍정 평가</th></tr>';
							
							if(result.length>=1){								
								result.forEach(function(item){
									pr +='<tr>';
										pr += "<td>"+item.name+"</td>";
									/*str += "<td>"+item.genre+"</td>";
									str += "<td>"+item.positive+"</td>"; */
									pr+ ="</tr>";			
				        		})
				        		$('#p').append(pr);
							}
						}
					})
				}
				</script>
											
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