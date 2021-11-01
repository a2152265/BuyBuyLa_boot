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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<button  onClick="batch_up()" >上架</button>
<table id="myTable" class="display">
    <thead>
        <tr>
    <th style="width:10%;">productId</th>
    <th style="width:20%;">productName</th>
    <th style="width:20%;">productImage</th>
    <th style="width:10%;">price</th>
    <th style="width:10%;">stock</th>
    <th style="width:10%;">category</th>
    <th style="width:10%;">insertTime</th>
    <th style="width:20%;"><input type="checkbox" value="" name="selectall"></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
           <td id="id">${product.productId}</td>
    <td>${product.productName}</td>
    <td><img width='100' height='100' 
  				   src="<c:url value='/getPicture/${product.productId}' />" /></td>
    <td>${product.price}</td>
    <td>${product.stock}</td>
    <td>${product.category}</td>
    <td>${product.insertTime}</td>
 	
 	
     <td>
       <input id="" type="checkbox" name="checkbox" id="checkbox" value="${product.productId}"/>
     </td>
        </tr>
        </c:forEach>
    </tbody>
</table>



<script>


	
	$('input:checkbox[name="selectall"]').click(function(){
		 if($(this).is(':checked')){
		     $('input:checkbox').each(function(){
		    $(this).prop("checked",true);
		  });
		    }else{
		      $('input:checkbox').each(function(){
		    $(this).prop("checked",false);
		  });
		    }
		 });
	      
	
	  function batch_up() {
		    var productId = '';
		    $('input:checkbox').each(function(){
		      if(this.checked == true){
		    	  productId += this.value + ',';
		      }
		      console.log(productId);
		    });

		      $.ajax({
		        type: 'post',
		        url: 'launched',
		        data: {"productIds": productId},
		        success: function (data, textStatus, xhr) {
		          if (xhr.status == 200) {
		        	 console.log("!!!!!!!!!");
		          } 
		        },
		        error: function (xhr, status) {
		        	console.log(xhr.status);
		        	 swal.fire({
		                 icon: 'success',
		                 title: '新增成功',
		                 showConfirmButton: false,
		                 timer: 1000
		               })
		        },
		      });
		   
		  }
	      

	
	
	
 
	

</script>

</body>
</html>