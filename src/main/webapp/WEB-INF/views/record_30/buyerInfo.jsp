<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>BuyBuyLa|</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/productstyle.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/' />">Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">會員</a>
                <ul class="dropdown-menu">
                <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
	                   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/login' />">會員登入</a></li> 
                  	   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/add' />">會員註冊</a></li>
               </c:if>
               <c:if test="${loginSession.userEmail != null}">
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/member/evolution' />">會員專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
<!--                   <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li> -->
<!--                   <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li> -->
                </c:if>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="campaigns" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">討論區</a>
<!--                 <ul class="dropdown-menu"> -->
<!--                   <li class="nav-item"><a class="nav-link" href="blog.html"></a></li> -->
<!--                   <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li> -->
<!--                 </ul> -->
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">活動專區</a>
<!--                 <ul class="dropdown-menu"> -->
<!--                   <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li> -->
<!--                   <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li> -->
<!--                   <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li> -->
<!--                 </ul> -->
              </li>
              <c:if test="${loginSession.userEmail != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
						${loginSession.userEmail}</a></li>
				</c:if>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
<!--               <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li> -->
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->
	
	<!-- ================ start banner area ================= -->	
	<!-- ================ end banner area ================= -->


  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
 						<div class="single-prd-item"> 
 							<img class="img-fluid" src="<c:url value='/getPicturefromMember/${member.id}'/>" alt="profile_picture"/> 
 						</div> 
						
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>帳號:${member.userEmail}</h3>
						<br><hr><br>
						<h3>暱稱:${member.userNickname}</h3>
						<br><hr><br>
						<h3>姓名:${member.userName}</h3>
						<br><hr><br>
						<h3>手機:${member.userPhone}</h3>
						<br><hr><br>
						<h3>生日:${member.birthday}</h3>

					</div>
				</div>
			</div>
		</div>
	</div>
	<br>	<br>	<br>	<br>	<br>
	
			<center>
			<a class="btn btn-outline-secondary" href="<c:url value='/update30' />" style='font-size:20px' role="button">回上一頁</a>
			
				
			</center>
			
			
			
				<br>	<br>	<br>	<br>	<br>	<br>	
	<!--================End Single Product Area =================-->


  <!--================ Start footer Area  =================-->	
	<footer>
	
		<div class="footer-area footer-only">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets ">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="img/gallery/r1.jpg" alt=""></li>
								<li><img src="img/gallery/r2.jpg" alt=""></li>
								<li><img src="img/gallery/r3.jpg" alt=""></li>
								<li><img src="img/gallery/r5.jpg" alt=""></li>
								<li><img src="img/gallery/r7.jpg" alt=""></li>
								<li><img src="img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
  
  
  <script>
$(".additem").click(function(){		
//		var data=$("#form1").serializeArray();
	var data=$('.pid').val();
	console.log(data+"************************");
	$.ajax({
		type:'get',
		url:'additem',
		data:{
			"id":data
		},
		
		success:function(){
			 console.log("77777777")
		}
								
	});		
	
	
});




</script>
  
  
</body>
</html>