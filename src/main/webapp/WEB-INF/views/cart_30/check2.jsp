<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Cart</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/productstyle.css">



  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>購物車</title>

 <script>
    let no = 1000;
    let index = 0;
    var buyerName= ["莊逸洪", '廖家慶', '葉俊偉', '謝德榮', '張晉愷'];
    var phone= ["0978856318", '0973848588', '0920447528', '0966338741', '0978456123'];
  
    var address= ["大溪區仁善街245號", '中壢區中正路四段85號', '中壢區春德路105號', '八德區豐田三路56號', '湖口鄉成功路100號'];
   
    var email= ["a2152265@gmail.com", 'aa15ss5@gmail.com', 'b21a5875@gmail.com', 'aqe45668@gmail.com', 'c123@gmail.com'];
    function quickInput(){
    	document.getElementById('buyerName').value = buyerName[index];
    	document.getElementById('phone').value = phone[index];
    
    	document.getElementById('address').value = address[index];
    	document.getElementById('email').value = email[index];
   	
    	index++;
        if (index >= buyerName.length) {
        	index = 0 ;
    	}
    	
    }
    
    </script>


</head>

<body>
 <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="<c:url value='/' />"><img src="img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="<c:url value='/' />">Home</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">會員</a>
                <ul class="dropdown-menu">
                <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
	                   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/login' />">會員登入</a></li> 
                  	   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/add' />">會員註冊</a></li>
               </c:if>
               <c:if test="${loginSession.userEmail != null}">
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/member/evolution' />">賣家專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
<!--                   <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li> -->
                </c:if>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="<c:url value='/forum' />" class="nav-link dropdown-toggle"  role="button" aria-haspopup="true"
                  aria-expanded="false">討論區</a>
<!--                 <ul class="dropdown-menu"> -->
<%--                   <li class="nav-item"><a class="nav-link" href="<c:url value='/forum' />"></a></li> --%>
<%--                   <li class="nav-item"><a class="nav-link" href="<c:url value='/forum' />">討論區</a></li> --%>
<!--                 </ul> -->
							</li>
							<li class="nav-item submenu dropdown">
                <a href="<c:url value='/campaigns' />" class="nav-link dropdown-toggle" role="button" aria-haspopup="true"
                  aria-expanded="false">活動專區</a>
<!--                 <ul class="dropdown-menu"> -->
<!--                   <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li> -->
<!--                   <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li> -->
<!--                   <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li> -->
<!--                 </ul> -->
              </li>
              <c:if test="${loginSession.userEmail != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
						${loginSession.userEmail}</a></li>
				</c:if>
            </ul>

            <ul class="nav-shop">
           <li class="nav-item" ><form:form method='POST' action="./queryproduct"
						class='form-horizontal'>
				
							<input name="productName" id="productName" type='text'
								class='form:input-large'/>
							<button type='submit' ><i class="ti-search" ></i></button>
<!-- 							<input id="btnAdd" type='submit' -->
<!-- 								class='btn btn-primary' /> -->
				
				</form:form>
              
            
              
              <!-- 購物車顯示數量在這裡改 -->
              
              <li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
<!--               <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li> -->
            </ul>
          </div>
        </div>
      </nav>
		
    </div>

  </header>
	<!--================ End Header Menu Area =================-->
		

	
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
				<tr>
					<th>圖片</th>
					<th>商品名稱</th>
				
					
					<th style='width:198px'>數量</th>
				
					
					<th>單價</th>
					<th>合計</th>
	
				</tr>
			</thead>
                      <tbody>
                      	<c:forEach var="row" items="${cart}">
                          <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                         <img width='150'src="<c:url value='/getPicture/${row.product.productId}' />" />
                                      </div>     
                                  </div>
                              </td>
                              <td>${row.product.productName}</td>
                              
                              <td>
                          
                                      ${row.count} 
                         
                              </td>
                        
                              <td>
                                  <h5>${row.product.price}</h5>
                              </td>
                              <td>
                                  <h5 class='total'>${row.count*row.product.price}</h5>
                              </td>
                        
                          </tr>
                        </c:forEach>
                        
                          <tr class="bottom_button">
                        
                              <td>
                                 
                              </td>
                                <td>
                                 
                              </td>
                              
                             
                              <td  colspan="2">
 	<select id='addAddress' style='font-size:20px'>
        <option selected>Choose...</option>
		<c:forEach var="rows" items="${BuyerAddressList}">	
			<option>${rows.city}${rows.address}</option>			
		</c:forEach>
		</select>
		
                              </td>
                            
                           
                              <td>
                                   <div class="bn" >
        <!-- Button新增地址 -->
                  
       
	        <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#staticBackdrop">
	            <a role="button">新增地址</a>
	        </button>
	
        <!-- Modal -->
        <div class="modal fade " id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="position:absolute; z-index:99999;">
            <div class="modal-dialog" >
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">新增地址:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >



							<form:form method='POST' modelAttribute="BuyerAddress" class='needs-validation'>	
                            <div class="form-row " >
                                <div class="col-md-6 mb-3 col-form-label-sm">
                                    <label for="validationCustom01">姓名:</label>
                                    <form:input id='buyerName' path='buyerName' type="text" class="form-control col-form-label-sm"  value="" placeholder="姓名" required="required"/>
                                    <div class="valid-feedback">

                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="validationCustom02">電話:</label>               
                                    <form:input type='text' class="form-control" id='phone' path='phone' value="" placeholder="電話" required="required"/>
                                    <div class="valid-feedback">

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="validationCustom02">城市:</label>
<!--                                 <select class="form-select form-select-lg mb-3" > -->
                                <form:select path='city' class="custom-select mr-sm-2" aria-label=".form-select-lg example" id="city" required="required">
                                    <option selected>Choose...</option>
                                    <form:option value="臺北市">臺北市</form:option>
                                    <form:option value="新北市">新北市</form:option>
                                    <form:option value="桃園市">桃園市</form:option>
                                    <form:option value="臺中市">臺中市</form:option>
                                    <form:option value="臺南市">臺南市</form:option>
                                    <form:option value="高雄市">高雄市</form:option>
                                    <form:option value="新竹縣">新竹縣</form:option>
                                    <form:option value="苗栗縣">苗栗縣</form:option>
                                    <form:option value="彰化縣">彰化縣</form:option>
                                    <form:option value="南投縣">南投縣</form:option>
                                    <form:option value="雲林縣">雲林縣</form:option>
                                    <form:option value="嘉義縣">嘉義縣</form:option>   
                                    <form:option value="屏東縣">屏東縣</form:option>
                                    <form:option value="宜蘭縣">宜蘭縣</form:option>
                                    <form:option value="花蓮縣">花蓮縣</form:option>
                                    <form:option value="臺東縣">臺東縣</form:option>
                                    <form:option value="澎湖縣">澎湖縣</form:option>
                                    <form:option value="金門縣">金門縣</form:option>
                                    <form:option value="連江縣">連江縣</form:option>
                                    <form:option value="基隆市">基隆市</form:option>
                                    <form:option value="新竹市">新竹市</form:option>
                                    <form:option value="嘉義市">嘉義市</form:option>
                                </form:select>
                                <div class="valid-feedback">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="validationCustom03">地址:</label>
                                <form:input path='address' type="text" class="form-control" id="address" value="" placeholder="地址" required="required"/>
                                <div class="valid-feedback">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="validationCustom03">Email</label>
                                <form:input path='email' type="text" class="form-control" id="email" value="" placeholder="Email" required="required"/>
                                <div class="valid-feedback">

                                </div>
                            </div>


                            <div class="modal-footer">

                                <button type="button" class="btn btn-outline-info" onclick='quickInput();'>一件輸入</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>

                                <button type="submit" class="btn btn-primary">送出</button>
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
                          <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                                <td>

                              </td>
                               
                              <td>
                                
                              </td>
                              <td>
                                    <h3>Subtotal:</h3>
                              </td>
                          </tr>
                              <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                                <td>

                              </td>
                               
                              <td>
                                
                              </td>
                              <td>
                                  <h2 id='totalPrice' style="font-size:60px">0</h2>
                              </td>
                          </tr>
                  <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td>
 				
                              </td>
                               <td>

                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                              
                              </td>
                          </tr>
                          <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td>
 				<a class="gray_btn" href="cart">回上一頁</a>
 				<a class="gray_btn" href="ecpay">付款</a>
                              </td>
                               <td>

                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="checkout_btn_inner d-flex align-items-center">
                                    
                                    <input type="button" value="確認送出" class="primary-btn ml-2 submit"></a>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>

<!-- 		<h2 id="h2" class=""> -->
<!-- 			總價：$<span id="totalPrice">0</span> -->
<!-- 		</h2> -->

   
		

		<input type='hidden' id='selectval' name='address' required="required"/>

		



	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>							
	
		var total = 0;
		$('.total').each(function() {
			$(this).html;
			var a = parseInt($(this).html());
			total = total + a

		})

		$('#totalPrice').html(total)
		
		
		
		
	$('#addAddress').on('change',function(){
		var addaddress = $('#addAddress option:selected').text();
// 		console.log(addaddress);
		$('#selectval').val(addaddress);
		})	


$(".submit").click(function(){	
	
	
		  let timerInterval
		  Swal.fire({
		  title: '交易處理中 ! !',
		  html: '請耐心等候 :)',
		  timer: 12000,
		  timerProgressBar: true,
		  didOpen: () => {
		    Swal.showLoading()
		    const b = Swal.getHtmlContainer().querySelector('b')
		    timerInterval = setInterval(() => {
		      b.textContent = Swal.getTimerLeft()
		    }, 100)
		  },
		  willClose: () => {
		    clearInterval(timerInterval)
		  }
		}).then((result) => {
		  /* Read more about handling dismissals below */
		  if (result.dismiss === Swal.DismissReason.timer) {
		    console.log('I was closed by the timer')
		  }
		})
		
		var data=$('#selectval').val();
		console.log(data);
		$.ajax({
			type:'get',
			url:'addaddress',
			data:{
				"address":data
			},
			
			success:function(){
				
				  setTimeout("location.href='fin'",0)
			}
									
		});		
		
		
	});
		
	 
   
   
   

	</script>

</body>



</html>