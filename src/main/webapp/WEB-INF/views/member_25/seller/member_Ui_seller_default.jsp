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



        <h1>Welcome ~~      WE Will BuyBuyLA your money</h1>
        
        
  




    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">賣家中心</span>
      </div>



    <div style="text-align: center;">
    
        <form:form method='POST' modelAttribute="sellerData"
        class='form-horizontal' enctype="multipart/form-data">
        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;" >
          <h2 style="text-align: center;">個人資料</h1><br>
          <span > 您需將資料填寫完成並驗證後，方可使用賣家功能</span><br><br><br>
          
          
            <tr>
          <td>頭像</td>
          <td>
          
                 <!-- 讀取圖片 --> 
               <img width='150'
                 src="<c:url value='/getPicturefromMember/${sellerData.id}'/>" />
          &nbsp;&nbsp;<br>
                 <!-- 上傳圖片 -->             
                更換頭像&nbsp;<form:input id="productImage" path="productImage" type='file'  cssClass="size:20%;"  />
          </td>
          </tr>
 
          <tr>
            <td >帳號</td>
            <td > 
             <!--放從DB取出的資料-->         
             Hi!!! &nbsp;&nbsp;  ${sellerData.userEmail} 
            <br> 
            
         
           </td> 
          </tr>


          <tr>
            <td>暱稱</td>
            <td> 
            <label for="userNickname"></label>
            <!--放從DB取出的資料-->         
              ${sellerData.userNickname} 
            &nbsp;&nbsp;/&nbsp;&nbsp;
            <form:input id="userNickname" path="userNickname" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
            
            </td> 
          </tr>

           <tr>
            <td>姓名</td>
            <td> 
            <label for="proName"></label>
            <!--放從DB取出的資料-->         
              ${sellerData.userName} 
            &nbsp;&nbsp;/&nbsp;&nbsp;
            <form:input id="userName" path="userName" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
            
            </td> 
          </tr>
            
            
            <tr>
            <td>手機號碼</td>
            <td>
             <!--放從DB取出的資料-->         
              ${sellerData.userPhone} 
             &nbsp;&nbsp;/&nbsp;&nbsp;  
             <form:input id="userPhone" path="userPhone" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
             
            </td>
            </tr>

            <tr>
                <td>生日</td>
                <td> 
                <label for="birthday"></label>
                <!--放從DB取出的資料-->         
                  ${sellerData.birthday} 
                &nbsp;&nbsp;/&nbsp;&nbsp;
                <form:input id="birthday" path="birthday" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
                
                </td> 
              </tr>
         
            <tr>
             <td>性別</td>
              <td>
                <!--放從DB取出的資料-->
                 ${sellerData.userGender} 
                     &nbsp;&nbsp;/&nbsp;&nbsp; 
                <label>  <form:radiobutton path="userGender" value="男性" label="男性" /> 
                  </label> 
             <label>     <form:radiobutton path="userGender" value="女性" label="女性" /> 
               </label>  
               <label>     <form:radiobutton path="userGender" value="其他" label="其他" /> 
               </label>  
              </td>
              </tr>
              
              
              
              <tr>
            <td>地址</td>
            <td> 
            <label for="address"></label>
            <!--放從DB取出的資料-->         
              ${sellerData.address} 
            &nbsp;&nbsp;/&nbsp;&nbsp;
            <form:input id="address" path="address" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
            
            </td> 
          </tr>
          
          
          
           <tr>
            <td>驗證碼</td>
            <td> 
            <label for="verifyCode"></label>
            <!--驗證碼欄位-->         
            <form:input id="verifyCode" path="verifyCode" type='text'  style="width: 250px; height: 30px;" cssClass="formInput" />
            &nbsp;&nbsp;/&nbsp;&nbsp;
           
          <!--  <li>    <button type="button"><c:url value='/member/verifyBtn' />送出驗證碼   </button> </li> -->
            <li><a href="<c:url value='/member/verifyBtn' />">發送驗證碼</a></li>  
            </td> 
          </tr>
            
            
          </table>
          
      
          <p>&nbsp;</p>
          <a href="<c:url value='/try/index' />?userEmail= ${sellerData.userEmail} ">
          <input type="submit" id="submitRewrite" class="submitBtn" name="submitRewrite" style="text-align: center; font-size: 18x;"  value="賣家資格驗證"/>
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
                    <a href="<c:url value='/' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/seller_Ui' />"">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item"> 商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">數據中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/seller_Ui' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">帳號管理</span>
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