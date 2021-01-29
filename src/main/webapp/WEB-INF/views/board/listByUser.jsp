<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	session.setAttribute("session_id", "ee");
%>
<!DOCTYPE html>
<html lang="ko-KR">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FROmme - 내 손으로 만드는 특별한 순간</title>
		<%@ include file="../main/src_forInclude.jsp" %>
		<link rel="stylesheet" href="/resources/assets/css/board-style.css">
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
				<div class="board_wrapper">
					<!-- 게시판 목차 -->
					<%@ include file="./board_template/boardNav.jsp" %>
					<!-- 게시판 -->
					<div class="board">
						<%@ include file="./board_template/boardQuickMenu.jsp" %>
						<!-- 게시판 퀵메뉴, 정렬 기능 리스트 -->
						<div class="user_area" style="clear:both; padding-top:15px;">
							<h4 style="text-align:left;">아이디 : ${users_id}</h4>
							<span style="font-size:14px;">총 게시글 : 
								<span style="color:red;">${totalBoardCount}</span>개 ㆍ총 댓글 : 
								<span style="color:red;">${totalReplyCount}</span>개
							</span>				
						</div>
						<div class="sort_wrapper">
							<ul style="float:left !important; margin-top:20px;">
						      	<li class="sort">
						      		<a href="/board/listByUser?users_id=${users_id}&field=reply&amount=15"class="${cri.field == 'reply' ? 'selected' : ''}">댓글단 글</a>
								</li>
								<li class="sort">
						      		<a href="/board/listByUser?users_id=${users_id}&field=board&amount=15" class="${cri.field == 'board' ? 'selected' : ''}">작성글</a>
						      	</li>
							</ul>
						</div>
						<table class="bbsListTbl" summary="번호, 제목, 조회수, 작성일 등을 제공하는 표">
							<caption class="hdd">공지사항 목록</caption>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<c:if test="${field eq 'reply'}">
										<th scope="col">작성자</th> 
									</c:if>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${list != null and fn:length(list) > 0}">
										<c:forEach var="board" items="${list}">
											<c:forEach var="b_bean" items="${board.postVO}" varStatus="stat">
												<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
												<c:set var="today_year" value="${today.year + 1900}"></c:set>
												<c:set var="today_day" value="${today.date}"></c:set>
												<c:set var="today_month" value="${today.month}"/>
												<fmt:parseDate var="parsedDate" value="${b_bean.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:parseNumber value="${parsedDate.year + 1900}" var="post_year"/>
												<fmt:parseNumber value="${parsedDate.date}" var="post_date"/>
												<fmt:parseNumber value="${parsedDate.month}" var="post_month"/>
												<c:set value="${today_month - post_month}" var="monthDiff" />
												<c:set value="${today_day - post_date}" var="dayDiff" />
												<c:set var="isToday" value="${(today_year eq post_year) and (dayDiff eq 0) and (monthDiff eq 0)}" />
												<tr>
													<td>${b_bean.post_no}</td>
													<td class="tit_notice">
														<a class="goGet" href="${b_bean.post_no}">
															${b_bean.post_title}
														</a>
														<c:if test="${board.reply_count > 0}">
															<span style="color:red; font-weight:bold;">[${board.reply_count}]</span>								
														</c:if>
														<c:if test="${isToday}">
															<span class="material-icons fiber_new">fiber_new</span>								
														</c:if>
													</td>
													<c:if test="${filter eq 'reply'}">
														<td><span>${b_bean.users_id}</span></td>
													</c:if>
													<td>
														<c:choose>
															<c:when test="${isToday}">
																<fmt:formatDate var="boardPostDate" value="${parsedDate}" pattern="HH:mm"/>
															</c:when>
															<c:otherwise>
																<fmt:formatDate var="boardPostDate" value="${parsedDate}" pattern="yyyy.MM.dd"/>
															</c:otherwise>
														</c:choose>
														${boardPostDate}
													</td>
													<td>${b_bean.post_views}</td>
												</tr>              		
											</c:forEach>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div style="clear:both;"></div>
						<div class="pagination">
						<c:set var="url" value="/board/listByUser${cri.getListLink()}&users_id=${users_id}" />
						<c:set var="image_path" value="/resources/assets/img/board_images"></c:set>
						<c:set var="pageNum" value="${pageMaker.cri.pageNum}" />
							<c:choose>
								<c:when test="${pageMaker.prev}">
									<a href="${pageMaker.startPage}" class="changePage firstpage pbtn"><img src="${image_path}/btn_firstpage.png" alt="첫 페이지로 이동"></a>
									<a href="${pageNum - 1}" class="changePage prevpage pbtn"><img src="${image_path}/btn_prevpage.png" alt="이전 페이지로 이동"></a>          	
								</c:when>          
							</c:choose>
							<c:if test="${pageNum >= 1}">
								<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<c:choose>
										<c:when test="${i eq pageNum}">
											<a href="#"><span class="pagenum currentpage">${i}</span></a>
										</c:when>
										<c:otherwise>
											<a href="${i}" class="changePage"><span class="pagenum">${i}</span></a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:choose>
								<c:when test="${pageMaker.next}">
									<a href="${pageNum + 1 }" class="changePage nextpage pbtn"><img src="${image_path}/btn_nextpage.png" alt="다음 페이지로 이동"></a>
									<a href="${pageMaker.realEnd}" class="changePage lastpage pbtn"><img src="${image_path}/btn_lastpage.png" alt="마지막 페이지로 이동"></a>                              	
								</c:when>
							</c:choose>
						</div>
					</div>
			</article>
		</main>
		<form action="/board/listByUser" method="GET" name="boardviewbyuserform" id="boardviewbyuserform">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
			<input type="hidden" name="field" value="${pageMaker.cri.field}" />
			<input type="hidden" name="users_id" value="${users_id}" />
		</form>
		<div class="line"></div>
		<!-- FOOTER -->
		<footer>
			<%@ include file="../main/footer.jsp" %>
		</footer>
		<%@ include file="./board_template/loginModal.jsp" %>
		<script> var session_id = "${session_id}"</script>
		<script type="text/javascript" src="/resources/assets/js/board.js"></script>
		<script>
			var userform = $('#boardviewbyuserform');
			
			$('.changePage').on("click", function(e){
				e.preventDefault();
				userform.find("input[name='pageNum']").val($(this).attr("href"));
				userform.submit();
			});
			
			$('.goGet').on("click", function(e){
				e.preventDefault();
				if(checkSession()){
					userform.append("<input type='hidden' name='post_no' value='"+ $(this).attr("href") +"'>");
					userform.attr("action", "/board/view");
					userform.submit();				
				}
			});
		</script>
	</body>
</html>