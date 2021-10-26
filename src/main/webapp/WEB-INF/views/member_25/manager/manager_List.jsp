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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
   
  
  
  <script>
  $(document).ready(function () {
      jQuery('#example').DataTable();
  });

      

  </script>


</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background: rgb(61, 27, 75);">
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
       
                  <td>
              <!--   <a href="${pageContext.request.contextPath}/memberEdit?id=<c:out value='${member.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; 
                    <a href="${pageContext.request.contextPath}/memberDelete?id=<c:out value='${member.id}' />">Delete</a>
                -->       
                
                <div class="bn">
                    <!-- Button 修改會員資料 -->
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#staticBackdrop" style="font-size: 50%; margin-top: 10px;" >
                        <a role="button">修改</a>
                    </button>&nbsp;
                      <a href="<c:url value='/member/delete' />" >
                     <input type="button" style="font-size: 50%; margin-top: 10px;" value="刪除" class="btn btn-primary btn-lg"  onclick="return(confirm('確定刪除？'))" >                 
                    </a>
                   
            
                    <!-- Modal -->
                    <div class="modal fade " id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">修改會員資料</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    



                                        <form:form method='POST' modelAttribute="member"
                                        class="needs-validation"    enctype="multipart/form-data">
                                         <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
                                         <input type="hidden" name="_token" value="">


                                        <!-- 表格內容區 -->
                                        <div class="form-group">
                                            <label class="control-label">E-Mail </label>
                                            <div>
                                            	${member.userEmail}
                                          
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">電話</label>
                                            <div>
                                      
                                                <form:input id="userPhone" path="userPhone" type='text' placeholder="userPhone" cssclass='form-control input-lg'  /> <br>
                                                <form:errors path="userPhone" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">密碼</label>
                                            <div>
                                                <form:input id="userPwd" path="userPwd" type='text' placeholder="userPwd" cssclass='form-control input-lg'  /> <br>
                                                <form:errors path="userPwd" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">會員姓名</label>
                                            <div>
                                                <form:input id="userName" path="userName" type='text' placeholder="userName" cssclass='form-control input-lg'  /> <br>
                                                <form:errors path="userName" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">會員暱稱</label>
                                            <div>
                                                <form:input id="userNickname" path="userNickname" type='text' placeholder="userNickname" cssclass='form-control input-lg'  /> <br>
                                                <form:errors path="userNickname" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">性別</label>
                                            <div>
                                                <form:radiobutton path="userGender" value="男性" label="男性" /> 
                                                <form:radiobutton path="userGender" value="女性" label="女性" /> 
                                                <form:radiobutton path="userGender" value="其他" label="其他" /> 
                                                 <form:errors path="userGender" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">地址</label>
                                            <div>
                                                <form:input id="address" path="address" type='text' placeholder="address" cssclass='form-control input-lg'  /> <br>
                                                <form:errors path="address" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">身分別</label>
                                            <div>
                                                <form:radiobutton path="identification" value="買家" label="買家" /> 
                                                <form:radiobutton path="identification" value="賣家" label="賣家" /> 
                                                <form:radiobutton path="identification" value="管理員" label="管理員" /> 
                                               <form:errors path="identification" cssClass="error" style="color: red;" />	
                                            </div>
                                        </div>
                                        
                                        
            
                                        <div class="form-group">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                <label class="form-check-label" for="invalidCheck">
                                                    Agree to terms and conditions
                                                </label>
                                                <div class="invalid-feedback">
                                                    You must agree before submitting.
                                                </div>
                                            </div>
                                        </div>
            
                                        <div class="modal-footer">
            
                                            <button type="button" class="btn btn-outline-info">一鍵輸入</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
        
                                   <!--     <button type="submit" class="btn btn-primary">確認送出</button>  -->    
                                           
                                            
                                            <!-- 提交修改按鈕 -->
                                            <a href="">
       										   <input type="submit" id="submitRewrite" class="btn btn-primary" name="submitRewrite" style="text-align: center; font-size: 18x;"  value="儲存修改"/>
        								   </a>  
                                          
                                        </div>
                                    </form:form>
                                    
                                    
                                    
            
                                    <script>
                                                    // Example starter JavaScript for disabling form submissions if there are invalid fields
                                                    (function () {
                                                        'use strict';
                                                        window.addEventListener('load', function () {
                                                            // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                                            var forms = document.getElementsByClassName('needs-validation');
                                                            // Loop over them and prevent submission
                                                            var validation = Array.prototype.filter.call(forms, function (form) {
                                                                form.addEventListener('submit', function (event) {
                                                                    if (form.checkValidity() === false) {
                                                                        event.preventDefault();
                                                                        event.stopPropagation();
                                                                    }
                                                                    form.classList.add('was-validated');
                                                                }, false);
                                                            });
                                                        }, false);
                                                    })();
                                    </script>
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
        <div class="sidebar" style="background: rgb(66, 9, 122);">
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
                    <a href="<c:url value='???' />"">
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
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">討論區</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item"></span>
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