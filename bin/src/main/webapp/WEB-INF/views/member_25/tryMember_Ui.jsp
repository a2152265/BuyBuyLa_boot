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
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <style>
        

    </style>
</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar">
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
        
  




    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">我的資料</span>
      </div>



    <div style="text-align: center;">
    
        <form:form method='POST' modelAttribute="memberUiDefault"
        class='form-horizontal' enctype="multipart/form-data">
        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;">
          
          <span > - 您可以在這邊做新增、修改、刪除</span><br><br><br>
          
          
                    <tr>
          <td>頭像</td>
          <td>
                 <!-- 讀取圖片 -->
               <img width='150'
                 src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>" />
                      <br><br><!-- 上傳圖片 -->
                     修改<form:input id="productImage" path="productImage" type='file'  cssClass="size:20%;"  />
                       &nbsp;&nbsp;
         <br><br><br>
          </td>
          </tr>
          
          
          
          
          
          <tr>
            <td >帳號</td>

            <td > 
             <!--放從DB取出的資料-->         
             Hi!!! &nbsp;&nbsp;  ${memberUiDefault.userEmail} 
            <br><br>
            
         
           </td> 
          </tr>


          <tr>
            <td>暱稱</td>
            <td> 
            <label for="userNickname"></label>
            <!--放從DB取出的資料-->         
              ${memberUiDefault.userNickname} 
            &nbsp;&nbsp;/&nbsp;&nbsp;
            <form:input id="userNickname" path="userNickname" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
            <br><br>
            </td> 
          </tr>
          
          
          
          
          
          
           <tr>
            <td>姓名</td>
            <td> 
            <label for="proName"></label>
            <!--放從DB取出的資料-->         
              ${memberUiDefault.userName} 
            &nbsp;&nbsp;/&nbsp;&nbsp;
            <form:input id="userName" path="userName" type='text'  style="width: 250px; height: 30px;"  cssClass="formInput" />
            <br><br>
            </td> 
          </tr>
            
            
            <tr>
            <td>手機號碼</td>
            <td>
             <!--放從DB取出的資料-->         
              ${memberUiDefault.userPhone} 
             &nbsp;&nbsp;/&nbsp;&nbsp;  
             <form:input id="userPhone" path="userPhone" type='text'  style="width: 250px; height: 30px;"  cssClass="formInput" />
             <br><br>
            </td>
            </tr>

            <tr>
                <td>生日</td>
                <td> 
                <label for="birthday"></label>
                <!--放從DB取出的資料-->         
                  ${memberUiDefault.birthday} 
                &nbsp;&nbsp;/&nbsp;&nbsp;
                <form:input id="birthday" path="birthday" type='text'  style="width: 250px; height: 30px;"  cssClass="formInput" />
                <br><br>
                </td> 
              </tr>
         
            <tr>
             <td>性別</td>
              <td>
                <!--放從DB取出的資料-->
                 ${memberUiDefault.userGender} 
                     &nbsp;&nbsp;/&nbsp;&nbsp; 
                <label>  <form:radiobutton path="userGender" value="男性" label="男性" /> 
                  </label> 
             <label>     <form:radiobutton path="userGender" value="女性" label="女性" /> 
               </label>  
               <label>     <form:radiobutton path="userGender" value="其他" label="其他" /> 
               </label>  <br><br>
              </td>
              </tr>
              
              
              
              <tr>
            <td>地址</td>
            <td> 
            <label for="address"></label>
            <!--放從DB取出的資料-->         
              ${memberUiDefault.address} 
            &nbsp;&nbsp;/&nbsp;&nbsp;
            <form:input id="address" path="address" type='text'  style="width: 250px; height: 30px;"  cssClass="formInput" />
            <br><br>
            </td> 
          </tr>
            
            
          </table>
          
      
          <p>&nbsp;</p>
          <a href="<c:url value='/try/index' />?userEmail= ${memberUiDefault.userEmail} ">
          <input type="submit" id="submitRewrite" class="submitBtn" name="submitRewrite" style="text-align: center; font-size: 18x;"  value="儲存修改"/>
           </a>
         
         
         
         </form:form>
      
       
       
      
      
      
      
        </div>




  </div>
        <div class="sidebar">
            <div class="profile">
                <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">
                <h3></h3>
                <p>Designer</p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='???' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/selectLsit' />"">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">購買紀錄</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">  個人主頁</span>
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
                    <a href="<c:url value='/member/changePwd' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">更改密碼</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">刪除會員</span>
                    </a>
                </li>

                <!-- /*減去footer高度*/ -->
                <li style="min-height: calc(100% - 50px); ">
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                
            </ul>
        </div>
        
    </div>

   


    <script>
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
    </script>
 
</body>
</html>