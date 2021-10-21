<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
<title>Insert title here</title>
</head>
<body>
   <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1 >產品清單</h1>
            </div>
        </div>
    </section>
    
    
	<div align='center'>
        <a href="<c:url value='/products' />">回首頁</a>&nbsp;&nbsp;
    </div> 
    
    <hr style="height:1px;border:none;color:#333;background-color:#333;">


        
    <section class="container">
        <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                <img width='100' height='200' 
  				   src="<c:url value='/getPicture/${product.productId}' />" />	
        	
                    <div class="caption">
                        <p>
                            <b style='font-size: 12px;'>${product.productName}</b>
                        </p>
                        <p>${product.price}</p>
                        <p>目前在庫數量: ${product.stock}</p>
                        <p>
                    <a href="<spring:url value='/product?id=${product.productId}' />"
   						 class="btn btn-primary">
    					<span class="glyphicon-info-sigh glyphicon"></span>詳細資料
						</a>
                        </p>
                        
                    </div>
                </div>
            </div>
         </c:forEach>
        </div>
    </section>
</body>
</html>