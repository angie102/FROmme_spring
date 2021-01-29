<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	session.setAttribute("session_id", "test22");
%>
<table class="bbsListTbl" summary="번호, 제목, 조회수, 작성일 등을 제공하는 표">
	<caption class="hdd">공지사항 목록</caption>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">아이디</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
			<c:if test="${cri.users_authority == 3}">
				<th scope="col">비공개</th>
				<c:if test="${cri.category_no == 1}">
					<th scope="col">삭제</th>
				</c:if>
			</c:if>
		</tr>
	</thead>
	<tbody>
		<form action="#" method="POST" name="listform">
			<c:choose>
				<c:when test="${list != null and fn:length(list) > 0}">
					<c:forEach var="board" items="${list}">
						<c:forEach var="b_bean" items="${board.postVO}">
							<c:set var="today_year" value="${today.year + 1900}"></c:set>
							<c:set var="today_day" value="${today.date}"></c:set>
							<fmt:parseDate var="parsedDate" value="${b_bean.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:parseNumber var="post_year" value="${parsedDate.year + 1900}"/>
							<fmt:parseNumber var="post_date" value="${parsedDate.date}"/>
							<c:set var="dayDiff" value="${today_day - post_date}"/>
							<c:set var="isToday" value="${(today_year eq post_year) and (dayDiff eq 0)}" />
							<tr>
								<td>${b_bean.post_no}</td>
								<td class="tit_notice">
									<a href="${b_bean.post_no}" class="goGet">
										${b_bean.post_title}
									</a>
									<c:if test="${board.getReply_count() > 0}">
										<span style="color:red; font-weight:bold;">[${board.reply_count}]</span>								
									</c:if>
									<c:if test="${isToday}">
										<span class="material-icons fiber_new">fiber_new</span>								
									</c:if>
								</td>
								<td class="id_notice notice${b_bean.post_no}" style="position:relative;">
									<%-- 공방주일 때 --%>
									<c:set var="authority" value="${board.users_authority}" />
									<c:set var="users_id" value="${b_bean.users_id}" />
									<c:if test="${authority == 2}">
										<i class="icon-sli-star" style="color:#000; font-size: 12px; vertical-align: middle; font-weight: bold;"></i>
									</c:if>
									<%-- 관리자일 때 --%>
									<c:if test="${authority == 3}">
										<i class="icon-sli-key" style="color:#000; font-size: 12px; vertical-align: middle; font-weight: bold;"></i>
									</c:if>
									<c:if test="${users_id eq session_id }">
										<span class="id">${users_id}</span>								
									</c:if>
									<c:if test="${users_id != session_id }">
										<span class="id" onclick="showmenu(${b_bean.post_no})">${users_id}</span>
										<ul style="display:none;">
											<li><a href="/board/listByUser?users_id=${users_id}&field=board&amount=15">게시글보기</a></li>
											<li><a href="javascript:checkSessionIdBeforeSendMessage('${users_id}')">쪽지보내기</a></li>
											<li><a href="javascript:checkSessionIdBeforeSendMessage('admin')">신고하기</a></li>
										</ul>
									</c:if>
								</td>
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
								<c:if test="${cri.users_authority == 3}">
									<td><input type="checkbox" style="width:17px; height:17px;" name="pub_check" value="${b_bean.post_no}" ${b_bean.post_pub eq 2 ? 'checked' : ''}/></td>
									<c:if test="${category_no == 1}">
										<td><input type="checkbox" style="width:17px; height:17px;" name="del_check" value="${b_bean.post_no}"/></td>
									</c:if>
								</c:if> 
							</tr>
						</c:forEach>       		
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</form>
		<form action="/message/write" method="GET" name="sendmessageform">
			<input type="hidden" name="reply_id" value="" />
		</form>
	</tbody>
</table>