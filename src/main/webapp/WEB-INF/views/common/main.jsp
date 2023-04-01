<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html>
<head>

<title>겜지라퍼</title>

<meta charset="utf-8" />
<title>GameOjirap</title>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />		<%--css 스타일 가져오기--%>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(function(){
$.ajax({
    url: "gametop6.do",
    type: "post",
    dataType: "json",
    success: function(data){
       console.log("success : " + data);    // Object 로 출력
//		select * 
//		from ( select rownum rnum, name, headerimg, short_description , releasedate,ccu,meta
//				from ( select * from game order by ccu desc ))
//		where rnum >= 1 and rnum <=6
       // 받은 Object => string 으로 바꿈
       var jsonStr = JSON.stringify(data);
       // sting => json 객체로 바꿈
       var json = JSON.parse(jsonStr);
       
       // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
       var gtvalues = $('#toplist').html();

		for(var i in json.list){
			
			gtvalues += "<article style='float:left;' ><a href='#' class='image'><img src='<c:url value='"
                + decodeURIComponent(json.list[i].headerimg).replace(/\+/gi, "/") +"'/>' alt='"+json.list[i].name+"' /></a>"
                +"<h3>"+json.list[i].name+"</h3><p>"
                +decodeURIComponent(json.list[i].short_description).replace(/\+/gi, " ")+"</p><p>"
                +json.list[i].ccu+"</p>"
                +"<ul class='actions'><li><a href='#' class='button'>More</a></li></ul></article>";
			
			
		}

       
       $('#toplist').html(gtvalues);
    	},
    	error: function(jqXHR, textStatus, errorThrown){
       	console.log("gametop6.do error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
    	}
 	});
});

$(function(){
	$.ajax({
	    url: "gamenew6.do",
	    type: "post",
	    dataType: "json",
	    success: function(data){
	       console.log("success : " + data);    // Object 로 출력
//			select * 
//			from ( select rownum rnum, name, headerimg, short_description , releasedate
//					from ( select * from game where releasedate is not null order by releasedate desc  ))
//			where rnum >= 1 and rnum <=6
	       // 받은 Object => string 으로 바꿈
	       var jsonStr = JSON.stringify(data);
	       // sting => json 객체로 바꿈
	       var json = JSON.parse(jsonStr);
	       
	       // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
	       var gnvalues = $('#newlist').html();

			for(var i in json.list){
				
				gnvalues += "<article style='float:left;' ><a href='#' class='image'><img src='<c:url value='"
	                + decodeURIComponent(json.list[i].headerimg).replace(/\+/gi, "/") +"'/>' alt='"+json.list[i].name+"' /></a>"
	                +"<h3>"+json.list[i].name+"</h3><p>"
	                +decodeURIComponent(json.list[i].short_description).replace(/\+/gi, " ")+"</p><p>"
	                +json.list[i].releasedate+"</p>"
	                +"<ul class='actions'><li><a href='#' class='button'>More</a></li></ul></article>";
				
				
			}

	       
	       $('#newlist').html(gnvalues);
	    	},
	    	error: function(jqXHR, textStatus, errorThrown){
	       	console.log("gamenew6.do error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
	    	}
	 	});
	});
	
$(function(){
	$.ajax({
	    url: "gamedisctop.do",
	    type: "post",
	    dataType: "json",
	    success: function(data){
	       console.log("success : " + data);    // Object 로 출력
//			select * 
//			from ( select rownum rnum, name, initialprice, finalprice ,ccu ,discountrate
//					from ( select * from game where discountrate is not null order by discountrate desc  ))
//			where rnum >= 1 and rnum <=10
	       var jsonStr = JSON.stringify(data);
	       // sting => json 객체로 바꿈
	       var json = JSON.parse(jsonStr);
	       
	       // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
	       var gdvalues = $('#disclist').html();
	       /* job.put("name", game.getName());
			job.put("initialprice", game.getInitialprice());
			job.put("finalprice", game.getFinalprice());
			job.put("ccu", game.getCcu());
			job.put("discountrate", game.getDiscountrate()); */
			for(var i in json.list){
				//decodeURIComponent(json.list[i].finalprice)
				gdvalues += "<tr><td><a href='moveGameDetail.do?appid=" + json.list[i].appid+"'>"
						+json.list[i].name
						+"</td><td>" + decodeURIComponent(json.list[i].initialprice)
	                     +"</td><td>" + decodeURIComponent(json.list[i].finalprice).replace(/\+/gi, " ")
	                     +"</td><td>" + json.list[i].ccu
	                     +"</td><td>" + json.list[i].discountrate
	                     +"</td></tr>";
				
				
			}

	       
	       $('#disclist').html(gdvalues);
	    	},
	    	error: function(jqXHR, textStatus, errorThrown){
	       	console.log("gamedisctop.do error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
	    	}
	 	});
	});

</script>

</head>
	<!-- Scripts -->
<%--	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.3.min.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/browser.min.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/breakpoints.min.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/util.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js">"></script>
--%>
<body class="is-preload">
<c:if test="${!empty message}">
   <script>
      alert("${message}");
      location.href = "main.do";
   </script>
</c:if>
<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
	<div id="main">
		<div class="inner">
			<!-- Header -->
			<c:import url="/WEB-INF/views/common/menubar.jsp"/>
			<!-- Banner -->
			<section id="banner">
				<div class="content">
					<header>
						<h1>겜지라퍼<br />
							게임 이야기 하기</h1>
						<p></p>
					</header>
					<p></p>
					<ul class="actions">
						<li><a href="${pageContext.servletContext.contextPath}/moveGameDetail.do" class="button big">Learn More</a></li>
					</ul>
				</div>
				<span class="image object">
				<img src="<c:url value="/resources/images/main1.webp"/>" alt="" />
				</span>
			</section>
			

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Best Game</h2>
				</header>
				<div id="toplist" class="posts">
					
				</div>
				
				<!-- 페이징 처리 -->
				<c:import url="/WEB-INF/views/common/page.jsp"/>
			</section>
			
			<!-- Section -->
			<section>
			
				<header class="major">
					<h2> New Game </h2>
				</header>
					<div id="newlist" class="posts">
					
				</div>
					<!-- 페이징 처리 -->
				<c:import url="/WEB-INF/views/common/page.jsp"/>
			</section>

	
	<!-- 순위 아래  -->
			<section>
				<header class="major">
					<h2> 할인율 </h2>
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
					<th>Peak Today</th>
					<th>Peak Today</th>
					<th>Peak Today</th>
					<th><img src="" class="flag" alt="" width="18" height="18"> Price</th>
				</tr>
				</thead>
				<tbody>
				<table id="disclist" border="1" cellspacing="0">
				<tr class="app" data-appid="2050650" data-cache="1679986748">
					<!-- <td class="applogo">
					<a href="/app/2050650/charts/" tabindex="-1" aria-hidden="true">
					<img src="" alt="">
					</a>
					</td> -->
					<th><a href="" class="css-truncate">GameName</a></th>
					<th class="text-center green">초기 가격</th>
					<th class="text-center">최종가격</th>
					<th class="text-center">전날 최고 동시 접속사</th>
					<th class="text-center">할인율</th>
				</tr>
				</table>
				</tbody>
				</table>

				</div>
				
				</section>
				
				
				
<%-- 	<!-- 유저게시판  -->				
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
						<a href="">번호
					</th>
					<th>제목</th>
					<th>조회수</th>
				</tr>
				</thead>
				<tbody>
				<tr class="boraddd">

					<th><a href="" class="css-truncate">번호</a></th>
					<th class="text-center green">제목</td>
					<th class="text-center">조회수</td>
				</tr>
				</tbody>
				</table>
				</div>
			
			</section> --%>
			



		</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</div>
</body>
</html>