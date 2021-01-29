<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="com_wrapper">
	<c:choose>
		<c:when test="${list != null and fn:length(list) > 0}">
			<c:forEach var="board" items="${list}">
				<c:forEach var="b_bean" items="${board.postVO}" varStatus="stat">
					<c:set var="today_year" value="${today.year + 1900}"></c:set>
					<c:set var="today_day" value="${today.date}"></c:set>
					<fmt:parseDate var="parsedDate" value="${b_bean.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:parseNumber var="post_year" value="${parsedDate.year + 1900}"/>
					<fmt:parseNumber var="post_date" value="${parsedDate.date}"/>
					<c:set var="dayDiff" value="${today_day - post_date}" />
					<c:set var="isToday" value="${(today_year eq post_year) and (dayDiff eq 0)}" />
					<div class="com_contents">
						<c:set var="url" value="${board.image_path}" />
						<c:set var="length" value="${fn:length(url)}"/>
						<c:choose>
							<c:when test="${empty url}">
								<a class="goGet" href="${b_bean.post_no}">
									<img src="/resources/assets/img/board_images/noimage_thumbnail.png" alt="게시판 썸네일"/>
								</a>
							</c:when>
							<c:when test="${fn:indexOf(url,'video_') != -1 }">
								<c:set var="videoPath" value="${fn:substring(url,index+6,length)}"/>
								<iframe src="${videoPath}" width="100%" height="50%" class="note-video-clip"></iframe>
							</c:when>
							<c:when test="${fn:indexOf(url,'board_') != -1 }">
								<c:set var="boardPath" value="${fn:substring(url,index+6,length)}"/>
								<a class="goGet" href="${b_bean.post_no}">
									<img src="/resources/files/summernote/${boardPath}" onerror="this.src='/resources/assets/img/board_images/noimage_thumbnail.png'" alt="게시판 썸네일"/>
								</a>							
							</c:when>
						</c:choose>
						<div class="com_title">
							<a class="goGet" href="${b_bean.post_no}">
								${b_bean.post_title}
							</a>
							<c:if test="${b_beans.reply_count > 0 }">
								<span style="color: red; font-weight: bold; margin-left: 5px;">[${b_beans.reply_count}]</span>
							</c:if>
							<c:if test="${isToday}">
								<span class="material-icons fiber_new">fiber_new</span>
							</c:if>
						</div>
						<div class="com_writer id_notice notice${stat.index}">
						작성자 : 
							<%-- 공방주일 때 --%>
							<c:if test="${board.users_authority == 2}">
								<i class="icon-sli-star" style="color:#000; font-size: 12px; vertical-align: middle; font-weight: bold;"></i>
							</c:if>
							<%-- 관리자일 때 --%>
							<c:if test="${board.users_authority == 3}">
								<i class="icon-sli-key" style="color:#000; font-size: 12px; vertical-align: middle; font-weight: bold;"></i>
							</c:if>
							<c:if test="${b_bean.users_id eq session_id }">
								<span class="id">${b_bean.users_id}</span>								
							</c:if>
							<c:if test="${b_bean.users_id ne session_id }">
								<span class="id" onclick="showmenu(${stat.index})">${b_bean.users_id}</span>
								<ul style="display:none;">
									<li><a href="${pageContext.request.contextPath}/board/BoardListByUser.bo?cat=${b_bean.category_no}&page=1&users_id=${b_bean.getUsers_id()}&filter=board">게시글보기</a></li>
									<li><a href="javascript:checkSessionIdBeforeSendMessage('${b_bean.users_id}')">쪽지보내기</a></li>
									<li><a href="javascript:checkSessionIdBeforeSendMessage('admin')">신고하기</a></li>
								</ul>
							</c:if>
						</div>
						<div class="com_date_num">
							<span class="date">
								<c:choose>
									<c:when test="${isToday}">
										<fmt:formatDate var="boardPostDate" value="${parsedDate}" pattern="HH:mm"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate var="boardPostDate" value="${parsedDate}" pattern="yyyy.MM.dd"/>
									</c:otherwise>
								</c:choose>
								${boardPostDate}
							</span>
							<span class="num">조회  ${b_bean.post_views}</span>
						</div>
					</div>
					</c:forEach>				
				</c:forEach>
		</c:when>
		<c:otherwise>
			<span>등록된 게시물이 없습니다.</span>
		</c:otherwise>
	</c:choose>
</div>
<form action="${pageContext.request.contextPath}/message/MessageWrite.msg" method="GET" name="sendmessageform">
	<input type="hidden" name="reply_id" value="" />
</form>

<div style="clear:both;"></div>