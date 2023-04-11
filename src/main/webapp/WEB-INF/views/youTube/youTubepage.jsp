<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="game" value="${ requestScope.game }" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>youTubepage</title>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />	
<style type="text/css">
	body{
     display:flex;
     flex-direction: column;
     justify-content: center;
     align-items: center;
   }
   .container{
     background-color:beige;
   }
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>


</head>
<body>
<!-- Wrapper -->
<div id="wrapper">
	<!-- Main -->
	<div id="main">
		
		<div class="inner" align="left">
			<!-- Header -->
			<c:import url="/WEB-INF/views/common/menubar.jsp"/>
			<section>
				<form name="form1" method="post" onsubmit="return false;">
			        <input type="text" id="gameYouTube" value="게임 ${requestScope.game.name}" style="display: none;">
			      <%--  <button onclick="fnGetList();" id="name" value="${requestScope.game.name}">가져오기</button> --%>
			        <header>
									<h1>${requestScope.game.name}<br />
										유튜브 영상들!</h1>
									
								</header>
			        
			        
			    </form>
			    <div id="get_view" align="center"></div> 
			    <div id="nav_view" align="center"></div>
			    <script type="text/javascript">
			    fnGetList();
						function fnGetList(sGetToken){			
						var $getval = $("#gameYouTube").val();			
						/* if($getval==""){			
						    alert("게임 관련 유튜브 영상이 없습니다.");			
						    $("#name").focus();			
						    return;			
						} */			
						$("#get_view").empty();			
						$("#nav_view").empty();			
						//https://developers.google.com/youtube/v3/docs/search/list			
						var order = "relevance";			
						var maxResults = "50";			
						var key = "AIzaSyDFgDe7X90Q2hjIstKIr4ts73R8M0NcRnk";
						var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order="+order			
						        + "&q="+ encodeURIComponent($getval) +"&key="+key+"&maxResults="+maxResults;			
						console.log(sGetToken);			
						if(sGetToken != null){			
						    sTargetUrl += "&pageToken="+sGetToken+"";			
						}			
						console.log(sTargetUrl);			
						$.ajax({			
						    type: "POST",			
						    url: sTargetUrl,			
						    dataType: "jsonp",			
						    success: function(jdata) {			
						        console.log(jdata);		
						
						
						        $(jdata.items).each(function(i){
						            $("#get_view").append("<iframe width='560' height='315' src='https://www.youtube.com/embed/"
						            		+this.id.videoId+"'frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
						
						        }).promise().done(function(){			
						            if(jdata.prevPageToken){			
						                $("#nav_view").append('<a href="javascript:fnGetList(\''+jdata.prevPageToken+'\');"><이전페이지></a>');
						
						            }			
						            if(jdata.nextPageToken){			
						                $("#nav_view").append('<a href="javascript:fnGetList(\''+jdata.nextPageToken+'\');"><다음페이지></a>');
						
						            }
						
						        });
						
						    },
						
						    error:function(xhr, textStatus) {
						
						        console.log(xhr.responseText);
						
						        alert("에러");
						
						        return;
						
						    }
						
						});
						
						}
			</script>
			</section>

<%-- <div id=appid value="${appid}">${appid}</div> --%>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
 </div>
 </div> 
</body>
</html>