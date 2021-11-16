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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
<style>
 body {
            font-family: "微軟正黑體";
            background-color: rgb(1, 1, 112,0.1);
            align-items: center;
            justify-content: center;
            position: relative;
        }

        table {
            border: 1px solid rgba(147, 156, 165, 0.2);
            border-radius: 20px;
            border-collapse: collapse;
            margin: auto;
            width: 600px;
            height: 400px;
            text-align: center;
        }

        header {
            text-align: center;
        }

        input,
        textarea,
        select {
            border: 1px solid rgb(155, 153, 153, 0.4);
            background-color: rgb(203, 218, 218, 0.2);
        }
		label{
		/*border:3px solid lightblue;*/
		width:80px;
		overflow:flex;
		}
        form {
            background-color: rgb(255, 255, 255, 0.8);
            margin: 20px auto;
            max-width: 800px;
            padding: 80px;
            /* border-radius: 20px; */
            box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
        }

        .form-group__file {
            display: flex;
            flex-direction: column;
            position: relative;
            width: 100%;
            min-width: 130px;
            height: 180px;
        }

        .file-label {
            margin: 10px 0;
        }

        .file-input {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 130px;
            height: 180px;
            cursor: pointer;
            z-index: 100;
        }

        .file-preview-background {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 130px;
            height: 140px;
            background-color: #f7f7f7;
            border: 2px dashed #dfdfdf;
            border-radius: 10px;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 3px;
            text-align: center;
            color: #bbb;
            display: flex;
            justify-content: center;
            align-items: center;
            /* z-index: 1; */
        }

        .file-preview {
            width: 120px;
            height: 120px;
            position: absolute;
            top: 46px;
            left: 8px;
            border-radius: 65px;
            z-index: 10;
            object-fit: cover;
            opacity: 0;
            transition: opacity 0.4s ease-in;
        }

        h1 {
            background-color: #f7f7f7;
            /* 告訴電腦背景顏色 */
            padding: 18px 0 16px 22px;
            /* 告訴電腦內距要多大 */
            border-left: 8px solid #33779e;
            /* 告訴電腦左邊框要多寬、跟顏色 */
            color: #333 !important;
            /* 告訴電腦文字顏色 */
            width: 300px;
        }

        .wrap {
            text-align: center;
             margin-top: 50px; 
        }

        .button {
            width: 140px;
            height: 45px;
            font-family: 'Roboto', sans-serif;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 2.5px;
            font-weight: 500;
            color: #000;
            background-color: #fff;
            border: none;
            border-radius: 45px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease 0s;
            cursor: pointer;
            outline: none;
        }

        .button:hover {
            background-color: #33779e;
            color: #fff;
            transform: translateY(-7px);
        }
		.im{
		margin-left: 150px;
		/*border:1px solid lightblue ; */
		/* margin-left: 100px; */
		width:100px;
		height:100px;
		/*padding-bottom: 100px;*/
		
	}
</style>
</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background-color: rgb(1, 1, 112);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>




    <div class="container" style="max-width: 95%;">
      <span style="font-size:30px;  font-weight:bold;">更新商品</span>
 
      </div>

  

  <section class="page-content">


	<div class="table-responsive">
	<div class="table-wrapper">
		 <form:form method='POST' modelAttribute="product" class='form-horizontal'
        	enctype="multipart/form-data">
        	<div>
			<img  style="display:block; margin:auto;padding:10px;width='300' height='300'" id="demo  onclick="fileSelect();"
  				   src="<c:url value='/getPicture/${product.productId}' />" />	
  				             <div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
					</label>
			
				<form:input  type="file" id="productImage" onchange="fileSelected();" style="display:none;"
				  path="productImage" vaule="${product.productImage}"
					class='form:input-large'/>
					
		</div> 
  			</div>
         <table rules="all">
	<tbody>
			
              <tr>
                <td><label  for="productId">商品代號</label></td>
                <td><input id="productId" name="productId" type='text' class='form:input-large' value="${product.productId}" readonly="readonly" /></td>
            </tr>
	   		 <tr>
                <td> <label class="" for='productName'>商品名稱:</label></td>
                <td> <form:input id="productName" path="productName" type='text' class='form:input-large' /></td>
            </tr>
	   <tr>
                <td> <label class="" for='price'>商品價格:</label></td>
                <td> <form:input id="price" path="price" type='number' min='1' class='form:input-large' /></td>
            </tr>
            <tr>
                <td><label class=""  for='category'>商品種類:</label></td>
                <td> <form:select path="category">
                            <form:options items="${categoryList}" />
                        </form:select>
                        </td>
            </tr>
           
            <tr>
                <td><label class='' for="stock">商品數量:</label></td>
                <td> <form:textarea id="stock" path="stock" type='number' min='1' class='form:input-large' /></td>
            </tr>
            <tr>
                <td><label class='' for="productNo">商品代號:</label></td>
                <td> <form:textarea id="productNo" path="productNo" type='text' class='form:input-large' /></td>
            </tr>
             <tr>
                <td><label class='' for="productInfo">商品描述:</label></td>
                <td> <form:textarea id="productInfo" path="productInfo" type='text' class='form:input-large' /></td>
            </tr>
                 <tr>
                <td><label class='' for="insertTime">新增時間:</label></td>
                <td> <input name="insertTime"  value="${product.insertTime}" readonly="readonly" id="insertTime"  type='text' class='form:input-large'  /></td>
            </tr>
          
           
        </tbody>
   	 </table>
           		<input name="discount"  value="${product.discount}"   type='hidden' class='form:input-large'  />
   	           	<input name="views"  value="${product.views}"   type='hidden' class='form:input-large'  />
   				<input name="favoriteCount"  value="${product.favoriteCount}"   type='hidden' class='form:input-large'  />
   				<input name="point"  value="${product.point}"   type='hidden' class='form:input-large'  />
   	<div class="wrap" style="display: flex;margin-left: 80px;">
        <input id="btnAdd" type='submit' class='btn btn-primary'
                            value="送出" />
	</div> 
        </form:form>
</div>
</div>
</section>



  </div>
        <div class="sidebar" style="background-color: rgb(1, 1, 112);">
            <div class="profile">
                <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">
                <h3></h3>
                <p>Designer</p>
            </div>
            <ul>
               <li>
                    <a href="<c:url value='/' />" >
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">首頁</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/member_Ui' />" >
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
 
                <!-- /*減去footer高度*/ -->
                <li style="min-height: calc(100% - 50px); ">
                    <a href="<c:url value='/seller/inschan_on' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/try/logout' />"  onclick="return(confirm('確認登出？'))" >
                        <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
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
    
    
   $('#productImage').change(function() {
    	  var file = $('#productImage')[0].files[0];
    	  var reader = new FileReader;
    	  reader.onload = function(e) {
    	    $('#demo').attr('src', e.target.result);
    	  };
    	  reader.readAsDataURL(file);
    	});
    
    function fileSelect() {
        document.getElementById("productImage").click(); 
    }
    
    function fileSelected() {
      // 檔案選擇後觸發次函式
    }
  
  
    </script>
 
</body>
</html>