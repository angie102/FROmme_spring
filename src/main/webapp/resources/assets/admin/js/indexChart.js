
function todayChart1() {
  var ctx = document.getElementById("myChart");
  var todayChart = new Chart(ctx, {
    type: "line",
    data: {
      labels: todayLabel,
      datasets: [
        {
          label: "예약 수",
          data: todayData,
          fill: false,
          backgroundColor: todayColor,
          borderColor: todayColor,
          borderWidth: 1,
        },
      ],
    },
    options: {
      responsive: true,
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
    },
  });
}

function weekChart() {
  var ctx = document.getElementById("myChart");
  var todayChart = new Chart(ctx, {
    type: "line",
    data: {
      labels: weekLabel,
      datasets: [
        {
          label: "예약 수",
          data: weekData,
          fill: false,
          backgroundColor: weekColor,
          borderColor: weekColor,
          borderWidth: 1,
        },
      ],
    },
    options: {
      responsive: true,
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
    },
  });
}


function onClick(obj) {
	console.log(obj.id);
	switch (obj.id) {
		case 'today':
			todayChart1();
			break;
		case 'week':
			weekChart();
			break;
		default:
			break;
	}
}



window.onload = () => {
	todayChart1();
}

