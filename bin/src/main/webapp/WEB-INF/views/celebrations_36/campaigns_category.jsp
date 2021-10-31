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
        	<c:forEach items='${campaigns}' var='campaign'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                	  <a href="<c:url value='${campaign.url}' />">
                	<img style="margin-left:30px;padding:10px;margin-bottom:20px" width='250' height='200' 
                		src="<c:url value='/getCampaignPicture/${campaign.id}' />" />
                		</a>
                    <div class="caption">
                        <p style='margin-bottom:30px;margin-left:10px'>
                           <b style='font-size: 20px;'>${campaign.name}</b>
                        </p>
                        <p style='margin-left:10px'>
                           <b style='font-size: 16px;color:grey;margin-right:28px'>有效期限至${campaign.date1}</b>
                       	<a href="<spring:url value='/campaign?id=${campaign.id}' />"
   							 class="btn btn-primary">
    						<span class="glyphicon-info-sigh glyphicon"style=''></span>詳細資料
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