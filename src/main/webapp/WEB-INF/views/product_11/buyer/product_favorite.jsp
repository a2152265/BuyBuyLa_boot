
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
  <title>商品收藏</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../vendors/linericon/style.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="../css/productstyle.css">
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
              <li class="nav-item active"><a class="nav-link" href="<c:url value='/' />">首頁</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">會員</a>
                <ul class="dropdown-menu">
                <c:if test="${loginSession ==null}">
	                   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/login' />">會員登入</a></li> 
                  	   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/add' />">會員註冊</a></li>
               </c:if>
                <c:if test="${managerSession == null}">
               <c:if test="${loginSession.userEmail != null}">
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/member/evolution' />">賣家專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
                </c:if>
                </c:if>
                 <c:if test="${managerSession != null}">
                   <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui0' />">管理中心</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">登出</a></li>
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
               <c:if test="${managerSession == null}">
              <c:if test="${loginSession.userEmail != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
						${loginSession.userEmail}</a></li>

				</c:if>
				</c:if>
				<c:if test="${managerSession != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui0' />">Hi管理員!!! &nbsp;
						${loginSession.userEmail}</a></li>
				</c:if>

			

            </ul>
            <ul class="nav-shop">
           <li class="nav-item" >
           
               <!---------------- 首頁查詢商品框 ---------------->
           		<form:form method='get' action="./queryproduct" class='form-horizontal'>
					<input name="productName" id="productName" type='text' class='form:input-large'/>
					<button type='submit' ><i class="ti-search" ></i></button>
				</form:form>

              <!---------------- 購物車 ---------------->
				<c:if test="${loginSession.userEmail != null}">
              		<li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'>${count}</span></button> </li>
				</c:if>
				 <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
				 	<li class="nav-item"><button onclick="location.href='<c:url value='/try/login' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
				 </c:if>
            </ul>
          </div>
        </div>
      </nav>
    </div>
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
				<tr align='center' valign="middle">
					<th style="width:10%;"></th>
					<th></th>
					<th></th>
					<th>	</th>
				</tr>
			</thead>
                      <tbody>
                      	<c:forEach var="favoriteList" items="${favoriteList}">
                          <tr align='center' valign="middle">
                              <td>
                                  <div class="media">
                                         <img width='150'src="<c:url value='/getPicture/${favoriteList.productId}' />" />
                                  </div>
                              </td>
                              <td>${favoriteList.productName}</td>
	
                              <td>
                                  <h5 value='${favoriteList.price}' class='price'>${favoriteList.price}</h5>
                              </td>
      
	                              <td>
							<a href="<c:url value='/deletecart' />?id=${favoriteList.productId}">
							<button style="border:0" type="button" class="btn btn-outline-dark deletecart" data-mdb-ripple-color="dark" value='${favoriteList.productId}'><i class="fas fa-trash"></i></button>
					</a>		
						</td>
	                          </tr>
	                        </c:forEach>

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
							<h4 class="footer_title large_title">我們的目標</h4>
							<p>
								起初，BuyBuyLa最初創立的目標是為了讓廖總能在台北多買一棟帝寶，1997年時廖總誕生於台北醫學院的護理產房，伴隨著他的是大安區10幾張地契的月子禮，
								而後又過了幾年，廖總與他一起長大的好夥伴葉總、謝總、歐總，他們展現出了無與倫比的天賦，在工程、財經、甚至極限運動上都有了驚人的成就(雖然他們並不缺錢)
							</p>
							<p>
								2021年，BuyBuyLa於中央大學的一間小工作室中誕生(暫定)，為了BuyBuyLa人們的money而設計出了另類的網站，有著奇怪的會員系統，神奇的商品、複雜的購物車、賭徒般的活動、社交的討論區，
								BuyBuyLa於人們野望中誕生。
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">快速連結</h4>
							<ul class="list">
								<li><a href="#">首頁</a></li>
								<li><a href="#">商品</a></li>
								<li><a href="#">討論版</a></li>
								<li><a href="#">購物車</a></li>
								<li><a href="#">活動</a></li>
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
							<h4 class="footer_title">聯絡我們</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									總部
								</p>
								<p>台北市中正區重慶南路一段122號</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									電話
								</p>
								<p>
									+0921212121 <br>
									+0226462646
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									電子信箱
								</p>
								<p>
									a212121@BuyBuyLa.org <br>
									
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



  <script src="../vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../vendors/skrollr.min.js"></script>
  <script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../vendors/mail-script.js"></script>
  <script src="../js/main.js"></script>
  
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