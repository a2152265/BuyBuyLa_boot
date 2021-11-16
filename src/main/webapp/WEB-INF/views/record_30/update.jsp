<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ include file="../Home/seller/header.jspf"%>
	<!-- sidebar -->	
	<%@ include file="../Home/seller/sidebar.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>
    
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


    <title>購物紀錄</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	
	<style>
				body {
					color: #566787;
					font-family: 'Roboto', sans-serif;
				}
				.table-responsive {
					margin: 30px 0;
				}
				.table-wrapper {
					min-width: 1000px;
					background: #fff;
					padding: 20px;
					box-shadow: 0 1px 1px rgba(0,0,0,.05);
				}
				.table-title {
					padding-bottom: 10px;
					margin: 0 0 10px;
					min-width: 100%;
				}
				.table-title h2 {
					margin: 8px 0 0;
					font-size: 22px;
				}
				.search-box {
					position: relative;
					float: right;
				}
				.search-box input {
					height: 34px;
					border-radius: 20px;
					padding-left: 35px;
					border-color: #ddd;
					box-shadow: none;
				}
				.search-box input:focus {
					border-color: #3FBAE4;
				}
				.search-box i {
					color: #a0a5b1;
					position: absolute;
					font-size: 19px;
					top: 8px;
					left: 10px;
				}
				table.table tr th, table.table tr td {
					border-color: #e9e9e9;
				}
				table.table-striped tbody tr:nth-of-type(odd) {
					background-color: #fcfcfc;
				}
				table.table-striped.table-hover tbody tr:hover {
					background: #f5f5f5;
				}
				table.table th i {
					font-size: 13px;
					margin: 0 5px;
					cursor: pointer;
				}
				table.table td:last-child {
					width: 130px;
				}
				table.table td a {
					color: #a0a5b1;
					display: inline-block;
					margin: 0 5px;
				}
				table.table td a.view {
					color: #03A9F4;
				}
				table.table td a.edit {
					color: #FFC107;
				}
				table.table td a.delete {
					color: #E34724;
				}
				table.table td i {
					font-size: 19px;
				}
				.pagination {
					float: right;
					margin: 0 0 5px;
				}
				.pagination li a {
					border: none;
					font-size: 95%;
					width: 30px;
					height: 30px;
					color: #999;
					margin: 0 2px;
					line-height: 30px;
					border-radius: 30px !important;
					text-align: center;
					padding: 0;
				}
				.pagination li a:hover {
					color: #666;
				}
				.pagination li.active a {
					background: #03A9F4;
				}
				.pagination li.active a:hover {
					background: #0397d6;
				}
				.pagination li.disabled i {
					color: #ccc;
				}
				.pagination li i {
					font-size: 16px;
					padding-top: 6px
				}
				.hint-text {
					float: left;
					margin-top: 6px;
					font-size: 95%;
				}
				.bt1{
					padding-right: 0px;
					padding-left: 0px;
					padding-top: 0px;
					padding-bottom: 3px;	
					border-top-width: 0px;
					border-bottom-width: 0px;
					border-right-width: 0px;
				}
				.container-xl {
					max-width:1300px !important;
				}
	</style>

</head>

<body>
    <div class="container" style="max-width: 95%;">
      <span style="font-size:30px;  font-weight:bold;">訂單管理</span>
      </div>
<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8"><h2><b>訂單管理</b></h2></div>
						
					</div>
				</div>
    
    <table id="example" class="display" style="width:100%">
       	<thead>
						<tr>
							<th>訂單編號<i class="fa fa-sort"></i></th>
							<th>商品編號</th>
							<th>商品名稱</th>
							<th>商品單價</th>
							<th>訂購數量</th>
							<th>購買時間</th>
							<th>出貨狀況</th>
							<th>編輯資料</th>
						</tr>
					</thead>
        		<%
			int i = 0;
			%>
<tbody>
    	<c:forEach var="update" items="${updateRecord}">
<%-- 					<form:form method='POST' modelAttribute="updatebean" class='form-horizontal'>	 --%>
						<tr>
							<td id='rid'>${update.record_id}</td>
							<td id='pid'>${update.pid}</td>
							<td>${update.p_name}</td>
							<td>${update.p_price}</td>
							<td>${update.pcount}</td>
							<td>${update.buy_time}</td>
					
							<td>
							<select path='transport_status' id='ts'>
							<option selected>${update.transport_status}</option>
							<option disabled>======</option>
<!-- 							<option value='待出貨' disabled>待出貨</option> -->
							<option value='運送中'>運送中</option>
<%-- 							<form:option value='已到貨'>已到貨</form:option>							 --%>
							</select>
							</td>

							<td>	
							 <a href="<c:url value='/selectbuyer?rid=${update.record_id}'/>" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
<%-- 							<form:input path="record_id" value='${update.record_id}' style="display:none"/> --%>
<%-- 							<form:input path="pid" value='${update.pid}' style="display:none"/>	 --%>
<!-- 							<button type="submit" class="btn bt1" data-toggle="modal" data-target="#staticBackdrop">										 -->
								<a href="<c:url value='/updatevalue30?rid=${update.record_id}&pid=${update.pid}&ts=運送中' />" class="edit" title="Edit" data-toggle="tooltip">
								<i class="material-icons">&#xE254;</i>
								</a>
<!-- 							</button>	 -->
									<a href='#' onclick="if(window.confirm('確定要刪除？')) location.href ='<c:url value='/delete?rid=${update.record_id}&pid=${update.pid}'/>'" class="delete" title="Delete" data-toggle="tooltip">
									<i class="material-icons">&#xE872;</i>
									</a>
							
							</td>
						</tr>
													
						
						</c:forEach>	
					</tbody>
    </table>
</div>
</div>
</div>
	<center>
			<a class="btn btn-outline-secondary" href="<c:url value='/member/evolution' />" style='font-size:20px' role="button">回上一頁</a>	
			</center>


    <script>
        $(document).ready(function () {
            jQuery('#example').DataTable();
        });


    </script>

</body>
</html>