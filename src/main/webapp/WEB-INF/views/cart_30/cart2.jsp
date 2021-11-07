
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
  <title>Aroma Shop - Cart</title>
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
<!--                 <ul class="dropdown-menu"> -->
<%--                   <li class="nav-item"><a class="nav-link" href="<c:url value='/forum' />"></a></li> --%>
<%--                   <li class="nav-item"><a class="nav-link" href="<c:url value='/forum' />">討論區</a></li> --%>
<!--                 </ul> -->
							</li>
							<li class="nav-item submenu dropdown">
                <a href="<c:url value='/campaigns' />" class="nav-link dropdown-toggle" role="button" aria-haspopup="true"
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

	<!-- ================ start banner area ================= -->	
<!-- 	<section class="blog-banner-area" id="category"  style='height:250px'> -->
<!-- 		<div class="container h-100"> -->
<!-- 			<div class="blog-banner"> -->
<!-- 				<div class="text-center"> -->
<!-- 					<h1>Shopping Cart</h1> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!--     </div> -->
<!-- 	</section> -->
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
				<tr>
					<th>圖片</th>
					<th>商品名稱</th>
					<th><center>數量</center></th>
					<th>單價</th>
					<th>合計</th>
					<th>刪除</th>
				</tr>
			</thead>
                      <tbody>
                      	<c:forEach var="row" items="${cart}">
                          <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                         <img width='150'src="<c:url value='/getPicture/${row.product.productId}' />" />
                                      </div>     
                                  </div>
                              </td>
                              <td>${row.product.productName}</td>
                              
                              <td>
                                  <div class="product_count">
         
                                      <input type="text" name="qty" id="sst" maxlength="12" value="${row.count}" title="Quantity:"
                                          class="input-text qty">

                                      <button   class="increase items-count up" type="button" value='${row.product.productId}'>
                                       <i class="lnr lnr-chevron-up"></i></button> 

                                         <button class="reduced items-count down" type="button" value='${row.product.productId}'>
                                          <i class="lnr lnr-chevron-down"></i></button>

                                         
                               
                                  </div>
                              </td>
                              <td>
                                  <h5 value='${row.product.price}' class='price'>${row.product.price}</h5>
                              </td>
                              <td>
                                  <h5 class='total' value='8888'>${row.count*row.product.price}</h5>
                              </td>
                              <td>
						<a href="<c:url value='/deletecart' />?id=${row.product.productId}">
						<button type="button" class="btn btn-outline-dark deletecart" data-mdb-ripple-color="dark" value='${row.product.productId}'>  刪除</button>
				</a>		
					</td>
                          </tr>
                        </c:forEach>
                          <tr class="bottom_button">
                        
                              <td>
<!--                                   <a class="button" href="#">Update Cart</a> -->
                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                             <td>

                              </td> <td>

                              </td>
                           
                              <td colspan="2">
                                  <div class="cupon_text d-flex align-items-center">
                                      <input type="text" placeholder="Coupon Code">
                                      <a class="primary-btn" href="#">Apply</a>
                                      <a class="button" href="#">Have a Coupon?</a>
                                  </div>
                              </td>
                              
                          </tr>
                          <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                                <td>

                              </td>
                             
                              <td>
                                
                              </td>
                                <td>

                              </td>
                              <td>
                                    <h3>總價:</h3>
                              </td>
                          </tr>
                              <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                                <td>

                              </td>
                             
                             <td>

                              </td>
                              <td colspan="2"  style="text-align:right;">
                                  <h2 id='totalPrice' style="font-size:60px">0</h2>
                              </td>
                          </tr>
<!--                           <tr class="shipping_area"> -->
<!--                               <td class="d-none d-md-block"> -->

<!--                               </td> -->
<!--                               <td> -->

<!--                               </td> -->
<!--                               <td> -->
<!--                                   <h5>Shipping</h5> -->
<!--                               </td> -->
<!--                               <td> -->
<!--                                   <div class="shipping_box"> -->
<!--                                       <ul class="list"> -->
<!--                                           <li><a href="#">Flat Rate: $5.00</a></li> -->
<!--                                           <li><a href="#">Free Shipping</a></li> -->
<!--                                           <li><a href="#">Flat Rate: $10.00</a></li> -->
<!--                                           <li class="active"><a href="#">Local Delivery: $2.00</a></li> -->
<!--                                       </ul> -->
<!--                                       <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6> -->
<!--                                       <select class="shipping_select"> -->
<!--                                           <option value="1">Bangladesh</option> -->
<!--                                           <option value="2">India</option> -->
<!--                                           <option value="4">Pakistan</option> -->
<!--                                       </select> -->
<!--                                       <select class="shipping_select"> -->
<!--                                           <option value="1">Select a State</option> -->
<!--                                           <option value="2">Select a State</option> -->
<!--                                           <option value="4">Select a State</option> -->
<!--                                       </select> -->
<!--                                       <input type="text" placeholder="Postcode/Zipcode"> -->
<!--                                       <a class="gray_btn" href="#">Update Details</a> -->
<!--                                   </div> -->
<!--                               </td> -->
<!--                           </tr> -->

                          <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td class="">

                              </td>
                               <td>

                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td >
                                  <div class="checkout_btn_inner d-flex " style="text-align:right;">
                                      <a class="gray_btn" href="index">繼續去購物</a>
                                      <a class="primary-btn ml-2" href="check">我要去買單</a>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
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
  <script src="js/main.js"></script>
  
   <script>
  
	$(".down").each(function(){
		$(this).click(function(){
			var text = $(this).prev().prev();
			
			var price =$(this).parent().parent().next().children("h5.price").html();
			console.log(price)
			
			var price2=parseFloat(price)
			console.log(price2)
			var totalprice = $(this).parent().parent().next().next().children("h5.total");
			console.log(parseFloat(totalprice))
			
			if(parseInt(text.val())>1){
				text.val(parseInt(text.val())-1)
				totalprice.html(parseFloat(text.val())*price2)
				
				totalprice.html(parseInt(text.val())*price2+".0")
				var total=0;
				$('.total').each(function(){
				$(this).html;
				var a = parseInt($(this).html());
				total=total+a

				})
	
				$('#totalPrice').html(total)
			}
			
		})
	})
	
	
	
	
	$(".down").click(function(){
		var cnt = $(this).prev().prev().val(); 
		
//	 	console.log("cnt=="+cnt)
		var data=$(this).val();

	
	$.ajax({
		type:'get',
		url:'sub',
		data:{
			"id":data
		},
		success:function(){
			var count = parseInt($('#ccount').html())-1
			console.log(count)
			if(count>0){
				$('#ccount').html(count)
			}
			
		}
								
	});			
});


	
	$(".up").each(function(){
		$(this).click(function(){
			var text = $(this).prev();
			var price =$(this).parent().parent().next().children("h5.price").html();
			
			var price2=parseInt(price)
			var totalprice = $(this).parent().parent().next().next().children("h5.total");
		
			var totalprice2 =parseInt(totalprice)
			
			text.val(parseInt(text.val())+1)
			totalprice.html(parseInt(text.val())*price2+".0")
			
			var total=0;
			$('.total').each(function(){
			$(this).html;
			var a = parseInt($(this).html());
			total=total+a

			})
	
			$('#totalPrice').html(total)
			
			
		})
	})
	
	
	
	$(".up").click(function(){		
	var cnt = $(this).prev().val(); 
	
	
	var data=$(this).val();

	$.ajax({
		type:'get',
		url:'add',
		data:{
			"id":data
		},
		
		success:function(){
			var count = parseInt($('#ccount').html())+1
			console.log(count)
			
			$('#ccount').html(count)
		
			
		}
								
	});			
});
	
	

	var total=0;
	$('.total').each(function(){
		$(this).html;
		var a = parseInt($(this).html());
		total=total+a

		})
	
	$('#totalPrice').html(total)
	
	 </script>	
</body>
</html>