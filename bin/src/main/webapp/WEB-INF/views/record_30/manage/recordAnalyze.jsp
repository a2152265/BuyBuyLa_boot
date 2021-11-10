<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
    <div class="container">
        <div class="row">
          <div class="col-12 col-md-6">
            <canvas id="lineChart"></canvas>
          </div>
          
        </div>
      </div>
      
 
      
      
      
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    

    <script>

      let ctx = document.getElementById('lineChart');
let myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['女性衣服', '男性衣服', '寵物', '健身器材', '其他'],
        datasets: [{
            label: '# of Votes',
            data: [10, 5, 12, 5, 1],
            backgroundColor: [
                'rgba(255, 99, 132,0.5)',
                'rgba(54, 162, 235,0.5)',
                'rgba(255, 206, 86,0.5)',
                'rgba(75, 192, 192,0.5)',                
                'rgba(255, 159, 64,0.5)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',            
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>   
</body>
</html>