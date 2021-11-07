
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>訂單確認</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/productstyle.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<!--   <script src="js/jquery.twzipcode.js"></script> -->
    <script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
    <script>
    let no = 1000;
    let index = 0;
    var buyerName= ["莊逸洪", '廖家慶', '葉俊偉', '謝德榮', '張晉愷'];
    var phone= ["0978856318", '0973848588', '0920447528', '0966338741', '0978456123'];
  
    var address= ["大溪區仁善街245號", '中壢區中正路四段85號', '中壢區春德路105號', '八德區豐田三路56號', '湖口鄉成功路100號'];
   
    var email= ["a2152265@gmail.com", 'aa15ss5@gmail.com', 'b21a5875@gmail.com', 'aqe45668@gmail.com', 'c123@gmail.com'];
    function quickInput(){
    	document.getElementById('buyerName').value = buyerName[index];
    	document.getElementById('phone').value = phone[index];
    
    	document.getElementById('address').value = address[index];
    	document.getElementById('email').value = email[index];
   	
    	index++;
        if (index >= buyerName.length) {
        	index = 0 ;
    	}
    	
    }
    
    </script>
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="<c:url value='/' />"><img src="img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="<c:url value='/' />">Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">會員</a>
                <ul class="dropdown-menu">
                <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
	                   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/login' />">會員登入</a></li> 
                  	   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/add' />">會員註冊</a></li>
               </c:if>
               <c:if test="${loginSession.userEmail != null}">
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/member/evolution' />">賣家專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
<!--                   <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li> -->
                </c:if>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="<c:url value='/forum' />" class="nav-link dropdown-toggle"  role="button" aria-haspopup="true"
                  aria-expanded="false">討論區</a>

							</li>
							<li class="nav-item submenu dropdown">
                <a href="<c:url value='/campaigns' />" class="nav-link dropdown-toggle" role="button" aria-haspopup="true"
                  aria-expanded="false">活動專區</a>

              </li>
              <c:if test="${loginSession.userEmail != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
						${loginSession.userEmail}</a></li>
				</c:if>
            </ul>

            <ul class="nav-shop">
           <li class="nav-item" ><form:form method='POST' action="./queryproduct"
						class='form-horizontal'>
				
							<input name="productName" id="productName" type='text'
								class='form:input-large'/>
							<button type='submit' ><i class="ti-search" ></i></button>
<!-- 							<input id="btnAdd" type='submit' -->
<!-- 								class='btn btn-primary' /> -->
				
				</form:form>
              
            
              
              <!-- 購物車顯示數量在這裡改 -->
              
               <li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'>${count}</span></button> </li>
<!--               <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li> -->
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
  </header>
	<!--================ End Header Menu Area =================-->

  

  <!--================Cart Area =================-->
<!-- 	<section class="blog-banner-area" id="category"> -->
<!-- 		<div class="container h-100"> -->
<!-- 			<div class="blog-banner"> -->
<!-- 				<div class="text-center"> -->
<!-- 					<h1>結帳</h1> -->
<!-- 					<nav aria-label="breadcrumb" class="banner-breadcrumb"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!--               <li class="breadcrumb-item active" aria-current="page">Checkout</li> -->
<!--             </ol> -->
<!--           </nav> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!--     </div> -->
<!-- 	</section> -->
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
 <form:form method='POST' modelAttribute="BuyerAddress" >
    <div class="container">
        <div class="billing_details">
            <div class="row">
                <div class="col-md-8">
                    <h3>結算明細</h3>
                    
                    <div class="row" style="margin-left: 0px;">
	                    <form class="row contact_form" action="#" method="post" novalidate="novalidate">
	                        <div class="col-6 form-group p_star">
	                            <form:input type="text" class="form-control" id="buyerName" path="buyerName" placeholder="姓名"/>
	                            <span class="placeholder" data-placeholder="Name"></span>
	                        </div>
	              
	                        <div class="col-6 form-group p_star" style="right: 18px">
	                            <form:input type="text" class="form-control" id="phone" path="phone" placeholder="電話"/>
	                            <span class="placeholder" data-placeholder="Phone number"></span>
	                        </div>
                       </div>
                       
                      <br>
                        <div class="col-md-12 form-group">
                          <form:input type="text" class="form-control" id="email" path="email" placeholder="E-mail"/>
                      </div>
                   
          			<br>
                      <div class="col-md-12 form-group">
                      <form:select id="city" placeholder="請選擇縣市" style="font-size: 20px;" path='city'></form:select>
                      <form:select id="dist" placeholder="請選擇鄉鎮區" style="font-size: 20px;"  path='country'></form:select>
                      <form:input class="js-demeter-tw-zipcode-selector" data-city="#city"  path='postalcode' data-dist="#dist" placeholder="請輸入郵遞區號"  readonly="readonly"/>
                      <span class="placeholder" data-placeholder="Address line 01"></span>
                    </div>
                	<br><br>
                        <div class="col-md-12 form-group p_star">
                            <form:input type="text" class="form-control" id="address" path="address" placeholder="地址"/>
                            <span class="placeholder" data-placeholder="Address line 01"></span>
                        </div>
                         <div class="">
                      <button type="button" class="btn btn-outline-info" onclick='quickInput();'style="border-left-width: 1px; margin-left: 20px;">一鍵輸入</button>
                   </div>
                   
                    <br><br><br><br><br>
                        <div class="">
                            <a class="gray_btn" href="cart">回上一頁</a>
                          </div>
                        
                    </form>
                
                </div>
               
                <div class="col-lg-4">
                    <div class="order_box">
                        <h2>購物清單</h2>
                        <table class="table">
                      
                            <tr><th>商品</th><th>數量</th> <th>價錢</th></tr>
                              <c:forEach var="row" items="${cart}">
                            <tr><td>${row.product.productName}</td><td class="middle">x ${row.count}</td> <td class="total" value='${row.count*row.product.price}'>${row.count*row.product.price}</td></tr>
                            
							</c:forEach>
                       
                       
                            <tr>
                            <td>總額</td>
                            <td></td>
                            <td id='totalPrice'>$2160.00</td>
                            </tr>
                            <tr>
                            <td>折扣</td>
                            <td></td>
                            <td id='discount'>50.00</td>
                            </tr>
                            <tr>
                            <td>應付金額</td>
                            <td></td>
                            <td id='finalTotal'>$2210.00</td>
                            </tr>
                      
                    </table>
                        <div class="payment_item active">
                            <div class="radion_btn">
                                <input type="radio" id="f-option6" name="selector">
                                <label for="f-option6">Ecpay </label>
                                <img src="img/product/card.jpg" alt="">
                                <div class="check"></div>
                            </div>
                            <p>Pay via Ecpay; you can pay with your credit card if you don’t have a Ecpay
                                account.</p>
                        </div>
                        <div class="creat_account">
                            <input type="checkbox" id="f-option4" name="selector">
                            <label for="f-option4">我已閱讀並接受</label>
                            <a href="#">條款和條件</a>
                        </div>
                         <div class="checkout_btn_inner d-flex align-items-center">
<!--                      <a class="button button-paypal" href="ecpay"></a> -->
                  	 	<button type="submit" class="btn btn-primary">前往付費</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </form:form>
  </section>
  <!--================End Cart Area =================-->



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
<!--   <script src="js/main.js"></script> -->
  
   <script>
  


	var total=0;
	var discount=parseInt($("#discount").html())
	$('.total').each(function(){
		$(this).html;
		var a = parseInt($(this).html());
		total=total+a

		})
	
	$('#totalPrice').html(total)
	
	total=total-discount
	$('#finalTotal').html(total)
	
	 </script>	
</body>
</html>