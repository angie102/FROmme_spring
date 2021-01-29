<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cssURL" value="/resources/assets/css" />
<c:set var="jsURL" value="/resources/assets/js" />
<c:set var="imgURL" value="/resources/img" />
<c:set var="totalPrice" value="0" />


<!DOCTYPE html>
<html lang="ko-KR">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- templete include --%>
<%@ include file="../main/src_forInclude.jsp"%>

<!-- import for cart.jsp -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="${cssURL}/class-style.css">
<link rel="stylesheet" href="${cssURL}/cart-style.css">
<script src="${jsURL}/classes-script.js"></script>

<head>
<title>FROmme - 내 손으로 만드는 특별한 순간</title>
</head>

<body>
	<!-- HEADER -->
	<header role="banner" class="position-absolute">
		<%@ include file="../main/header.jsp"%>
	</header>
	<div class="margin-bottom-70 "></div>
	<hr>
	<div></div>

	<section>
		<div class="cart-wrapper">
			<div class="margin-left-right-80 margin-m-left-right-10">
				<div class="page-title">
					<div class="text-center">
						<div style="margin: 140px 70px;">
							<h1>장바구니</h1>
						</div>
					</div>
				</div>
				<div class="padding">




					<c:choose>
						<c:when test="${list != null and fn:length(list) > 0 }">
							<div class="shopping-cart">

								<div class="column-labels margin-left-right-15">
									<label class="product-image">Image</label> 
									<label class="product-details">Product</label> 
									<label class="product-price">가격</label> 
									<label class="product-quantity">수량</label> 
									<label class="product-removal">Remove</label> 
									<label class="product-line-price">합계</label>
								</div>
								<c:forEach var="cart" items="${list}" varStatus="status">
									<div class="product">
										<span hidden="hidden">${cart.getCartNo() }</span> <input class="product_cart_no" hidden="hidden" value="${cart.getCartNo()}">
										<div class="product-image">
											<img src="${imgURL }/class_thumbnail/classes_thumbnail_${cart.getClassesNo()}.jpg" alt="${cart.getClassesName() }" />
										</div>
										<div class="product-details">
											<input hidden="hidden" value="${cart.getCartNo() }">
											<div class="product-title">${cart.getClassesName() }</div>
											<p class="product-description">[ 수강일 : ${fn:substring(cart.getChoiceDate(),0, 11) }]</p>
										</div>
										<div class="product-price">${cart.getClassesPrice() }</div>
										<div class="product-quantity">
											<input type="number" value="${cart.getCartQuantity() }" min="1">
										</div>
										<div class="product-removal">
											<input type="button" class="remove-product" value="삭제">
										</div>
										<div class="product-line-price">${cart.getCartSumPrice() }</div>
									</div>
									<c:set var="totoalPrice" value="${totoalPrice+cart.getCartSumPrice() }" />
								</c:forEach>
								<div class="margin-top-50">
									<div class="totals">
										<%--
										<div class="totals-item">
											<label>Subtotal</label>
											<div class="totals-value" id="cart-subtotal">0</div>
										</div>
										<div class="totals-item">
											<label>Tax (5%)</label>
											<div class="totals-value" id="cart-tax">3.60</div>
										</div>
										<div class="totals-item">
											<label>Shipping</label>
											<div class="totals-value" id="cart-shipping">15.00</div>
										</div>
										--%>
										<div class="totals-item totals-item-total margin-bottom-30">
											<label>결제 예정금액</label>
											<div class="totals-value h3" id="cart-total"></div>
										</div>
										<div class="margin right">
											<input id="paymentProcess_button" type="button" class="button background-dark text-size-16" value="클래스 신청하기" onclick="goPay();">
										</div>
									</div>
								</div>
							</div>

						</c:when>

						<c:otherwise>
							<div class="text-center">
								<p>장바구니가 비었습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

		</div>
	</section>
	<form action="/classes/payList" method="post" name="cartForm">
	<input name="usersId" value="${sessionId }" type="hidden">
	<input name="totalPrice" value="" type="hidden">
	</form>

	<div class="margin-top-60"></div>

	<!-- FOOTER -->
	<footer>
		<%@ include file="../main/footer.jsp"%>
	</footer>

</body>

<script>
	/**
	 * 장바구니 이벤트 script
	 */
	/* Set rates + misc */
	var taxRate = 10;
	var shippingRate = 0;
	var fadeTime = 300;
	recalculateCart();

	/* Assign actions */
	$('.product-quantity input').change(function() {
		updateQuantity(this);
	});

	$('.product-removal input').click(function() {
		removeItem(this);

	});

	/* Recalculate cart */
	function recalculateCart() {
		var subtotal = 0;

		/* Sum up row totals */
		$('.product').each(function() {
			subtotal += parseInt($(this).children('.product-line-price').text());
		});

		/* Calculate totals */
		// var tax = subtotal * taxRate;
		// var shipping = (subtotal > 0 ? shippingRate : 0);
		// var total = subtotal + tax + shipping;
		var total = subtotal;

		/* Update totals display */
		$('.totals-value').fadeOut(fadeTime, function() {
			// $('#cart-subtotal').html(subtotal.toFixed(0));
			// $('#cart-tax').html(tax.toFixed(0));
			// $('#cart-shipping').html(shipping.toFixed(0));
			$('#cart-total').html(total.toFixed(0));
			if (total == 0) {
				$('.checkout').fadeOut(fadeTime);
			} else {
				$('.checkout').fadeIn(fadeTime);
			}
			$('.totals-value').fadeIn(fadeTime);
		});
	}

	/* Update quantity */
	function updateQuantity(quantityInput) {
		/* Calculate line price */
		var productRow = $(quantityInput).parent().parent();
		var price = parseInt(productRow.children('.product-price').text());
		var quantity = $(quantityInput).val();
		var linePrice = price * quantity;
		var cart_no = productRow.find("span").text();
		var usersId = $
		{
			usersId
		}

		CartService.modify({
			cartNo : cart_no,
			cartQuantity : quantity,
			usersId : usersId
		}, function(result) {
			console.log(result);
		})

		/* Update line price display and recalc cart totals */
		productRow.children('.product-line-price').each(function() {
			$(this).fadeOut(fadeTime, function() {
				$(this).text(linePrice.toFixed(0));
				recalculateCart();
				$(this).fadeIn(fadeTime);
			});
		});
	}

	/* Remove item from cart */

	function removeItem(removeButton) {
		/* Remove row from DOM and recalc cart total */
		var productRow = $(removeButton).parent().parent();
		var cart_no = productRow.find("span").text();

		productRow.slideUp(fadeTime, function() {
			productRow.remove();

			CartService.remove(cart_no, function(result) {
				console.log(result);
			})

			recalculateCart();
		});
	}
</script>

<script>
$('#paymentProcess_button').click( function() {
	goSubmit();
});

function goSubmit() {
	$("input[name='totalPrice']").val($("#cart-total").text());
	cartForm.submit();
}

	
</script>

</html>