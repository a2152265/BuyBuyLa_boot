<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/manager/header.jspf"%>
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
      <h1 style="font-size: 40px; text-align: center;" >會員資料修改</h1>


  <script type="text/javascript">
//   form


    //刪除&更新
    function confirmDelete(id){
        var result = confirm("確定刪除此筆記錄(帳號:" + id.trim() + ")?");
        if (result) {
            document.forms[0].putOrDelete.name = "_method";
            document.forms[0].putOrDelete.value = "DELETE";
            document.forms[0].action = "<c:url value='/manager/edit" + id + "' />";
            return true;
        }
        return false;
    }
    function confirmUpdate(id){
        document.forms[0].putOrDelete.name = "_method";
        document.forms[0].putOrDelete.value = "PUT";
        document.forms[0].action = "<c:url value='/manager/edit" + id + "' />";
        return true;
    }
  </script>
  
  <style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
  
  
  
   <div class="container">
   <!-- 修改表單資料 -->
        <form:form method='POST' modelAttribute="memberDataDefault" >
        <input type="hidden" name="_method"  id='putOrDelete'   value="DELETE" >
        <c:if test='${memberDataDefault.id != null}'>
               <form:hidden path="id" /><br>&nbsp;
			</c:if>
			
    <div class="row">
      <div class="col-25">
        <label for="fname">姓名</label>
      </div>
      <div class="col-75">
        <form:input path="userName" id="fname" name="firstname" placeholder="請輸入姓名"/>
        <form:errors path="userName" cssClass="error" style="color: red;"/>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">暱稱</label>
      </div>
      <div class="col-75">
        <form:input path="userNickname" id="lname" name="lastname" placeholder="暱稱"/>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">電話</label>
      </div>
      <div class="col-75">
        <form:input path="userPhone" id="lname" name="lastname" placeholder="電話"/>
        <form:errors path="userPhone" cssClass="error" style="color: red;"/>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">密碼</label>
      </div>
      <div class="col-75">
        <form:input path="userPwd" id="lname" name="lastname" placeholder="密碼"/>
        <form:errors path="userPwd" cssClass="error" style="color: red;" />
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">地址</label>
      </div>
      <div class="col-75">
        <form:input path="address" id="lname" name="lastname" placeholder="地址"/>
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="country">性別</label>
      </div>
      <div class="col-75">
        <form:select id="country" name="country"/>
          <form:options path="userGender" value="男性">Australia</form:options>
          <form:options path="userGender"  value="女性">Canada</form:options>
          <form:options path="userGender" value="其他">USA</form:options>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="subject">備註</label>
      </div>
      <div class="col-75">
        <form:textarea path="notes" id="subject" name="subject" placeholder="Write something.." style="height:200px"/>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="修改">
    </div>
  </form:form>
</div>
    
    
	

  