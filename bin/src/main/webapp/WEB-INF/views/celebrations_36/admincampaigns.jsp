<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />   
<title>Products</title>
<style type="text/css">
	.btn-outline-primary {
  color:lightblue;
  background-color: #fff;
  border-color: lightblue;
  width:130px;
  height:50px;
}
.btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active:hover{
  color: #fff;
  background-color:lightblue;
  border-color: lightblue;
}
</style>
</head> 
<body>
	<div id="search">
   <input style="margin-right:300px"type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
						<button type="button" class="btn btn-outline-primary"onclick="location.href ='./campaign/addCampaign'">新增活動</button>
	</div>
<table id="myTable">
  <tr class="header">
    <th >編號</th>
    <th >活動名稱</th>
    <th >活動內容</th>
    <th >圖片</th>
    <th >日期</th>
    <th >備註</th>
    <th >編輯</th>
  </tr>
  <c:forEach items='${campaigns}' var='campaign'>
  <tr>
    <td>${campaign.id}</td>
    <td>${campaign.name}</td>
    <td>${campaign.description}</td>
    <td>
    <a href="<c:url value='${campaign.url} ' />"  target="_blank">
    <img style="padding:10px" width='100' height='100' 
                		src="<c:url value='/getCampaignPicture/${campaign.id}' />" />
     </a>
    </td>
    <td>${campaign.date1}</td>
    <td>${campaign.note}</td>
    <td><button class="btn" type="button" onclick="location.href ='./updatecampaign?id=${campaign.id}'" >修改</button>
    	<button class="btn" type="button" onclick="if(window.confirm('確定要刪除')) location.href ='./deletecampaign/${campaign.id}'" >刪除</button>
    </td>
  </tr>
 
    </c:forEach>
</table>
</body>
</html>
    