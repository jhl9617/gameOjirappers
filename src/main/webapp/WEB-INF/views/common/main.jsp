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
			<div>
				<header class="major">
					<h2> 게임검색하기 </h2>
				</header>	
				<table id="gameAll" >
				</table>
				<div class="paginate" id="paging">
  </div>
<script>
  var pageNum = 1 ;  //현재 페이지 번호
  var totalPageCnt = 0 ; //전체 페이지 수
  var totalCnt = 0;  //전체 글 수
  var listCnt = 10;  //한 화면에 보여질 리스트 수
  var pageSet = 10;  // 페이징 부부의 카운트 수
  var searchString = ""; //검색
$(function(){
   searchList();  //목록 조회 함수 호출
});
 
  //정보 조회
searchList = function(){
  var startNum = (pageNum -1) * listCnt;  //현재 페이지 번호를 가지고 시작 위치를 구한다.    
  var parameter = {
    "SearchType" : $("#searchType").val() + ""
    ,"SearchString" : $("#searchString").val() + ""
    ,"startNum" : startNum + ""
    ,"endNum" : listCnt + ""        
    }
  util.data.getDatafromUrl("/process/p_list.jsp", parameter, searchListCallback); //호출 주소는 적당히 알아서...
  }
   
searchListCallback = function(resultData){
    $("#listCont").empty(); //리스트 내용을 지움
    if (resultData.list != null){
      totalCnt = resultData.Cnt;
      util.list.setListContent(resultData,"#listCont", "#listTmpl");  //util.list.setListContent(데이터, 대상 오브젝트, 템플릿스크립트 오브젝트);                   
    }
    util.list.paging("#paging", pageNum, listCnt, resultData.Cnt , "searchList()", "pageNum"); //페이징 처리
  }
   
</script>
							
				<div>
					<form name="search-form1" autocomplete="off">
						<select name="type">
							<option selected value="name">검색 내용 선택</option>
							<option value="name">게임이름</option>
							<option value="genre">게임장르</option>
							<option value="initialprice">출시가격</option>
							<option value="finalprice">할인된가격</option>
							<option value="discountrate">할인율</option>							
						</select>
						<input type="text" name="keyword" placeholder="입력하세요" />
						<input type="button" onclick="gameAllSearch()" id="search" value="검색">
					</form>
				</div>				
				</div>
				<script type="text/javascript">
				function gameAllSearch(){
					$.ajax({
						type: 'GET',
						url : "gameAllsearch.do",
						data : $("form[name=search-form1]").serialize(),
						success : function(result){
							//테이블 초기화
							$('#gameAll').empty();
							var ge = '<tr><td color="red">게임이름</td><td>게임내용</td><td>게임장르</td><td>좋아요</td><td>출시가격</td><td>할인된가격</td><td>어제 접속자수</td><td>출시일</td><td>평점</td></tr>';
							
							
							if(result.length>=1){								
								result.forEach(function(item){
									ge +="<tr><td><a href='moveGameDetail.do?appid="
										+item.appid
										+ "'>"+item.name+"</td>";
									ge += "<td>"+item.short_description+"</td>";
									ge += "<td>"+item.genre.replace(/\//g, ",").slice(0,-1)
									+"</td>";
									ge += "<td>"+item.positive+"</td>";
									ge += "<td>"+item.initialprice+"</td>";									
									ge += "<td>"+item.finalprice+"</td>";
									ge += "<td>"+item.ccu+"</td>";
									ge += "<td>"+item.releasedate+"</td>";
									ge += "<td>"+item.meta+"</td>";
									ge +="</tr>"			
				        		});
				        		$('#gameAll').append(ge);
							}
							
						}
					});
				}
				
				
				</script>
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
			<script type="text/javascript">
			$(function(){
				$.ajax({
				    url: "gametop6.do",
				    type: "post",
				    dataType: "json",
				    success: function(data){
				       console.log("success : " + data);    // Object 로 출력
//						select * 
//						from ( select rownum rnum, name, headerimg, short_description , releasedate,ccu,meta
//								from ( select * from game order by ccu desc ))
//						where rnum >= 1 and rnum <=6
				       // 받은 Object => string 으로 바꿈
				       var jsonStr = JSON.stringify(data);
				       // sting => json 객체로 바꿈
				       var json = JSON.parse(jsonStr);
				       
				       // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
				       var gtvalues = $('#toplist').html();

						for(var i in json.list){
							
							gtvalues += "<article style='float:left;' ><a href='#' class='image'><img src='<c:url value='"
				                + decodeURIComponent(json.list[i].headerimg).replace(/\+/gi, "/") +"'/>' alt='"+json.list[i].name+"' /></a>"
				                +"<h3><a href='${pageContext.servletContext.contextPath}/moveGameDetail.do?appid="+json.list[i].appid+"'>"+json.list[i].name+"</a></h3><p>"
				                +decodeURIComponent(json.list[i].short_description).replace(/\+/gi, " ")+"</p><p>"
				                +json.list[i].ccu+"</p>"
				                +"<ul class='actions'><li><a href='moveGameDetail.do?appid="+json.list[i].appid+"' class='button'>More</a></li></ul></article>";
				               
						}

				       
				       $('#toplist').html(gtvalues);
				    	},
				    	error: function(jqXHR, textStatus, errorThrown){
				       	console.log("gametop6.do error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
				    	}
				 	});
				});
			</script>
			
			<!-- Section -->
			<section>
			
				<header class="major">
					<h2> New Game </h2>
				</header>
					<div id="newlist" class="posts">
					
				</div>
					<!-- 페이징 처리 -->
					<c:set var="url" value="/gnlist.do.do"/>
				<c:import url="/WEB-INF/views/common/page.jsp"/>
			</section>
			<script type="text/javascript">
			$(function(){
				$.ajax({
				    url: "gamenew6.do",
				    type: "post",
				    dataType: "json",
				    success: function(data){
				       console.log("success : " + data);    // Object 로 출력

				       var jsonStr = JSON.stringify(data);
				       // sting => json 객체로 바꿈
				       var json = JSON.parse(jsonStr);
				       
				       // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
				       var gnvalues = $('#newlist').html();

						for(var i in json.list){
							
							gnvalues += "<article style='float:left;' ><a href='moveGameDetail.do?appid=" + json.list[i].appid+"' class='image'><img src='<c:url value='"
				                + decodeURIComponent(json.list[i].headerimg).replace(/\+/gi, "/") +"'/>' alt='"+json.list[i].name+"' /></a>"
				                +"<h3>"+json.list[i].name+"</h3><p>"
				                +decodeURIComponent(json.list[i].short_description).replace(/\+/gi, " ")+"</p><p>"
				                +json.list[i].releasedate+"</p>"
				                +"<ul class='actions'><li><a href='moveGameDetail.do?appid=" + json.list[i].appid+"%"+"' class='button'>More</a></li></ul></article>";
							
							
						}

				       
				       $('#newlist').html(gnvalues);
				    	},
				    	error: function(jqXHR, textStatus, errorThrown){
				       	console.log("gamenew6.do error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
				    	}
				 	});
			});
			</script>

	
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
				<tbody>
				<thead>
				<!-- <tr>
					<th class="table-title" colspan="2">
						<a href="#">
						<span class="hide-small">GameName </span>Releases
						<svg version="1.1" width="24" height="24" viewBox="0 0 16 16" class="octicon octicon-arrow-right" aria-hidden="true">
						<path d="M8.22 2.97a.75.75 0 0 1 1.06 0l4.25 4.25a.75.75 0 0 1 0 1.06l-4.25 4.25a.751.751 0 0 1-1.042-.018.751.751 0 0 1-.018-1.042l2.97-2.97H3.75a.75.75 0 0 1 0-1.5h7.44L8.22 4.03a.75.75 0 0 1 0-1.06Z">
						</path> 
						</svg>
						</a>
						game name
					</th>
					<th>초기 가격</th>
					<th>최종가격</th>
					<th>전일 접속</th>
					<th><img src="" class="flag" alt="" width="18" height="18"> 할인율</th>
				</tr> -->
				<table id="disclist">
				<tr><td class='table-title' colspan='2'>game name</td>
				<td>초기 가격</td><td>최종가격</td><td>전일 접속</td><td>할인율</td></td></table>
				
				
				</thead>
				</tbody>
				</table>
				<!-- <table id="disclist" border="1" cellspacing="0">
				<tr class="app" data-appid="2050650" data-cache="1679986748">
				 
				<tr>
					<th><a href="" class="css-truncate">GameName</a></th>
					<th class="text-center green">초기 가격</th>
					<th class="text-center">최종가격</th>
					<th class="text-center">전날 최고 동시 접속사</th>
					<th class="text-center">할인율</th>
				</tr>
				</table> -->

				</div>
				
				</section>
				<script type="text/javascript">
				$(function(){
					$.ajax({
					    url: "gameDiscTop.do",
					    type: "post",
					    dataType: "json",
					    success: function(data){
					       console.log("success : " + data);    // Object 로 출력

					       var jsonStr = JSON.stringify(data);
					       // sting => json 객체로 바꿈
					       var json = JSON.parse(jsonStr);
					       
					       // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
					       var gdvalues = $('#disclist').html();

							for(var i in json.list){
								gdvalues +="<tr><td colspan='2'><a href='moveGameDetail.do?appid=" + json.list[i].appid+"'>"
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
				
				

		</div>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
	</div>
</div>
</body>
</html>