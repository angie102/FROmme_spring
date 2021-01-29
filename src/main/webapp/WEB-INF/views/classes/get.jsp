<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cssURL" value="/resources/assets/css" />
<c:set var="jsURL" value="/resources/assets/js" />
<c:set var="imgURL" value="/resources/img" />

<%session.setAttribute("sessionId", "test1"); %>


<!DOCTYPE html>
<html lang="ko-KR">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
/* 감싸는 div */
.wrap {
	position: relative;
	width: inherit;
	height: inherit;
	margin: 0 auto;
	overflow: hidden;
}
/* 확대될 타겟이미지*/
.target {
	display: block;
	width: 100%;
}
/* 돋보기 */
.magnifier {
	width: 300px;
	height: 300px;
	position: absolute;
	border-radius: 100%;
	box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px
		rgba(0, 0, 0, 0.5);
	display: none;
}
</style>

<head>
<title>FROmme - 내 손으로 만드는 특별한 순간</title>


<%-- templete include --%>
<%@ include file="../main/src_forInclude.jsp"%>

<%-- layer popup script --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<%-- datepicker script --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<%-- kakao share --%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<link rel="stylesheet" href="${cssURL}/class-style.css">
<link rel="stylesheet" href="${cssURL}/modal_popup.css">
<script src="${jsURL}/datepicker.js"></script>
<script src="${jsURL}/classes-script.js"></script>
<script src="${jsURL}/modal.js"></script>

</head>






<body class="size-1140">

	<!-- HEADER -->
	<header role="banner" class="position-absolute">
		<%@ include file="../main/header.jsp"%>
	</header>

	<div class="margin-bottom-50 "></div>

	<!-- class detail information -->
	<div class="classDetail-wrapper">
		<section class="section-top-small-padding">
			<div class="margin">

				<form name="detailForm" action="/classes/listCart" method="get" target="cartIn" >
				<input name="usersId" type="text" hidden="hidden" value="${sessionId}">
				<input name="classesInfoNo" type="text" hidden="hidden" value="">
					<!-- 페이지 이동 없이 submit하기 위한 iframe -->
					<iframe name="cartIn" style="display: none;"></iframe>


					<table class="classDetail-table">
						<%-- 상단 category --%>
						<tr>
							<td class="classDetail-category-wrapper">
								<div class="padding ">
									<div class="">
										<div class="tag">
											<p class="fs11 tPad10">
												<a href="/main/index">HOME </a> &nbsp;&gt;&nbsp; 
												<a id="goGenreList" href="${c_vo.getGenreNo() }">${genName}</a>&nbsp;&gt;&nbsp; 
												<a class="text-dark" > ${c_vo.getClassesName() }</a>
											<hr class="margin-top-bottom-0">
											</p>
										</div>
									</div>
								</div>
							</td>
						</tr>

						<tr class="background-white" style="border: white;">
							<td class=" classDetail-wrapper">
								<div class=" padding">

									<!-- class detail 이미지 -->
									<div class="classDetail-img-wrapper">
										<div class="s-12 m-12 l-12 xl-7">
											<div class="img">
												<div class="wrap">
													<img class="target" data-zoom="1.4" src="${imgURL }/class_thumbnail/classes_thumbnail_${ c_vo.getClassesNo()}.jpg" alt="" title="Portfolio Image" />
												</div>
											</div>
										</div>
									</div>

									<div class="s-12 m-12 l-12 xl-5 ">
										<div class="margin-m-left-0">
											<div class="classDetail-content-wrapper">

												<!-- class detail 설명 -->
												<div class="classDetail-box">
													<div class="padding-2x">

														<!-- category / 공방 이름-->
														<div class="classDetail-info">
															<div class="line">
																<div class="category-tag">
																	<div id="studio_categoty" class="tag margin-bottom-10 margin-right-20">
																		${genName}<span>・</span>${stuName}
																	</div>
																</div>
															</div>

															<div class="line">
																<div class="classDetail-title">
																	<p id="classes_title" class="h1 text-size-25 ">${c_vo.getClassesName()}
																</div>
																<div class="tag">
																	<p id="classes_teacher">클래스 작가: ${c_vo.getClassesTeacher()}</p>
																</div>
															</div>
															<hr>


															<!-- start date -->
															<div class="line">
																<div class="classDetail-text-date">
																	<div class="margin-bottom-10">
																		<div class="tag-small-date text-center">
																			<p>
																				${c_vo.getClassesStart()} <span class="category-tag-From-Creator">・</span>주 1회
																			</p>
																		</div>
																	</div>
																</div>
															</div>

															<div class="classDetail-text">

																<!-- 신청 가능여부 -->
																<div class="line">
																	<div class="classDetail-text-available">
																		<p>
																			<c:choose>
																				<c:when test="${c_vo.getClassesState() eq 1}">
																					<span class="text-primary">현재 신청 가능</span>
																				</c:when>
																				<c:when test="${c_vo.getClassesState() eq 3}">
																					<span class="text-gray">정원 모집 마감</span>
																				</c:when>
																			</c:choose>
																			<span id="classDetail-available_num"></span>
																		</p>
																	</div>
																</div>
																<!-- type -->
																<div class="line">
																	<div class="classDetail-text-type">
																		<p>원데이 클래스</p>
																	</div>
																</div>

																<div class="line">
																	<div class="text-dark">
																		<!-- heart -->
																		<div class="classDetail-text-heart">
																			<div class="left text-l-size-16">
																				<!-- 클릭 시 하트 숫자 증가 -->
																				<p class="classes-like-wrapper float-left tag text-size-16">
																					<a class="heart icon-heart" href="${c_vo.getClassesNo() }"> <span id="likeNum">${c_vo.getClassesLike() }</span>
																					</a>
																				</p>

																			</div>
																		</div>
																		<!-- price -->
																		<div class=" classDetail-text-price">
																			<div class="right">
																				<p class="" id="classes_price" style="font-size: 1.5rem;">${c_vo.getClassesPrice()}<span>원</span>
																				</p>
																			</div>
																		</div>
																	</div>
																</div>

															</div>

														</div>

														<!-- date picker -->
														<div class="line">
															<div id="classDetail-datePicker">
																<div class="margin-top-30 margin-bottom-10">
																	<input class="datePicker-inputBox" type="text" name="choiceDate" id="datePicker" placeholder="수강하실 날짜를 선택해주세요." readonly="readonly" />
																</div>
															</div>
														</div>


														<!-- purchase -->
														<div class="line">
															<div class=" margin-top-10">
																<div class="s-12 l-5">
																	<input id="pay" type="button" class="s-12 button background-primary text-white text-size-16" value="바로 신청">
																</div>

																<div class="s-12 l-5">
																	<input id="cart_btn" type="button" class="s-12 button button-primary-stroke text-primary text-white-hover text-size-16" style="height: 2.64rem;" value="담아두기">
																</div>

																<!-- share--->
																<div class="s-2">
																	<div class="margin-left-20 text-dark" style="margin-top: 0.25rem;">
																		<a id="share"> <i class="icon-sli-share background-transparent text-size-20"></i>
																		</a>
																	</div>
																</div>

															</div>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>

								</div>

							</td>
						</tr>
					</table>

				</form>

			</div>
		</section>
	</div>

	<div class="margin-bottom-80"></div>

	<section class="section-padding">
		<div class="padding">
			<div class="classDetail-tab-wrapper">

				<div class="tabs ">

					<div class="tab-content">
						<div class="tab-product-detail">
							<a href="#product-detail" style="height: 2.68rem; line-height: 1.61rem;" class="m-12 l-3 xl-2 full-width button button-primary-stroke margin-right-10 margin-m-right-0 margin-bottom-10"> 상세정보</a>
						</div>
					</div>

					<div class="tab-content">
						<div class="tab-product-policy">
							<a href="#product-policy" class="m-12 l-3 xl-2 full-width button button-primary-stroke margin-right-10 margin-m-right-0 margin-bottom-10"> 환불 정책</a>
						</div>
					</div>

				</div>
			</div>

			<div class="classDetail-tab-item-wrapper">
				<div class="classDetail-tab-item">

					<hr id="product-detail">
					<div class="margin-top-bottom-80">
						<h3>상품 설명</h3>
						<table>
							<tbody>
								<tr>
									<td>
										<div class="product-detail-wrapper">
											<p>클래스 설명</p>
											<p>${c_vo.getClassesContent()}</p>										
												<%@ include file="./get_content.jsp"%>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<h3>상품 필수 정보 전자상거래 등에서의 상품정보 제공 고시에 따라 작성 되었습니다.</h3>
					</div>
				</div>


				<div class="classDetail-tab-item">
					<!-- 정책 -->
					<hr id="product-policy" class="classDetail-tab-item">

					<div class="margin-top-bottom-80">
						<h3>배송/교환/환불</h3>
						<p>
							<a href="#">반품/환불 신청하기</a>
						</p>
						배송정보 및 교환/환불 AS안내
						<table>
							<tbody>
								<tr>
									<th>배송정보</th>
									<td>
										<ul>
											<li>배송기간은 주문일(무통장입금은 결제완료일)로부터 1일(24시간) ~ 5일정도 걸립니다.</li>
											<li>단, 지정일 배송이 가능한 플라워 상품이나, 제작기간이 별도로 소요되는 상품의 경우에는 상품설명에 있는 제작기간과 배송시기를 숙지해 주시기 바랍니다.</li>
											<li>업체조건배송 상품은 해당 브랜드 배송기준으로 배송비가 부여됩니다. 업체착불배송 상품은 해당 브랜드 배송기준 및 배송지에 따라 배송비가 착불로 부과됩니다.</li>
											<li>가구 및 플라워 등의 상품의 경우에는 지역에 따라 추가 배송비용이 발생할 수 있음을 알려드립니다.</li>
											<li>해외배송 표시가 되어 있는 상품은 해외 주소로 배송이 가능합니다. (배송방법 : EMS)</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>교환/환불/AS안내</th>
									<td>
										<ul>
											<li>교환/반품 신청은 배송완료 후 7일 이내 가능합니다.</li>
											<li>변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.</li>
											<li>상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
											<li>출고 이후 환불요청 시 상품 회수 후 처리됩니다.</li>
											<li>쥬얼리를 포함한 주문제작 상품/카메라/밀봉포장상품/플라워 등은 변심으로 인한 반품/환불이 불가합니다.</li>
											<li>완제품으로 수입된 상품의 경우 A/S가 불가합니다.</li>
											<li>상품페이지에 교환/환불/AS에 대한 브랜드 개별기준이 있는 경우에는 해당 내용이 우선 적용 됩니다.</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>기타 기준 사항</th>
									<td>
										<ul>
											<li>구매자가 미성년자인 경우에는 상품 구입시 법정대리인이 동의하지 아니하면 미성년자 본인 또는 법정대리인이 구매취소 할 수 있습니다.</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- tab 클릭시 실행할 action -->
	<form id="tabForm" method="get" action="/classes/list">
		<input type="hidden" name="pageNum" value="${cri.pageNum}"> 
		<input type="hidden" name="amount" value="${cri.amount}">  
		<input type="hidden" name="typeCheck" value="genre">
	</form>

	<!-- FOOTER -->
	<footer>
		<%@ include file="../main/footer.jsp"%>
	</footer>

<%@ include file="./modalCart.jsp"%>
<%@ include file="./modalShare.jsp"%> 
</body>

<script>

var tabForm = $("#tabForm");
$("#goGenreList").on("click", function(e) {
	e.preventDefault();
	tabForm.append("<input type='hidden' name='genreType' value='${c_vo.getGenreNo()}'>");
	tabForm.submit();
})

//date picker script for working
//https://davidwalsh.name/jquery-datepicker-disable-days
/**
* 날짜 선택 스크립트
*/
var startDate = new Date("${c_vo.getClassesStart()}".substring(0,11).trim());//시작일 받아오기
var endDate = new Date("${c_vo.getClassesEnd()}".substring(0,11).trim());//종료일 받아오기

//해당 클래스의 선택가능 날짜 배열로 받기
var str;
var i=0;
var availableArr= new Array(); 
var availableDateValue = "${availableDate}";

<c:forEach var="date" items="${availableDate}" varStatus="status">
	availableArr[i] = "${date}".substring(0,11).trim();
	i++;
</c:forEach>
 
 $( document ).ready(function() {
	 
	function available(date) {
		var thismonth = date.getMonth()+1;
		var thisday = date.getDate();

		if(thismonth<10){thismonth = "0"+thismonth;}
		
		if(thisday<10){thisday = "0"+thisday;}
	    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;

	    if ($.inArray(ymd, availableArr) >= 0) {
	        return [true,"",""];
	    } else {
	        return [false,"",""];
	    }
	}
	
    $(function () {
    	$("#datePicker").datepicker({
    		minDate: startDate , 
    		maxDate: endDate , 
    		dateFormat: 'yy-m-d',
    		constrainInput: true,
     		beforeShowDay: available
    	});
    });
}); 
 
//날짜 선택 시 해당 날짜의 선택가능 인원을 가져옴
 $("#datePicker").change(function () {
 	var classesNo = ${classesNo};
 	var classesDate = $(this).val();
 	
 	dateService.getNum({classesNo: classesNo, classesDate: classesDate}, function (classesInfo) {
 		//console.log(classesInfo.classesInfoNo);
 		
 		var availableNum = classesInfo.classesLimit - classesInfo.classesApplyNum;

 		if(availableNum >= 0){
 		//신청가능
 			$("#classDetail-available_num").text("["+availableNum+"명 신청가능]");
 			$("input[name='classesInfoNo']").val(classesInfo.classesInfoNo);
 		}else{
 		//신청불가
 			$("#classDetail-available_num").text("");
 		}
 		
 	});  	
 });
 
</script>


<script>
/**
 * 장바구니 추가 / 팝업
 */
 
var detailForm = document.detailForm;	

$("#cart_btn").click(function(evt) {
	evt.preventDefault();
	if($("#datePicker").val() == ''){
		alert("수강하실 날짜를 선택해주세요.");
		return false;
	}
	evt.stopPropagation();
//	event.cancelBubble = true; // for IE 8
	CartService.add({usersId:$("input[name='usersId']").val() || "temp", 
							classesInfoNo:$("input[name='classesInfoNo']").val(), 
							classesNo:"${c_vo.getClassesNo()}", 
							choiceDate:$("#datePicker").val()}, 
			function (result) {		
	})
		$(".cart-popup-wrapper").toggle();
																		
});

$(document).click(function(){ $('.cart-popup-wrapper').hide();});

function goCart() {
	$("form[name='detailForm']").attr("target", "_self");
	detailForm.submit();
}

//결제 버튼 클릭 시
$("#pay").click(function (){
	
	if($("#datePicker").val() == ''){
		alert("수강하실 날짜를 선택해주세요.");
		return false;
	}
	
	$("form[name='detailForm']").attr("method", "post");
	$("form[name='detailForm']").attr("action", "/classes/payOne");
	$("form[name='detailForm']").append("<input type=hidden name='classesNo' value='${c_vo.getClassesNo()}'>");
	$("form[name='detailForm']").append("<input type=hidden name='classesName' value='${c_vo.getClassesName()}'>");
	$("form[name='detailForm']").append("<input type=hidden name='cartSumPrice' value='${c_vo.getClassesPrice()}'>");
	$("form[name='detailForm']").append("<input type=hidden name='totalPrice' value='${c_vo.getClassesPrice()}'>");
	$("form[name='detailForm']").attr("target", "_self");
	detailForm.submit();
});


</script>

<script>
var share_url= document.location.href; 
$("#share").click(function(evt) {

	evt.stopPropagation();
//	event.cancelBubble = true; // for IE 8
	evt.preventDefault();
	$(".share-popup-wrapper").toggle();

});
$(document).click(function(){ $('.share-popup-wrapper').hide(); });


// 트위터 공유
function sendLinkTwitter() {
	console.log("twitter");
	window.location.href = "https://twitter.com/intent/tweet?text=FROmme. <c:out value='${c_bean.getClasses_name()}'/>&url="+share_url;
}
//카카오톡 공유
  function sendLinkKakao() {
		Kakao.init("c4902b2f37fc365d506aad9f8f2cbf71");
    Kakao.Link.sendScrap({
      requestUrl: share_url,
    })
  }


$("#facebook").click(function (evt) {
	console.log("facebook");
	window.location.href = "http://www.facebook.com/sharer/sharer.php?u=PAGE_URL"
});

$("#only-url").click(function (evt) {
	console.log("only-url");
});

//url 복사 스크립트
$(document).on("click", "#link-copy", function(e) { 
	// 링크복사 시 화면 크기 고정 
	$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
	var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
	$(this).append(html); var input_clip = document.getElementById("clip_target"); 
	//현재 url 가져오기 
	var _url = $(location).attr('href'); $("#clip_target").val(_url);
	if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) { 
		var editable = input_clip.contentEditable; 
		var readOnly = input_clip.readOnly; 
		input_clip.contentEditable = true; 
		input_clip.readOnly = false; 
		var range = document.createRange(); 
		range.selectNodeContents(input_clip); 
		var selection = window.getSelection(); 
		selection.removeAllRanges(); 
		selection.addRange(range); input_clip.setSelectionRange(0, 999999); 
		input_clip.contentEditable = editable; 
		input_clip.readOnly = readOnly; 
	} else { 
		input_clip.select(); 
	} try { 
		var successful = document.execCommand('copy');
		input_clip.blur(); 
		if (successful) { 
			alert("URL이 복사 되었습니다."); 
			// 링크복사 시 화면 크기 고정 
			$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes'); } 
		else { 
			alert('이 브라우저는 지원하지 않습니다.'); 
			} 
		} catch (err) {
			alert('이 브라우저는 지원하지 않습니다.'); 
			} 
		}); 
//클립보드 복사



//좋아요
jQuery(document).ready(function() {
	$(".heart").on("click", function(e) {
		e.preventDefault();

		var cnoValue = $(this).attr("href");
		idValue = "${sessionId}";
		likeService.update({
			classesNo : cnoValue,
			usersId : idValue
		}, function(result) {
			alert(result);

		})

	});
});

//zoom
$('.target').on('mouseover', function(){
	dodbogi();
});
function dodbogi(){
	 var target = $('.target');
	 var zoom = target.data('zoom');
	 
	    $(".wrap")
	        .on('mousemove', magnify)
	        .css('cursor','none')
	        .prepend("<div class='magnifier'></div>")
	        .children('.magnifier').css({
	            "background": "url('" + target.attr("src") + "') no-repeat",
	            "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
	        });
	 
	    var magnifier = $('.magnifier');
	 
	    function magnify(e) {
	 
	        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
	        var mouseX = e.pageX - $(this).offset().left;
	        var mouseY = e.pageY - $(this).offset().top;
	 
	        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
	        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
	            magnifier.fadeIn(200);
	        } else {
	            magnifier.fadeOut(200);
	            magnifier.attr("display", "none");
	        }
	    
	        //돋보기가 존재할 때
	        if (magnifier.is(":visible")) {
	 
	            var rx = -(mouseX * zoom - magnifier.width() /2 );
	            var ry = -(mouseY * zoom - magnifier.height() /2 );
	 
	            //돋보기를 마우스 위치에 따라 움직인다.
	            //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
	            var px = mouseX - magnifier.width() / 2;
	            var py = mouseY - magnifier.height() / 2;
	 
	            //적용
	            magnifier.css({
	                left: px,
	                top: py,
	                backgroundPosition: rx + "px " + ry + "px"
	            });
	        }
	    }
}
</script>
</html>