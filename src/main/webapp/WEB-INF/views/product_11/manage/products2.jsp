<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<style>
body{

}
#myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 50%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
  border-collapse: collapse; /* Collapse borders */
  width: 50%; /* Full-width */
  border: 1px solid #ddd; /* Add a grey border */
  font-size: 14px; /* Increase font-size */
  margin:auto;
  font-family: "微軟正黑體";
  font-weight: bolder;
            
}

#myTable th, #myTable td {
  text-align: left; /* Left-align text */
  padding: 12px; /* Add padding */
}

#myTable tr {
  /* Add a bottom border to all table rows */
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  /* Add a grey background color to the table header and on hover */
  background-color: #f1f1f1;
}


</style>
</head>
<body>
<a  href="<c:url value='/products/add' />">新增商品</a>
<table id="myTable" class="display">
    <thead>
        <tr>
    <th style="width:10%;">productId</th>
    <th style="width:30%;">productName</th>
    <th style="width:20%;">productImage</th>
    <th style="width:10%;">price</th>
    <th style="width:10%;">stock</th>
    <th style="width:10%;">category</th>
    <th style="width:10%;">insertTime</th>
    <th style="width:10%;">update</th>
    <th style="width:10%;">delete</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
           <td>${product.productId}</td>
    <td>${product.productName}</td>
    <td><img width='100' height='100' 
  				   src="<c:url value='/getPicture/${product.productId}' />" /></td>
    <td>${product.price}</td>
    <td>${product.stock}</td>
    <td>${product.category}</td>
    <td>${product.insertTime}</td>
   <!-- <td><input type=button onclick="location.href='./update/${product.productId}'" value='update'></td>
    <td><input type=button onclick="location.href='/delete/${product.productId}'" value='update'></td>-->
     <td><a id="update" href="<c:url value='/update?productId=${product.productId}' />">update</a></td>
    <td><a  href="<c:url value='/delete/${product.productId}' />">delete</a></td>
        </tr>
        </c:forEach>
    </tbody>
</table>



<script>


$(document).ready( function () {
    $('#myTable').DataTable();
} );
 
	

</script>

</body>
</html>