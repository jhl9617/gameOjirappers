<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html>
<head>

   <title>겜지라퍼</title>

   <meta charset="utf-8" />
   <title>GameOjirap</title>
   <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />      <%--css 스타일 가져오기--%>
   <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>

</head>
<!-- Scripts -->
<%--   <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.3.min.js">"></script>
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
            <!-- <table id="gameAll" >
            </table> -->
            <table style="border:none;">
               <form name="search-game" autocomplete="no">
                  <td style="width:200px; background-color:#000;border:none;">
                     <select name="type" style="color:Lightgray;">
                        <option  selected value="name">게임이름으로 검색</option>
                        <option value="genre">게임장르로 검색</option>
                        <option value="initialprice">출시가격으로 검색</option>
                        <option value="finalprice">할인된가격으로 검색</option>
                        <option value="discountrate">할인율로 검색</option>
                     </select>
                  </td>
                  <td  colspan='3' style="background-color:#000;border:none;">
                     <input type="text" style="align:center; width:100%; color: #000" name="keyword" placeholder="입력하세요" />
                  </td>
                  <td align="center"  style="width:150px; background-color:#000; border:none;">
                     <input type="button"  align="center" style="width:100px;" onclick="gameAllSearch()" id="search" value="검색">
                     <!-- <input type="button"  align="center" style="width:100px;" onclick="searchBoard()" id="search2" value="검색"> -->
                  </td>
               </form>
            </table>
            <table id="gameAll" >
            </table>
            <table id="page"></table>
         </div>
         <script type="text/javascript">
            function gameAllSearch(){
               $.ajax({
                  type: 'GET',
                  url : "gameAllsearch.do",
                  data : $("form[name=search-game]").serialize(),
                  success : function(result){
                     //테이블 초기화
                     $('#gameAll').empty();
                     var ge = '<tr><td color="red">게임이름</td><td>게임내용</td><td>게임장르</td><td>좋아요</td><td>출시가격</td><td>할인율</td><td>할인된가격</td><td>어제 접속자수</td><td>출시일</td><td>평점</td></tr>';


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
                           ge += "<td>"+item.discountrate+"%</td>";
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
         <!-- <script type="text/javascript">
         function searchBoard(keyword, pageIndex){  // 검색어, 현재 페이지 번호
             $.ajax({
                 type : 'get',
                 url : "gameAllsearch.do",
                 dataType : "json",
                 data : {
                     keyword : keyword,
                     pageIndex : pageIndex
                 },
                 success : function(res) {
                     $("#gameAll").empty();
                     $("#page").remove();

                     var resultList = res.boardSearchList;
                     var resultCnt = res.boardSearchListCnt;
                     var ge2 = "";
                     if(resultCnt > 0){
                         // 게시물
                         for(var i in resultList) {
                             ge2 +="<tr><td><a href='moveGameDetail.do?appid="
                                 +item.appid
                                 + "'>"+item.name+"</td>";
                              ge2 += "<td>"+item.short_description+"</td>";
                              ge2 += "<td>"+item.genre.replace(/\//g, ",").slice(0,-1)
                              +"</td>";
                              ge2 += "<td>"+item.positive+"</td>";
                              ge2 += "<td>"+item.initialprice+"</td>";
                              ge2 += "<td>"+item.discountrate+"%</td>";
                              ge2 += "<td>"+item.finalprice+"</td>";
                              ge2 += "<td>"+item.ccu+"</td>";
                              ge2 += "<td>"+item.releasedate+"</td>";
                              ge2 += "<td>"+item.meta+"</td>";
                              ge2 +="</tr>"     // 게시물 디자인에 따라 변경해서 사용
                         }
                         $("#gameAll").append(ge);

                         // 페이징
                         paginationInfo(searchKeyword, res.pageIndex, res.recordCountPerPage, res.pageSize, resultCnt, "searchBoard", "gameAll");
                     }else{
                         ge2 += "검색결과 오류!";  // 게시물 디자인에 따라 변경해서 사용
                         $("#gameAll").append(ge);
                     }
                 }
             });
         }


         function paginationInfo(kyword, pageIndex, recordCountPerPage, pageSize, resultCnt, fnName, listName){
             var totalPageCount = parseInt(((resultCnt-1)/recordCountPerPage) + 1);

             var firstPageNoOnPageList = pageIndex-(pageIndex%10)+1;
             if(pageIndex%10==0) firstPageNoOnPageList = pageIndex-10+1;
             var lastPageNoOnPageList = firstPageNoOnPageList+pageSize-1
             if(lastPageNoOnPageList > totalPageCount) lastPageNoOnPageList = totalPageCount;

             var prevPage = firstPageNoOnPageList-1;
             if(prevPage < 1) prevPage = 1;
             var nextPage = lastPageNoOnPageList+1;
             if(nextPage > totalPageCount) nextPage = totalPageCount;

             var html = "<p class=\"pagenation "+listName+"_page\">";
             if(pageSize < totalPageCount){  // 이전, 처음 버튼이 생기는 경우
                 html += "<button class=\"prev end\" onclick=\""+fnName+"('"+kyword+"', "+1+");\">처음</button>";
                 html += "<button class=\"prev\" onclick=\""+fnName+"('"+kyword+"', "+prevPage+");\">이전</button>";
             }
             for(var j=firstPageNoOnPageList; j<=lastPageNoOnPageList; j++){
                 if(j == pageIndex) html += "<a href=\"javascript:;\" class=\"on\">"+j+"</a>";
                 else html += "<a href=\"javascript:;\" onclick=\""+fnName+"('"+kyword+"', "+j+");\">"+j+"</a>";
             }
             if(pageSize < totalPageCount){  // 다음, 마지막 버튼이 생기는 경우
                 html += "<button class=\"next\" onclick=\""+fnName+"('"+kyword+"', "+nextPage+");\">다음</button>";
                 html += "<button class=\"next end\" onclick=\""+fnName+"('"+kyword+"', "+totalPageCount+");\">맨 마지막</button>";
             }
             html += "</p>";

             $("."+listName).after(html);
         }
         [출처] ajax로 리스트뽑고, 페이징처리 하는법|작성자 Luna
         </script> -->
         <%-- <section id="banner">
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
         </section> --%>





         <!-- Section -->
         <section>
            <header class="major">
               <h2>Best Game</h2>
            </header>
            <div id="toplist" class="posts">

            </div>
            <div id="nav_view" align="center"></div>
         </section>
         <script type="text/javascript">
            $(function(){
               $.ajax({
                  url: "gametop6.do",
                  type: "post",
                  dataType: "json",
                  success: function(data){
                     console.log("success : " + data);    // Object 로 출력
                     // 받은 Object => string 으로 바꿈
                     var jsonStr = JSON.stringify(data);
                     // sting => json 객체로 바꿈
                     var json = JSON.parse(jsonStr);

                     // for in 문 : 인덱스 변수를 0에서 자동 1씩 증가시키는 루프문
                     var gtvalues = $('#toplist').html();

                     for(var i in json.list){

                        gtvalues += "<article style='float:left;' ><a href='moveGameDetail.do?appid=" + json.list[i].appid+"' class='image'><img src='<c:url value='"
                            + decodeURIComponent(json.list[i].headerimg).replace(/\+/gi, "/") +"'/>' alt='"+json.list[i].name+"' /></a>"
                                +"<h3><a href='moveGameDetail.do?appid="+json.list[i].appid+"'>"+json.list[i].name+"</a></h3>"
                                +"<a href='moveGameDetail.do?appid=" + json.list[i].appid+"'><p>"
                                +decodeURIComponent(json.list[i].short_description).replace(/\+/gi, " ")+"</p></a>"
                                +"<a href='moveGameDetail.do?appid=" + json.list[i].appid+"'><p>어제 접속자수: "
                                +json.list[i].ccu+"명</p></a>"
                                +"<a href='moveGameDetail.do?appid=" + json.list[i].appid+"'><p>좋아요: "
                                +json.list[i].positive+"♥</p></a>"
                                +"<ul class='actions'><li><a href='moveGameDetail.do?appid="+json.list[i].appid+"' class='button'>More</a></li></ul></article>";

                     }


                     /*  $('#toplist').html(gtvalues); */
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
                                +"<a href='moveGameDetail.do?appid=" + json.list[i].appid+"'><h3>"+json.list[i].name+"</h3></a>"
                                +"<a href='moveGameDetail.do?appid=" + json.list[i].appid+"'><p>"
                                +decodeURIComponent(json.list[i].short_description).replace(/\+/gi, " ")+"</p></a><a href='moveGameDetail.do?appid=" + json.list[i].appid+"'><p>출시일:"
                                +json.list[i].releasedate+"</p></a>"
                                +"<ul class='actions'><li><a href='moveGameDetail.do?appid=" + json.list[i].appid+"' class='button'>More</a></li></ul></article>";


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
                     <tr align="center"><td class='table-title' colspan='2'>game name</td>
                        <td>출시가격</td><td>할인율</td><td>할인한가격</td></table>


                  </thead>
                  </tbody>
               </table>
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
                        gdvalues +="<tr align='center'><td colspan='2'><a href='moveGameDetail.do?appid=" + json.list[i].appid+"'>"
                                +json.list[i].name
                                +"</td><td>" + decodeURIComponent(json.list[i].initialprice)
                                +"원</td><td>" + json.list[i].discountrate
                                +"%</td><td>" + decodeURIComponent(json.list[i].finalprice)
                                +"원</td></tr>";

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