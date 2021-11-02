<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="member.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    

    
    
    
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>賣家中心</title>
    <style>
       /* loader */
       .switch {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 22px;
}

.switch-slider {
  position: absolute;
  cursor: pointer;
  border-radius: 20px;
  border: 1px solid red;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: red;
  -webkit-transition: .4s;
  transition: .4s;
}

.switch-slider.enabled {
  border-color: green;
  background-color: green;
}

.switch-slider:before {
  position: absolute;
  content: "";
  height: 16px;
  width: 16px;
  left: 2px;
  bottom: 2px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
  border-radius: 50%;
}

.loading:before
{
 border-style: dashed;
 animation: spin 2s infinite linear
}

.loading_completed:before
{
 background-color: white;
}

.switch-slider.enabled:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

@keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);

  }
  100% {
    -webkit-transform: rotate(359deg);
    transform: rotate(359deg);
  }
}





    
    .button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
        

    </style>
</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background-color: rgb(87, 87, 121);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>



        <h1>Welcome ~~      WE Will BuyBuyLA your money</h1>
        
        
  




    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">賣家中心</span>
      </div>



    <div style="text-align: center;">
    
        <form:form method='POST' modelAttribute="sellerData"
        class='form-horizontal' enctype="multipart/form-data">
        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;" >
          <h2 style="text-align: center; margin-left:-30px;">個人資料</h1><br>
          <span > 您需將資料填寫完成並驗證後，方可使用賣家功能</span><br><br><br>
          
         <tr>
         您的信箱為 : &nbsp;  
              ${sellerData.userEmail}
          </tr>    
          
        
          
           <tr>
            <td  style="margin-top:35px"></td>
           
            <td> 
            <label for="verifyCode"></label>
            <!--驗證碼欄位-->         
            <form:input id="verifyCode" path="verifyCode" placeholder="請輸入驗證碼" type='text'  style="width: 250px; height: 30px; margin-top:25px; size: 20px;" cssClass="formInput" />
         
            </td> 
          
            </tr>
            
            <tr>
            <td></td>
            
            <td>
            <!-- toggle 棟棟 -->
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
           
            <br><div ng-app style="margin-left:0px; margin-top:10px" >
                <div ng-controller="ToogleStateCtrl">
                    <span style="margin-top:9px;">發送驗證碼</span>
                    <div id="srv-state" class="switch vertical-center" ng-click="toggleState()">
                        <div class="switch-slider {{change}}" ng-class="{'disabled' : !plugin.enabled , 'enabled': plugin.enabled, 'pending': plugin.pending, 'loaded': !plugin.pending}">
                            <a href="<c:url value='/member/verifyBtn' />"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        </div>
                    </div>
                </div>
            </div>
            </td>
            </tr>
          
        
          
            
          </table>
    
       <br> <br>
          <a href="<c:url value='/try/index' />?userEmail= ${sellerData.userEmail} ">
          <input type="submit" id="submitRewrite" class="button" name="submitRewrite" style="vertical-align:middle "  value="賣家資格驗證"/>
           </a>
    
    </form:form>
      
       
       
      
      
      
      
        </div>




  </div>
        <div class="sidebar" style="background-color: rgb(87, 87, 121);">
            <div class="profile">
                <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">
                <h3></h3>
                <p>Designer</p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>

           

                    <a href="<c:url value='???' />"   onclick="return(confirm('請先成為認證賣家'))">

                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />"   onclick="return(confirm('請先成為認證賣家'))">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item"> 商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />"  onclick="return(confirm('請先成為認證賣家'))">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">數據中心</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/try/delete' />" onclick="return(confirm('確認刪除？'))">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">刪除會員</span>
                    </a>
                </li>

                <!-- /*減去footer高度*/ -->
                <li style="min-height: calc(100% - 50px); ">
                    <a href="<c:url value='/seller/inschan' />">
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

        //toggle 棟棟
        function ToogleStateCtrl($scope) {
  $scope.plugin = {
    enabled: false
  }
  $scope.toggleState = function() {
    console.log('toggling from ' + $scope.plugin.enabled + ' to ' + !$scope.plugin.enabled);
    $scope.plugin.pending = true;
    //delay to simulate pending state
    $scope.change='loading';
    setTimeout(doToggle, 11000);
  }
  function doToggle() {
    console.log('do toggling')
    $scope.plugin.pending = false;
    $scope.plugin.enabled = !$scope.plugin.enabled;
    $scope.change='loading_completed';
    $scope.$apply()
  }
}


          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
    </script>
 
</body>
</html>