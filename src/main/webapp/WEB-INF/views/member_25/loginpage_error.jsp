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
  <link rel="stylesheet" href="../vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">

 
    <link rel='stylesheet' href="<spring:url value='../css/productstyle.css' />"  type="text/css" />
  <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>


 

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


  <script>
  alert('登入失敗(查無此帳號)');
  
	let no = 1000;
let index = 0,index2=0;
var names= ["a2152265@gmail.com", 'z1718221@gmail.com', 'xzc8951273@gmail.com'];
function quickInput(){
	document.getElementById('name').value = names[index];
	document.getElementById('pwd').value = names[index];
   
	index++;
	if (index >= names.length) {
		index = 0 ;
	}
	
}

var names2= ["manager9527@gmail.com", 'manager04@gmail.com', 'manager07@gmail.com'];
function quickInput2(){
	document.getElementById('name').value = names2[index2];
	document.getElementById('pwd').value = names2[index2];
   
	index2++;
	if (index2 >= names2.length) {
		index2 = 0 ;
	}
	
}

</script>
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
					   <form:form method='POST' action="./queryproduct" class='form-horizontal'>
						<input name="productName" id="productName" type='text' class='form:input-large'/>
						<button type='submit' ><i class="ti-search" ></i></button>
					</form:form>
	
	
				  <!---------------- 購物車 ---------------->
				  <li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'></span></button> </li>
	
				</ul>
			  </div>
			</div>
		  </nav>
		</div>
	  </header>
		<!--================ End 首頁標題 =================-->
  
 
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>新加入的夥伴?</h4>
							<p>註冊後開始享受你的購物旅程</p>
							<a class="button button-account" href="<c:url value='/try/add' />">註冊</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>登入後開始</h3>

						<!-- 登入帳號區 -->
						<form:form method='POST'   modelAttribute="loginSession"
							cssClass='row login_form' id="contactForm">


							<div class="col-md-12 form-group">
								<form:input  class="form-control" path="userEmail"  id="name" name="name" placeholder="請輸入帳號" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'"/>
							</div>
							<div class="col-md-12 form-group">
								<form:password class="form-control" path="userPwd"  id="pwd" name="name" placeholder="請輸入密碼" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'"/>
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">保持登入狀態</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">登入</button>
								<input id="onejan" type="button" value="一键输入用户名"  onclick='quickInput();' > 
									<input id="onejan2" type="button" value="一键输入管理者"  onclick='quickInput2();' >  <br>
								<a href="<c:url value='/member/forget' />">忘記密碼?</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->



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



  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>