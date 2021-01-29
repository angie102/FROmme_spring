<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html class="no-js" lang="kr">

<head>
    <c:import url="./header.jsp"></c:import>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<c:import url="./menuBar.jsp"></c:import>
	<div class="charts-area mg-tb-15">
            <div class="container-fluid">
            	<div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                        <div class="charts-single-pro mg-tb-30 responsive-mg-b-0">
                            <div class="alert-title">
                                <h2 style="color: aliceblue; display: inline;">날짜를 선택하세요</h2>
                                <div style="float: right">
								<form>
									<input type="date" value="2020-11-01" onchange="onChange(this)" style="margin-bottom: 7px">
								</form>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="charts-single-pro responsive-mg-b-30">
                            <div class="alert-title">
                                <h2 style="color: aliceblue;">일간 방문 차트</h2>
                                <!-- 달력으로 날짜 선택이 가능하도록 만든다 -->
                                <canvas id="todayViewChart" class="flot-chart-sts flot-chart curved-chart-statistic"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="charts-single-pro">
                            <div class="alert-title">
                                <h2 style="color: aliceblue;">주간 방문 차트</h2>
                                <canvas id="weekViewChart" class="flot-chart-sts flot-chart curved-chart-statistic"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="charts-single-pro mg-tb-30 responsive-mg-b-0">
                            <div class="alert-title">
                                <h2 style="color: aliceblue;">월간 방문 차트</h2>
                                <canvas id="monthViewChart" class="flot-chart-sts flot-chart curved-chart-statistic"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="charts-single-pro mg-tb-30">
                            <div class="alert-title">
                                <h2 style="color: aliceblue;">연간 방문 차트</h2>
                                <canvas id="yearViewChart" class="flot-chart-sts flot-chart curved-chart-statistic"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="./footer.jsp"></c:import>
        <script src="js/viewChart.js"></script>
        <script src="js/callApi.js"></script>
</body>
<script>
let todayLabel;
let todayData;
let weekLabel;
let weekData;
let monthLabel;
let monthData;
let yearLabel;
let yearData;
let todayChart;
let weekChart;
let monthChart;
let yearChart;

function onChange(obj) {
	todayLabel = [];
	todayData = [];
	weekLabel = [];
	weekData = [];
	monthLabel = [];
	monthData = [];
	yearLabel = [];
	yearData = [];
	todayChart = [];
	weekChart = [];
	monthChart = [];
	yearChart = [];
    todayColor = [];
    weekColor = [];
    monthColor = [];
    yearColor = [];
    let date = obj.value;
	callApi("?date="+date+"&chart=view")
      .then((data) => {
          let keys = [];
          for (let i = 0; i < data.item.length; i+=2) {
              keys = Object.keys(data.item[i]);
              for (let j = 0; j < keys.length; j++) {
                if(keys[j] == "x") {
                    break;
                }
                  //당일 데이터
                    if( i < 2) {
                        todayLabel.push(data.item[i][keys[j]]);
                        todayData.push(parseInt(data.item[i+1][keys[j]]));
                        todayColor.push("rgba("+getRandomRGB(1,255)+","+getRandomRGB(1,255)+","+getRandomRGB(1,255)+",0.5)");
                    } else if( i < 4) {
                        weekLabel.push(data.item[i][keys[j]]);
                        weekData.push(parseInt(data.item[i+1][keys[j]]));
                        weekColor.push("rgba("+getRandomRGB(1,255)+","+getRandomRGB(1,255)+","+getRandomRGB(1,255)+",0.5)");
                    } else if( i < 6) {
                        monthLabel.push(data.item[i][keys[j]]);
                        monthData.push(parseInt(data.item[i+1][keys[j]]));
                        monthColor.push("rgba("+getRandomRGB(1,255)+","+getRandomRGB(1,255)+","+getRandomRGB(1,255)+",0.5)");
                    } else if( i < 8) {
                        yearLabel.push(data.item[i][keys[j]]);
                        yearData.push(parseInt(data.item[i+1][keys[j]]));
                        yearColor.push("rgba("+getRandomRGB(1,255)+","+getRandomRGB(1,255)+","+getRandomRGB(1,255)+",0.5)");
                        
                    }
              }
              
          }
          
          todayViewChart();
          weekViewChart();
          monthViewChart();
          yearViewChart();
          
      })
      .catch(err => alert('차트 정보를 불러오지 못했습니다.'));
	
    
}

</script>
</html>