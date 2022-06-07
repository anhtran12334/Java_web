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
    <link rel="stylesheet" href="${base }/user/css/Detail.css">
</head>
<body>
    <!-- menu -->
<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
    <main>
      <div class="product">
      <h1>${product.title }</h1>
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-5">
            <div class="img-area">
            <img src="${base }/upload/${product.avatar }">
            </div>
          </div>
          <div class="col-md-7">          
              <div class="img-text">
                  <h2>${product.title }</h2>
                  <p>${product.detailDescription }</p>
                  <span> 
                  Giá: <fmt:setLocale value="vi_VN" scope="session" />
					<fmt:formatNumber value="${product.price }" type="currency" />
                  </span>
                  <div>
                    <button type="button" onclick = "AddToCart('${base}', ${product.id },1)">Thêm Vào Giỏ Hàng</button>
                    <button type="button" onclick = "AddToCart('${base}', ${product.id },1)"><a href="${base }/cart/view">Mua Hàng</a></button>
                  </div>
              </div>
          </div>
          </div>
        </div>
      </div>
      <hr/>
      <div class="menus">
          <h1>Sản Phẩm Tương Tự</h1>
          <div class="menu text-center "> 
            <div class="row">
              <div class="col-md-12">
                  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                      <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                      </div>
                      <div class="carousel-inner">
                        <div class="carousel-item active">
                          <div class="row">
                          <div class="col-md-3">
                            <a href="${base }/listProduct/com">
                            <div class="anh single-box">
                              <img src="${base}/user/img/banner.jfif">
                              <p>Bán chạy</p>
                            </div>
                            </a>
                          </div>
                          <div class="col-md-3">
                            <a href="${base }/listProduct/com">
                            <div class="anh single-box">
                              <img src="${base}/user/img/brittani-carter-JGNdCxmwETY-unsplash.jpg">
                              <p>Khuyến Mãi</p>
                            </div>
                            </a>
                          </div>
                          <div class="col-md-3">
                            <a href="${base }/listProduct/com">
                            <div class="anh single-box">
                              <img src="${base}/user/img/M1_comsuoncay.png">
                              <p>Cơm</p>
                            </div>
                            </a>
                          </div>
                          <div class="col-md-3">
                            <a href="${base }/listProduct/my">
                            <div class="anh single-box">
                              <img src="${base}/user/img/M5_mixaohaisan.png">
                              <p>Phở Mỳ</p>
                            </div>
                            </a>
                        </div>
                        </div>
                        </div>
                        <div class="carousel-item">
                          <div class="row">
                            <div class="col-md-3">
                              <a href="${base }/listProduct/do-uong">
                              <div class="anh single-box">
                                <img src="${base}/user/img/M5TacXiMuoi.png">
                                <p>Đồ Uống</p>
                              </div>
                              </a>
                            </div>
                            <div class="col-md-3">
                              <a href="${base }/listProduct/do-chay">
                              <div class="anh single-box">
                                <img src="${base}/user/img/M19_bannerdochay.jpeg">
                                <p>Đồ Chay</p>
                              </div>
                              </a>
                            </div>
                            <div class="col-md-3">
                              <a href="${base }/listProduct/trang-mieng">
                              <div class="anh single-box">
                                <img src="${base}/user/img/M40_kemly.jfif">
                                <p>Tráng Miệng</p>
                              </div>
                              </a>
                            </div>
                            <div class="col-md-3">
                              <a href="${base }/listProduct/mon-ga">
                              <div class="anh single-box">
                                <img src="${base}/user/img/M42_ganuongtieuden.jfif">
                                <p>Món Gà</p>
                              </div>
                            </a>
                          </div>
                          </div>
                        </div>
                        <div class="carousel-item">
                          <div class="row">
                            <div class="col-md-3">
                              <a href="${base }/listProduct/pizza">
                            <div class="anh single-box">
                              <img src="${base}/user/img/M32_pizzafomai.jfif">
                              <p>Pizza</p>
                              </div>
                              </a>
                            </div>
                            <div class="col-md-3">
                              <a href="${base }/listProduct/shushi">
                              <div class="anh single-box">
                                <img src="${base}/user/img/M28_shushicahoi.jpg">
                                <p>Shushi</p>
                              </div>
                              </a>
                            </div>
                            <div class="col-md-3">
                              <a href="#">
                              <div class="anh single-box">
                                <img src="${base}/user/img/BannerBeerKorean.jpg">
                                <p>Bia</p>
                              </div>
                              </a>
                            </div>
                            <div class="col-md-3">
                              <a href="${base }/listProduct/lau">
                              <div class="anh single-box">
                                <img src="${base}/user/img/M34_LauNamTuXuyen.jfif">
                                <p>Lẩu</p>
                              </div>
                              </a>
                          </div>
                          </div>
                        </div>
                      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span aria-hidden="true" style="font-size:30px; color:black; margin-left: -200px; "><i class="fas fa-chevron-left"></i></span>
                        <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span  aria-hidden="true" style="font-size:30px; color:black; margin-right: -200px; "><i class="fas fa-chevron-right"></i></span>
                        <span class="visually-hidden">Next</span>
                      </button>
                    </div>
                    </div>
                </div>
            </div>
            </div>
     </div>
      
    </main>
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
				/* alert("Đã thêm món ăn vào giỏ hàng"); */
				let totalItems = jsonResult.totalItems;
				$("#totalCartItemId").text(totalItems);
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
</script>
</html>