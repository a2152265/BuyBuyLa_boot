<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    <link rel="stylesheet" href="member.css">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <style>
        

    </style>
</head>
<body >
   
    <div class="wrapper" >
       <div class="section">



    <div class="top_navbar" style="background-color: rgb(51, 63, 177);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>



        <!-- <h1>WE Will BuyBuyLA your money</h1>
        <h2>Flexbo -> 商品狀態x</h2>
        <nav>
            <ul class="flex-nav">
                <li><a href="#">未付款</a></li>
                <li><a href="#">已付款</a></li>
                <li><a href="#">已出貨</a></li>
                <li><a href="#">運送中</a></li>
                <li><a href="#">已送達</a></li>
                <li><a href="#">已完成</a></li>
                <li><a href="#">取消交易</a></li>
            </ul>
        </nav> -->
        
  




    <div class="container" >
      <span style="font-size:30px;  font-weight:bold;">會員專區</span>
      </div>



    

         
                  <div class="card text-black" style="border-radius: 25px;">
                    <div class="card-body p-md-5">
                      <div class="row justify-content-center">
                        <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
          
                          <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"> 修改會員資料 </p>
                            <!-- 修改表單開始 -->
                          <form:form method='POST' modelAttribute="memberUiDefault"
                          class="mx-1 mx-md-4" enctype="multipart/form-data">
                       

                          <div class="d-flex flex-row align-items-center mb-4">
                            <i class="fas fa-user fa-lg me-3 fa-fw"  style="margin-bottom: 10px; " ></i>
                            <div class="form-outline flex-fill mb-0">
                               &nbsp; Hi!!! &nbsp;&nbsp;  ${memberUiDefault.userEmail} 
                              <label class="form-label" for="form3Example1c">帳號</label>
                            </div>
                          </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                             <form:input id="userNickname" path="userNickname" type="text"  class="form-control" placeholder="暱稱" />
                                 </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                <form:input id="userName" path="userName" class="form-control" type='text'  placeholder="姓名" />
                                  </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                <form:input id="userPhone" path="userPhone" type='text' class="form-control"  placeholder="手機"  />
                                </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-birthday-cake fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                <form:input id="birthday" path="birthday" type='text' class="form-control"  placeholder="生日"  />
                                 </div>
                            </div>                       

                              <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-Genderless fa-lg me-3 fa-fw"></i>
                                <div class="form-outline flex-fill mb-0">
                                    <label>  <form:radiobutton id="userGender" path="userGender" value="男性" label="男性" /> 
                                    </label> 
                               <label>     <form:radiobutton id="userGender" path="userGender" value="女性" label="女性" /> 
                                 </label>  
                                 <label>     <form:radiobutton id="userGender" path="userGender" value="其他" label="其他" /> 
                                 </label>
                                   </div>
                              </div>

                              <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-Genderless fa-lg me-3 fa-fw"></i>
                                <div class="form-outline flex-fill mb-0">
                                  <form:input id="address" path="address" type='text' class="form-control" placeholder="地址" />
                                   </div>
                              </div>
          
                            
          
                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <input type="submit" id="submitRewrite" name="submitRewrite" class="btn btn-primary btn-lg" value="送出修改">
                            </div>

                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                <input type="button" id="onejan" name="submitRewrite" class="btn btn-primary btn-lg" value="一鍵輸入">
                              </div>
          
          
                        </div>
                        
                        
            
                 <!-- 讀取圖片 --> 
               <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>" 
                   class="img-fluid" alt="Sample image"  style="width: 50%;  height:50%;" />
         
                        <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
          

                            
                    <!-- 上傳圖片 -->
                   	<form>
                      <div class="custom-file" style="width: 250px;">
                        <form:input type="file"  path="productImage" class="custom-file-input" id="productImage"  />
                        <br><br> <label class="custom-file-label" for="customFile">選擇大頭貼</label> 
                      </div>
						</form>

                    </form:form> 

                          <!-- <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-registration/draw1.png" class="img-fluid" alt="Sample image"> -->
          
                        </div>
                      </div>
                    </div>
                  </div>
               

       
      
       
       
      
      
      
        
        
        

	


 
<div>
        <div class="sidebar" style="background-color: rgb(51, 63, 177);">
            <div class="profile">
             <!--    <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">  --> 
                <!-- 讀取圖片 -->
               <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>"   alt="profile_picture" />
                <h3></h3>
                <p>${memberUiDefault.userEmail} </p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">回首頁</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/selectLsit'/>">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">購買紀錄</span>
                    </a>
                </li>
                  <li>
                    <a href="<c:url value='/addressLsit'/>">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">地址管理</span>
                    </a>
                </li>
           
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">討論區</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">帳號管理</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/member/evolution' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">賣家中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/changePwd_check' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">更改密碼</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/coupon' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">我的折價券</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />"  onclick="return(confirm('確認刪除？'))">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">刪除會員</span>
                    </a>
                </li>

                <!-- /*減去footer高度*/ -->
                <li>
                    <a href="<c:url value='/member/inschan' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/try/logout' />"  onclick="return(confirm('確認登出？'))" >
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">登出</span>
                    </a>
                </li>
                
                
            </ul>
        </div>
        
    </div>
   


    <script>
    // 1 jan input
    let demoBTN = document.getElementById('onejan')
    demoBTN.onclick = function(){
    document.getElementById("userNickname").setAttribute('value','pop貓');
    document.getElementById("userName").setAttribute('value','李小貓');               
    document.getElementById("userPhone").setAttribute('value','0912345678'); 
    document.getElementById("birthday").setAttribute('value','1997-04-26'); 
    document.getElementById("userGender").setAttribute('label','男性'); 
    document.getElementById("address").setAttribute('value','桃園市中壢區中大路300號'); 
    console.log("YAA");
    };
    
    
    
    
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })


  // Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
    </script>
 
</body>
</html>