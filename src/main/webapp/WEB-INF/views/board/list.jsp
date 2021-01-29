<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko-KR">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FROmme - 내 손으로 만드는 특별한 순간</title>
		<%@ include file="../main/src_forInclude.jsp" %>
		<link rel="stylesheet" href="/resources/assets/css/board-style.css">
		<link rel="stylesheet" href="/resources/assets/css/board-imagelist-style.css">
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
			<article>
				<c:set var="category_no" value="${pageMaker.cri.category_no}"></c:set>
				<c:set var="category_name" value="${pageMaker.cri.category_name}"></c:set>
				<div class="board_wrapper">
					<!-- 게시판 목차 -->
					<%@ include file="./board_template/boardNav.jsp" %>
					<!-- 게시판 -->
					<div class="board">
						<!-- 게시판 퀵메뉴, 정렬 기능 리스트 -->
						<%@ include file="./board_template/boardQuickMenu.jsp" %>
						<%@ include file="./board_template/boardSortMenu.jsp" %>
						<jsp:useBean id="today" class="java.util.Date" />
						<c:choose>
							<c:when test="${pageMaker.cri.list_type == 'image'}">
								<!-- 게시글 이미지 리스트 -->
								<%@ include file="./board_template/boardImageList.jsp" %>
							</c:when>
							<c:otherwise>
								<!-- 게시글 텍스트 리스트 -->
								<%@ include file="./board_template/boardTextList.jsp" %>							
							</c:otherwise>						
						</c:choose>
						<!-- 검색창, 페이징 처리 -->
						<%@ include file="./board_template/boardSearchAndPaging.jsp" %>
					</div>
			</article>
		</main>
		<div class="line"></div>
		<!-- FOOTER -->
		<footer>
			<%@ include file="../main/footer.jsp" %>
		</footer>
		<%@ include file="./board_template/loginModal.jsp" %>
	</body>
	<form id="actionForm" method="GET">
		<input type="hidden" name="category_no" value="${pageMaker.cri.category_no}" />
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" name="sort" value="${pageMaker.cri.sort}" />
		<input type="hidden" name="list_type" value="${pageMaker.cri.list_type}" />
		<input type="hidden" name="field" value="${pageMaker.cri.field}" />
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
		<input type="hidden" name="category_name" value="${pageMaker.cri.category_name}" />
	</form>
	<script> var session_id = "${session_id}"</script>
	<script type="text/javascript" src="/resources/assets/js/board.js"></script>
	<script>
	
		var actionForm = $('#actionForm');
		
		$('.changePage').on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$('.goGet').on("click", function(e){
			e.preventDefault();
			if(checkSession()){
				actionForm.append("<input type='hidden' name='post_no' value='"+ $(this).attr("href") +"'>");
				actionForm.attr("action", "/board/view");
				actionForm.submit();				
			}
		});
		$('.listtype').on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='list_type']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$('.sortTag').on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='sort']").val($(this).attr("href"));
			actionForm.submit();
		});
	</script>
</html>