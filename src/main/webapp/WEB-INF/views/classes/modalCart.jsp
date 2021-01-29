<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 장바구니 팝업창 --%>
<div id="cart-popup" class="cart-popup">
	<div class="cart-popup-wrapper popup-wrapper">
		<div class="cart-popup-content popup-content">
			<div class="padding text-center">
				<div class="margin-bottom-20">
					<p class="text-size-20">클래스를 장바구니에 담았습니다.</p>
					<p>장바구니로 바로 가시겠습니까?</p>
				</div>
				<%-- 팝업창 외부 클릭시 팝업창 닫기 --%>
				<input type="button" class="button background-primary text-white" value="계속 구경하기" onclick="$('.cart-popup-wrapper').hide();"> 
				<input type="button" class="button background-primary text-white" value="장바구니 바로가기" onclick="goCart()">

			</div>
		</div>
	</div>
</div>
