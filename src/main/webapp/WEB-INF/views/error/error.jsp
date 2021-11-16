<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>403</title>
</head>
<body style="background-color: rgb(93, 93, 235);">
    <p style="text-align:center">somthing wrong</p>
    <h2 style="text-align:center">J裡是403</h2>
    <h1  style="text-align:center">簡單的來說就是你沒有權限<h1>
    
    
   				 <h1>!!!!</h1>
			<img src="../img/error/YSNP.png" alt="BuyBuyLa">
    
	<!--這段程式碼在頁面不會展現，只會出現在控制檯，假如線上報錯可以看控制檯快速鎖定錯誤原因-->    
	<div>
	    <div th:utext="'&lt;!--'" th:remove="tag"></div>
	    <div th:utext="'Failed Request URL : ' + ${url}" th:remove="tag"></div>
	    <div th:utext="'Exception message : ' + ${exception.message}" th:remove="tag"></div>
	    <ul th:remove="tag">
	      <li th:each="st : ${exception.stackTrace}" th:remove="tag"><span th:utext="${st}" th:remove="tag"></span></li>
	    </ul>
	    <div th:utext="'--&gt;'" th:remove="tag"></div>
	</div>
</body>
</html>