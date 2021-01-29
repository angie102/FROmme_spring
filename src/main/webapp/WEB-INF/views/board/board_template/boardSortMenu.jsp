<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="board_title">${category_name}</div>
<div class="sort_wrapper">
	<ul>
		<c:if test="${(pageMaker.cri.category_no == 3) or (pageMaker.cri.category_no == 4)}">
			<li>
				<i><a href="text" class="listtype material-icons sort_icon ${(pageMaker.cri.list_type == null) or (pageMaker.cri.list_type == 'text') ? 'selected' : ''}">article</a></i>
			</li>
			<li>
	      		<i><a href="image" class="listtype material-icons sort_icon ${(pageMaker.cri.list_type == 'image') ?  'selected' : ''}">perm_media</a></i>
	      	</li>
		</c:if>
		<c:set var="url" value="/board/list${pageMaker.cri.getListLink()}" />
      	<li class="sort">
      		<a href="date" class="sortTag ${(fn:toLowerCase(pageMaker.cri.sort) == 'date') ? 'selected' : ''}">최신순</a>
      	</li>
      	<li class="sort">
      		<a href="views" class="sortTag ${(fn:toLowerCase(pageMaker.cri.sort) == 'views') ? 'selected' : ''}">조회수</a>
		</li>
	</ul>
</div>