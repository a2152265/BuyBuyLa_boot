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

  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css"  type="text/css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css"  type="text/css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css"  type="text/css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css"  type="text/css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css"  type="text/css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css"  type="text/css">
   <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css"  type="text/css">
<!--   <link rel='stylesheet' href="css/campaigns.css"  > -->
  <link rel="stylesheet" href="css/productstyle.css"  type="text/css">
  <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>

<!-- <script src="sweetalert2.min.js"></script> -->
<!-- <link rel="stylesheet" href="sweetalert2.min.css"> -->
<!-- <script src="sweetalert2.all.min.js"></script> -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <style>
        ul {
            /* ����ul�w�]�����Y�μ˦� */
            margin: 0;
            padding: 0;
            list-style: none;
           
        }

            ul.drop-down-menu {
/*                 border: #ccc 1px solid; */
                display: inline-block;
                font-family: 'Open Sans', Arial, sans-serif;
                font-size: 13px;
            }

                ul.drop-down-menu li {
                    position: relative;
                    white-space: nowrap;
/*                     border-right: #ccc 1px solid; */
                }

                ul.drop-down-menu > li:last-child {
                    border-right: none;
                }

                ul.drop-down-menu > li {
                    float: left;
                  
                }

                ul.drop-down-menu a {
                    background-color: #fff;
                    color: #333;
                    display: block;
                    padding: 0 30px;
                    text-decoration: none;
                    line-height: 40px;
                }

                    ul.drop-down-menu a:hover {
                        
                        background-color: #fff;
                        color: #fff;
                    }

                ul.drop-down-menu li:hover > a {
                   
                    color:black;
                }

                ul.drop-down-menu ul {
                    border: #ccc 3px solid;
                    position: absolute;
                    z-index: 99;
                    left: -68px;
                    top: 100%;
                    min-width: 200px;
                    background-color:white;
                }

                    ul.drop-down-menu ul li {
                        border-bottom: #ccc 1px solid;
                    }

                        ul.drop-down-menu ul li:last-child {
                            border-bottom: none;
                        }

                    ul.drop-down-menu ul ul {
                      
                        z-index: 999;
                        top: 10px;
                        left: 90%;
                    }

                ul.drop-down-menu ul {
                    
                    display: none;
                }

                ul.drop-down-menu li:hover > ul {
                    
                    display: block;
                }
    </style>
</head>
<body>
  <!--================ 首頁標題 start =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="<c:url value='/' />"><img src="img/logo.png" alt="BuyBuyLa"></a>
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
                <c:if test="${loginSession.userEmail ==null}">
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
                   <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui' />">管理中心</a></li>
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
						${loginSession.userName}</a></li>

				</c:if>
				</c:if>
				<c:if test="${managerSession != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui' />">Hi! &nbsp;
						${loginSession.userName}</a></li>
				</c:if>

			

            </ul>
            <ul class="nav-shop drop-down-menu">
           <li class="nav-item" >
           
               <!---------------- 首頁查詢商品框 ---------------->
           		<form:form method='get' action="./queryproduct" class='form-horizontal'>
					<input name="productName" id="productName" type='text' class='form:input-large' />
					<button type='submit' ><i class="ti-search" ></i></button>
				</form:form>

              <!---------------- 購物車 ---------------->
				<c:if test="${loginSession.userEmail != null}">
<!-- 				<ul class="drop-down-menu"> -->
        <li class="nav-item">
			<button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'>${count}</span></button>

            <ul>
            <li>
            <p>近期加入購物車商品</p>
             <c:forEach items="${cart}" var="carts">
			<tr>
			<td> 
			 <div class="media">
                 <div class="d-flex">   
 					<img width='100'src="<c:url value='/getPicture/${carts.product.productId}' />" />
                  </div>     
                 </div>
             </td>
			<td>${carts.product.productName}</td>
			<td>${carts.count}</td>
			<td>${carts.product.price}</td>
			</tr>
			</c:forEach>
            </li>

            </ul>
        </li>


<!--     </ul> -->	
				</c:if>
				 <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
				 	<li class="nav-item"><button onclick="location.href='<c:url value='/try/login' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
				 </c:if>
            </ul>
            
              <!---------------- 我的最愛 ---------------->
            <ul style="list-style-type: none; padding-left:10px;padding-bottom:10px"  >
               <c:if test="${loginSession.userEmail != null}">
                <li ><button style="border:0 ;background-color:transparent;" onclick="location.href='<c:url value='/member/favorite' />'"><i class="fas fa-heart"></i></button> </li>		
               </c:if>
                 <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
                <li ><button style="border:0 ;background-color:transparent;" onclick="location.href='<c:url value='/try/login' />'"><i class="fas fa-heart"></i></button> </li>		
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
        
        <c:forEach items="${descProduct}" var="product">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
                <img  width="243.61" height="255" class="card-img" src="<c:url value='/getPicture/${product.productId}' />" alt="">
                  <input type='hidden' class='pid' name='address' value='${product.productId}'/>
                <ul class="card-product__imgOverlay">
                  <li><button onclick="location.href='<c:url value='/product?id=${product.productId}' />'"><i class="ti-search"></i></button></li>
                  <c:if test="${loginSession.userEmail != null}">
                  <li><button class='additem' value='${product.productId}' ><i class="ti-shopping-cart"></i></button></li>                  
                  </c:if>
                  
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
    <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px">
      <div class="container">
        <div class="row">
          <div class="col-xl-5">
            <div class="offer__content text-center">
              <h3>Up To 50% Off</h3>
              <h4>Winter Sale</h4>
              <p>Him she'd let them sixth saw light</p>
              <a class="button button--active mt-3 mt-xl-4" href="#">Shop Now</a>
            </div>
          </div>
        </div>
      </div>
    </section>
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
          　<c:if test="${product.stock >0 }">
          <div class="card text-center card-product">
            <div  class="card-product__img">
              <img width="243.61" height="255" class="img-fluid" src="<c:url value='/getPicture/${product.productId}' />" alt="">
                  <input type='hidden' class='pid' name='address' value='${product.productId}'/>
              <ul class="card-product__imgOverlay">
                  <li><button onclick="location.href='<c:url value='/product?id=${product.productId}' />'"><i class="ti-search"></i></button></li>  
                    <c:if test="${loginSession.userEmail != null}">
                  <li><button class='additem' value='${product.productId}' ><i class="ti-shopping-cart"></i></button></li>                  
<!--                   <li><button><i class="ti-heart"></i></button></li> -->
                  </c:if>
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
          </c:if>
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
	<footer>
		<div class="footer-area footer-only">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets ">
							<h4 class="footer_title large_title">我們的目標</h4>
							<p>
								起初，BuyBuyLa最初創立的目標是為了讓<h9 style="color:red;">莊董</h9>能在台北多買一棟帝寶，1997年時莊董誕生於台北醫學院的護理產房，伴隨著他的是大安區10幾張地契的月子禮，
								而後又過了幾年，莊董與他一起長大的好夥伴廖總、葉總、謝總、歐總，他們展現出了無與倫比的天賦，在工程、財經、甚至極限運動上都有了驚人的成就(雖然他們並不缺錢)
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



  <script src="vendors/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js" type="text/javascript"></script>
  <script src="vendors/skrollr.min.js" type="text/javascript"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js" type="text/javascript"></script>
  <script src="vendors/jquery.ajaxchimp.min.js" type="text/javascript"></script>
  <script src="vendors/mail-script.js" type="text/javascript"></script>
  <script src="js/main.js" type="text/javascript"></script>

  <script type="text/javascript"> 

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
     


<%-- <input type='hidden' value='${count}' class='count2' /> --%>


	
<script type="text/javascript">



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
		
				var count = parseInt($('#ccount').html())+1
				console.log(count)
				
				$('#ccount').html(count)
		},error:function(){
			Swal.fire({
				  position:'center',
				  icon: 'error',
				  title: '加入購物車失敗 ! ! !',
				  text: '請登入會員',
				  showConfirmButton: false,
				  timer: 1500
				})
		}
								
	});		
	
	
});






</script>

</body>
</html>