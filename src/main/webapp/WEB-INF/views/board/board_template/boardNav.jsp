<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${(category_no == 3) or (category_no == 4)}">
		<nav class="nav">
			<div>Community</div>
			<a href="/board/list?category_no=3" class="${(category_no == 3) ? 'selected' : ''}">내 작품 자랑</a>
			<a href="/board/list?category_no=4" class="${(category_no == 4) ? 'selected' : ''}">중고 거래</a>
		</nav>
	</c:when>
	<c:otherwise>
		<nav class="nav">
			<div>Q&A</div>
			<a href="/board/list?category_no=1" class="${(category_no == 1) ? 'selected' : ''}">공지 사항</a>
			<a href="/board/list?category_no=2" class="${(category_no == 2) ? 'selected' : ''}">문의 사항</a>
		</nav>
	</c:otherwise>
</c:choose>