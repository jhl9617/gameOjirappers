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
   <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />      <%--css 스타일 가져오기--%>
   <link rel="stylesheet" href="<c:url value="/resources/css/table.css"/>" />      <%--css 스타일 가져오기--%>
   <style type="text/css">
      #updateinfo {
         display: none;
      }
      #deleteinfo {
         display: none;
      }

      #gamedetd {
         margin: 0 auto;
         padding: 0;
      }

      #gamedetd h3{
         margin: 0 auto;
         padding: 0;
      }

      #table55 *{
         border: 0;
      }

      * {
         color: #fef2dc !important;
      }

      .button:hover {
         color: #000 !important;
      }

      #pctable * {
         border: none;
         list-style: none;
         margin: 0 auto;
         padding: 0;
      }

      #pctable {
         border-collapse: separate;
         border-spacing: 20px;
      }

      #pctable tr{
         border-bottom: 2px;
         border-top: 2px;
         color: #666B85;
         text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
         pointer-events: none;
      }
      #pctable tr th{
         color: #a0a0a0;
         background: #282828;
         border-bottom: 4px ;
         border-right: 1px;
         border-left: 2px;
         border-bottom: #ece8dd;
         padding: 5px;
         text-align: center;
         text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
         vertical-align: middle;
         background-clip: padding-box;
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

      //게시판이동
      function movegameboard(){
         location.href = "movegameboard.do?appid=${ requestScope.game.appid }&page=1";
      }
   </script>

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
         <div align="center">


            <header class="main">
               <h1 align="center">${ requestScope.game.name }</h1>
            </header>
            <div>
               <c:if test="${ requestScope.game.genre != null}">
                  <h3 align="center">
                     <script type="text/javascript">
                        function genrenReplace(){
                           var genreRe = '${ requestScope.game.genre }';
                           genre = genreRe.replace(/\//g, "#").slice(0,-1);
                           document.write("#"+genre);
                        }
                        genrenReplace();
                     </script></h3>
               </c:if>
               <c:if test="${ requestScope.game.genre == null}"></c:if>
               <c:if test="${ requestScope.game.initialprice != 0}">
                  <h2 align="center" >출시된 가격:[${ requestScope.game.initialprice }원]</h2>
                  <c:if test="${ requestScope.game.discountrate !=0}">
                     <h2 align="center">할인율:[${ requestScope.game.discountrate }%]</h2>
                     <h2 align="center">할인된 가격:[${ requestScope.game.finalprice }원]</h2></c:if>
                  <c:if test="${ requestScope.game.discountrate == 0}">
                     <h2 align="center">할인중이 아닙니다!</h2>
                  </c:if>
               </c:if>

            </div>
            <div>
               <div align="center">
                  <span class="button" onclick="genreSearch();">장르로 검색하세요</span>
                  <span class="button" onclick="priceSearch();">가격으로 검색하기</span>
                  <br>
                  <div id="genreSearch" style="display: none;">
                     <table style="border:none;">
                        <form name="search-genre" autocomplete="off">
                           <td colspan='3' style="background-color:#000; color:#C0C0C0; border:none;">
                              <input type="text" name="keyword" placeholder="검색할 장르를 입력하세요" />
                           </td>
                           <td align="center"  style="width:150px; background-color:#000; border:none;">
                              <input type="button" onclick="gamegSearch();" id="searchgenre" value="검색">
                           </td>
                        </form>
                     </table>
                     <table id="genre" >
                     </table>
                  </div>
                  <br>

                  <div id="priceSearch" style="display: none;">
                     <table style="border:none;">
                        <form name="search-price" autocomplete="off">
                        <td style="height: 100%; padding: 0;">
                           <div id="languagediv">
                              <c:if test="${requestScope.game.supported_languages != null}">
                                 <h3 style="margin: 0;">${requestScope.game.supported_languages}</h3>
                              </c:if>
                              <c:if test="${requestScope.game.supported_languages == null}">
                                 <h3 style="margin: 0;">지원하는 언어가 없습니다!</h3>
                              </c:if>
                           </div>
                        </td>
                        <td style="height: 100%; padding: 0;">
                           <c:if test="${requestScope.game.pcminimum != null}">
                              <div style="float: left;">
                                 <h3 style="margin: 0;">
                                    <script type="text/javascript">
                                       pcminimumReplace();

                                       function pcminimumReplace() {
                                          var pcminimumRe = '${requestScope.game.pcminimum}';
                                          pcminimum = pcminimumRe.replace("<strong>최소:</strong>", "");
                                          document.write(pcminimum);
                                       }
                                    </script>
                                 </h3>
                              </div>
                           </c:if>
                           <c:if test="${requestScope.game.pcminimum == null}">
                              <h3 style="margin: 0;">게임 최소 사양이 없습니다!</h3>
                           </c:if>
                        </td>
                        <td style="height: 100%; padding: 0;">
                           <c:if test="${requestScope.game.pcrecommended != null}">
                              <div style="float: left;">
                                 <h3 style="margin: 0;">
                                    <script type="text/javascript">
                                       pcrecommendedReplace();

                                       function pcrecommendedReplace() {
                                          var pcrecommendedRe = '${requestScope.game.pcrecommended}';
                                          pcrecommended = pcrecommendedRe.replace("<strong>권장:</strong>", "");
                                          document.write(pcrecommended);
                                       }
                                    </script>
                                 </h3>
                              </div>
                           </c:if>
                           <c:if test="${requestScope.game.pcrecommended == null}">
                              <h3 style="margin: 0;">게임의 권장 사양이 없습니다!</h3>
                           </c:if>
                        </td>
                        </tr>
                        ch-price" autocomplete="off">
                           <td style="width:200px; color:#C0C0C0; background-color:#000; border:none;">
                              <select name="type">
                                 <option selected value="initialprice">출시가격</option>
                                 <option value="finalprice">할인된가격</option>
                                 <option value="discountrate">할인율</option>
                              </select>
                           </td>
                           <td  colspan='3' style="background-color:#000; color:#C0C0C0; border:none;">
                              <input type="text" id="keyword" name="keyword" placeholder="검색할 가격 또는 할인율을 입력하세요" />
                           </td>
                           <td align="center"  style="width:150px; background-color:#000; border:none;">
                              <input type="button" onclick="gamepSearch();" id="searchprice" value="검색">
                           </td>
                        </form>
                     </table>
                     <table id="price" >
                     </table>
                  </div>


               </div>
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
                     if('#keyword'==""){
                        alert("검색어를 입력해주세요!");
                        $("#search").focus();
                        return;
                     }
                     $.ajax({
                        type: 'GET',
                        url : "ggsearch.do",
                        data : $("form[name=search-genre]").serialize(),
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
                        data : $("form[name=search-price]").serialize(),
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
            </div>


            <%--즐찾기능 START (230407) --%>
            <%-- <form id="like_form">
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
                       }   //error
                     });
                }
                </script> --%>
            <%--즐찾기능 END --%>


            <%-- <h3 align="center">메타크리틱 게임 평점: [${ requestScope.game.meta }]</h3> --%>
            <!-- <h3 align="center">게임 카테고리:
                  <script type="text/javascript">
                  function categoryReplace(){
                     var category = '${ requestScope.game.category }';
                     category = category.replace(/\//g, "<br>#").slice(0,-1);
                     document.write("#"+category);
                     }
                     categoryReplace();
                  </script></h3> -->
         </div>
         <div style="display:flex; height: 500px;">
            <div style="width: 100%; text-align: center;">
            <video height="100%" width="80%" style="margin:0;" autoplay muted>
               <source src="${ requestScope.game.movie }" type="video/mp4">
            </video>
            </div>
            <div style="text-align: center;">
            <table id="table55" style="margin: 0; display: inline-block;">
               <tr>
                  <td colspan="2"><a href="${ requestScope.game.headerimg }">
                     <img style="padding: 0px; margin: 0;" alt="${ requestScope.game.name }의게임대표이미지" src="${ requestScope.game.headerimg }" ></a>
                  </td>
               </tr>
               <tr>
                  <td id="gamedetd">
                     <h3 align="center">메타크리틱 게임 평점: [${ requestScope.game.meta }]</h3>
                     <h3 align="center">게임 출시일: [${ requestScope.game.releasedate }]</h3>
                     <c:if test="${ requestScope.game.positive !=0 }">
                        <h3 align="center">positive: [${ requestScope.game.positive }]</h3>
                     </c:if>
                     <c:if test="${ requestScope.game.positive ==0 }">
                     </c:if>
                     <c:if test="${ requestScope.game.ccu !=0}">
                        <h3 align="center">Concurrent Users: [${ requestScope.game.ccu }]</h3>
                     </c:if>
                     <c:if test="${ requestScope.game.ccu == 0}"></c:if>
                     <h3 align="center">개발자:[${ requestScope.game.developer }]</h3>
                     <h3 align="center">배급사:[${ requestScope.game.publisher }]</h3>
                  </td>
                  <td style="text-align: center;">
                     <div class="menudiv"><a href="${ pageContext.servletContext.contextPath }/goChallenge.do?appid=${ requestScope.game.appid }" class="button">도전과제 보러가기</a></div>
                     <div class="menudiv">   <a href="${ pageContext.servletContext.contextPath }/youTube.do?appid=${ requestScope.game.appid }" class="button">유튜브 영상 보러가기</a></div>
                     <div class="menudiv">   <a href="${ pageContext.servletContext.contextPath }/movegameboard.do?appid=${ requestScope.game.appid }&page=1" class="button">유저게시판 가기</a></div>
                     <div class="menudiv">   <a href="https://www.inven.co.kr/webzine/news/" class="button">게임뉴스 보러 가기</a></div>
                  </td>
               </tr>
            </table>
            </div>
         </div>

         <!-- 게임 소개글 -->
         <div>
            <c:choose>
               <c:when test="${ requestScope.game.description != null}">
                  <header class="major">
                     <h2> 게임 소개글 </h2>
                  </header>
                  <div style="float:left;">
                     <h3 align="left">${ requestScope.game.description }</h3>
                  </div>
               </c:when>
               <c:otherwise></c:otherwise>
            </c:choose>
         </div>

         <div align="center">
            <table id="pctable">
               <tr>
                  <th colspan="2"><h2 align="center" style="margin: 0px;"> 게임 지원언어 </h2></th>
               </tr>
               <tr>
                  <td colspan="2">
                     <c:if test="${ requestScope.game.supported_languages != null}">
                        <h3>${ requestScope.game.supported_languages }
                        </h3>
                     </c:if>
                     <c:if test="${ requestScope.game.supported_languages == null}">
                        <h3>지원하는 언어가 없습니다!</h3>
                     </c:if>
                     <br><br><br><br>
                  </td>
               </tr>

               <tr>
                  <th><h2 align="center" style="margin: 0px;"> 게임 최소사양 </h2></th>
                  <th><h2 align="center" style="margin: 0px;"> 게임 권장사양 </h2></th>
               </tr>
               <tr>
                  <td>
                     <c:if test="${ requestScope.game.pcminimum != null}">
                        <div>
                           <h3 style="margin: 0px; padding: 0px;">
                              <script type="text/javascript">
                                 pcminimumReplace();
                                 function pcminimumReplace(){
                                    var pcminimumRe = '${ requestScope.game.pcminimum }';
                                    pcminimum = pcminimumRe.replace("<strong>최소:</strong>", "");
                                    document.write(pcminimum);
                                 }
                              </script></h3></div>
                     </c:if>
                     <c:if test="${ requestScope.game.pcminimum == null}">
                        <h3 >게임 최소 사양이 없습니다!</h3>
                     </c:if>

                  </td>
                  <td>
                     <c:if test="${ requestScope.game.pcrecommended != null}">
                        <div>

                           <h3>
                              <script type="text/javascript">
                                 pcminimumReplace();
                                 function pcrecommendedReplace(){
                                    var pcrecommendedRe = '${ requestScope.game.pcrecommended }';
                                    pcrecommended = pcrecommendedRe.replace("<strong>권장:</strong>", "");
                                    document.write(pcrecommended);
                                 }
                              </script>
                           </h3>
                        </div>
                     </c:if>
                     <c:if test="${ requestScope.game.pcrecommended == null}">
                        <h3 >게임의 권장 사양이 없습니다!</h3>
                     </c:if>
                  </td>
               </tr>

            </table>
         </div>


         <div align="center">
            <header class="major">
               <h2><a onclick="movegameboard();"> 유저게시판 </a></h2>
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

         </div>
         <!-- <section>
                  <h2>댓글 처리할거임</h2>
                  <p></p>
                  <p></p>

                  <hr class="major" />
               </section>    -->



      </div>

      <c:import url="/WEB-INF/views/common/footer.jsp"/>

   </div>
</div>

<!-- Scripts -->
<!--   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script> -->
</body>
</html>