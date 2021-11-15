<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyBuyLa | 賣家中心</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<style>
#myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 50%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
  border-collapse: collapse; /* Collapse borders */
  width: 50%; /* Full-width */
  border: 1px solid #ddd; /* Add a grey border */
  font-size: 14px; /* Increase font-size */
  margin:auto;
  font-family: "微軟正黑體";
  font-weight: bolder;
            
}

#myTable th, #myTable td {
  text-overflow:ellipsis; 
  white-space:nowrap;
  word-wrap:break-word; 
  text-align: center; /* Left-align text */
  padding: 12px; /* Add padding */
}

#myTable tr {
  /* Add a bottom border to all table rows */
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  /* Add a grey background color to the table header and on hover */
  background-color: #ECF5FF;
}
 .btn-outline-primary {
  color:black;
  background-color: liightgray;
  border:0;
  width:130px;
  height:50px;
}
  .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active:hover{
  color: black;
  background-color:#f5f6fa;
  border-color: #f5f6fa;
}


.page-content {
  position: relative;
  left: var(--page-header-width);
  width: calc(100% - var(--page-header-width));
/*   min-height: 100vh; */
  padding: 25px 0;
  color: var(--page-content-txtColor);
  background: var(--page-content-bgColor);
}

.search-and-user {
  display: grid;
  grid-template-columns: 1fr auto;
  grid-column-gap: 50px;
  align-items: center;
  background: var(--page-content-bgColor);
  margin-bottom: 30px;
}

.search-and-user form {
  position: relative;
}

.search-and-user [type="search"] {
  width: 100%;
  height: 50px;
  font-size: 1.5rem;
  padding-left: 15px;
  background: var(--page-content-blockColor);
  color: var(--white);
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}

.search-and-user ::placeholder {
  color: var(--page-content-txtColor);
}

.search-and-user form svg {
  width: 26px;
  height: 26px;
  fill: var(--page-content-txtColor);
}

.search-and-user form button {
  position: absolute;
  top: 50%;
  right: 15px;
  transform: translateY(-50%);
}

.search-and-user .admin-profile {
  display: flex;
  align-items: center;
}

.search-and-user .admin-profile .greeting {
  margin: 0 10px 0 20px;
}

.search-and-user .admin-profile svg {
  width: 30px;
  height: 30px;
}

.search-and-user .admin-profile .notifications {
  position: relative;
}

.search-and-user .admin-profile .badge {
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: -10px;
  right: -3px;
  width: 18px;
  height: 18px;
  border-radius: 50%;
  font-size: 10px;
  color: var(--white);
  background: var(--red);
}

.page-content .grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 30px;
}

.page-content .grid > article {
  display: flex;
  height: 300px;
  background: var(--page-content-blockColor);
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}

.page-content .grid > article:first-child,
.page-content .grid > article:last-child {
  grid-column: 1 / -1;
}

.table-wrapper {
					min-width: 1000px;
					background: #fff;
					padding: 20px;
					box-shadow: 0 1px 1px rgba(0,0,0,.05);
				}

.table-responsive {
					margin: 30px 32px 30px 0 ;
				}
				
    .dashboard-cards {
  position: relative;
  padding-bottom: 50px;
  margin-left: 25px;
  
}

.dashboard-cards .card {
  background: #ffffff;
  display: inline-block;
  -webkit-perspective: 1000;
  perspective: 1000;
  z-index: 20;
  padding: 0 !important;
  margin: 5px 5px 10px 5px;
  position: relative;
  text-align: left;
  transition: all 0.3s 0s ease-in;
  z-index: 1;
  width: calc(33.33333333% - 21.5px);
  cursor: pointer;
  transition: all 0.3s ease;
}

.dashboard-cards .card:hover {
  box-shadow: 0 15px 10px -10px rgba(31, 31, 31, 0.5);
  transition: all 0.3s ease;
}

.dashboard-cards .card .card-title {
  background: #ffffff;
  padding: 20px 15px;
  position: relative;
  z-index: 0;
}

.dashboard-cards .card .card-title h2 {
  font-size: 24px;
  letter-spacing: -0.05em;
  margin: 0;
  padding: 0;
}

.dashboard-cards .card .card-title h2 small {
  display: block;
  font-size: 14px;
  margin-top: 8px;
  letter-spacing: -0.025em;
}

.dashboard-cards .card .card-description {
  position: relative;
  font-size: 14px;
  border-top: 1px solid #ddd;
  padding: 10px 15px 0 15px;
}

.dashboard-cards .card .card-actions {
  box-shadow: 0 2px 0px 0 rgba(0, 0, 0, 0.075);
  padding: 10px;
  text-align: center;
}

.dashboard-cards .card .card-flap {
  background: #d9d9d9;
  position: absolute;
  width: 100%;
  -webkit-transform-origin: top;
  transform-origin: top;
  -webkit-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
}

.dashboard-cards .card .flap1 {
  transition: all 0.3s 0.3s ease-out;
  z-index: -1;
}

.dashboard-cards .card .flap2 {
  transition: all 0.3s 0s ease-out;
  z-index: -2;
}

.dashboard-cards.showing .card {
  cursor: pointer;
  opacity: 0.6;
  -webkit-transform: scale(0.88);
  transform: scale(0.88);
}

.dashboard-cards .no-touch .dashboard-cards.showing .card:hover {
  opacity: 0.94;
  -webkit-transform: scale(0.92);
  transform: scale(0.92);
}

.dashboard-cards .card.d-card-show {
  opacity: 1 !important;
  -webkit-transform: scale(1) !important;
  transform: scale(1) !important;
}

.dashboard-cards .card.d-card-show .card-flap {
  background: #ffffff;
  -webkit-transform: rotateX(0deg);
  transform: rotateX(0deg);
}

.dashboard-cards .card.d-card-show .flap1 {
  transition: all 0.3s 0s ease-out;
}

.dashboard-cards .card.d-card-show .flap2 {
  transition: all 0.3s 0.2s ease-out;
}

.dashboard-cards .card .task-count {
  width: 40px;
  height: 40px;
  position: absolute;
  top: 22px;
  right: 10px;
  background: #ecf0f1;
  text-align: center;
  line-height: 40px;
  border-radius: 100%;
  color: #333333;
  font-weight: 600;
  transition: all .2s ease;
}

.dashboard-cards .task-list {
  padding: 0 !important;
}

.dashboard-cards .task-list li {
  padding: 10px 0;
  padding-left: 10px;
  margin: 3px 0;
  list-style-type: none;
  border-bottom: 1px solid #e9ebed;
  border-left: 3px solid #ff3a3a;
  transition: all .2s ease;
}

.dashboard-cards .task-list li:hover {
  background: #ecf0f1;
  transition: all .2s ease;
}

.dashboard-cards .task-list li span {
  float: right;
  color: #ff3a3a;
  margin-right: 5px;
}

.dashboard-cards.showing .card.d-card-show .task-count {
  color: #ffffff;
  background: #ff3a3a;
  transition: all .2s ease;
}

.dashboard-cards .card-actions .btn {
  color: #333;
}

.dashboard-cards .card-actions .btn:hover {
  color: #ff3a3a;
}
@media (max-width:750px) {
  .dashboard-cards .card {
    margin-top: 10px;
    width: 100%;
  }
}
</style>
</head>
<body style="background-color: rgb(214, 214, 238,0.5);">
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>


    <div class="container" style="display:flex">
      <span style="font-size:30px;  font-weight:bold;">商品管理</span>
      	<div id="search" style="margin-left:auto">
		<button  type="button" class="btn btn-outline-primary"onclick="location.href ='<c:url value='/products/add' />'">新增商品</button>
	</div>
      </div>

  <div class='row dashboard-cards' >
        <div class='card col-md-4 '>
          <div class='card-title'>
            <h2>
              商品瀏覽排行
              <small>Top 5</small>
            </h2>
            <div class='task-count'>
              
            </div>
          </div>
          <div class='card-flap flap1'>
            <div class='card-description'>
              <ul class='task-list'>
              <c:forEach items="${viewProductList}" var="viewProductList" begin="0" end="4">
                <li>
                  ${viewProductList.productName}
                  <span>${viewProductList.views}</span>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class='card-flap flap2'>
              <div class='card-actions'>
                <a class='btn' href='#'>Close</a>
              </div>
            </div>
          </div>
        </div>
        <div class='card col-md-4 '>
          <div class='card-title'>
            <h2>
              商品銷售排行
              <small>Top 5</small>
            </h2>
            <div class='task-count'>
              
            </div>
          </div>
          <div class='card-flap flap1'>
            <div class='card-description'>
              <ul class='task-list'>
                  <c:forEach items="${salesProductList}" var="salesProductList" begin="0" end="4">
                <li>
                  ${salesProductList.productName}
                  <span>${salesProductList.sales}</span>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class='card-flap flap2'>
              <div class='card-actions'>
                <a class='btn' href='#'>Close</a>
              </div>
            </div>
          </div>
          
        </div>
         <div class='card col-md-4 '>
          <div class='card-title'>
            <h2>
              商品收藏排行
              <small>Top 5</small>
            </h2>
            <div class='task-count'>
              
            </div>
          </div>
          <div class='card-flap flap1'>
            <div class='card-description'>
              <ul class='task-list'>
              <c:forEach items="${favoriteProductList}" var="favoriteProductList" begin="0" end="4">
                <li>
                  ${favoriteProductList.productName}
                  <span>${favoriteProductList.favoriteCount}</span>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class='card-flap flap2'>
              <div class='card-actions'>
                <a class='btn' href='#'>Close</a>
              </div>
            </div>
          </div>
        </div>

  <section class="page-content">
  
	
	 
      <span style="font-size:30px; display:block;text-align: center; font-weight:bold;">全部商品</span>
     
	
	<div class="table-responsive">
	<div class="table-wrapper">
		<table id="myTable" class="display" style="width:100%;font-weight:bolder;font-size:20px;" >
  
    <thead >
        <tr >
    <th style="width:6%;"><i class="fas fa-list-ol"></i>&nbsp商品編號</th>
    <th style="width:12%;"><i class="fas fa-portrait"></i>&nbsp商品名稱</th>
    <th style="width:15%;"><i class="fas fa-image"></i>&nbsp商品圖片</th>
    <th style="width:10%;"><i class="far fa-calendar-alt"></i>&nbsp商品庫存</th>
    <th style="width:10%;"><i class="far fa-calendar-alt"></i>&nbsp商品價錢</th>
    <th style="width:10%;"><i class="far fa-calendar-alt"></i>&nbsp銷售量</th>
    <th style="width:10%;"><i class="far fa-calendar-alt"></i>&nbsp商品瀏覽量</th>
    <th style="width:10%;"><i class="far fa-clipboard"></i>&nbsp商品類別</th>
    <th style="width:20%;"><i class="fas fa-file-alt"></i>&nbsp上傳時間</th>
    <th style="width:20%;"><i class="fas fa-file-alt"></i>&nbsp商品狀態</th>
    <th style="width:10%;"><i class="fas fa-pencil-alt"></i>&nbsp修改</th>
    <th style="width:10%;"><i class="fas fa-trash-alt"></i>&nbsp刪除</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${sellerproducts}" var="product">
        <tr>
    <td>${product.productId}</td>
    <td>${product.productName}</td>
    <td><img width='100' height='100' 
  				   src="<c:url value='/getPicture/${product.productId}' />" /></td>
  	<td>${product.stock}</td>			   
    <td>${product.price}</td>
    <td>${product.sales}</td>
    <td>${product.views}</td>
    <td>${product.category}</td>
    <td>${product.insertTime}</td>
    <td>${product.status}</td>
    <td><button style="border:0"  type="button" onclick="location.href ='../update?productId=${product.productId}'" ><i class="fas fa-edit"></i></button></td>
    <td><button style="border:0"  class="btn" type="button" onclick="location.href ='../delete/${product.productId}'" ><i class="fas fa-trash-alt"></i></button>
    </td>
  </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</div>
</section>
<!-- 	<span style="font-size:30px; display:block;text-align: center; font-weight:bold;">商品留言</span> -->



  </div >
        <div class="sidebar" style="background-color: rgb(1, 1, 112);">
            <div class="profile">
                <!--    <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">  --> 
                   <!-- 讀取圖片 -->
                  <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>"   alt="profile_picture" />
                   <h3></h3>
                   <p>${memberUiDefault.userEmail} </p>
               </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />" >
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">首頁</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/member_Ui' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">會員中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/update30' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/products/seller' />">
                        <span class="icon"><i class="fas fa-gifts"></i></span>
                        <span class="item">商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/seller/inschan_on' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/logout' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">登出</span>
                    </a>
                </li>
 

             
                
            </ul>
        </div>
        
    </div>
    </div>	



    <script>
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
  
  $('#myTable').DataTable({
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
  
  $(document).ready(function(){
	  var zindex = 10;
	  
	  $("div.card").click(function(e){
	    e.preventDefault();

	    var isShowing = false;

	    if ($(this).hasClass("d-card-show")) {
	      isShowing = true
	    }

	    if ($("div.dashboard-cards").hasClass("showing")) {
	      $("div.card.d-card-show")
	        .removeClass("d-card-show");

	      if (isShowing) {
	        $("div.dashboard-cards")
	          .removeClass("showing");
	      } else {
	        $(this)
	          .css({zIndex: zindex})
	          .addClass("d-card-show");

	      }

	      zindex++;

	    } else {
	      $("div.dashboard-cards")
	        .addClass("showing");
	      $(this)
	        .css({zIndex:zindex})
	        .addClass("d-card-show");

	      zindex++;
	    }
	    
	  });
	});
  
  
    </script>
 
</body>
</html>