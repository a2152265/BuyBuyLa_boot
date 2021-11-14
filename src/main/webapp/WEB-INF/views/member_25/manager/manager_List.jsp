
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/manager/datatable/header.jspf"%>
<!-- sidebar -->
<%@ include file="../../Home/manager/footer.jspf"%>


   
<!-- title -->
   <div style="color:black; background-color:white; margin-left:15%;  margin-right:5%; margin-top:15px; margin-botton:30px; padding:30px;">
    	<h1 style="font-size:50px; text-align:center;">管理者中心</h1>
   </div>
   
   <div>
<!-- 通知欄 -->
<section class="page-content">
	<section class="search-and-user">
		
		
	</section>
	
	
	<!-- Analyze pic div-->
	<!-- chart analyzza pic -->
 <script src="https://cdn.bootcss.com/echarts/4.6.0/echarts.min.js"></script>
	
 <!-- 放分析圓餅圖 -->
 	<div style=" display:flex; 　position:relative">
  	<div style="width:60%; display:flex; 　position:relative">
    <article style="width:40%; 　position:relative">
     <div id="memberCount" style="width: 500px;height:300px;" class="analyzeDiv"></div>
    </article>
    </div>
    
    	<div style="width:40%;  　position:relative">
    <article style="width:40%; 　position:relative">
     <div id="memberGender" style="width: 500px;height:300px;" class="analyzeDiv"></div>
    </article>
    </div>
    
    </div>
    
    





	<!-- 會員清單 -->
	<h1 style="font-size: 40px; text-align: center;">會員清單</h1>


	<table id="example" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>會員編號</th>
				<th>E-mail</th>
				<th>電話</th>
				<th  style="width:20%; max-width: 50px;">密碼</th>
				<th>會員名稱</th>
				<th>會員暱稱</th>
				<th>性別</th>
				<th>地址</th>
				<th>8.權限</th>
				<th>備註</th>
				<th>會員狀態</th>
				<th>修改</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach varStatus="memberr"  var="member" items="${memberList}">
			
			<!-- 加入欄位顏色 --> <!--  
				<c:choose>
					<c:when test="${memberr.count %2==0}">
						<c:set var="rowColor" value="#FFEBFF"/>
					</c:when>
					<c:otherwise>
						<c:set var="rowColor" value="#DEFADE"/>
					</c:otherwise>
				</c:choose>    bgColor="${rowColor}" -->
				<tr    height='25'>  
				
				
					<td><c:out value="${member.id}" /></td>
					<td><c:out value="${member.userEmail}" /></td>
					<td><c:out value="${member.userPhone}" /></td>
					<td  style="width:20%; max-width: 90px; word-break: break-all;" ><c:out value="${member.userPwd}" /></td>
					<td><c:out value="${member.userName}" /></td>
					<td><c:out value="${member.userNickname}" /></td>
					<td><c:out value="${member.userGender}" /></td>
					<td><c:out value="${member.address}" /></td>
					<td><c:out value="${member.identification}" /></td>
					<td style="color: red;"><c:out value="${member.notes}" /></td>
					<td style="color: red;"><c:out value="${member.suspension}" /></td>

					<td>


						<div class="bn">
							<!-- Button 修改會員資料 -->
							<!--	<a href="<c:url value='/select?id=${selects.record_id}'/>" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a> -->

							<a href='/BuyBuyla_boot/manager/edit${member.id}' class="view"
								title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a><br>
							<a href='/BuyBuyla_boot/manager/delete${member.id}'
								onclick="return(confirm('確認刪除？'))" class="button-1">刪除</a>

						</div>

					</td>
				</tr>
			</c:forEach>
	</table>
	
	
	</section>
	</div>
<!-- 
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>  -->
	
	  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script>
	
        console.log('INNNNNNNNNNN');
    	$.ajax({
    		type:'get',
    		url:'banList',
    		data:{		
    		},
    		 async: true,
    		 dataType: "json",     
    		 contentType: 'application/json; charset=utf-8',
    		success:function(banList){
 				 console.log('HAAAAAAAAAa');
 				console.log(banList);	
 				var s=[];
 				//sweat alert
 				for(i=0 ; i<banList.length ; i++){
     				banList[i];
     				s+=banList[i]+"<br>";
 				}
 				
 				    let timerInterval
  				  Swal.fire({
   				 title: '您好 ! !  這裡是ban list',
   				html: 
   					s
  				  ,
   				 timer: 500000,
   				 timerProgressBar: true,
    				didOpen: () => {
    			  Swal.showLoading()
   			   const b = Swal.getHtmlContainer().querySelector('b')
    			  timerInterval = setInterval(() => {
    			    b.textContent = Swal.getTimerLeft()
   			   }, 2000)
   			 },
    willClose: () => {
      clearInterval(timerInterval)
    }
  }).then((result) => {
    /* Read more about handling dismissals below */
    if (result.dismiss === Swal.DismissReason.timer) {
      console.log('Ban ban ban')
    }
  })
    			 
    		},
    		error: function (banList) {
    	        console.log(banList);
    	    }
    				
    	});	
    	
    </script>
    
    
    
    
<!-- Ajax傳data專用 -->
<script>
	//會員人數統計
	var memberCountList2=[];
	 console.log('INNNNNNNNNNN');
	 ajax_memberCount=$.ajax({
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
     				s+=memberCountList[i];
 				}
 				
    		},
    		
    		
    		error: function (memberCountList) {
    	        console.log(memberCountList+'<------出錯拉');
    	    }
    				
    	});	
	
	 $.when(ajax_memberCount).done(function () {
		//所做操作
		});
	 
	 
	 
	 
	 
	//會員性別統計
		var memberGenderList2=[];
		 console.log('INNNNNNNNNNN2');
		 ajax_memberGender=$.ajax({
	    		type:'get',
	    		url:'AnalyzeData_memberGender',
	    		data:{		
	    		},
	    		 async: true,
	    		 dataType: "json",     
	    		 contentType: 'application/json; charset=utf-8',
	    		 
	    		 
	    		 
	    		success:function(memberGenderList){
	 				 console.log('HAAAAAAAAAa');
	 				console.log(memberGenderList);	
	 				var s=[];
	 				//sweat alert
	 				for(i=0 ; i<memberGenderList.length ; i++){
	 					memberGenderList2[i]=memberGenderList[i];
	     				s+=memberGenderList[i];
	 				}
	 				
	    		},
	    		
	    		
	    		error: function (memberGenderList) {
	    	        console.log(memberGenderList+'<------出錯拉');
	    	    }
	    				
	    	});	
	 
		
	
</script>




<!-- member_25  for Countmember  -->
<script type="text/javascript">
    
    
    //memberGender  會員性別
    // 初始化ECharts元件到id為main的元素上
    $.when(ajax_memberGender).done(function () {
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
        { value: memberGenderList2[0], name: '男性' },
        { value: memberGenderList2[1], name: '女性' },
        { value: memberGenderList2[2], name: '其他' },
    
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
    });
    
    
    
    //memberCount 會員人數
    // 初始化ECharts元件到id為main的元素上
    $.when(ajax_memberCount).done(function () {
    let myChart2 = echarts.init(document.getElementById('memberCount'));
    // 定義圖示的配置項
    console.log('第幾個月->'+memberCountList2[2]+'<--在外面可用2222');
    let option2 = {
    		 title: {
    			    text: '會員人數成長2021',
    			    subtext: '',
    			    left: 'center'
    			  },
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
    /*	{
    	value: 2000,
    	 itemStyle: {
    		color: '#a90000'
    	}
    	}, */
    	memberCountList2[0],
    	memberCountList2[1],
    	memberCountList2[2],
    	memberCountList2[3],
    	memberCountList2[4],
    	memberCountList2[5],
    	memberCountList2[6],
    	memberCountList2[7],
    ],
    type: 'bar'
    }
    ]
  };
    
    myChart2.setOption(option2);
    });
    
    
    
    $('#example').DataTable({
  	  rowReorder: true,
  	  columnDefs: [
  	      { orderable: true, className: 'reorder', targets: 0},
  	      { orderable: true, className: 'reorder', targets: 3},
  	      { orderable: true, className: 'reorder', targets: 4},
  	      { orderable: true, className: 'reorder', targets: 5},
  	      { orderable: true, className: 'reorder', targets: 7},

  	      { orderable: false, targets: '_all' }

  	      ],
       "language": {
       "processing": "處理中...",
       "loadingRecords": "載入中...",
       "lengthMenu": "顯示 _MENU_ 項結果",
       "zeroRecords": "沒有符合的結果",
       "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
       "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
       "infoFiltered": "(從 _MAX_ 項結果中過濾)",
       "infoPostFix": "",
       "search": "搜尋:",
       "paginate": {
           "first": "第一頁",
           "previous": "上一頁",
           "next": "下一頁",
           "last": "最後一頁"
       },
       "aria": {
           "sortAscending": ": 升冪排列",
           "sortDescending": ": 降冪排列"
       }
       
       
       
   }
    
    
  });
    
</script>
    