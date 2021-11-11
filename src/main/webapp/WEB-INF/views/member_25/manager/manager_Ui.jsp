
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/manager/header.jspf"%>
<!-- sidebar -->>
<%@ include file="../../Home/manager/footer.jspf"%>


<!-- chart analyzza pic -->
 <script src="https://cdn.bootcss.com/echarts/4.6.0/echarts.min.js"></script>



<!-- 通知欄 -->>
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
  <section class="grid">
  
    <article>
    <button class="button buttonTotal">總收益</button>
    </article>
    
    
    <article>
     <button class="button button3">會員人數成長</button>
     <div id="memberCount" style="width: 500px;height:300px;" class="analyzeDiv"></div>
    </article>
    
    
    <article>
    
   		<button class="button button3" style="background-color:;">會員性別</button>
     <div id="memberGender" style="width: 500px;height:300px;" class="analyzeDiv"></div>
    </article>
    
    <article>
     <button class="button button3">發文次數</button>
    </article>
    
    <article>
     <button class="button button3">活動收益一覽</button>
    </article>
    
    <article>
     <button class="button button3">購物紀錄</button>
    </article>
  </section>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>
<!-- Ajax傳data專用 -->
<script>
	//人數統計
	var memberCountList2=[];
	 console.log('INNNNNNNNNNN');
    	$.ajax({
    		type:'get',
    		url:'AnalyzeData_memberCount',
    		data:{		
    		},
    		 async: true,
    		 dataType: "json",     
    		 contentType: 'application/json; charset=utf-8',
    		 
    		 
    		 
    		success:function(memberCountList){
 				 console.log('HAAAAAAAAAa');
 				console.log(memberCountList);	
 				var s=[];
 				//sweat alert
 				for(i=0 ; i<memberCountList.length ; i++){
 					memberCountList2[i]=memberCountList[i];
 					console.log('------月份----->'+memberCountList[i]);
 					console.log('------月份2----->'+memberCountList2[i]);
     				s+=memberCountList[i];
 				}
 				
    		},
    		
    		
    		error: function (memberCountList) {
    	        console.log(memberCountList+'<------出錯拉');
    	    }
    				
    	});	
    	console.log('測試樓下');
    	console.log('第幾個月->'+memberCountList2[2]+'<--在外面可用');
	
</script>




<!-- member_25  for Countmember  -->
<script type="text/javascript">
    
    
    //memberGender  會員性別
    // 初始化ECharts元件到id為main的元素上
    let myChart = echarts.init(document.getElementById('memberGender'));
    // 定義圖示的配置項
    let option = {
        title: {
    text: '會員性別',
    subtext: '',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: '50%',
      data: [
        { value: 12, name: '男性' },
        { value: 735, name: '女性' },
        { value: 580, name: '其他' },
    
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
};
    myChart.setOption(option);
    
    
    
    
    //memberCount 會員人數
    // 初始化ECharts元件到id為main的元素上
    let myChart2 = echarts.init(document.getElementById('memberCount'));
    // 定義圖示的配置項
    console.log('第幾個月->'+memberCountList2[2]+'<--在外面可用2222');
    let option2 = {
    	 xAxis: {
    	 type: 'category',
    	 data: ['5月','6月', '7月', '8月', '9月', '10月', '11月', '12月']
    	},
    	 yAxis: {
    	 type: 'value'
    	  },
    	series: [
   		 {
    	  data: [
    		  
    		  
    		  
    	120,
    	{
    	value: 2000,
    	 itemStyle: {
    		color: '#a90000'
    	}
    	},
    	1500,
    	80,
    	70,
    	110,
    	130,
    	20,
    	
    	
    ],
    type: 'bar'
    }
    ]
  };
    myChart2.setOption(option2);
    
</script>






  