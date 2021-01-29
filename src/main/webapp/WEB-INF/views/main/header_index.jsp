<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- Top Navigation -->
		<nav
			class="background-transparent background-transparent-hightlight full-width sticky">
			<div class="s-12 l-2 header-logo">
				<a href="/" class="logo"> <!-- Logo White Version --> <img
					class="logo-white"
					src="/resources/assets/img/logo.png" alt="">
					<!-- Logo Dark Version --> <img class="logo-dark"
					src="/resources/assets/img/logo-dark.png" alt="">
				</a>
			</div>
			<div class="top-nav s-12 l-10">
				
				<ul class="right chevron ">
					<li><a href="/">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/classes/ClassesList.cls?sort_type=all&sort_by=new">Class</a></li>
 					<li><a href="/map/search">Map</a></li>
					<li>
						<a href="/board/list?category_no=3">Community</a>
					</li>
					<li>
						<a href="/board/list?category_no=1">Q&A</a>
					</li>
					<c:if test="${empty session_id}">
						<li><a href="${pageContext.request.contextPath}/app/user/login.jsp"><b>Login</b></a></li>
					</c:if>
					<c:if test="${empty authority}">
						<c:set var="authority" value="0" />
					</c:if>
					<c:if test="${!empty session_id}">
						<c:set var="users_id" value="${session_id }" />
						<li>
							<c:choose>
								<c:when test="${authority eq 1}">
									<a href="${pageContext.request.contextPath}/app/user/myPage.jsp?cat=5"><b>${users_id}</b></a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/app/user/myPage.jsp?cat=5">MyPage</a></li>
										<li><a href="${pageContext.request.contextPath}/user/UserLogout.use?cat=6">Logout</a></li>
									</ul>
								</c:when>
								<c:when test="${authority eq 2}">
									<a href="${pageContext.request.contextPath}/app/user/myPage_studio.jsp?cat=5"><b>${users_id}</b></a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/app/user/myPage_studio.jsp?cat=5">MyPage</a></li>
										<li><a href="${pageContext.request.contextPath}/studio/StudioViewAction.std?cat=6">MyStudio</a></li>
										<li><a href="${pageContext.request.contextPath}/user/UserLogout.use?cat=7">Logout</a></li>
									</ul>								
								</c:when>
								<c:when test="${authority eq 3}">
									<a href="${pageContext.request.contextPath}/admin/indexData.adm"><b>${users_id}</b></a>
									<ul>
										<li><a href="${pageContext.request.contextPath}/admin/indexData.adm">AdminPage</a></li>
										<li><a href="${pageContext.request.contextPath}/user/UserLogout.use?cat=7">Logout</a></li>
									</ul>						
								</c:when>
							</c:choose>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>