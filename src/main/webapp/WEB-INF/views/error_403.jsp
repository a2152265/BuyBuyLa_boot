<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>哈哈出錯囉</title>


	<style>
	body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
	</style>
	<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet"  type="text/css"> 
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"  type="text/javascript"></script>
Themes Usage
	<script  type="text/javascript">
	Swal.fire({
		  title: 'You shall not pass!!!!',
		  text: "Because....沒權限!!!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '好的'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'OK!',
		      '回首頁中',
		      ''
		    )
		  }
		})
		
		setTimeout("location.href='../'",2800);
	</script>
</head>
<body style="background-color: rgb(93, 93, 235);">

				<h1>!!!!</h1>
			<img src="img/error/YSNP.png" alt="BuyBuyLa">
	
		
</body>
</html>