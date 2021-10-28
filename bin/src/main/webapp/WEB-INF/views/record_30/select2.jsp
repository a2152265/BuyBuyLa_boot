<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%-- <%@page import="user.Select2bean"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物紀錄</title>
<style>
        body {
            font-family: "微軟正黑體";
            background-color: rgb(203, 218, 218);
            align-items: center;
            justify-content: center;
            position: relative;
        }

        table {
            border: 1px solid rgba(147, 156, 165, 0.2);
            border-radius: 20px;
            border-collapse: collapse;
            margin: auto;
            width: 820px;
            height: 400px;
            text-align: center;
         
        }
       
        header {
            text-align: center;
        }

        input,
        textarea,
        select {
            border: 1px solid rgb(155, 153, 153, 0.4);
            background-color: rgb(203, 218, 218, 0.2);
        }

        form {
            background-color: rgb(255, 255, 255, 0.8);
            margin: 20px auto;
            max-width: 820px;
            padding: 80px;
            /* border-radius: 20px; */
            box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
        }

        .form-group__file {
            display: flex;
            flex-direction: column;
            position: relative;
            width: 100%;
            min-width: 130px;
            height: 180px;
        }

        .file-label {
            margin: 10px 0;
        }

        .file-input {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 130px;
            height: 180px;
            cursor: pointer;
            z-index: 100;
        }

        .file-preview-background {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 130px;
            height: 140px;
            background-color: #f7f7f7;
            border: 2px dashed #dfdfdf;
            border-radius: 10px;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 3px;
            text-align: center;
            color: #bbb;
            display: flex;
            justify-content: center;
            align-items: center;
            /* z-index: 1; */
        }

        .file-preview {
            width: 120px;
            height: 120px;
            position: absolute;
            top: 46px;
            left: 8px;
            border-radius: 65px;
            z-index: 10;
            object-fit: cover;
            opacity: 0;
            transition: opacity 0.4s ease-in;
        }

        h1 {
            background-color: #f7f7f7;
            /* 告訴電腦背景顏色 */
            padding: 18px 0 16px 22px;
            /* 告訴電腦內距要多大 */
            border-left: 8px solid #33779e;
            /* 告訴電腦左邊框要多寬、跟顏色 */
            color: #333 !important;
            /* 告訴電腦文字顏色 */
            width: 300px;
        }

.wrap {
	margin-top: -145px;
	margin-left: -30px;
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 40px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}
    


</style>
</head>
<body>
<%-- 	<jsp:useBean id="select2" class="user.Select2bean" scope="session" /> --%>

<h1>您的購買紀錄&nbsp;:</h1>
	<form>



			<%
			int i = 0;
			%>
			<table>
					<thead>
					<td style="font-size: 30px;">編號</td>
						<td style="font-size:30px">商品編號</td>
						<td style="font-size:30px">商品名稱</td>
						<td style="font-size:30px">單價</td>
						<td style="font-size:30px">交易時間</td>
						<td style="font-size:30px">數量</td>
					
					</thead>
					
				<c:forEach var="selects" items="${select}">
<% i += 1;	%>
					<tr>  
						<td style="font-size:30px;">${selects.record_id}</td>
						<td style="font-size:30px">${selects.pid}</td>
						<td style="font-size:30px">${selects.p_name}</td>
						<td style="font-size:30px">${selects.p_price}</td>
						<td style="font-size:30px">${selects.buy_time}</td>
						<td style="font-size:30px">${selects.pcount}</td>
					</tr>
				</c:forEach>

			</table>
			<br>
			<br>
			
		
			<h2 style="text-align: right;">
				共
				<%
				out.println(i);
				%>筆資料
			</h2>
			
			<br>
			<br>	
			<br>
		

		<div class="wrap">
		
			<a href="<c:url value='user' />" class="button" name="return" id="return">返回</a>		
		</div>
	</form>
</body>
</html>