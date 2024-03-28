// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie', // Thay đổi type từ 'doughnut' thành 'pie'
  data: {
    labels: ["Fail","Normal", "Good", "Excellent"],
    datasets: [{
      data: [55, 10, 15, 20],
      backgroundColor: ['#E74A3B', '#F6C23E','#36B9CC', '#1CC88A'],
      hoverBackgroundColor: ['#66211b', '#735b1e', '#154a52', '#0d5e41'],
      hoverBorderColor: "rgba(234, 236, 244, 1)"
    }]
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 0, // Bỏ cắt bớt để tạo thành biểu đồ pie chart tròn đầy đủ
  },
});
