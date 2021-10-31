<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>BuyBuyLa|Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<!--   <link rel='stylesheet' href="css/campaigns.css"  > -->
  <link rel="stylesheet" href="css/productstyle.css">
  <style type="text/css">
.form__label {
  font-family: 'Roboto', sans-serif;
  font-size: 1.2rem;
  margin-left: 2rem;
  margin-top: 0.7rem;
  display: block;
  transition: all 0.3s;
  transform: translateY(0rem);
}
.form__input {
  font-family: 'Roboto', sans-serif;
  color: #333;
  font-size: 1.2rem;
	margin: 0 auto;
  padding: 1.5rem 2rem;
  border-radius: 0.2rem;
  background-color: rgb(255, 255, 255);
  border: none;
  width: 90%;
  display: block;
  border-bottom: 0.3rem solid transparent;
  transition: all 0.3s;
}
.form__input:placeholder-shown + .form__label {
  opacity: 0;
  visibility: hidden;
  -webkit-transform: translateY(-4rem);
  transform: translateY(-4rem);
}
 .wrap{
            width: 1000px;
            height: 300px;
            background-color: black;
            margin:0 auto;
            position: relative;
            overflow: hidden;
        }
        .slide-img{
            margin: 0;
            padding: 0;
            list-style: none;
            position: absolute;
            width: 12000px;
            /* border: olive 2px solid; */
            display: flex;
            left: 0;
            transition: 0.6s;
        }
        .slide-img li{
            width: 1000px;
            height: 300px;
            /* 伸展比例 壓縮比例 額外剩餘比例 */
            /* flex:1 0 0; */
        }
        .slide-img li img{
            height: 100%;
            width: 100%;
            /* 元素內容調整大小比例 */
            object-fit: cover;
        }
        .pages{
            list-style: none;
            position: absolute;
            margin:0;
            padding: 0;
            bottom:10px;
            display: flex;
            left:0;
            width: 100%;
            justify-content: center;
        }
        .pages li{
            border:1px solid #fff;
            margin: 0 5px;
            width: 20px;
            height:20px;
            border-radius: 50%;
            cursor:hand;
        }
        .slide-arrow{
            position: absolute;
            /* background-color: red; */
            width: 40px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index:1;
            font-size: 36px;
            cursor: pointer;
            color: white;
            opacity: .6;
        }
        .slide-arrow:hover{
        	color: white;
            opacity: 1;
        }
        .slide-arrow.right{
            right:0;
        }
</style>
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
              
              <li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
<!--               <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li> -->
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->

  <main class="site-main">
    
    <!--================ Hero banner start =================-->
    <section class="hero-banner">
      <div class="container">
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block">
            <div class="hero-banner__img">
              <img class="img-fluid" src="img/home/hero-banner.png" alt="">
            </div>
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
              <h4>Shop is fun</h4>
              <h1>BuyBuyLa</h1>
              <p></p>
<!--               <a class="button button-hero" href="#">Browse Now</a> -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ Hero banner start =================-->

    <!--================ Hero Carousel start =================-->
    <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
      <c:forEach var='category' items='${categoryList}'>
        <div class="hero-carousel__slide">
          <img src="img/home/${category}.png" alt="" class="img-fluid">
          <a href="<c:url value='/products/${category}' />" class="hero-carousel__slideOverlay">
            <h3>${category}</h3>
            <p></p>
          </a>
        </div>
        </c:forEach>
<!--         <div class="hero-carousel__slide"> -->
<!--           <img src="img/home/hero-slide2.png" alt="" class="img-fluid"> -->
<!--           <a href="#" class="hero-carousel__slideOverlay"> -->
<!--             <h3>Wireless Headphone</h3> -->
<!--             <p>Accessories Item</p> -->
<!--           </a> -->
<!--         </div> -->
<!--         <div class="hero-carousel__slide"> -->
<!--           <img src="img/home/hero-slide3.png" alt="" class="img-fluid"> -->
<!--           <a href="#" class="hero-carousel__slideOverlay"> -->
<!--             <h3>Wireless Headphone</h3> -->
<!--             <p>Accessories Item</p> -->
<!--           </a> -->
<!--         </div> -->
      </div>
    </section>
    <!--================ Hero Carousel end =================-->

    <!-- ================ trending product section start ================= -->  
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Product</p>
          <h2>BuyBuy <span class="section-intro__style">Product</span></h2>
        </div>
        
        <div class="row">
        
        <c:forEach items="${products}" var="product">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img class="card-img" src="<c:url value='/getPicture/${product.productId}' />" alt="">
                <ul class="card-product__imgOverlay">
                  <li><button onclick="location.href='<c:url value='/product?id=${product.productId}' />'"><i class="ti-search"></i></button></li>
<%--                   <input type='text' class='pid' name='address' value='${product.productId}'/> --%>
                 
<!--                   <li><button class='additem' ><i class="ti-shopping-cart"></i></button></li> -->
                  <li><button onclick="location.href='<c:url value='/additem' />?id=${product.productId}'"><i class="ti-shopping-cart"></i></button></li>
           
                  <li><button><i class="ti-heart"></i></button></li>
                </ul>
              </div>
              <div class="card-body">
                <p>${product.category}</p>
                <h4 class="card-product__title"><a href="single-product.html">${product.productName}</a></h4>
                <p class="card-product__price">${product.price}</p>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
    </section>
    <!-- ================ trending product section end ================= -->  


    <!-- ================ offer section start ================= --> 
<!--     <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px"> -->
<!--       <div class="container"> -->
<!--         <div class="row"> -->
<!--           <div class="col-xl-5"> -->
<!--             <div class="offer__content text-center"> -->
<!--               <h3>Up To 50% Off</h3> -->
<!--               <h4>Winter Sale</h4> -->
<!--               <p>Him she'd let them sixth saw light</p> -->
<!--               <a class="button button--active mt-3 mt-xl-4" href="#">Shop Now</a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->
    <!-- ================ offer section end ================= --> 

    <!-- ================ Best Selling item  carousel ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Best <span class="section-intro__style">Sellers</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          
          <c:forEach items="${products}" var="product">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="<c:url value='/getPicture/${product.productId}' />" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>${product.category}</p>
              <h4 class="card-product__title"><a href="single-product.html">${product.productName}</a></h4>
              <p class="card-product__price">${product.price}</p>
            </div>
          </div>
		</c:forEach>
        </div>
      </div>
    </section>
    <!-- ================ Best Selling item  carousel end ================= --> 

    <!-- ================ Blog section start ================= -->  
<!--     <section class="blog"> -->
<!--       <div class="container"> -->
<!--         <div class="section-intro pb-60px"> -->
<!--           <p>Popular Item in the market</p> -->
<!--           <h2>Latest <span class="section-intro__style">News</span></h2> -->
<!--         </div> -->

<!--         <div class="row"> -->
<!--           <div class="col-md-6 col-lg-4 mb-4 mb-lg-0"> -->
<!--             <div class="card card-blog"> -->
<!--               <div class="card-blog__img"> -->
<!--                 <img class="card-img rounded-0" src="img/blog/blog1.png" alt=""> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <ul class="card-blog__info"> -->
<!--                   <li><a href="#">By Admin</a></li> -->
<!--                   <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li> -->
<!--                 </ul> -->
<!--                 <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4> -->
<!--                 <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p> -->
<!--                 <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->

<!--           <div class="col-md-6 col-lg-4 mb-4 mb-lg-0"> -->
<!--             <div class="card card-blog"> -->
<!--               <div class="card-blog__img"> -->
<!--                 <img class="card-img rounded-0" src="img/blog/blog2.png" alt=""> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <ul class="card-blog__info"> -->
<!--                   <li><a href="#">By Admin</a></li> -->
<!--                   <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li> -->
<!--                 </ul> -->
<!--                 <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4> -->
<!--                 <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p> -->
<!--                 <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->

<!--           <div class="col-md-6 col-lg-4 mb-4 mb-lg-0"> -->
<!--             <div class="card card-blog"> -->
<!--               <div class="card-blog__img"> -->
<!--                 <img class="card-img rounded-0" src="img/blog/blog3.png" alt=""> -->
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <ul class="card-blog__info"> -->
<!--                   <li><a href="#">By Admin</a></li> -->
<!--                   <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li> -->
<!--                 </ul> -->
<!--                 <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4> -->
<!--                 <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p> -->
<!--                 <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->
    <!-- ================ Blog section end ================= -->  

    <!-- ================ Subscribe section start ================= --> 
<!--     <section class="subscribe-position"> -->
<!--  <div class="wrap"> -->
<!--             <a class="slide-arrow" id="slidePrev"><i class="fas fa-arrow-left"></i></a> -->
<!--             <a class="slide-arrow right" id="slideNext"><i class="fas fa-arrow-right"></i></a> -->
<!--             <ul class="slide-img" id="slide-img"> -->
<%--                 <c:forEach items='${campaignss}' var='campaign'> --%>
<!--                 <li> -->
<%--                 <a href="<c:url value='${campaign.url}'  /> " target="_blank"> --%>
<%--                 <img src="<c:url value='/getCampaignPicture/${campaign.id}' />" alt=""> --%>
<!--                 </a> -->
<!--                 </li> -->
<%--           </c:forEach> --%>
<!--             </ul> -->
            
            
<!--               <ul class="pages" id="pages"> -->
<%--                 <c:forEach var="i" begin="0" end="${campaignsizes-1}"> --%>
<!--                 <li></li> -->
<%--                 </c:forEach> --%>
<!--             </ul> -->
         
<!--         </div> -->
<!--     </section> -->
    <!-- ================ Subscribe section end ================= --> 

    

  </main>


  <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
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
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p> -->
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
<!--   <script> 

//       $(function(){
//           let index=0;
//           let slideMove=0;
//           $('#pages li').eq(0).css('background-color','lightblue')
//           $('#pages li').on('click',function(){
//               // console.log('123')
//               //移動第一張圖
//               // $('#slide-img').css('left','-800px')
//               //移動n張圖 index() 讀取索引值
//               // let index=$(this).index()
//               //區域變數變全域變數
//               index=$(this).index()
//               console.log(index)
//               slideMove=-1000*index;
//               $('#slide-img').css('left',slideMove)
//               $(this).css('background-color','lightblue')
//               .siblings().css('background-color','transparent')
            
//           })
//           let slideCount=$('#slide-img li').length
//           console.log('123')
//           $('#slideNext').on('click',function(){
//               index++;
//               if(index>=slideCount){
//                   index=0;
//               }
//               // slideMove=-800*index;
//               // $('#slide-img').css('left',slideMove)
//               // $('#pages li').eq(index).css('background-color','white')
//               // .siblings().css('background-color','transparent')
//               moveImg()
//           })
//           $('#slidePrev').on('click',function(){
//               index--;
//               if(index<0){
//                   index=slideCount-1;
//               }
//               // slideMove=-800*index;
//               // $('#slide-img').css('left',slideMove)
//               // $('#pages li').eq(index).css('background-color','white')
//               // .siblings().css('background-color','transparent')
//               moveImg()
//           })
//           function moveImg(){
//               slideMove=-1000*index;
//               $('#slide-img').css('left',slideMove)
//               $('#pages li').eq(index).css('background-color','lightblue')
//               .siblings().css('background-color','transparent')
//           }
//           setInterval(autoImg,3000)
//           function autoImg(){
//               index++;
//               if(index>=slideCount){
//                   index=0;
//               }
//               moveImg()
//           }
//       })
     </script>     -->
     
     
<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<script>
// $(".additem").click(function(){		
// //		var data=$("#form1").serializeArray();
// 	var data=$('.pid').val();
// 	console.log(data+"************************");
// 	$.ajax({
// 		type:'get',
// 		url:'additem',
// 		data:{
// 			"id":data
// 		},
		
// 		success:function(){
// 			 console.log("77777777")
// 		}
								
// 	});		
	
	
});




</script>
	


</body>
</html>