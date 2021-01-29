function todayClassChart() {
    var ctx = document.getElementById("todayClassChart");
    todayChart = new Chart(ctx, {
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

  function weekClassChart() {
    var ctx = document.getElementById("weekClassChart");
    weekChart = new Chart(ctx, {
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
  
  function monthClassChart() {
	    var ctx = document.getElementById("monthClassChart");
	    monthChart = new Chart(ctx, {
	      type: "line",
	      data: {
	        labels: monthLabel,
	        datasets: [
	          {
	            label: "예약 수",
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
  
  function yearClassChart() {
	    var ctx = document.getElementById("yearClassChart");
	    yearChart = new Chart(ctx, {
	      type: "line",
	      data: {
	        labels: yearLabel,
	        datasets: [
	          {
	            label: "예약 수",
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