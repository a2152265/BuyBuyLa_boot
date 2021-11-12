<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good Bye</title>


	<style>
	Swal.fire({
  title: 'Sweet!',
  text: 'Modal with a custom image.',
  imageUrl: 'https://unsplash.it/400/200',
  imageWidth: 400,
  imageHeight: 200,
  imageAlt: 'Custom image',
})
	</style>

	
</head>
<body  style="background-color: rgb(18, 18, 78);">
  
    
    <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    
    <script type="text/javascript">
    Swal.fire({
    	  title: '感謝您! 已登出',
    	  text: 'Modal with a custom image.',
    	  imageUrl: 'https://unsplash.it/400/200',
    	  imageWidth: 400,
    	  imageHeight: 200,
    	  imageAlt: 'Custom image',
    	})
    	
    	setTimeout("location.href='/BuyBuyla_boot/'",2200);
	</script>
</body>
</html>