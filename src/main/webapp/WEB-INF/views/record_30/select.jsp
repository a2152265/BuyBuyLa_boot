<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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


    <title>card</title>
<!-- 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"> -->
<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script> -->
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
	<style>
				body {
					color: #566787;
					background: #f5f5f5;
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
	</style>
    <script>
        $(document).ready(function () {
            jQuery('#example').DataTable();
        });


    </script>

    <style>
    </style>
</head>

<body>
    
    <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>訂單編號<i class="fa fa-sort"></i></th>
                <th>訂單總價</th>
                <th>購買時間</th>
                <th>詳細資料</th>
            </tr>
        </thead>
        		<%
			int i = 0;
			%>
        <tbody>
        <c:forEach var="selects" items="${selectlist}">
					<% i += 1;	%>
            <tr>
                <td>${selects.record_id}</td>
                <td>${selects.totalprice}</td>
                <td>${selects.buy_time}</td>
                <td>
				<a href="<c:url value='/select?id=${selects.record_id}'/>" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
				</td>
            </tr>
</c:forEach>
        </tfoot>
    </table>
<div class="clearfix">
					<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
					<ul class="pagination">
						<li class="page-item disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item active"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
					</ul>
				</div>
			</div>


</body>
</html>