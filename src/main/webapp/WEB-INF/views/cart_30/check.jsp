<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<!-- <link -->
<!-- 	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" -->
<!-- 	rel="stylesheet"> -->


<title>購物車</title>




<title>購物車</title>


<style>
/* * { */
/* 	margin: 10px; */
/* 	padding: 0; */
/* } */

/* .container { */
/* 	width: 1200px; */
/* 	margin: 0 auto; */
/* } */

h1 {
	text-align: left;
	font-size: 250%;
}

h3 {
	margin: 20px 0;
}

table {
	border-collapse: collapse;
	width: 1200px;
	margin-top: 20px;
	text-align: center;
}

table img {
	width: 100px;
	padding: 5px
}

table thead {
	font: bold 22px/40px "微软雅黑";
	background-color: lightblue;
	color: #fff;
}

table.hide {
	display: none;
}

/* table .ck {
	width: 22px;
	height: 22px;
	vertical-align: middle;
} */
table tbody input {
	width: 20px;
	text-align: center;
}

.up, .down {
	width: 20px;
}

.box {
	width: 100%;
	height: 200px;
	background-color: lightblue;
	font: bold 36px/200px "微软雅黑";
	text-align: center;
}

.box.hide {
	display: none;
}

h2 {
	float: right;
	padding: 20px;
}

h2.hide {
	display: none;
}

h2 span {
	font: bold 33px/33px "微软雅黑";
	color: red;
}

.submit {
	margin: auto;
	padding: auto;
	font-size: 20px;
}

.title {
	background-color: lightblue;
	width: 1200px;
	height: 120px;
	display: block;
	padding: 20px 0;
	left: 0%;
	top: 0%
}

.search {
	position: absolute;
	left: 30%;
	top: 1%
}

#search {
	width: 800px;
	height: 40px;
	font-size: 20px;
}
</style>
</head>

<body>


	<div class="container">
		<div id="title" class="title">
			<h1>購物車</h1>
			<div class="search">
				<button class="icon">
					<i class="fa fa-search"></i>
				</button>
				<input type="search" id="search" placeholder="Search..." />
			</div>
		</div>

		<h3>
			<a href="<c:url value='/products' />">返回商品頁面</a><br> <a href="<c:url value='/cart' />">返回上一頁</a>
		</h3>
		<table>
			<thead>
				<tr>
					<th>圖片</th>
					<th>商品名稱</th>
					<th>數量</th>
					<th>單價</th>
					<th>合計</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach var="row" items="${cart}">
					<tr>
						<td><img width='150' src="<c:url value='/getPicture/${row.pid}' />" /></td>
						<td>${row.p_name}</td>
						<td>${row.count}</td>
						<td>NT<span>${row.p_price}</span></td>
						<td>NT<span class="total">${row.count*row.p_price}</span></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>

		<h2 id="h2" class="">
			總價：$<span id="totalPrice">0</span>
		</h2>
		<br> <br> <br> <br> <br> <br>
		
	
		
	<br> <br> <br> <br> <br> <br>
			
    <div class="bn" >
        <!-- Button新增地址 -->
        <div style="text-align:right;">
        <select style='font-size:20px'>
        <option selected>Choose...</option>
		<c:forEach var="rows" items="${BuyerAddressList}">
	
			<option>${rows.city}&nbsp;${rows.address}</option>
			
	
		</c:forEach>
		</select>
	        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#staticBackdrop">
	            <a role="button">新增地址</a>
	        </button>
		</div>
        <!-- Modal -->
        <div class="modal fade " id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">新增地址:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



							<form:form method='POST' modelAttribute="BuyerAddress" class='needs-validation'>	
                            <div class="form-row ">
                                <div class="col-md-6 mb-3 col-form-label-sm">
                                    <label for="validationCustom01">姓名:</label>
                                    <form:input path='buyerName' type="text" class="form-control col-form-label-sm"  value="" placeholder="姓名" required="required"/>
                                    <div class="valid-feedback">

                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="validationCustom02">電話:</label>               
                                    <form:input type='text' class="form-control" path='phone' value="" placeholder="電話" required="required"/>
                                    <div class="valid-feedback">

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="validationCustom02">城市:</label>
                                <form:select path='city' class="custom-select mr-sm-2" id="inlineFormCustomSelect" required="required">
                                    <option selected>Choose...</option>
                                    <form:option value="臺北市">臺北市</form:option>
                                    <form:option value="新北市">新北市</form:option>
                                    <form:option value="桃園市">桃園市</form:option>
                                    <form:option value="臺中市">臺中市</form:option>
                                    <form:option value="臺南市">臺南市</form:option>
                                    <form:option value="高雄市">高雄市</form:option>
                                    <form:option value="新竹縣">新竹縣</form:option>
                                    <form:option value="苗栗縣">苗栗縣</form:option>
                                    <form:option value="彰化縣">彰化縣</form:option>
                                    <form:option value="南投縣">南投縣</form:option>
                                    <form:option value="雲林縣">雲林縣</form:option>
                                    <form:option value="嘉義縣">嘉義縣</form:option>   
                                    <form:option value="屏東縣">屏東縣</form:option>
                                    <form:option value="宜蘭縣">宜蘭縣</form:option>
                                    <form:option value="花蓮縣">花蓮縣</form:option>
                                    <form:option value="臺東縣">臺東縣</form:option>
                                    <form:option value="澎湖縣">澎湖縣</form:option>
                                    <form:option value="金門縣">金門縣</form:option>
                                    <form:option value="連江縣">連江縣</form:option>
                                    <form:option value="基隆市">基隆市</form:option>
                                    <form:option value="新竹市">新竹市</form:option>
                                    <form:option value="嘉義市">嘉義市</form:option>
                                </form:select>
                                <div class="valid-feedback">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="validationCustom03">地址:</label>
                                <form:input path='address' type="text" class="form-control" id="validationCustom02" value="" placeholder="地址" required="required"/>
                                <div class="valid-feedback">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="validationCustom03">Email</label>
                                <form:input path='email' type="text" class="form-control" id="validationCustom02" value="" placeholder="Email" required="required"/>
                                <div class="valid-feedback">

                                </div>
                            </div>


                            <div class="modal-footer">

                                <button type="button" class="btn btn-outline-info">一件輸入</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>

                                <button type="submit" class="btn btn-primary">送出</button>
                            </div>
                        </form:form>

                        <script>
                            // Example starter JavaScript for disabling form submissions if there are invalid fields
                            (function () {
                                'use strict';
                                window.addEventListener('load', function () {
                                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                    var forms = document.getElementsByClassName('needs-validation');
                                    // Loop over them and prevent submission
                                    var validation = Array.prototype.filter.call(forms, function (form) {
                                        form.addEventListener('submit', function (event) {
                                            if (form.checkValidity() === false) {
                                                event.preventDefault();
                                                event.stopPropagation();
                                            }
                                            form.classList.add('was-validated');
                                        }, false);
                                    });
                                }, false);
                            })();
                        </script>
                    </div>

                </div>
            </div>
        </div>
    </div>
		
		<center>

			<a href="<c:url value='/fin' />"><input type="submit" name="confirm"
				value="確認送出" class="submit"></a>
		</center>
		
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		var total = 0;
		$('.total').each(function() {
			$(this).html;
			var a = parseInt($(this).html());
			total = total + a

		})

		$('#totalPrice').html(total)
	</script>

</body>



</html>