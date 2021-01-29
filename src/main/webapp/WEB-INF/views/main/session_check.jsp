<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- Top Navigation -->
	<c:if test="${empty session_id}">
		<script>
			alert('로그인 후 이용해주세요.');
			location.href = "${pageContext.request.contextPath}/user/UserLogin.use";
		</script>
	</c:if>