<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: "微軟正黑體";
	background-color: rgb(203, 218, 218);
	align-items: center;
	justify-content: center;
	position: relative;
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

form {
	background-color: rgb(255, 255, 255, 0.8);
	margin: 20px auto;
	max-width: 600px;
	padding: 80px;
	/* border-radius: 20px; */
	box-shadow: 0 10px 10px 0 rgba(177, 175, 175, 0.2);
}

table {
	border: 1px solid rgba(147, 156, 165, 0.2);
	border-radius: 20px;
	border-collapse: collapse;
	margin: auto;
	width: 600px;
	height: 400px;
	text-align: center;
}

input, textarea, select {
	border: 1px solid rgb(155, 153, 153, 0.4);
	background-color: rgb(203, 218, 218, 0.2);
	font-size: 21px;
}

.leftSide {
	float: left;
}
    .wrap {
            text-align: center;
            margin-top: 50px;
        }

        .button {
            width: 140px;
            height: 45px;
            font-family: 'Roboto', sans-serif;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 2.5px;
            font-weight: 500;
            color: #000;
            background-color: #fff;
            border: none;
            border-radius: 45px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease 0s;
            cursor: pointer;
            outline: none;
        }

        .button:hover {
            background-color: #33779e;
            color: #fff;
            transform: translateY(-7px);
        }
</style>
</head>
<body>

	<div style="background: lightblue;">
	<br>
		<center>
			<Input type="text"
				style="margin-top: -10px; background-color: white; font-size: 33px; width: 780px;">
			<input type="submit" style="font-size: 28px;" value="搜尋" />
		</center>
<br>
		<hr>
	</div>

	<div class="leftSide">
		<h1 class="p">更改購物紀錄</h1>

	</div>
<br><br><br><br><br>
	<div>
		<form:form method='POST' modelAttribute="RecordBean" class='form-horizontal'>
			<input type="hidden" class="inputClass" name="proId" id="proId"
				value="" />
			<table rules="all">
				<tr>
					<td>請輸入要更改的單號:</td>
					<td>
					<form:input id="in1" type="text" path="record_id" class="inputClass"/>  
					<span id="idsp1" style="color: black;"></span> 
					<span id="idsp2" style="color: red;"></span><br /></td>
				</tr>
				<tr>
					<td>請輸入要更改的貨號:</td>
					<td><label for="proName"></label>
					 <form:input type="text" class="inputClass" path="pid" id="in2"/> 
					 <span id="idsp3" style="color: black;"></span> <span id="idsp4"
						style="color: red;"></span><br /></td>
				</tr>


				<tr>
					<td>請輸入更改後的數量:</td>
					<td>
					<form:input type="text" class="inputClass" path="pcount"  id="in3"/> 
					<span id="idsp5" style="color: black;"></span> 
					<span id="idsp6" style="color: red;"></span><br /></td>
				</tr>
			</table>
				<div class="wrap">
        <a href="<c:url value='update2' />"><input type="submit" name="update" class="button" value="確認送出" /></a>
		
    </div>
		
		</form:form>
	</div>

	


	<script>
		document.getElementById("in1").addEventListener('blur', check1);
		document.getElementById("in2").addEventListener('blur', check2);
		document.getElementById("in3").addEventListener('blur', check3);
		function check1() {
			let theIdObj = document.getElementById("in1");
			let theIdObjVal = theIdObj.value;
			let sp = document.getElementById("idsp1");
			let sp1 = document.getElementById("idsp2");
			let theIdObjValLen = theIdObjVal.length;
			let ch, flag1 = false;
			if (theIdObjVal == "") {
				flag1 = false;
				sp.innerHTML = "you must enter";
			} else {

				for (let i = 0; i < theIdObjValLen; i++) {
					ch = theIdObjVal.charAt(i);
					console.log(ch);
					if (ch >= '0' && ch <= '9') {
						flag1 = true;
						console.log(flag1);

					} else {
						flag1 = false;
						console.log(flag1);
						break;
					}
				}
			}
			if (flag1) {
				sp.innerHTML = "OK";
				sp1.innerHTML = "";

			} else {
				sp1.innerHTML = "請輸入數字";
				sp.innerHTML = "";

			}
		}
		function check2() {
			let theIdObj = document.getElementById("in2");
			let theIdObjVal = theIdObj.value;
			let sp = document.getElementById("idsp3");
			let sp1 = document.getElementById("idsp4");
			let theIdObjValLen = theIdObjVal.length;
			let ch, flag1 = false;
			if (theIdObjVal == "") {
				flag1 = false;
				sp.innerHTML = "you must enter";
			} else {

				for (let i = 0; i < theIdObjValLen; i++) {
					ch = theIdObjVal.charAt(i);
					console.log(ch);
					if (ch >= '0' && ch <= '9') {
						flag1 = true;
						console.log(flag1);

					} else {
						flag1 = false;
						console.log(flag1);
						break;
					}
				}
			}
			if (flag1) {
				sp.innerHTML = "OK";
				sp1.innerHTML = "";

			} else {
				sp1.innerHTML = "請輸入數字";
				sp.innerHTML = "";

			}
		}
		function check3() {
			let theIdObj = document.getElementById("in3");
			let theIdObjVal = theIdObj.value;
			let sp = document.getElementById("idsp5");
			let sp1 = document.getElementById("idsp6");
			let theIdObjValLen = theIdObjVal.length;
			let ch, flag1 = false;
			if (theIdObjVal == "") {
				flag1 = false;
				sp.innerHTML = "you must enter";
			} else {

				for (let i = 0; i < theIdObjValLen; i++) {
					ch = theIdObjVal.charAt(i);
					console.log(ch);
					if (ch >= '0' && ch <= '9') {
						flag1 = true;
						console.log(flag1);

					} else {
						flag1 = false;
						console.log(flag1);
						break;
					}
				}
			}
			if (flag1) {
				sp.innerHTML = "OK";
				sp1.innerHTML = "";

			} else {
				sp1.innerHTML = "請輸入數字";
				sp.innerHTML = "";

			}
		}
	</script>
</body>
</html>