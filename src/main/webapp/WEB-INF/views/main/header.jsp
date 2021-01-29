<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- Top Navigation -->
		<nav
			class="background-transparent background-transparent-hightlight full-width sticky" style="background:white;">
			<div class="s-12 l-2 header-logo">
				<a href="/" class="logo"> <!-- Logo White Version --> <img
					class="logo-white"
					src="/resources/assets/img/logo-dark.png" alt="">
					<!-- Logo Dark Version --> <img class="logo-dark"
					src="/resources/assets/img/logo-dark.png" alt="">
				</a>
			</div>
			<div class="top-nav s-12 l-10">
			
				<ul class="right chevron text-dark">
					<li><a href="/">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/classes/classesList.cls">Class</a></li>
					<li><a href="/map/search">Map</a></li>
					<li>
						<a href="/board/list?category_no=3">Community</a>
					</li>
					<li>
						<a href="/board/list?category_no=1">Q&A</a>
					</li>
					<%
						String users_id = "";
						if(session.getAttribute("session_id") != null){
							users_id = (String)session.getAttribute("session_id");
						}
						if (users_id.equals("")){
					%>
						<li><a href="${pageContext.request.contextPath}/app/user/login.jsp"><b>Login</b></a></li>
					<%		
						} else {
					%>
						<li>
							<%
								if(session.getAttribute("authority") == null){
									session.setAttribute("authority", 0);
								}
								if(((int)session.getAttribute("authority") == 1)){
							%>
								<a href="${pageContext.request.contextPath}/app/user/myPage_studio.jsp?cat=5"><b><%=users_id %></b></a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/app/user/myPage_studio.jsp?cat=5">MyPage</a></li>
									<li><a href="${pageContext.request.contextPath}/app/user/myStudio.jsp?cat=6">MyStudio</a></li>
									<li><a href="${pageContext.request.contextPath}/user/UserLogout.use?cat=7">Logout</a></li>
								</ul>
								<%		
									}else{
								%>
								<a href="${pageContext.request.contextPath}/app/user/myPage.jsp?cat=5"><b><%=users_id %></b></a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/app/user/myPage.jsp?cat=5">MyPage</a></li>
									<li><a href="${pageContext.request.contextPath}/user/UserLogout.use?cat=6">Logout</a></li>
								</ul>
								<%
									}
								%>
						</li>
					<%
						}
					%>
				</ul>
			</div>
		</nav>