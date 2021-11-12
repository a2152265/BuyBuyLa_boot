<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
  body {
            font-family: "微軟正黑體";
            background-color: rgb(203, 218, 218);
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
            max-width: 600px;
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Products</title>
</head>
<body>
    <section>
        <div class="container">
            <h1 style="text-align: center">
         		更新產品資料
            </h1>
        </div>
    </section>

    <hr style="height: 1px; border: none; color: #333; background-color: #333;">
    <section class="container">
        <!--       三個地方要完全一樣 -->
      
  				   
        <form:form method='POST' modelAttribute="product" class='form-horizontal'
        	enctype="multipart/form-data">
        	<div>
			<img  style="display:block; margin:auto;" width='300' height='300' id="demo" class="normalFace" onclick="fileSelect();"
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
   	<div class="wrap" style="display: flex;margin-left: 80px;">
        <input id="btnAdd" type='submit' class='btn btn-primary'
                            value="送出" />
	</div> 
        </form:form>
    </section>
   
    
    
    
    <script>
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
