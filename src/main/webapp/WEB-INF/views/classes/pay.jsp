<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cssURL" value="/resources/assets/css" />
<c:set var="jsURL" value="/resources/assets/js" />
<c:set var="imgURL" value="/resources/img" />


<!DOCTYPE html>
<html lang="ko-KR">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<head>
<title>FROmme - 내 손으로 만드는 특별한 순간</title>
</head>

<%-- templete include --%>
<%@ include file="../main/src_forInclude.jsp"%>

<link rel="stylesheet" href="${cssURL}/class-style.css">
<link rel="stylesheet" href="${cssURL}/payment-style.css">


<body class="size-1140">

	<!-- HEADER -->
	<header role="banner" class="position-absolute">
		<%@ include file="../main/header.jsp"%>
	</header>

	<section>
		<div class="margin-bottom-70 "></div>
		<hr>

		<div class="line">
			<div class="margin">
				<div class="page-title">
					<div class="text-center">
						<div style="margin: 140px 70px;">
							<h1>결제 정보</h1>
						</div>
					</div>
				</div>
				<!-- delivery info Form -->
				<form id="orderForm" name="orderForm" class="customform" method="post" action="/classes/orderListOk">
					<input type="hidden" name="usersId" value="${sessionId }"> 
					<input type="hidden" name="totalPrice" value="${totalPrice}"> 
					<input type="hidden" name="isDirect" value="${type}"> 
					<div class="s-12 m-12 l-6 padding ">
						<div class="parchase-box">

							<h2 class="margin-bottom-30">주문 정보</h2>
							<div class="line margin-bottom-20">
								<div class="margin">
									<div class="l-12 margin-bottom-10">
										<p class="h6">주문자</p>
									</div>

									<div class="s-12 m-12 l-6">
										<input name="ordererName" class="required name" value="${usersVO.getUsersName() }" placeholder="이름" title="이름" type="text">
									</div>
									<div class="s-12 m-12 l-6">
										<input name="ordererPhone" class="required phone" placeholder="연락처" value="${usersVO.getUsersPhone() }" title="연락처" type="text">
									</div>
									<div class="l-12">
										<input name="ordererEmail" class="required email" placeholder="email" value="${usersVO.getUsersEmail() }" title="이메일" type="email">
									</div>


								</div>
							</div>

						</div>

						<div class="margin-top-30"></div>
						<div class="parchase-box">
							<div class="line margin-bottom-20">
								<h2 class="margin-bottom-20">결제 수단</h2>
								<div class="text-size-12 l-12">
								<div class="margin ">
									<div class="l-3">
										<input type="radio" name="payType" value="cash" onchange="checkPayType($(this).val())" data-name="무통장입금" checked="checked" class="_pay_type l-2"> 
										<span>무통장입금</span> 
									</div>
									<div class="l-3">
										<input type="radio" name="payType" value="phone" onchange="checkPayType($(this).val())" data-name="핸드폰결제"
											class="_pay_type"> 
											<span>핸드폰</span> 
									</div>
									<div class="l-3">
										<input type="radio" name="payType" value="toss" onchange="checkPayType($(this).val())" data-name="계좌이체" class="_pay_type l-2"> 
										<span>토스페이</span> 
									</div>
									<div class="l-3">
										<input type="radio" name="payType" value="kakao" onchange="checkPayType($(this).val())" data-name="계좌이체" class="_pay_type l-2"> 
										<span><img alt="카카오페이" src="${imgURL}/social/payment_icon_yellow_medium.png"  style="width: 60px;"> </span>
									</div>
								</div>
								</div>
							</div>
							<div class="line">

								<div class="form-select-wrap cash_wrapper on" >
									<select class="form-control  text-padding-small " style="background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;; color: #000; z-index: 10" name="cash_idx" id="cash_idx" title="입금계좌 안내">
										<option value="계좌선택">계좌 선택</option>
										<option value="신한 110-000-0000 (김세현)">신한 110-000-0000 (김세현)</option>
										<option value="신한 110-000-0000 (이형준)">신한 110-000-0000 (이형준)</option>
										<option value="신한 110-000-0000 (윤순호)">신한 110-000-0000 (윤순호)</option>
										<option value="신한 110-000-0000 (양희재)">신한 110-000-0000 (양희재)</option>
										<option value="신한 110-000-0000 (양희재)">신한 110-000-0000 (신운교)</option>
									</select> <input type="text" class="form-control text-padding-small margin-bottom-0" id="depositor_name" name="depositor_name" placeholder="입금자명 (미입력시 주문자명)" style="z-index: 10; position: relative;" title="입금자명 (미입력시 주문자명)">
								</div>

								<div class="form-select-wrap phone_wrapper on" style="display: none;">핸드폰 결제</div>
								<div class="form-select-wrap pay_wrapper on" style="display: none;"></div>
							</div>

						</div>
					</div>

					<div class="s-12 m-12 l-6 padding">
						<div class="parchase-box">
							<div class="orderList-wrapper">
								<div class="line">
									<h2 class="margin-bottom-30">주문 상품 정보</h2>
									<c:choose>
										<c:when test="${list != null and fn:length(list) > 0}">
											<c:forEach var="cart" items="${list }" varStatus="status">
												<div class="s-12 margin-bottom-10">
													<div class="l-3">
														<img style="height: 75px; margin-right: 10px;" src="${imgURL }/class_thumbnail/classes_thumbnail_${ cart.getClassesNo()}.jpg" alt="${ cart.getClassesName()}" />
													</div>
													<div class="l-8">
														<p class="text-strong">${cart.getClassesName()}</p>
														<p>[ 수강일 : ${fn:substring(cart.getChoiceDate(),0, 11) }]</p>
														<p>
															<span>총 ${cart.getCartQuantity()}개 </span>${cart.getCartSumPrice()}<span>원</span>
														</p>
													</div>
												</div>
											</c:forEach>
										</c:when>
										<c:otherwise>
										<input name="classesNo" value="${cartListVO.classesNo}" type="hidden">
										<input name="classesInfoNo" value="${cartListVO.classesInfoNo}" type="hidden">
											<div class="s-12 margin-bottom-10">
												<div class="l-3">
													<img src="${imgURL }/class_thumbnail/classes_thumbnail_${cartListVO.classesNo }.jpg" alt="${cartListVO.classesName}" style="height: 75px;" />
												</div>
												<div class="l-9">
													<p class="text-strong">${cartListVO.classesName}</p>
													<p>[ 수강일 : ${cartListVO.choiceDate}]</p>
													<p>
														<span>총 1개 </span>${cartListVO.cartSumPrice}<span>원</span>
													</p>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									<hr>
									<div class="s-12">
										<div class="margin-bottom-20">
											<p class="text-size-12 margin-bottom-10">결제예정금액</p>
											<p class="h2">${totalPrice }
												<span>원</span>
											</p>
										</div>

										<input id="purchase_btn" type="button" class="s-12 button background-primary text-white text-size-16 margin-bottom-0" value="결제하기" style="font-family: GmarketSansMedium;">
									</div>
								</div>


							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<div class="margin-top-70"></div>

	<!-- FOOTER -->
	<footer>
		<%@ include file="../main/footer.jsp"%>
	</footer>

</body>

<script>
	// required 미입력시 처리를 위한 변수
	var required_css_save;
	// 결제 수단 체크를 위한 변수
	var payType = "account";

	$("input[name=ordererName]").click(function(evt) {
		if (required_css_save != null) {
			$("input[name=ordererName]").css("border-color", required_css_save);
		}
	});
	$("input[name=ordererPhone]").click(function(evt) {
		if (required_css_save != null) {
			$("input[name=ordererPhone]").css("border-color", required_css_save);
		}
	});
	$("input[name=ordererEmail]").click(function(evt) {
		if (required_css_save != null) {
			$("input[name=ordererEmail]").css("border-color", required_css_save);
		}
	});

	// submit 하기 전 충족시켜야하는 조건
	$("#purchase_btn").click(function(evt) {

		//필수 입력 조건 미 충족시 css 변경을 위해 기존 css 저장
		if (required_css_save == null) {
			required_css_save = $("input[name=ordererName]").css("border-color");
		}
		if ($("input[name='ordererName']").val() == "") {
			$("input[name='ordererName']").attr("placeholder", "이름을 입력하세요.");
			$("input[name='ordererName']").css("border-color", "red");
		}
		if ($("input[name='ordererPhone']").val() == "") {
			$("input[name='ordererPhone']").attr("placeholder", "핸드폰 번호를 입력하세요.");
			$("input[name='ordererPhone']").css("border-color", "red");
		}
		if ($("input[name='ordererEmail']").val() == "") {
			$("input[name='ordererEmail']").attr("placeholder", "메일주소를 입력하세요.");
			$("input[name='ordererEmail']").css("border-color", "red");
		}
		//필수 입력 조건 체크
		if ($(".required").val() == "") {
			return false;
		}

		//장바구니를 통하지 않고 결제페이지로 온 경우
		if ($("input[name='isDirect']").val()) {
			$("#orderForm").attr("action", "/classes/orderOneOk");
		}
		
		//무통장 입금인 경우
		if ($("input[name='payType']:checked").val() == "cash") {
			if ($("#cash_idx").val() == "계좌선택") {
				alert("입금할 계좌번호를 선택해주세요.");
				return false;
			}
			//주문자명 비어있을 경우 복사
			if ($("input[name='depositorName']").val() == "") {
				orderer_name = $("input[name=ordererName]").val();
				$("input[name='depositorName']").val(orderer_name);
			}
		}
		//카카오페이인 경우
		if ($("input[name='payType']:checked").val() == "kakao") {
			if ($("#cash_idx").val() == "계좌선택") {
				$("#orderForm").attr("action", "/payment/kakaoPay");
			}
		}
		
		$("#orderForm").submit();
	});

	//결제 수단 선택에 따라 보여줄 옵션
	function checkPayType(payType) {
		$(".form-select-wrap").css("display", "none");
		if (payType == "cash")
			$(".cash_wrapper").css("display", "");
		else if (payType == "phone")
			$(".phone_wrapper").css("display", "");
		else if (payType == "toss")
			$(".pay_wrapper").css("display", "");
		else
			$(".pay_wrapper").css("display", "");

	}
</script>

<script>
	//토스페이
</script>

</html>