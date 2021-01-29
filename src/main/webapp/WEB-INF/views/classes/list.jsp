<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="cssURL" value="/resources/assets/css" />
<c:set var="jsURL" value="/resources/assets/js" />
<c:set var="imgURL" value="/resources/img" />
<%session.setAttribute("sessionId", "test1"); %>
<%-- <c:set var="sessionId" value="${sessionScope.usersId }" /> --%>


<!DOCTYPE html>
<html lang="ko-KR">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<head>
<title>FROmme - 내 손으로 만드는 특별한 순간</title>

<%-- template include --%>
<%@ include file="../main/src_forInclude.jsp"%>
<%-- <%@ include file="../board/board_template/loginModal.jsp"%> --%>

<%-- page include --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="${cssURL}/jquery.bxslider.css">
<link rel="stylesheet" href="${cssURL}/class-style.css">


</head>




<body class="size-1140">
	<!-- HEADER -->
	<header role="banner" class="position-absolute">
		<%@ include file="../main/header.jsp"%>
	</header>

	<div class="margin-bottom-70 "></div>

	<!-- slide banner -->
	<div style="padding-top: 0;">
		<img src="${imgURL }/banner/event_mini_banner1.png" alt="이벤트 배너 이미지">
	</div>


	<section class="section-small-padding section-top-small-padding">
		<div class="classList-wrapper">

			<div class="line margin-bottom-30">
				<div class="classList-search-wrapper">
					<div class="line">
						<div class="s-12 m-12 l-6">
							<div class="h2 margin-left-10 text-dark">
								<a href="/classes/list">ALL</a> &nbsp; <a href="/classes/list?type=H">BEST</a>&nbsp; <a href="#">RECOMMEND</a>&nbsp;
							</div>
						</div>
						<div class="s-12 m-12 l-6">
							<div class="margin-m-left-right-0 margin-l-left-right-20 " style="padding: 0 1%;">
								<div class="l-12 full-width">
									<fieldset class="field-container">
										<form name="searchForm" class="searchForm" action="/classes/list" method="get" id="searchForm" action="#">
											<input name="pageNum" type="hidden" value="${pageMaker.cri.pageNum } "> 
											<input name="amount" type="hidden" value="${pageMaker.cri.amount } "> <input type="hidden" name="typeCheck" value="keyword"> 
											<input name="keyword" type="text" placeholder="원하는 클래스가 있나요?"
												value="${pageMaker.cri.keyword}" class="field"
											>
											<div class="icons-container">
												<div class="icon-search"></div>
												<div class="icon-close">
													<div class="x-up"></div>
													<div class="x-down"></div>
												</div>
											</div>
										</form>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="line margin-bottom-0">
				<div class="margin-l-left-right-20 margin-m-left-right-0" style="padding: 0 1%;">
					<div id="bannerWrap">
						<a id="prevBtn"><img alt="이전" src="${imgURL }/board_images/btn_prevpage.png"></a>
						<ul id="slideBanner" class="margin-left-right-20">
							<%-- 장르 DB에서 받아온 뒤 for문 돌리기 --%>
							<c:forEach var="genre" items="${genreMap }">
								<li><a class="genreType text-white-hover s-12 button button-primary-stroke text-primary" href="${genre.key }">${genre.value }</a></li>
							</c:forEach>
						</ul>
						<a id="nextBtn"><img alt="다음" src="${imgURL }/board_images/btn_nextpage.png"></a>


					</div>
				</div>
			</div>
		</div>
	</section>


	<%-- 전체 클래스 --%>
	<section class="section-small-padding section-top-small-padding">
		<div class="classList-wrapper">
			<div class="line">
				<div class="margin-l-left-right-20 margin-m-left-right-0" style="padding: 0 1%;">

					<div class="function-sort-wrapper">
						<select id="type" name="type" class="right xans-product classes-orderby">
							<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>정렬 기준</option>
							<option value="N" ${pageMaker.cri.type == 'N' ? 'selected' : ''}>신상품</option>
							<option value="P" ${pageMaker.cri.type == 'P' ? 'selected' : ''}>상품명</option>
							<option value="L" ${pageMaker.cri.type == 'L' ? 'selected' : ''}>낮은 가격</option>
							<option value="E" ${pageMaker.cri.type == 'E' ? 'selected' : ''}>높은 가격</option>
							<option value="H" ${pageMaker.cri.type == 'H' ? 'selected' : ''}>인기순</option>
						</select>
					</div>

					<%-- 전체 클래스 --%>
					<div class="classList-title-wrapper">

						<!-- 클래스 출력 -->
						<div class="classList-title">

							<h2 class="margin-bottom-0">클래스</h2>
						</div>
					</div>
				</div>
			</div>

			<%-- 클래스 리스트 --%>
			<ul class="classList-detail-wrapper line">
				<c:choose>

					<c:when test="${list != null and fn:length(list) > 0}">
						<!-- 반복문 -->
						<c:forEach var="c_vo" items="${list }" varStatus="stat">

							<li class="classesRow">
								<div class="s-12 m-12 l-6 xl-3" style="padding: 0 1%;">
									<div class="margin-m-left-right-0  margin-top-10">
										<%-- 클래스 상세정보 링크 --%>

										<a class="goGet classDetail_link" href="${c_vo.getClassesNo() }">
											<div class="image-with-hover-overlay image-hover-zoom margin-bottom ">
												<img src="${imgURL }/class_thumbnail/classes_thumbnail_${c_vo.getClassesNo() }.jpg" />
											</div>
										</a>

									</div>
									<div class="margin-bottom-30">
										<div class="line margin-top-10">
											<!-- category / 공방 이름-->
											<div class="category-tag${c_vo.getClassesNo() } tag ">
												<c:set var="g_no" value="${c_vo.getGenreNo() }" />
												<c:set var="s_no" value="${c_vo.getStudioNo() }" />
												${ genreMap[g_no]} <span class="category-tag-From-Creator">・</span> ${ studioMap[s_no]}
											</div>
										</div>
										<!-- simple description -->
										<div class="line">
											<p id="classes-description">${c_vo.getClassesName()}</p>
										</div>
										<div class="line">
											<div class="tag">
												<c:if test="${c_vo.getClassesState()} eq 1}">
													<p class="classes_state text-primary">현재 신청 가능</p>
												</c:if>
												<c:if test="${c_vo.getClassesState()} eq 3}">
													<p class="classes_state text-gray">모집 완료(예약가능)</p>
												</c:if>

											</div>
											<div class="text-dark-hover">
												<p class="classes-like-wrapper float-left tag text-size-16">
													<c:set var="c_no" value="${c_vo.getClassesNo() }" />
													<c:set var="textColor" value="" />
													<c:choose>
														<c:when test="${ likeMap[c_no] eq 1}">
															<c:set var="textColor" value="text-dark" />
														</c:when>
														<c:otherwise>
															<c:set var="textColor" value="text-gray" />
														</c:otherwise>
													</c:choose>

													<a class="heart icon-heart ${textColor }" href="${c_vo.getClassesNo() }"> <span class="classes-like">${c_vo.getClassesLike()}</span>
													</a>

												</p>
											</div>
										</div>


										<div class="line">
											<hr class="break margin-top-bottom-10">
										</div>
										<!-- price -->
										<div class="line">
											<div class="s-12 m-6">
												<div class=" text-dark">
													<p class="tag">${c_vo.getClassesPrice()}<span>원</span>
													</p>
												</div>
											</div>
											<div class="s-12 m-6 ">
												<p class="tag-small right">${c_vo.getClassesStart()}</p>
											</div>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:when>
				</c:choose>
			</ul>

			<div class="small-width" style="text-align: center">
				<c:if test="${pageMaker.cri.pageNum > 1}">
					<a class="changePage" href="${pageMaker.cri.pageNum - 1}"><code>&lt;</code></a>
				</c:if>
				<code>${pageMaker.cri.pageNum}</code>
				<c:if test="${pageMaker.cri.pageNum != pageMaker.realEnd}">
					<a class="changePage" href="${pageMaker.cri.pageNum + 1}"><code>&gt;</code></a>
				</c:if>
			</div>

		</div>

		<div class="big-width" style="text-align: center">
			<c:if test="${pageMaker.prev}">
				<a class="changePage" href="${pageMaker.startPage - 1}"><code>&lt;</code></a>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<c:choose>
					<c:when test="${num eq pageMaker.cri.pageNum}">
						<code>${num}</code>
					</c:when>
					<c:otherwise>
						<a class="changePage" href="${num}"><code>${num}</code></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<a class="changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
			</c:if>
		</div>

		<form id="actionForm" action="/classes/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>

		<form id="sortForm" action="/classes/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> <input type="hidden" name="typeCheck" value="${pageMaker.cri.typeCheck}">
		</form>

		<form id="genreForm" action="/classes/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> <input type="hidden" name="genreType" type="text" value="${pageMaker.cri.genreType}">
		</form>


	</section>

	<!-- FOOTER -->
	<footer>
		<%@ include file="../main/footer.jsp"%>
	</footer>
</body>
<script src="${jsURL }/classes-script.js"  type="text/javascript"></script>

<script>
	$(function() {
		var mySlider = $("#slideBanner").bxSlider({
			mode : "horizontal", // 가로 수평으로 슬라이드된다.
			speed : 500, // 이동 속도를 설정한다.
			pager : false, // 현재 위치 페이지 표시 여부를 설정한다.
			moveSlides : 1, // 슬라이드 이동 시 개수를 설정한다.
			slideWidth : 140, // 슬라이드 너비를 설정한다.
			minSlides : 1, // 최소 노출 개수를 설정한다.
			maxSlides : 6, // 최대 노출 개수를 설정한다.
			slideMargin : 60, // 슬라이드 간의 간격을 설정한다.
			auto : true, // 자동으로 흐를지 여부를 설정한다.
			autoHover : true, // 마우스오버 시 정지할지를 설정한다.
			controls : false, // 이전 버튼, 다음 버튼 노출 여부를 설정한다.
			touchEnabled : (navigator.maxTouchPoints > 0)
		// a링크 오류 해결
		});

		// 이전 버튼을 클릭하면 이전 슬라이드로 전환된다.
		$("#prevBtn").on("click", function() {
			// 이전 슬라이드 배너로 이동된다.
			mySlider.goToPrevSlide();
			// <a>의 링크를 차단한다.
			return false;
		});

		// 다음 버튼을 클릭하면 다음 슬라이드로 전환한다.
		$("#nextBtn").on("click", function() {
			// 다음 슬라이드 배너로 이동된다.
			mySlider.goToNextSlide();
			// <a>의 링크를 차단한다.
			return false;
		});
	});
</script>

<script>

	//check();

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

	var actionForm = $("#actionForm");
	var searchForm = $("#searchForm");
	var sortForm = $("#sortForm");
	var genreForm = $("#genreForm");

	$("#searchForm a").on("click", function(e) {
		e.preventDefault();
		searchCheck();
	})
	$("#keyword").keydown(function(key) {
		if (key.keyCode == 13) {
			searchCheck();
		}
	})

	function searchCheck() {
		if (searchForm.find("input[name='keyword']").val() == ""
				|| !searchForm.find("input[name='keyword']").val()) {
			alert("검색할 단어를 입력하세요");
			return false;
		}
		searchForm
				.append("<input type='hidden' name='typeCheck' value='keyword'>");
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	}

	$(document)
			.ready(
					function() {
						$(".changePage").on(
								"click",
								function(e) {
									e.preventDefault();
									actionForm.find("input[name='pageNum']").val($(this).attr("href"));
									actionForm.submit();
								});

						$(".goGet")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											var cnoValue = $(this).attr("href");
											var nameValue = $(
													".category-tag" + cnoValue)
													.text().split("・");
											genNameValue = nameValue[0].trim();
											stuNameValue = nameValue[1].trim();

											actionForm.append("<input type='hidden' name='classesNo' value='"+ $(this).attr("href")+"'>");
											actionForm.append("<input type='hidden' name='genName' value='"+genNameValue+"'>");
											actionForm.append("<input type='hidden' name='stuName' value='"+stuNameValue+"'>");
											
											actionForm.append("<input type='hidden' name='textColor' value='"+stuNameValue+"'>");
											actionForm.attr("action","/classes/get");
											actionForm.submit();
										})

						$("#type").change(function(e) {
											typeCheckValue = "${pageMaker.cri.typeCheck}";
											var typeValue = $('#type option:selected').val();

											if (typeCheckValue == "genre") {
												genreType = "${pageMaker.cri.genreType}";
												sortForm
														.append("<input type='hidden' name='genreType' value='"+genreType+"'>");
											} else if (typeCheckValue == "keyword") {
												alert("??");
												keyword = "${pageMaker.cri.keyword}";
												sortForm
														.append("<input type='hidden' name='keyword' value='"+keyword+"'>");
											}
											sortForm.append("<input type='hidden' name='type' value='"+typeValue+"'>");
											sortForm.find("input[name='pageNum']").val("1");
											sortForm.submit();
										})

						$(".genreType").on("click", function(e) {
											e.preventDefault();
											genreForm.append("<input type='hidden' name='typeCheck' value='genre'>");
											genreForm.find(
													"input[name='genreType']")
													.val($(this).attr("href"));
											genreForm.find(
													"input[name='pageNum']")
													.val("1");
											genreForm.submit();
										});

					});
</script>



</html>