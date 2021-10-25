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
fieldset {
    border: 1px solid rgb(255, 232, 57);
    width: 400px;
    margin: auto;
}
.aui-info {
    position: relative;
}

 .fileInput{
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            opacity: 0;
            display: block;
            width: 3.5rem;
            clear: both;
            display: block;
            margin: auto;
            background-color: red;
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
    <div align='center'>
        <a href="<c:url value='/' />">
        回首頁
        </a>
    </div> 
    <hr style="height: 1px; border: none; color: #333; background-color: #333;">
    <section class="container">
        <!--       三個地方要完全一樣 -->
      
  				   
        <form:form method='POST' modelAttribute="product" class='form-horizontal'
        	enctype="multipart/form-data">
            <fieldset >
             	<div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for='productId'>
                        商品代號
                    </label>
                    <div class="col-lg-10">
                         <input id="productId" name="productId" type='text'
                            class='form:input-large' value="${product.productId}" readonly="readonly" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2" for='productName'>
                        商品名稱
                    </label>
                    <div class="col-lg-10">
                         <form:input id="productName" path="productName" type='text'
                            class='form:input-large' />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-lg-2 col-lg-2"  for='price'>
                        商品價格
                    </label>
                    <div class="col-lg-10">
                        <form:input id="price" path="price" type='text'
                            class='form:input-large' />
                    </div>
                </div>

                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="category">
                       商品種類
                    </label>
                    <div class='col-lg-10'>
                        <form:select path="category">
                            <form:option value="家電影音">
                            	
                            </form:option>
                            <form:options items="${categoryList}" />
                        </form:select>
                    </div>
                </div>

                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="stock">
                        商品數量
                    </label>
                    <div class='col-lg-10'>
                        <form:input id="stock" path="stock" type='text'
                            class='form:input-large' />
                    </div>
                </div>
                <div class="form-group">
                    <label class='control-label col-lg-2 col-lg-2' for="productNo">
                        商品代號
                    </label>
                    <div class='col-lg-10'>
                        <form:input id="productNo" path="productNo" type='text'
                            class='form:input-large' />
                    </div>
                </div>
     
             <div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productImage">
						新增照片
					</label>
			<div class='col-lg-10'>
				<form:input  type="file" id="productImage" onchange="fileSelected();" style="display:none;"
				  path="productImage" vaule="${product.productImage}"
					class='form:input-large'/>
					
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
   
    <div class="face">
     <img width='300' height='300' id="demo" class="normalFace" onclick="fileSelect();"
  				   src="<c:url value='/getPicture/${product.productId}' />" />	
  				   
 <form id="form_face" enctype="multipart/form-data" style="width:auto;">
  <input type="file" name="productImage" id="productImage" onchange="fileSelected();" style="display:none;">
 </form>
  </div>
    
    
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
