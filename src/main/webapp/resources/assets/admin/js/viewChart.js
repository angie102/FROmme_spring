function todayViewChart() {
    var ctx = document.getElementById("todayViewChart");
    todayChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: todayLabel,
        datasets: [
          {
            label: "조회 수",
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

  function weekViewChart() {
    var ctx = document.getElementById("weekViewChart");
    weekChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: weekLabel,
        datasets: [
          {
            label: "조회 수",
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
  
  function monthViewChart() {
	    var ctx = document.getElementById("monthViewChart");
	    monthChart = new Chart(ctx, {
	      type: "line",
	      data: {
	        labels: monthLabel,
	        datasets: [
	          {
	            label: "조회 수",
	            data: monthData,
	            fill: false,
	            backgroundColor: monthColor,
	            borderColor: monthColor,
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
  
  function yearViewChart() {
	    var ctx = document.getElementById("yearViewChart");
	    yearChart = new Chart(ctx, {
	      type: "line",
	      data: {
	        labels: yearLabel,
	        datasets: [
	          {
	            label: "조회 수",
	            data: yearData,
	            fill: false,
	            backgroundColor: yearColor,
	            borderColor: yearColor,
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