<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form:form method='POST' modelAttribute="updateForumBean" class='form-horizontal' enctype="multipart/form-data"> 
						<div class="contentBody">
						<h1>編輯貼文</h1>
						<form:input path="userName" type="text" value="asd123" style="display:none" />
						<div class="mb-3">
							<label>分類標籤</label> <select id="select">
								<option>忙裡偷閒聊</option>
								<option>開箱文</option>
								<option>其他</option>
							</select><br>
							<br>
							<form:input type="text" path="date" id="dt" style="display:none" />
							<form:input path="tag" type="text" id="select2" style="display:none" />
							<img id="fileshow" src="<c:url value='/getPicture32/${updid}' />" style=" width: 200px; height: 200px;"><br><br>
							<div class="mb-3">
								<form:input class="form-control" path="image" id="filebtn" type="file"/>
							</div>
							<form:textarea path="content" class="form-control" placeholder="${fb.content}" rows="7" id="recipient-name" />
						</div>
						</div>
						<button id="submit" type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">取消</button>
			</form:form>
			
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$("#filebtn").change(function() {
				var readFile = new FileReader();
				var mfile = $("#filebtn")[0].files[0]; 
				readFile.readAsDataURL(mfile);
				readFile.onload = function() {
					var img = $("#fileshow");
					img.attr("src", this.result);
				}
			})
			 })
		     $('.contentBody').on('mouseover',function(){
		        $('#select2').val($('#select option:selected').text())
		     })
			 var date = new Date();
		     const formatDate = (date)=>{
		     let formatted_date = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()
		     return formatted_date;
		     }
		     $('#dt').val(formatDate(date))
		     
    </script>
	
</body>
</html>