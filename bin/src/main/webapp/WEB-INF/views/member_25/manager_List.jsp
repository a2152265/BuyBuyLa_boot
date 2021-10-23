<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>
    
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


    <title>card</title>

    <script>
        $(document).ready(function () {
            jQuery('#example').DataTable();
        });


    </script>

    <style>
    </style>
</head>

<body>
    
    <table id="example" class="display" style="width:100%">
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
                  <a href="${pageContext.request.contextPath}/memberEdit?id=<c:out value='${member.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; 
                    <a href="${pageContext.request.contextPath}/memberDelete?id=<c:out value='${member.id}' />">Delete</a>
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



</body>
</html>