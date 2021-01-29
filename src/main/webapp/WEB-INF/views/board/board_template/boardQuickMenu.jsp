<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="board-nav s-12 l-10">
	<c:set var="image_path" value="/resources/assets/img/board_images" />
	<ul class="right chevron text-dark category_list">
		<li class="submenu">
			<i>
				<a href="/" class="material-icons home_icons" style="color: #767676;">home</a>
			</i>
		</li>
		<li class="submenu">
			<a href="/">Main</a>
		</li>
		<li>
			<img style="padding:15px 5px 0;" src="${image_path}/btn_nextpage.png" alt="">
		</li>
		<c:choose>
			<c:when test="${(category_no eq 3) or (category_no eq 4)}">		
				<li class="submenu">
					<a href="#" onclick="showList(1)" class="list">Community</a>
					<ul class="menu_1">
						<li><a href="/board/list?category_no=1">Q&A</a></li>
					</ul>
				</li>
				<li>
					<img style="padding:15px 5px 0;" src="${image_path}/btn_nextpage.png" alt="">
				</li>
				<li class="submenu">
					<a href="#" onclick="showList(2)" class="list">${category_name}</a>
					<ul class="menu_2">
						<c:if test="${(category_no eq 3)}">
							<li><a href="/board/list?category_no=4">중고거래</a></li>						
						</c:if>
						<c:if test="${(category_no eq 4)}">
							<li><a href="/board/list?category_no=3">내작품자랑</a></li>						
						</c:if>
					</ul>
				</li>
			</c:when>
			<c:otherwise>
				<li class="submenu">
					<a href="#" onclick="showList(1)" class="list">Q&A</a>
					<ul class="menu_1">
						<li><a href="/board/list?category_no=3">Community</a></li>
					</ul>
				</li>
				<li>
					<img style="padding:15px 5px 0;" src="${image_path}/btn_nextpage.png" alt="">
				</li>
				<li class="submenu">
					<c:if test="${(!empty category_name)}">
						<a href="#" onclick="showList(2)" class="list">${category_name}</a>
						<ul class="menu_2"> 
							<c:if test="${(category_no eq 1)}">
								<li><a href="/board/list?category_no=2">문의사항</a></li>							
							</c:if>
							<c:if test="${(category_no eq 2)}">
								<li><a href="/board/list?category_no=1">공지사항</a></li>							
							</c:if>
						</ul>					
					</c:if>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
