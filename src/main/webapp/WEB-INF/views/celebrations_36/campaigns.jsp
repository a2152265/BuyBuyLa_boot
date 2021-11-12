<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>BuyBuyLa</title>
	<link rel="icon" href="./img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="./vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="./vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="./vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="./vendors/linericon/style.css">
  <link rel="stylesheet" href="./vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="./vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="./vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="./css/productstyle.css">
  <style>
  #navbar {
  height: 70px;
      background-color: lightgreen;
  
}
.navbar-custom {
    background-color: lightgreen;
}
/* .navbar-nav:a{ */
/*  padding-left:100px */
/* } */
.btn-primary {
  color: #fff;
  background-color: #FFC300;
  border-color: #FFC300;
}
.btn-primary:hover, .btn-primary:focus, .btn-primary:active:hover{
  color: #fff;
  background-color: #FFC300;
  border-color: #FFC300;
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
	<!--================ End Header Menu Area =================-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar" >
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav" style="font-weight:bolder;font-size:25px">
        <a class="nav-link" href="<c:url value='/campaigns' />"style="padding-left:100px;">活動總覽</a>
        <a class="nav-link" href="<c:url value='/campaigns/購物金' />" style="padding-left:100px">購物金</a>
        <a class="nav-link" href="<c:url value='/campaigns/免運' />" style="padding-left:100px">免運</a>
        <a class="nav-link" href="<c:url value='/campaigns/限時活動' />" style="padding-left:100px">限時活動</a>
      </div>
    </div>
  </div>
</nav>
<!-- 	<!-- ================ start banner area ================= -->	
<!-- 	<section class="blog-banner-area" id="blog"> -->
<!-- 		<div class="container h-100"> -->
<!-- 			<div class="blog-banner"> -->
<!-- 				<div class="text-center"> -->
<!-- 					<h1>活動總覽</h1> -->
<!-- 					<nav aria-label="breadcrumb" class="banner-breadcrumb"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"><a href="#"></a></li> -->
<!--             </ol> -->
<!--           </nav> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!--     </div> -->
<!-- 	</section> -->
<!-- 	<!-- ================ end banner area ================= --> 


<!--   <!--================Single Product Area =================--> 

     <section class="container">
        <div class="row">
        	<c:forEach items='${campaigns}' var='campaign'>
            <div class="col-sm-6 col-md-3" style="width: 390px; height: 370px;margin:40px">
                <div class="thumbnail" style="width: 320px; height: 340px ;border:1px solid grey">
                	  <a href="<c:url value='${campaign.url}' />">
                	<img style="margin-left:0px;margin-bottom:20px;" width='319' height='140' 
                		src="<c:url value='/getCampaignPicture/${campaign.id}' />" />
                		</a>
                    <div class="caption">
<!--                         <p style='margin-bottom:20px;margin-left:10px;margin-top:7px'> -->
                         <p style='text-align:center'>
                           <b style='font-size: 20px;'>${campaign.name}</b>
                        </p>
                        <p style='text-align:center;margin-top:px;'>
                           <b style='font-size: 16px;color:grey;'>有效期限至${campaign.date1}</b>
<%--                        	<a href="<spring:url value='/campaign?id=${campaign.id}' />" --%>
<!--    							 class="btn btn-primary"> -->
<!--     						<span class="glyphicon-info-sigh glyphicon"style=''></span>詳細資料 -->
<!-- 						</a> -->
                       
                        </p>
                        <p style="margin-left:100px;margin-top:20px">
                        		<a href="<spring:url value='${campaign.url}' />"
   							 class="btn btn-warning btn-lg" >
    						<span class="glyphicon-info-sigh glyphicon"style=''></span>詳細資料
						</a>
                        </p>
                    </div>
                </div>
            </div>
          </c:forEach>
        </div>
    </section>



<!-- 	<!--================End Single Product Area =================--> 

<!-- 	<!--================Product Description Area =================--> 
<!-- 	<section class="product_description_area"> -->
<!-- 		<div class="container"> -->
<!-- 			<ul class="nav nav-tabs" id="myTab" role="tablist"> -->
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a> -->
<!-- 				</li> -->
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" -->
<!-- 					 aria-selected="false">Specification</a> -->
<!-- 				</li> -->
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" -->
<!-- 					 aria-selected="false">Comments</a> -->
<!-- 				</li> -->
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" -->
<!-- 					 aria-selected="false">Reviews</a> -->
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 			<div class="tab-content" id="myTabContent"> -->
<!-- 				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab"> -->
<%-- 					<p>${product.productInfo}</p> --%>
<!-- 					<p></p> -->
<!-- 				</div> -->
<!-- 				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"> -->
<!-- 					<div class="table-responsive"> -->
<!-- 						<table class="table"> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Width</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>128mm</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Height</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>508mm</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Depth</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>85mm</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Weight</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>52gm</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Quality checking</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>yes</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Freshness Duration</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>03days</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>When packeting</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>Without touch of hand</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td> -->
<!-- 										<h5>Each Box contains</h5> -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<h5>60pcs</h5> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-6"> -->
<!-- 							<div class="comment_list"> -->
<!-- 								<div class="review_item"> -->
<!-- 									<div class="media"> -->
<!-- 										<div class="d-flex"> -->
<!-- 											<img src="img/product/review-1.png" alt=""> -->
<!-- 										</div> -->
<!-- 										<div class="media-body"> -->
<!-- 											<h4>Blake Ruiz</h4> -->
<!-- 											<h5>12th Feb, 2018 at 05:56 pm</h5> -->
<!-- 											<a class="reply_btn" href="#">Reply</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et -->
<!-- 										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea -->
<!-- 										commodo</p> -->
<!-- 								</div> -->
<!-- 								<div class="review_item reply"> -->
<!-- 									<div class="media"> -->
<!-- 										<div class="d-flex"> -->
<!-- 											<img src="img/product/review-2.png" alt=""> -->
<!-- 										</div> -->
<!-- 										<div class="media-body"> -->
<!-- 											<h4>Blake Ruiz</h4> -->
<!-- 											<h5>12th Feb, 2018 at 05:56 pm</h5> -->
<!-- 											<a class="reply_btn" href="#">Reply</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et -->
<!-- 										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea -->
<!-- 										commodo</p> -->
<!-- 								</div> -->
<!-- 								<div class="review_item"> -->
<!-- 									<div class="media"> -->
<!-- 										<div class="d-flex"> -->
<!-- 											<img src="img/product/review-3.png" alt=""> -->
<!-- 										</div> -->
<!-- 										<div class="media-body"> -->
<!-- 											<h4>Blake Ruiz</h4> -->
<!-- 											<h5>12th Feb, 2018 at 05:56 pm</h5> -->
<!-- 											<a class="reply_btn" href="#">Reply</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et -->
<!-- 										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea -->
<!-- 										commodo</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-6"> -->
<!-- 							<div class="review_box"> -->
<!-- 								<h4>Post a comment</h4> -->
<!-- 								<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate"> -->
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<input type="text" class="form-control" id="name" name="name" placeholder="Your Full name"> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<input type="email" class="form-control" id="email" name="email" placeholder="Email Address"> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<input type="text" class="form-control" id="number" name="number" placeholder="Phone Number"> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<textarea class="form-control" name="message" id="message" rows="1" placeholder="Message"></textarea> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-md-12 text-right"> -->
<!-- 										<button type="submit" value="submit" class="btn primary-btn">Submit Now</button> -->
<!-- 									</div> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-lg-6"> -->
<!-- 							<div class="row total_rate"> -->
<!-- 								<div class="col-6"> -->
<!-- 									<div class="box_total"> -->
<!-- 										<h5>Overall</h5> -->
<!-- 										<h4>4.0</h4> -->
<!-- 										<h6>(03 Reviews)</h6> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-6"> -->
<!-- 									<div class="rating_list"> -->
<!-- 										<h3>Based on 3 Reviews</h3> -->
<!-- 										<ul class="list"> -->
<!-- 											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i -->
<!-- 													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li> -->
<!-- 											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i -->
<!-- 													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li> -->
<!-- 											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i -->
<!-- 													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li> -->
<!-- 											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i -->
<!-- 													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li> -->
<!-- 											<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i -->
<!-- 													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="review_list"> -->
<!-- 								<div class="review_item"> -->
<!-- 									<div class="media"> -->
<!-- 										<div class="d-flex"> -->
<!-- 											<img src="img/product/review-1.png" alt=""> -->
<!-- 										</div> -->
<!-- 										<div class="media-body"> -->
<!-- 											<h4>Blake Ruiz</h4> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et -->
<!-- 										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea -->
<!-- 										commodo</p> -->
<!-- 								</div> -->
<!-- 								<div class="review_item"> -->
<!-- 									<div class="media"> -->
<!-- 										<div class="d-flex"> -->
<!-- 											<img src="img/product/review-2.png" alt=""> -->
<!-- 										</div> -->
<!-- 										<div class="media-body"> -->
<!-- 											<h4>Blake Ruiz</h4> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et -->
<!-- 										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea -->
<!-- 										commodo</p> -->
<!-- 								</div> -->
<!-- 								<div class="review_item"> -->
<!-- 									<div class="media"> -->
<!-- 										<div class="d-flex"> -->
<!-- 											<img src="img/product/review-3.png" alt=""> -->
<!-- 										</div> -->
<!-- 										<div class="media-body"> -->
<!-- 											<h4>Blake Ruiz</h4> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 											<i class="fa fa-star"></i> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et -->
<!-- 										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea -->
<!-- 										commodo</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-lg-6"> -->
<!-- 							<div class="review_box"> -->
<!-- 								<h4>Add a Review</h4> -->
<!-- 								<p>Your Rating:</p> -->
<!-- 								<ul class="list"> -->
<!-- 									<li><a href="#"><i class="fa fa-star"></i></a></li> -->
<!-- 									<li><a href="#"><i class="fa fa-star"></i></a></li> -->
<!-- 									<li><a href="#"><i class="fa fa-star"></i></a></li> -->
<!-- 									<li><a href="#"><i class="fa fa-star"></i></a></li> -->
<!-- 									<li><a href="#"><i class="fa fa-star"></i></a></li> -->
<!-- 								</ul> -->
<!-- 								<p>Outstanding</p> -->
<!--                 <form action="#/" class="form-contact form-review mt-3"> -->
<!--                   <div class="form-group"> -->
<!--                     <input class="form-control" name="name" type="text" placeholder="Enter your name" required> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <input class="form-control" name="email" type="email" placeholder="Enter email address" required> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <input class="form-control" name="subject" type="text" placeholder="Enter Subject"> -->
<!--                   </div> -->
<!--                   <div class="form-group"> -->
<!--                     <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea> -->
<!--                   </div> -->
<!--                   <div class="form-group text-center text-md-right mt-3"> -->
<!--                     <button type="submit" class="button button--active button-review">Submit Now</button> -->
<!--                   </div> -->
<!--                 </form> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
<!-- 	<!--================End Product Description Area =================--> 

<!-- 	<!--================ Start related Product area =================-->   
<!-- 	<section class="related-product-area section-margin--small mt-0"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="section-intro pb-60px"> -->
<!--         <p>Popular Item in the market</p> -->
<!--         <h2>Top <span class="section-intro__style">Product</span></h2> -->
<!--       </div> -->
<!-- 			<div class="row mt-30"> -->
<!--         <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!--           <div class="single-search-product-wrapper"> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-1.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                   <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                   <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-2.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-3.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

<!--         <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!--           <div class="single-search-product-wrapper"> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-4.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                   <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                   <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-5.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-6.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

<!--         <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!--           <div class="single-search-product-wrapper"> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-7.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                   <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                   <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-8.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-9.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

<!--         <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!--           <div class="single-search-product-wrapper"> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-1.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                   <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                   <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-2.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="single-search-product d-flex"> -->
<!--               <a href="#"><img src="img/product/product-sm-3.png" alt=""></a> -->
<!--               <div class="desc"> -->
<!--                 <a href="#" class="title">Gray Coffee Cup</a> -->
<!--                 <div class="price">$170.00</div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!-- 		</div> -->
<!-- 	</section> -->
<!-- 	<!--================ end related Product area =================-->  	

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



  <script src="./vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="./vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="./vendors/skrollr.min.js"></script>
  <script src="./vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="./vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="./vendors/jquery.ajaxchimp.min.js"></script>
  <script src="./vendors/mail-script.js"></script>
  <script src="./js/main.js"></script>
</body>
</html>