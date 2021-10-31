<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<title>Products</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
    <section>
        <div class="container">
            <h1 style="text-align: center">
         		新增產品資料
            </h1>
        </div>
    </section>
 <!--     <div align='center'>
        <a href="<c:url value='/' />">
        回首頁
        </a>
    </div> 
    -->
    <hr style="height: 1px; border: none; color: #333; background-color: #333;">
    <section class="container">
        <!--       三個地方要完全一樣 -->
        <form:form id='form' method='POST' modelAttribute="productBean" class='form-horizontal'
        	enctype="multipart/form-data">
             <table rules="all">
       		
		<tbody>
				<div id="display" class="im" style="margin-bottom:80px">
				<img src="https://unsplash.com/photos/8pb7Hq539Zw?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink" width="150" height="150" alt="封面圖片" >
			</div>
			
			 <tr>
                <td> <label  for="productInfo">
                        商品照片:
                     </label></td>
                <td> 
                		<form:input id="productImage" path="productImage" type='file' accept=".jpg,.png,.gif,.svg"
                            class='form:input-large' /></td>
            </tr>
			
            <tr>
                <td><label  for="productName">
						商品名稱
					</label></td>
                <td>	<form:input id="productName" path="productName" type='text'
							class='form:input-large' /></td>
            </tr>
			<tr>
                <td><label for='price'>
                        商品價格
					</label></td>
                <td>  <form:input id="price" path="price" type='number' min='1'
                            class='form:input-large' /></td>
            </tr>

	  <tr>
                <td><label  for='category'>
						商品種類:          
					</label></td>
                		<td>        
                		<form:select path="category">
                            <form:option value="女生衣服"></form:option>
                            <form:option value="男生衣服"></form:option>
                            <form:option value="寵物"></form:option>
                            <form:option value="運動健身"></form:option>
                            <form:option value="其他"></form:option>
                       
                        </form:select>
                        </td>
            </tr>



            <tr>
                <td> <label   for='stock'>
                         商品數量:
                     </label></td>
                <td> <form:input id="stock" path="stock" type='number' min='1'
                            class='form:input-large' />
		</td>
            </tr>
           
            <tr>
                <td><label for="productNo">
                     	商品代號:
                    </label></td>
                <td><form:input id="productNo" path="productNo" type='text'
                            class='form:input-large' /></td>
            </tr>
            <tr>
                <td> <label  for="productInfo">
                        商品描述:
                     </label></td>
                <td> <form:textarea id="productInfo" path="productInfo" type='text'
                            class='form:input-large' /></td>
            </tr>
            
               </tbody>
    </table>
    		<div class="wrap" style="display: flex;margin-left: 80px;">
      			  <input id="btnAdd" type='submit' class='btn btn-primary'
                            value="送出" />
	</div>  
        </form:form>
        
    </section>
    
    <script>
    var x = new FileReader;
    document.forms[0].elements[0].onchange = function () {
        x.readAsDataURL(this.files[0]);
    }
    x.onloadend = function () {
        document.images[0].src = this.result;
    }
    
    

    </script>
    
</body>
</html>
