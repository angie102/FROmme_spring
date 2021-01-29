<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="white_bg"></div>
<div class="login_modal_wrap" style="display:none;">
	<div class="login_modal_close"><a href="#">close</a></div>
	<div class="login_modal_wrapper">
		<div class="login_modal_content">
			<div class="padding text-center">
				<div class="margin-bottom-20">
					<p class="text-size-20">로그인이 되어 있지 않습니다.</p>
					<p>로그인 페이지로 이동하시겠습니까?</p>
				</div>
				<%-- 팝업창 외부 클릭시 팝업창 닫기 --%>
				<input type="button"
					class="button background-primary text-white"
					value="로그인 페이지로 이동"
					onclick="location.href='${pageContext.request.contextPath}/app/user/login.jsp'"> 
			</div>
		</div>
	</div>
</div>