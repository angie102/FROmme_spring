<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko-KR">

<%-- templete include --%>
<%@ include file="../main/src_forInclude.jsp"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>FROmme - 내 손으로 만드는 특별한 순간</title>
    
  <link rel="stylesheet" href="${cssURL}board-style.css">
</head>

<% session.setAttribute("usersId", "test1"); %>

<body class="size-1140">
  <!-- HEADER -->
	<header role="banner" class="position-absolute">
	<%@ include file="../main/header_index.jsp" %>
	</header>
  <!-- MAIN -->
    <!-- Main Header -->
    <header>
      <div class="carousel-default owl-carousel carousel-main carousel-nav-white background-dark text-center">

        <div class="item">
          <div class="s-12">
            <img src="../assets/img/header.jpg" alt="">
            <div class="carousel-content">
              <div class="content-center-vertical line">
                <div class="margin-top-bottom-70">
                  <!-- Title -->
                  <h1 class="text-white margin-top-bottom-40 text-size-60 text-line-height-1">내 손으로 만드는<br> 특별한 순간</h1>

                  <div class="s-12 m-10 l-8 center">
                    <p class="text-white text-size-14 margin-bottom-10">지금 내 주변에서 수강할 수 있는 클래스를 찾아보세요</p>
                    
                  </div>
                  <!-- search bar -->

                  <div class="s-12 m-12 l-6 center">
                    <!-- search bar 세부 옵션  -->
                    <div class="margin-bottom-10 background-white-hightlight">
                      <form action="${pageContext.request.contextPath}/map/FindGongBangList.map" name="contactForm" class="customform" method="get">
                        <input class="search" name="search" type="search" placeholder="건물명, 도로명, 지번으로 검색하세요." onkeydown="JavaScript:enter_Check();">
                        <p class="text-white map_guide">
	                    	사용방법은 
	                    	<a href="#" id="modal_btn">
	                    		<span class="material-icons" style="color:yellow !important; font-size:16px;">help</span>
	                    	</a>
	                    	아이콘을 클릭하세요
	                    </p>
                      </form>
								
                    </div>
                    <div class="s-12 m-12 l-6 center">
                      <!-- search button -->
                      <div class="line">
                        <a class="button button-white-stroke s-12 " href="javascript:searchaddress()">Start Search</a>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="s-12">
            <img src="../assets/img/banner/event_banner2.png" alt="background-dark">
          </div>
        </div>

        <div class="item">
          <div class="s-12">
            <img src="../assets/img/banner/event_banner1.png" alt="background-dark">
          </div>
        </div>

      </div>

    </header>

 	 <!-- FOOTER -->
 	<footer>
	<%@ include file="../main/footer.jsp" %>
	</footer>
	<%-- <%@ include file="../map/mapUseGuideModal.jsp" %> --%>
  <script type="text/javascript" src="${pageContext.request.contextPath}/app/assets/js/map.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/app/assets/js/board.js"></script>
  <script>
	window.onload = function() {
		addEvent();
  	}
  </script>
</body>
</html>