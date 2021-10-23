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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
fieldset {
    border: 1px solid rgb(255, 232, 57);
    width: 400px;
    margin: auto;
}
</style>
<title>Products</title>
</head>
<body>
    <section>
        <div class="container">
            <h1 style="text-align: center">
         		新增產品資料
            </h1>
        </div>
    </section>
    <div align='center'>
        <a href="<c:url value='/' />">
        回首頁
        </a>
    </div> 
    <hr style="height: 1px; border: none; color: #333; background-color: #333;">
    <section class="container">
        <!--       三個地方要完全一樣 -->
        <form:form id='form' method='POST' modelAttribute="productBean" class='form-horizontal'
        	enctype="multipart/form-data">
            <fieldset >
                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for='productName'>
                        商品名稱
                    </label>
                    <div class="col-lg-10">
                         <form:input id="productName" path="productName" type='text'
                            class='form:input-large' name="productName" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2"  for='price'>
                        商品價格
                    </label>
                    <div class="col-lg-10">
                        <form:input id="price" path="price" type='text'
                            class='form:input-large' name="price" />
                    </div>
                </div>

                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="category">
                       商品種類
                    </label>
                    <div class='col-lg-10'>
                        <form:select path="category">
                            <form:option value="女生衣服"></form:option>
                            <form:option value="男生衣服"></form:option>
                            <form:option value="寵物"></form:option>
                            <form:option value="運動健身"></form:option>
                            <form:option value="其他"></form:option>
                       
                        </form:select>
                    </div>
                </div>

                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="stock">
                        商品數量
                    </label>
                    <div class='col-lg-10'>
                        <form:input id="stock" path="stock" type='text'
                            class='form:input-large' name="stock"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="productNo">
                        商品代號
                    </label>
                    <div class='col-lg-10'>
                        <form:input id="productNo" path="productNo" type='text'
                            class='form:input-large' name="productNo" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="productInfo">
                        商品描述
                    </label>
                    <div class='col-lg-10'>
                        <form:textarea id="productNo" path="productInfo" 
                          rows="4" cols="40"  class='form:input-large' name="productInfo" />
                    </div>
                </div>
     
             <div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						新增照片
					</label>
			<div class='col-lg-10'>
				<form:input  id="productImage" path="productImage" type='file'
					class='form:input-large' />
			</div>
		</div>         
                <div class="form-group">
                    <div class='col-lg-offset-2 col-lg-10'>
                        <input id="btnAdd" type='submit' class='btn btn-primary'
                            value="送出" />
                    </div>
                </div>
            </fieldset>
        </form:form>
    </section>
    
</body>
</html>
