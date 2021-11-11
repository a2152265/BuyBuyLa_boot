
    <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/manager/header.jspf"%>
<!-- sidebar -->
<%@ include file="../../Home/manager/footer.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
<section class="page-content">
  <section class="search-and-user">
    <form>
      <input type="search" placeholder="Search Pages...">
      <button type="submit" aria-label="submit form">
        <svg aria-hidden="true">
          <use xlink:href="#search"></use>
        </svg>
      </button>
    </form>
    <div class="admin-profile">
      <span class="greeting">通知</span>
      <div class="notifications">
        <span class="badge">22</span>
        <svg>
          <use xlink:href="#users"></use>
        </svg>
      </div>
    </div>
  </section>
  
  
  
  

  <!-- 放分析圓餅圖 -->
  <section class="">
  
    <article>
    <h1></h1>
   
    </article>
    
    
  
    

    

    
    <article>


            <canvas id="lineChart" style="background-color:white;"></canvas>

    </article>
    
    
  </section>





  
   
      
 <input id='female'  class='female' value='${female}'type='hidden' />
 <input id='male' value='${male}' type='hidden'/>
 <input id='pet' value='${pet}' type='hidden'/>
 <input id='fit' value='${fit}' type='hidden'/>
 <input id='other' value='${other}' type='hidden'/>
      
      
      
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
    

    <script>
	var female = document.getElementById('female').value
	var male = document.getElementById('male').value
	var pet = document.getElementById('pet').value
	var fit = document.getElementById('fit').value
	var other = document.getElementById('other').value
   
    
    
    let ctx = document.getElementById('lineChart');
	let myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['女性衣服', '男性衣服', '寵物', '健身器材', '其他'],
        datasets: [{
            label: '# of Votes',
            data: [female,male, pet, fit,other],
            backgroundColor: [
                'rgba(255, 99, 132,0.7)',
                'rgba(54, 162, 235,0.7)',
                'rgba(255, 206, 86,0.7)',
                'rgba(75, 192, 192,0.7)',                
                'rgba(255, 159, 64,0.7)'
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
	
	
	
	let ctx2 = document.getElementById('lineChart2');
	let myChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['女性衣服', '男性衣服', '寵物', '健身器材', '其他'],
        datasets: [{
            label: '# of Votes',
            data: [female,male, pet, fit,other],
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