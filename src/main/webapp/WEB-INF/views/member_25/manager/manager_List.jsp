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
    
    <link rel="stylesheet" href="member.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理中心</title>
    
  

<!-- for form css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  
    <!-- 跳出表單 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
   
  
  
  <script>
  $(document).ready(function () {
      jQuery('#example').DataTable();
  });

      

  </script>


</head>
<body style="background-color: rgb(225, 219, 241);">
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background: rgb(44, 8, 80);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>


    <div class="container" style="padding: 0px 0px 0px 30px;">
       <span style="font-size: 40px;">會員清單</span>
      </div>


      <table id="example" class="display" style="width:100% ">
        <thead>
            <tr>
                <th>會員編號</th>
                <th>E-mail</th>
                <th>電話</th>
                <th>密碼</th>
                <th>會員名稱</th>
                <th>會員暱稱</th>
                <th>性別</th>
                <th>地址</th>
                <th>8.權限</th>
                <th>備註</th>
                <th>修改</th>
              </tr>
        </thead>




        <tbody>


            <c:forEach var="member" items="${memberList}">
                <tr>
                  <td><c:out value="${member.id}" /></td>
                  <td><c:out value="${member.userEmail}" /></td>
                  <td><c:out value="${member.userPhone}" /></td>
                  <td><c:out value="${member.userPwd}" /></td>
                  <td><c:out value="${member.userName}" /></td>
                  <td><c:out value="${member.userNickname}" /></td>
                  <td><c:out value="${member.userGender}" /></td>
                  <td><c:out value="${member.address}" /></td>
                  <td><c:out value="${member.identification}" /></td>
                  <td><c:out value="${member.notes}" /></td>
       
                  <td>
                 
                
                <div class="bn">
                    <!-- Button 修改會員資料 -->
                    <a href='/BuyBuyla_boot/manager/edit${member.id}'  class="button-1" >修改會員</a>
                          <a href='/BuyBuyla_boot/manager/delete${member.id}'  onclick="return(confirm('確認刪除？'))"    class="button-1" >刪除會員</a>
                         
                                    
                                    
            
                                    
                                </div>
            
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                  </td>                      
                </tr>
                
                
               
                
                 </c:forEach>
          
        </tbody>

        <tfoot>
            <tr>
                <th>會員編號</th>
                <th>E-mail</th>
                <th>電話</th>
                <th>密碼</th>
                <th>會員名稱</th>
                 <th>會員暱稱</th>
                <th>性別</th>
                <th>地址</th>
                <th>8.權限</th>
                <th>修改</th>
            </tr>
        </tfoot>
    </table>



  </div>
        <div class="sidebar" style="background: rgb(44, 8, 80);">
            <div class="profile">
      
                <!-- 讀取圖片 -->
               <img src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>" />
    
                <h3></h3>
                <p>您好! &nbsp; 管理員${loginSession.userEmail}</p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />" >
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/manager_Ui' />" class="active">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">會員資料管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">效益分析</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/manager/forum' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">討論區</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/recordManage' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/changePwd' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item"></span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item"></span>
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