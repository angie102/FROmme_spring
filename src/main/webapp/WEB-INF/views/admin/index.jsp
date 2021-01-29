<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html class="no-js" lang="kr">

<head>
   <c:import url="./header.jsp" />
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        


	<c:if test="${session_id ne 'admin' }">

	</c:if> 

	<%-- 메인페이지에서 사용되는 변수 --%>
	
	<%-- 주문 건수 --%>
	<c:set var="orderCnt" value="${totalReserve}" />
	<%-- 세금 --%>
	<c:set var="profit" value="${tax}" />
	<%-- 월간 계약액 --%>
	<c:set var="monthAmount" value="${reserve}" />
	<%-- 신규 등록된 클래스 4개 --%>
	<c:set var="classList" value="${classList}" />
	<%-- 총 방문자 --%>
	<c:set var="totalCnt" value="${views.getTotalViews()}" />
	<%-- 월간 방문자 --%>
	<c:set var="monthCnt" value="${views.getMonthViews()}" />
	<%-- 일일 방문자 --%>
	<c:set var="dayCnt" value="${views.getDayViews()}" />
	<%-- 금일 클래스 예약 --%>
	<c:set var="todayChart" value="${today}" />
	<c:set var="weekChart" value="${week}" />
	<script src="/resources/assets/admin/js/callApi.js"></script>
	<script>
		let todayLabel = [];
		 	todayData = [];
			weekLabel = [];
			weekData = [];
			todayColor= [];
			weekColor=[];
	</script>
	<c:forEach var="todayData" items="${todayChart}">
		<script>
			todayData.push("${todayData.getDateData()}");
			todayLabel.push("${todayData.getCriteriaDate()}");
			todayColor.push("rgba("+getRandomRGB(1,255)+","+getRandomRGB(1,255)+","+getRandomRGB(1,255)+",0.5)");
		</script>
	</c:forEach>
	<c:forEach var="weekData" items="${weekChart}">
		<script>
			weekData.push("${weekData.getDateData()}");
			weekLabel.push("${weekData.getCriteriaDate()}");
			weekColor.push("rgba("+getRandomRGB(1,255)+","+getRandomRGB(1,255)+","+getRandomRGB(1,255)+",0.5)");
		</script>
	</c:forEach>
	
	<c:import url="./menuBar.jsp" />
        <div class="section-admin container-fluid">
            <div class="row admin text-center">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="margin-bottom:1px;">
                            <div class="admin-content analysis-progrebar-ctn res-mg-t-30">
                                <h4 class="text-left text-uppercase"><b>주문 건</b></h4>
                                <div class="row vertical-center-box vertical-center-box-tablet">
                                    <div class="col-xs-3 mar-bot-15 text-left">
                    
                                    </div>
                                    <div class="col-xs-9 cus-gh-hd-pro">
                                        <h2 class="text-right no-margin">${orderCnt}</h2>
                                    </div>
                                </div>
                                <div class="progress progress-mini">
                                    <div style="width: 78%;" class="progress-bar bg-green"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="admin-content analysis-progrebar-ctn res-mg-t-30">
                                <h4 class="text-left text-uppercase"><b>세금</b></h4>
                                <div class="row vertical-center-box vertical-center-box-tablet">
                                    <div class="text-left col-xs-3 mar-bot-15">
                                        
                                    </div>
                                    <div class="col-xs-9 cus-gh-hd-pro">
                                        <h2 class="text-right no-margin">${profit}</h2>
                                    </div>
                                </div>
                                <div class="progress progress-mini">
                                    <div style="width: 60%;" class="progress-bar bg-blue"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <div class="admin-content analysis-progrebar-ctn res-mg-t-30">
                                <h4 class="text-left text-uppercase"><b>월간 판매액</b></h4>
                                <div class="row vertical-center-box vertical-center-box-tablet">
                                    <div class="text-left col-xs-3 mar-bot-15">
                                        
                                    </div>
                                    <div class="col-xs-9 cus-gh-hd-pro">
                                        <h2 class="text-right no-margin"> ${monthAmount} </h2>
                                    </div>
                                </div>
                                <div class="progress progress-mini">
                                    <div style="width: 60%;" class="progress-bar bg-purple"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-sales-area mg-tb-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="product-sales-chart">
                            <div class="portlet-title">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="caption pro-sl-hd">
                                            <span class="caption-subject text-uppercase"><b>클래스 예약 현황</b></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="actions graph-rp">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-grey active" id="today" onclick="onClick(this)">오늘</label>
                                                <label class="btn btn-grey" id="week" onclick="onClick(this)">이번 주</label>
                                              	<%-- 그래프 데이터는 자바 객체로 안받고 ajax 통해 받음 --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- flot-active.js 사용하여 조작한다. -->

                            <canvas id="myChart" class="flot-chart-sts flot-chart curved-chart-statistic"></canvas>
                            
                        </div>
                    </div>
                    <%-- 방문자 수는 셀프조인으로 받아옴  --%>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="white-box analytics-info-cs mg-b-30 res-mg-t-30">
                            <!-- 총 방문자 숫자 -->
                            <h3 class="box-title">총 방문자</h3>
                            <ul class="list-inline two-part-sp">
                                <li>
                                    <div></div>
                                </li>
                                <li class="text-right sp-cn-r"><span class="counter sales-sts-ctn">${totalCnt}</span></li>
                            </ul>
                        </div>
                        <div class="white-box analytics-info-cs mg-b-30">
                            <h3 class="box-title">월간 방문자</h3>
                            <ul class="list-inline two-part-sp">
                                <li>
                                    <div></div>
                                </li>
                                <li class="text-right"> <span class="counter sales-sts-ctn">${monthCnt}</span></li>
                            </ul>
                        </div>
                        <div class="white-box analytics-info-cs mg-b-30">
                            <h3 class="box-title">일일 방문자</h3>
                            <ul class="list-inline two-part-sp">
                                <li>
                                    <div></div>
                                </li>
                                <li class="text-right"><span class="counter sales-sts-ctn">${dayCnt}</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 새로운 클래스 업데이트 시 신규 클래스 4개만 보여줌 -->
        <div class="product-new-list-area">
            <div class="container-fluid">
                <div class="row">
                    <c:forEach var="classes" begin="0" end="3" step="1" items="${classList}">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="single-new-trend mg-t-30">
                        	<%-- 클래스 이미지 경로 --%>
                            <a href="#"><img src="img/new-product/5.png" alt=""></a>
                            <div class="overlay-content">
                                <a href="#">
                                    <h2>${classes.getClasses_price()}</h2>
                                </a>
                                <a class="pro-tlt" href="#">
                                    <h4>${classes.getClasses_name()}</h4>
                                </a>
                                
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                  
                  
                </div>
            </div>
        </div>
        
        <!-- 달력 js 사용하여 만질 수 있음 -->
        <div class="calender-area mg-tb-30">
        <%--
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="calender-inner">
                            <div id='calendar'></div>
                        </div>
                    </div>
                </div>
            </div> --%>
        </div> 
        
        <c:import url="./footer.jsp"></c:import>
        <script src="/resources/assets/admin/js/indexChart.js"></script>
        
</body>
</html>
