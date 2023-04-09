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
						function genrenReplace(){
						var genreRe = '${ requestScope.game.genre }';
						genre = genreRe.replace(/\//g, "#").slice(0,-1);
						document.write("#"+genre);
						}
						genrenReplace();
						</script>					
						</h3>


					<%--즐찾기능 START (230407) --%>
					<form id="like_form">
					<c:url var = "like" value="/.do">
						<c:param name="appid" value="${appid}"/>
						<c:param name="login_user" value="${sessionScope.loginUser.user_id}"/>
					</c:url>
					
					<c:if test="${!empty sessionScope.loginUser}">
						<input type="button" value="즐겨찾기" onclick="return like()" >
						<div id="like_result">${game.appid}</div> 
					</c:if>
					</form>
					
					<script type="text/javascript">
					function like(){
					  $.ajax({
						    url: "asl아직안만들었음!ksdf.do ",
						    type: "POST",
						    cache: false,
						    dataType: "json",
						    data: $('#like_form').serialize(),   //아이디가 like_form인 곳의 모든 정보를 가져와  파라미터 전송 형태(표준 쿼리형태)로 만들어줌
						    success: 
						    function(data){      					
						    	alert("즐겨찾기 성공!") ;  
					               $("#like_result").html(data.like);  //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
						    },   //success
						    
						    error: 
						    function (request, status, error){  
						      alert("즐겨찾기 실패")                  
						    }	//error
						  });
					}
					</script>
					<%--즐찾기능 END --%>
                  

						<h3 align="center">메타크리틱 게임 평점: [${ requestScope.game.meta }]</h3>
						<h3 align="center">게임 카테고리: [${ requestScope.game.category }]</h3>
						<h3 align="center">게임 출시일: [${ requestScope.game.releasedate }]</h3>
						<h3 align="center">게임 좋아요수: [${ requestScope.game.positive }]</h3>
						<h3 align="center">전일 게임접속사 수: [${ requestScope.game.ccu }]</h3>
						<h3 align="center">게임 간단한 설명: [${ requestScope.game.short_description }]</h3>
						<h2 align="center">개발자:[${ requestScope.game.developer }]</h2>
						<h2 align="center">배급사:[${ requestScope.game.publisher }]</h2>
						
						
					</header>
				</section>
				<section>
					<!--게임사진 들어갈 부분 -->
					<header class="major">
						<h2> ${ requestScope.game.name }의 대표이미지 </h2>
					</header>
					<span style="all: none;">
					<a href="${ requestScope.game.headerimg }"><img alt="${ requestScope.game.name }의게임대표이미지" src="${ requestScope.game.headerimg }" style="max-width: 100%; height: auto;"></a>
					</span>					
					

				</section>
				
				<section style="all: none;">
					<div class="content" >
					<header class="major">
						<h2> 동영상 </h2>
					</header>
					<video autoplay muted>
					  <source src="${ requestScope.game.movie }" type="video/mp4">
					 </video>						
					</div>
					<span class="object">
							<div style=" border:1px solid black; ">
							<h2 align="center" >출시된 가격:[${ requestScope.game.initialprice }원]</h2>
							<h2 align="center">할인율:[${ requestScope.game.discountrate }%]</h2>
							<h2 align="center">할인된 가격:[${ requestScope.game.finalprice }원]</h2>
							<h2 align="center"><a href="${ pageContext.servletContext.contextPath }/goChallenge.do?appid=${ requestScope.game.appid }" class="button">도전과제 링크</a></h2>
							</div>
					</span>
				</section>			
				
				<section style="all: none;">
				
					<div>
						<header class="major">
						<h2> 게임 플랫폼 </h2>
					</header>
					<div>
						<h3 align="center">${ requestScope.game.platform }</h3>
					</div>
					</div>
					<div>			
					<header class="major">
						<h2> 게임 지원언어 </h2>
					</header>
					<div style="float:left; border:1px solid black;">		
					<h3>${ requestScope.game.supported_languages }</h3>
					</div>
					</div>	
				
				
					<div>				
						<header class="major">
							<h2> 게임 최소사양 </h2>
						</header>
						<div style="float:left;">		
						<p>${ requestScope.game.pcminimum }</p>
						</div>
					</div>
				
					<div>
					<header class="major">
							<h2> 게임 권장사양 </h2>
						</header>
						<div style="float:left;">		
						<p>${ requestScope.game.pcrecommended }</p>
						</div>
					</div>
				</section>
				
				<!-- 게임 소개글 -->
				<section>				
					<header class="major">
						<h2> 게임 소개글 </h2>
					</header>
				<div style="float:left;">		
					<p>${ requestScope.game.description }</p>
				</div>
				</section>
				
				
				<section>
				<span class="button" onclick="genreSearch();">장르로 검색하세요</span>
				<span class="button" onclick="priceSearch();">가격으로 검색하기</span>
				<div id="genreSearch" style="display: none;">			
				<form name="search-form1" autocomplete="off">
						<input type="text" name="keyword" placeholder="검색할 장르를 입력하세요" />
						<input type="button" onclick="gamegSearch();" id="search" value="검색">
				</form>
					<table id="genre" >
					</table>
				</div>
				
				<div id="priceSearch" style="display: none;">
				<form name="search-form2" autocomplete="off">
						<select name="type">
							<option selected value="initialprice">출시가격</option>
							<option value="finalprice">할인된가격</option>
							<option value="discountrate">할인율</option>					
						</select>
						<input type="text" name="keyword" placeholder="검색할 가격 또는 할인율을 입력하세요" />
						<input type="button" onclick="gamepSearch();" id="search" value="검색">
					</form>
					<table id="price" >
					</table>
				</div>
				
				
				</section>
				<script type="text/javascript">
				function genreSearch(){
					$("#genreSearch").show();
					$("#priceSearch").hide();
				}
				function priceSearch(){
					$("#priceSearch").show();
					$("#genreSearch").hide();
				}
				</script>
				<script type="text/javascript">
							
				
				function gamegSearch(){
					$.ajax({
						type: 'GET',
						url : "ggsearch.do",
						data : $("form[name=search-form1]").serialize(),
						success : function(result){
							//테이블 초기화
							$('#genre').empty();
							var genre = '<tr><th>게임이름</th><th>게임장르</th><th>좋아요</th></tr>';
							
							if(result.length>=1){								
								result.forEach(function(item){
									genre +="<tr><td><a href='moveGameDetail.do?appid="
										+item.appid+ "'>"+item.name+"</td>";
									genre += "<td>"+item.genre.replace(/\//g, ",").slice(0,-1)
									+"</td>";
									genre += "<td>"+item.positive+"</td>";
									genre +="</tr>"			
				        		});
				        		$('#genre').append(genre);
							}
						}
					})
				}
				
				function gamepSearch(){
					$.ajax({
						type: 'GET',
						url : "gpsearch.do",
						data : $("form[name=search-form2]").serialize(),
						success : function(result){
							//테이블 초기화
							$('#price').empty();
							var price = '<tr><td color="red">게임이름</td><td>게임장르</td><td>출시가격</td><td>할인된가격</td><td>할인율</td></tr>';
							if(result.length>=1){								
								result.forEach(function(item){
									price +="<tr><td><a href='moveGameDetail.do?appid="
										+item.appid+ "'>"+item.name+"</td>";
									price += "<td>"+item.genre.replace(/\//g, ",").slice(0,-1)
									+"</td>";
									price += "<td>"+item.initialprice+"</td>";									
									price += "<td>"+item.finalprice+"</td>";
									price += "<td>"+item.discountrate+"</td>";
									price +="</tr>"			
				        		});
				        		$('#price').append(price);
							}
						}
					});
				}
				</script>
				
				
<%-- 				<section>
				<header class="major">
					<h2> 게임리스트2 </h2>
				</header>				
				<div>
					<form name="search-form2" autocomplete="off">
						<input type="number" name="keyword" value="${ requestScope.game.finalprice }" />
						<input type="button" onclick="gamepSearch()" value="초기가:[${ requestScope.game.finalprice }]">
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
						data : "json",
						success : function(data){
							console.log("data : "+data);
							
							var jsonStr = JSON.stringify(data);
							var json = JSON.parse(jsonStr);
							var gp = $('#p').html();
							for ( var i in json.list) {
								gdvalues += "<tr><td><a href='moveGameDetail.do?appid="
								+ json.list[i].appid+ "'>"
								+ json.list[i].name
								+ "</td><td>"+ json.list[i].name.initialprice
								+ "</td><td>"+ decodeURIComponent(json.list[i].finalprice).replace(/\+/gi," ")
								+ "</td><td>"+ json.list[i].discountrate
								+ "</td></tr>";
								}
							}
						});
					}
				</script> --%>
											
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
			<!-- <section>
					<h2>댓글 처리할거임</h2>
					<p></p>
					<p></p>

					<hr class="major" />
				</section>	 -->
						
				
				

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