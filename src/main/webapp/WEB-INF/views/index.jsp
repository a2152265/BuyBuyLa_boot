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
   <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<!--   <link rel='stylesheet' href="css/campaigns.css"  > -->
  <link rel="stylesheet" href="css/productstyle.css">
  <link rel="icon"  sizes="180x180" href="images/favicon.ico" type="image/x-icon"/>
<!-- <script src="sweetalert2.min.js"></script> -->
<!-- <link rel="stylesheet" href="sweetalert2.min.css"> -->
<!-- <script src="sweetalert2.all.min.js"></script> -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
  <!--================ 首頁標題 start =================-->
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
                <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
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
                   <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui' />">會員管理</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
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
              <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui' />">Hi管理員!!! &nbsp;
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
              		<li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'></span></button> </li>
				</c:if>
				 <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
				 	<li class="nav-item"><button onclick="location.href='<c:url value='/try/login' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'></span></button> </li>
				 </c:if>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End 首頁標題 =================-->

  <main class="site-main">
    
    <!--================  start =================-->
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
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ End =================-->

    <!--================ 顯示類別產品 start =================-->
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
      </div>
    </section>
    <!--================ 顯示類別產品 end =================-->

    <!-- ================ start 最新商品 ================= -->  
    
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>New Products</p>
          <h2>New <span class="section-intro__style">Products</span></h2>
        </div>
        
        <div class="row">
        
        <c:forEach items="${ascProduct}" var="product">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img  width="243.61" height="255" class="card-img" src="<c:url value='/getPicture/${product.productId}' />" alt="">
                  <input type='hidden' class='pid' name='address' value='${product.productId}'/>
                <ul class="card-product__imgOverlay">
                  <li><button onclick="location.href='<c:url value='/product?id=${product.productId}' />'"><i class="ti-search"></i></button></li>
                  <li><button class='additem' value='${product.productId}' ><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
                  
                </ul>
              </div>
              <div class="card-body">
                <p>${product.category}</p>
                <h4 class="card-product__title">
                <a  href="<c:url value='/product?id=${product.productId}' />"
                	style="overflow:hidden;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
					white-space: normal;">${product.productName}
				</a>
				</h4>
                <p class="card-product__price">${product.price}</p>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
    </section>
    <!-- ================ 最新商品 end ================= -->  


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

    <!-- ================ 熱銷產品 start ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Best <span class="section-intro__style">Sellers</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          
          <c:forEach items="${products}" var="product">
          <div class="card text-center card-product">
            <div  class="card-product__img">
              <img width="243.61" height="255" class="img-fluid" src="<c:url value='/getPicture/${product.productId}' />" alt="">
                  <input type='hidden' class='pid' name='address' value='${product.productId}'/>
              <ul class="card-product__imgOverlay">
                  <li><button onclick="location.href='<c:url value='/product?id=${product.productId}' />'"><i class="ti-search"></i></button></li>  
                  <li><button class='additem' value='${product.productId}' ><i class="ti-shopping-cart"></i></button></li>
                  <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>${product.category}</p>
              <h4 	class="card-product__title">
              <a 	href="<c:url value='/product?id=${product.productId}' />"
              		style="overflow:hidden;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
					white-space: normal;" href="single-product.html">${product.productName}</a></h4>
              <p class="card-product__price">${product.price}</p>
            </div>
          </div>
		</c:forEach>
        </div>
      </div>
    </section>
    <!-- ================ 熱銷產品 end ================= --> 

    <!-- ================ 討論區 start ================= -->  
    <section class="blog">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Latest <span class="section-intro__style">News</span></h2>
        </div>

        <div class="row">
         <c:forEach items="${announcementList}" var="announcementList">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="img/blog/blog1.png" alt="">
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li><a href="#">${announcementList.tag}</a></li>
                  <li><a href="#"><i class="ti-comments-smiley"></i> ${announcementList.messageQty} Comments</a></li>
                </ul>
                <h4 class="card-blog__title"><a href="single-blog.html"></a>${announcementList.title}</h4>
                <p>${announcementList.content}</p>
                <a class="card-blog__link" href="#">Read More <i class="ti-arrow-right"></i></a>
              </div>
            </div>
          </div>
		</c:forEach>

        </div>
      </div>
    </section>
    <!-- ================ 討論區 end ================= -->  

    <!-- ================ Subscribe section start ================= --> 
 <section class="subscribe-position">
       <c:if test="${campaignsizes>0}">
 	<div class="wrap">
            <a class="slide-arrow" id="slidePrev"><i class="fas fa-arrow-left"></i></a>
            <a class="slide-arrow right" id="slideNext"><i class="fas fa-arrow-right"></i></a>
            <ul class="slide-img" id="slide-img">
           
           <c:forEach items='${campaignss}' var='campaign'>
                <li>
                <a href="<c:url value='${campaign.url}'  /> " target="_blank">
                <img style=" width:1000px ;height:300px" src="<c:url value='/getCampaignPicture/${campaign.id}' />" alt="">
                </a>
                </li>
          </c:forEach>

            </ul>
            
            
              <ul class="pages" id="pages">
                <c:forEach var="i" begin="0" end="${campaignsizes-1}">
                <li></li>
                </c:forEach>
            </ul>
        </div>
          </c:if>  
    </section>
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
  <script> 

       $(function(){
           let index=0;
           let slideMove=0;
           $('#pages li').eq(0).css('background-color','lightblue')
           $('#pages li').on('click',function(){
               // console.log('123')
               //移動第一張圖
               // $('#slide-img').css('left','-800px')
               //移動n張圖 index() 讀取索引值
               // let index=$(this).index()
               //區域變數變全域變數
               index=$(this).index()
               console.log(index)
               slideMove=-1000*index;
               $('#slide-img').css('left',slideMove)
               $(this).css('background-color','lightblue')
               .siblings().css('background-color','transparent')
            
           })
           let slideCount=$('#slide-img li').length
           console.log('123')
           $('#slideNext').on('click',function(){
               index++;
               if(index>=slideCount){
                   index=0;
               }
               // slideMove=-800*index;
               // $('#slide-img').css('left',slideMove)
               // $('#pages li').eq(index).css('background-color','white')
               // .siblings().css('background-color','transparent')
               moveImg()
           })
           $('#slidePrev').on('click',function(){
               index--;
               if(index<0){
                   index=slideCount-1;
               }
               // slideMove=-800*index;
               // $('#slide-img').css('left',slideMove)
               // $('#pages li').eq(index).css('background-color','white')
               // .siblings().css('background-color','transparent')
               moveImg()
           })
           function moveImg(){
               slideMove=-1000*index;
               $('#slide-img').css('left',slideMove)
               $('#pages li').eq(index).css('background-color','lightblue')
               .siblings().css('background-color','transparent')
           }
           setInterval(autoImg,3000)
           function autoImg(){
               index++;
               if(index>=slideCount){
                  index=0;
               }
               moveImg()
           }
       })
     </script>  
     
 
<c:forEach var="row" items="${cart}">
<span class="count"  style="display:none"> ${row.count}</span>

</c:forEach>


	
<script>


var count=0;
// const MySwal = withReactContent(Swal)
$(".additem").click(function(){		

	var data=$(this).val();
		$.ajax({
		type:'get',
		url:'additem',
		data:{
			"id":data
		},
		
		success:function(){
	

			Swal.fire({
				  position:'center',
				  icon: 'success',
				  title: '已加入購物車',
				  showConfirmButton: false,
				  timer: 1500
				})
			


		}
								
	});		
	
	
});

$('.count').each(function(){
	$(this).html;
	var a = parseInt($(this).html());
	count=count+a

	})

$('#ccount').html(count)


</script>

</body>
</html>