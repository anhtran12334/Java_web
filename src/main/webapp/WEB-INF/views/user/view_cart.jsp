<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- directive cua jstl-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- variables -->
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${base}/user/css/fix_Cart.css">
</head>
<body>
     <!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
    <div class="box">
    <div class="alert alert-success tb" role="alert">
        Đặt hàng thành công!  <i class="fas fa-check-circle"></i>
             <i class="far fa-times-circle delete" style="margin-left: 50px; color: red" ></i>
      </div>
    <main>
        <div class="header">
        <img src="${base}/user/img/logo_2.png" style="border-radius:100%;">
        </div>
        <div class="order">
            <h1 class="head">Your order from Our Shop</h1>
            <ul class="order-items">
            <c:forEach items="${cart.cartItems }" var="cartItem">
            	<li class="order-item">
                    <div>
                        <img src="${base }/upload/${cartItem.productAvatar}">
                        <p class="item-name">${cartItem.productName }</p>
                    </div>
                    
                    <span class="quanlity">
                        <button id="minus" onclick="MinusItem('${base}',${cartItem.productId })">-</button>
                        <input id="sl" type="number" value="${cartItem.quanlity }" style="width: 40px;
                        height : 40px;" min = "1">
                        <button id="plus" onclick="PlusItem('${base}',${cartItem.productId })">+</button>
                    </span>

                    <span class="price">
                        <span  class="gia"> 
	                          <fmt:setLocale value="vi_VN" scope="session" />
							<fmt:formatNumber value="${cartItem.priceUnit }" type="currency" />  
							  
						</span>
                    </span>
                    <span class="price">
                        <span  class="subtotal"> 
                        <fmt:setLocale value="vi_VN" scope="session" />
							<fmt:formatNumber value="${cartItem.total }" type="currency" />
						</span>
                        
                    </span>
                    <span class="price">
                    <button id="remove" onclick="DeleteItem('${base}',${cartItem.productId })">X</button>
                    </span>
                    
                </li>
            </c:forEach>
               
            </ul>
            <!-- <button id="add">Add Food</button> -->
			
            <div class="order-summary">
                <p>Subtotal <span id="" class="tong money">
                <fmt:setLocale value="vi_VN" scope="session" />
				<fmt:formatNumber value="${cart.totalPrice }" type="currency" />
                
                </span></p>
                <p>Shipping <span class="money" id="shipping"> 20.000 đ</span></p>
                <p>Total <span class="checkout money" >
                <fmt:setLocale value="vi_VN" scope="session" />
				<fmt:formatNumber value="${cart.totalPrice +20000}" type="currency" /> 
				</span></p>
                
            </div>
            
           <!--  <button id="checkout">Check out</button> -->
        </div>
       
    </main>
    <div class='right'>
        <form method ="post" action="${base }/cart/finish">
        <c:choose>
        	<c:when test="${isMember }">
        	
        	<lable>Full name</lable>
        <br/>
        <input type="text" name="fullName" value="${userLogined.username}">
        <br/>
        <lable>Address</lable>
        <br/>
        <input type="text" name ="address" value="${userLogined.address }">
        <br/>
        <lable>Phone Number</lable>
        <br/>
        <input type="number" name="phoneNumber" value="${userLogined.phoneNumber }">
        <br/>
        <lable>Email Address</lable>
        <br/>
        
        <input type="email" name="email" value="${userLogined.email }">
        <br/>
        <br/>
         <button type="submit" id="checkout" >Check out</button>
        	</c:when>
        
        <c:otherwise>
        
        <lable>Full name</lable>
        <br/>
        <input type="text" name="fullName" required="required">
        <br/>
        <lable>Address</lable>
        <br/>
        <input type="text" name ="address" required="required">
        <br/>
        <lable>Phone Number</lable>
        <br/>
        <input type="number" name="phoneNumber" required="required">
        <br/>
        <lable>Email Address</lable>
        <br/>
        <input type="email" name="email" aria-describedby="emailHelp" required="required">
        <br/>
        <br/>
         <button type="submit" id="checkout"  >Check out</button>
         </c:otherwise>
         </c:choose>
    </form>
    </div>
    </div>
    <footer class="row col-md-12 text-center " style="max-width: 1500px; margin: auto;">
        
        <div class="col-md-4">
            <img src="../img/logo_2.png">
            </div>
            <div class="col-md-4 text-center">
            <h2 >Về chúng tôi</h2>
            <p>
            <i class="fas fa-map-marker-alt"></i> Minh Khai,Bắc Từ Liêm , Hà Nội
            </p>
            <p>
            <i class="fas fa-phone"></i> +84.123.456.789
            </p>
            <p>
            <i class="far fa-envelope"></i> homnayangimammam@gmail.com
            </p>
            <p class="icon">
            <i class="fab fa-facebook"></i><i class="fab fa-instagram"></i><i class="fab fa-youtube"></i>
            </p>
          </div>
          <div class="col-md-4">
            <h2>Địa chỉ</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29786.602140076946!2d105.72967036685665!3d21.059667202201954!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454e33407ecc7%3A0x6b9d843be64f7f06!2zTWluaCBLaGFpLCBC4bqvYyBU4burIExpw6ptLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1626112257470!5m2!1svi!2s"  style="border:0;" allowfullscreen="" loading="lazy"></iframe>
          </div>
          
        </footer>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script src="${base}/user/js/fix_Cart.js"></script>
<script type="text/javascript">
  $('#checkout').on('click', function(e){
    e.preventDefault();
    
      //$('.tb').css('display', 'block');
    $('.tb').show("fast");
    $('.tb').hide(5000);
    $('form').submit();
    
    
    
})
/* $('.delete').on('click', function(){
    $('.tb').hide(2000);
	
    $('form').submit();
})   */

/* $('#checkout').on('click', function(){ */
	
</script>
<script>
	var gia = $('.gia').text();
	console.log("gia" + gia);
	var total = $('.subtotal').text();
	console.log('tong Item '+ total);
</script>
<script type="text/javascript">
//thêm sản phẩm vào giỏ hàng
	function PlusItem(baseUrl, productId){
		
		//javascript object
		let data = {
				productId: productId,
				/* quanlity: quanlity, *///lay theo id
				//
				
		};
		// $ ==== jQuery
		$.ajax({
			url :baseUrl+ "/ajax/plusItem",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			dataType : "json", // kieu tra ve tuw controller la json
			success : function(jsonResult){
				console.log(jsonResult);
				/* alert("them thanh cong"); */
				let totalItems = jsonResult.totalItems;
				$("#totalCartItemId").text(totalItems);
				var total = jsonResult.totalPrice;
				var checkout = total + 20000;
				checkout = checkout.toString();
				total = total.toString();
				$(".tong").text(Number.parseInt(total.slice(0,total.length-3)).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString() + " đ");
				$(".checkout").text(Number.parseInt(checkout.slice(0,checkout.length-3)).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString() + " đ");
				
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
	
</script>
<script type="text/javascript">
//thêm sản phẩm vào giỏ hàng
	function MinusItem(baseUrl, productId){
		
		//javascript object
		let data = {
				productId: productId,
				/* quanlity: quanlity, *///lay theo id
				//
				
		};
		// $ ==== jQuery
		$.ajax({
			url :baseUrl+ "/ajax/minusItem",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			dataType : "json", // kieu tra ve tuw controller la json
			success : function(jsonResult){
				console.log(jsonResult);
				/* alert("bot thanh cong"); */
				let totalItems = jsonResult.totalItems;
				$("#totalCartItemId").text(totalItems);
				var total = jsonResult.totalPrice;
				total = total.toString();
				$(".tong").text(Number.parseInt(total.slice(0,total.length-3)).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString() + " đ");
				
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
</script>
<script type="text/javascript">
//thêm sản phẩm vào giỏ hàng
	function DeleteItem(baseUrl, productId){
		
		//javascript object
		let data = {
				productId: productId,
				/* quanlity: quanlity, *///lay theo id
				//
				
		};
		// $ ==== jQuery
		$.ajax({
			url :baseUrl+ "/ajax/deleteItem",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			dataType : "json", // kieu tra ve tuw controller la json
			success : function(jsonResult){
				console.log(jsonResult);
				alert("xoa thanh cong");
				let totalItems = jsonResult.totalItems;
				$("#totalCartItemId").text(totalItems);
				var total = jsonResult.totalPrice;
				total = total.toString();
				$(".tong").text(Number.parseInt(total.slice(0,total.length-3)).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString() + " đ");
				
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
	
</script>
</html>