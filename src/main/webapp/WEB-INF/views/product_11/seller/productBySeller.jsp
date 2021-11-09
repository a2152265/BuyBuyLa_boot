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
    <link rel="stylesheet" href="member.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>賣家中心</title>
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
  color:lightblue;
  background-color: #fff;
  border-color: lightblue;
  width:130px;
  height:50px;
}
  .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active:hover{
  color: #fff;
  background-color:lightblue;
  border-color: lightblue;
}


.page-content {
  position: relative;
  left: var(--page-header-width);
  width: calc(100% - var(--page-header-width));
  min-height: 100vh;
  padding: 30px;
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
					margin: 30px 0;
				}
</style>
</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>



        <h1>Welcome ~~      WE Will BuyBuyLA your money</h1>



    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">賣家中心</span>
      </div>



  <section class="page-content">
  <div id="search" style="margin-bottom:30px">
						<button  type="button" class="btn btn-outline-primary"onclick="location.href ='<c:url value='/products/add' />'">新增商品</button>
	</div>
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



  </div>
        <div class="sidebar">
            <div class="profile">
                <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">
                <h3></h3>
                <p>Designer</p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='' />">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/products/seller' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">數據中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/seller_Ui' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">帳號管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/changePwd' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">更改密碼</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">刪除會員</span>
                    </a>
                </li>

                <!-- /*減去footer高度*/ -->
                <li style="min-height: calc(100% - 50px); ">
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                
            </ul>
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
  
  
  
  
    </script>
 
</body>
</html>