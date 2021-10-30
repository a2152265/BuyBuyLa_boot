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
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <title>抽獎</title>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- 這裡是css部分 -->
 <style>
 #bg{
 width: 650px;
 height: 600px;
 margin: 0 auto;
 /* background: url(turntable-bg.jpg) no-repeat; */
 position: relative;
 }
 img[src^="<c:url value='/images/rotater_04.png' />"]{
 position: absolute;
 z-index: 10;
 top: 155px;
 left: 247px;
 }
 img[src^="<c:url value='/images/rotater_05.png' />"]{
 position: absolute;
 z-index: 5;
 top: 60px;
 left: 116px;
 transition: all 4s;
 }
 
 </style>
</head>
<body>
<!-- 這裡是HTML結構部分 -->
<%-- <form:form method='POST' modelAttribute="loginSession" class='form-horizontal'> --%>
 <div id="bg">
<!--  <img id ="pointer" src="style/rotater_04.png" alt="pointer" width="100" height="100" style="margin-top: 80px;margin-left: 44px;"> -->
<%--   <p>使用者名稱: ${loginMb.getUserEmail()}</p> --%>
  
  <img id ="pointer" src="<c:url value='/images/rotater_04.png' />" alt="pointer" width="100" height="100" style="margin-top: 80px;margin-left: 44px;">
 
 ${loginSession.userEmail}

 <img src="<c:url value='/images/rotater_05.png' />" alt="turntable" width="450" height="450">
 <input type="hidden" id="couponName" name="" >
 <input type="hidden" id="couponNumber" name="" >
  <input type="hidden" id="email" value="${loginSession.userEmail}" >
 </div>
<%--   </form:form> --%>
 <!-- 這裡是js部分 -->
 <script>
//  var oPointer=document.getElementsByTagName("img")[0];
 var oTurntable=document.getElementsByTagName("img")[1];
 var cat=60;
 var num=0;
 var offOn=true;
 document.title="";
 



//  oPointer.onclick=function(){
//  if(offOn){
//  oTurntable.style.transform="rotate(0deg)";
//  ratating();
//  offOn=!offOn;

//  }
//  else{
//     alert("今日以兌換完畢");
//  }
//  }
 

 $(function(){
      $("#pointer").click(function() {
//     	  location.href="<c:url value='/try/login' />";
//          if(offOn){
//          oTurntable.style.transform="rotate(0deg)";
//          ratating();
//          offOn=!offOn;

//          }
//          else{
//             alert("今日以兌換完畢");
//          }
    //   data:{couponNumber:$('#couponNumber'),couponName:$('#couponName')},
        $.ajax({
          type: "GET",
          url: "<c:url value='/campaigns/login' />",
       	  data:{},
       	  
       	  success:function(data,textStatus,xhr){  	  
        	console.log(xhr.status);
         if(xhr.status==200){
        	 if(offOn){
              oTurntable.style.transform="rotate(0deg)";
              ratating();
              offOn=!offOn;
              }
              else{
                 alert("今日以兌換完畢");
              }
       		  }
  		   },
          error: function(xhr,status) {
        	 location.href="<c:url value='/try/login' />";
            }     
          });
        });
//       $.ajax({
//           type: "GET",
//           url: "<c:url value='/campaigns/insertdiscount' />",
//        	  data:{'couponNumber':$('#couponNumber').val(),'couponName':$('#couponName').val()},
       	  
//        	  success:function(data,textStatus,xhr){  	  
//         	console.log(xhr.status);
//          if(xhr.status==200){
//         	 if(offOn){
//               oTurntable.style.transform="rotate(0deg)";
//               ratating();
//               offOn=!offOn;
//               console.log($('#couponNumber').val());
//               console.log($('#couponName').val());
//               }
//               else{
//                  alert("今日以兌換完畢");
//               }
//        		  }
//   		   },
//           error: function(xhr,status) {
//         	// location.href="<c:url value='/try/login' />";
//             }     
//           });
      
      });
 


 function ratating(){
 var timer=null;
 var rdm=0;
 clearInterval(timer);
 timer=setInterval(function(){
 if(Math.floor(rdm/360)<3){
  rdm=Math.floor(Math.random()*4600); 
 }else{
    clearInterval(timer);
    oTurntable.style.transform="rotate("+rdm+"deg)";
  setTimeout(function(){
 
  num=rdm%360;
  if(num<=cat*1){ 
     var str =document.getElementById("couponName").value = "10元BuyBuy幣";
     console.log(str);
     str1= myrandomstring();
     console.log(str1);
     var str2 =$('#email').val();

     
  $.ajax({
  type: "GET",
  url: "<c:url value='/campaigns/insertCoupon' />",
  data:{'couponNumber':str1,'couponName':'10元buybuy幣','userEmail':str2},
  success:function(data,textStatus,xhr){  	  
  console.log(xhr.status);
  if(xhr.status==200){
	alert("10元");
		  }
	   },
  error: function(xhr,status) {
	// location.href="<c:url value='/try/login' />";
    }     
  });
  
}else if(num<=cat*2){
   
   var str =document.getElementById("couponName").value = "8000元BuyBuy幣";
   console.log(str);
   str1= myrandomstring();
   console.log(str1);
   var str2 =$('#email').val();
   $.ajax({
	   type: "GET",
	   url: "<c:url value='/campaigns/insertCoupon' />",
	   data:{'couponNumber':str1,'couponName':'8000元buybuy幣','userEmail':str2},
	   success:function(data,textStatus,xhr){  	  
	   console.log(xhr.status);
	   if(xhr.status==200){
	 	alert("8000元");
	 		  }
	 	   },
	   error: function(xhr,status) {
	 	// location.href="<c:url value='/try/login' />";
	     }     
	   });
   
  
}else if(num<=cat*3){
   var str =document.getElementById("couponName").value = "銘謝惠顧";
   console.log(str);
   str1= '';
   console.log(str1);
   
   alert("銘謝惠顧");
  
}else if(num<=cat*4){
  var str =document.getElementById("couponName").value = "600元折價券";
  console.log(str);
  str1= myrandomstring();
  console.log(str1);
  var str2 =$('#email').val();
  $.ajax({
	  type: "GET",
	  url: "<c:url value='/campaigns/insertCoupon' />",
	  data:{'couponNumber':str1,'couponName':'600元折價券','userEmail':str2},
	  success:function(data,textStatus,xhr){  	  
	  console.log(xhr.status);
	  if(xhr.status==200){
		alert("600元折價券");
			  }
		   },
	  error: function(xhr,status) {
		// location.href="<c:url value='/try/login' />";
	    }     
	  });
  
  }else if(num<=cat*5){
  
   var str =document.getElementById("couponName").value = "1元BuyBuy幣";
   console.log(str);
   str1= myrandomstring();
   console.log(str1);
   var str2 =$('#email').val();
   $.ajax({
		  type: "GET",
		  url: "<c:url value='/campaigns/insertCoupon' />",
		  data:{'couponNumber':str1,'couponName':'1元BuyBuy幣','userEmail':str2},
		  success:function(data,textStatus,xhr){  	  
		  console.log(xhr.status);
		  if(xhr.status==200){
			alert("1元BuyBuy幣");
				  }
			   },
		  error: function(xhr,status) {
			// location.href="<c:url value='/try/login' />";
		    }     
		  });
  
  
}else if(num<=cat*6){
  
   var str =document.getElementById("couponName").value = "5元BuyBuy幣";
   console.log(str);
   str1= myrandomstring();
   console.log(str1);
   var str2 =$('#email').val();
   $.ajax({
		  type: "GET",
		  url: "<c:url value='/campaigns/insertCoupon' />",
		  data:{'couponNumber':str1,'couponName':'5元BuyBuy幣','userEmail':str2},
		  success:function(data,textStatus,xhr){  	  
		  console.log(xhr.status);
		  if(xhr.status==200){
			alert("5元BuyBuy幣");
				  }
			   },
		  error: function(xhr,status) {
			// location.href="<c:url value='/try/login' />";
		    }     
		  });
 
  }

  },4000);
 } 
 },30); 
 
 }

 function randomusefloor(min,max) {
	return Math.floor(Math.random()*(max-min+1)+min);
}
// 亂數英文字
function makerandomletter(max) {
  var text = "";
  var possible = "abcdefghijklmnopqrstuvwxyz";

  for (var i = 0; i < max; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));
  return text;
}

// 前兩碼英文小寫,後6碼數字
function myrandomstring() {
   
   var str =document.getElementById("couponNumber").value = makerandomletter(2)+randomusefloor(1,999999);
   return str;
}
 </script>
</body>
</html>