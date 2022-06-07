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
<!-- css -->
<jsp:include page="/WEB-INF/views/user/layout/css_chung.jsp"></jsp:include>
</head>
<body>
    <!-- menu -->
<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
    <main>
        
        <div class="main_menu text-center">
          <h2>Kết quả tìm kiếm....</h2>
            <div class="col-md-12">
              <div class="row">
                    <c:forEach items="${resultsWithPaging.data}" var="product">
                    <div class="col-md-3 food">
                    <a href="${base }/detailProduct/${product.seo}">
                    <div class="single-box">
                      <div class="img-area">
                          <img src="${base }/upload/${product.avatar }" alt=''>
                      </div>
                      <div class="img-text">
                          <h2>${product.title }</h2>
                          <p>${product.shortDescription }</p>
                          <span>
                          	<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${product.price }" type="currency" />
                          </span>
                      </div>
                    </div>
                    </a>
                    <div class="dropdown text-center">
                      <p>Đánh giá về món này</p>
                      <div class="icondrop">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-heart"></i>
                        <button onclick="AddToCart('${base }',${product.id},1)"><i class="fas fa-shopping-cart"></i></button>
                      </div>
                    </div>
                    </div>
                    </c:forEach>
                  
                
             
                  </div>
                </div>
                
          </div>
        
    </main>
    <hr/>
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
<!-- js -->
<jsp:include page="/WEB-INF/views/user/layout/js_chung.jsp"></jsp:include>
<script type="text/javascript">
//thêm sản phẩm vào giỏ hàng
	function AddToCart(baseUrl, productId,quanlity){
		
		//javascript object
		let data = {
				productId: productId,
				quanlity: quanlity//lay theo id
				//
				
		};
		// $ ==== jQuery
		$.ajax({
			url :baseUrl+ "/ajax/addToCart",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			
			dataType : "json", // kieu tra ve tuw controller la json
			success : function(jsonResult){
				console.log(jsonResult);
				alert("Đã thêm món ăn vào giỏ hàng");
				let totalItems = jsonResult.totalItems;
				$("#totalCartItemId").text(totalItems);
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
</script>
</html>