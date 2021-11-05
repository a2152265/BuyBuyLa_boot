
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/manager/datatable/header.jspf"%>
<!-- sidebar -->>
<%@ include file="../../Home/manager/footer.jspf"%>

<!-- 通知欄 -->>
<section class="page-content">
  <section class="search-and-user">
    <form>
      <input type="search" placeholder="Search Pages...">
      <button type="submit" aria-label="submit form">
        <svg aria-hidden="true">
          <use xlink:href="#search"></use>
        </svg>
      </button>
    </form>
    <div class="admin-profile">
      <span class="greeting">通知</span>
      <div class="notifications">
        <span class="badge">22</span>
        <svg>
          <use xlink:href="#users"></use>
        </svg>
      </div>
    </div>
  </section>
  
  
  
  
  
  
  <!-- 會員清單 -->
      <h1 style="font-size: 40px; text-align: center;" >會員清單</h1>

    
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
                <th>備註</th>
                 <th>會員狀態</th>
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
                  <td style="color:red;"><c:out value="${member.suspension}" /></td>
       
                  <td>
                 
                
                <div class="bn">
                    <!-- Button 修改會員資料 -->
				<!--	<a href="<c:url value='/select?id=${selects.record_id}'/>" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a> -->
				
                    <a href='/BuyBuyla_boot/manager/edit${member.id}'   class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                     <a href='/BuyBuyla_boot/manager/delete${member.id}'  onclick="return(confirm('確認刪除？'))"    class="button-1" >刪除會員</a>
                               
                 </div>
            
                  </td>                      
                </tr>
                 </c:forEach>
          

    </table>        
    
    
    





  