<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FROmme - 내 손으로 만드는 특별한 순간</title>
		<%@ include file="../main/src_forInclude.jsp" %>
		<link rel="stylesheet" href="/resources/assets/css/map.css">
		<link rel="stylesheet" href="/resources/assets/css/board-style.css">
		<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Playfair+Display&subset=latin,latin-ext'>
		<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800&subset=latin,latin-ext'>
	</head>
	<body class="size-1140">
		<!-- HEADER -->
		<header role="banner" class="position-absolute">
			<%@ include file="../main/header.jsp" %>
		</header>
		<!-- slide banner -->
		<!-- MAIN -->
		<main role="main">
  			<!-- Main Header -->
			<header>
			  <%@ include file="../main/banner.jsp" %>
			</header>
		</main>
		<div class="line"></div>
		<!-- MAIN -->
		<main role="main">
			<!-- Content -->
			<article style="width:80%; margin:0 auto;">
				<div class="map_header" >
					<div class="map_text">
						주소를 입력해 보세요.<br/>검색하신 주소에 등록되어 있는 공방들을 찾아 드립니다.
					</div>
					<div class="map_search">				
						<form name="searchMapForm" action="/map/search">
							<input class="input_search" type="search" name="search" placeholder="주소를 입력해 주세요." value="${search}" onkeydown="JavaScript:enter_Check();"/>
							<input class="btn_bbs btn_search" type="button" value="검색" onclick="submitform()"/>				
						</form>
					</div>
				</div>				
				<div class="map_wrap">
					<div class="searchMapList" style="display:none;">
						<p>공방 목록</p>
						<ul class="map_list">
						</ul>
						<div class="pagination">
						</div>
					</div>
					<div id="map" style="width:100%;"></div>				
				</div>
				<p class="map_zoom">
					<a href="javascript:setZoomable(false)" class="btn_map btn_false">지도 확대/축소 끄기</a>
					<a href="javascript:setZoomable(true)" class="btn_map btn_true clicked">지도 확대/축소 켜기</a>
				</p>
			</article>
		</main>
  		<div class="line"></div>
		<!-- FOOTER -->
		<footer>
		  <%@ include file="../main/footer.jsp" %>
		</footer>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a354b9eb9cb42ab99114924570a7b8d&libraries=services"></script>
		<script type="text/javascript" src="/resources/assets/js/map.js"></script>
	</body>
	<script>
		window.onload = function(){
			searchform(1);
		}
	</script>
</html>