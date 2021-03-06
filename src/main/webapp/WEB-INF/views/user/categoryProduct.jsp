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
        <div class="header" style="background-image: url('${base}/upload/${curentCategory.avatar }')">
          <p>${curentCategory.name }</p>
        </div >
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
                        <div class=" col-sm-6 col-lg-3">
                          <a href="./Giohang.html">
                          <div class="anh single-box">
                            <img src="${base }/user/img/banner.jfif">
                            <p>B??n ch???y</p>
                          </div>
                          </a>
                        </div>
                        <div class=" col-sm-6 col-lg-3">
                          <a href="#">
                          <div class="anh single-box">
                            <img src="${base }/user/img/brittani-carter-JGNdCxmwETY-unsplash.jpg">
                            <p>Khuy???n M??i</p>
                          </div>
                          </a>
                        </div>
                        <div class=" col-sm-6 col-lg-3">
                          <a href="${base }/listProduct/com">
                          <div class="anh single-box">
                            <img src="${base}/user/img/M1_comsuoncay.png">
                            <p>C??m</p>
                          </div>
                          </a>
                        </div>
                        <div class=" col-sm-6 col-lg-3">
                          <a href="${base }/listProduct/my">
                          <div class="anh single-box">
                            <img src="${base}/user/img/M5_mixaohaisan.png">
                            <p>Ph??? M???</p>
                          </div>
                          </a>
                      </div>
                      </div>
                      </div>
                      <div class="carousel-item">
                        <div class="row">
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/do-uong">
                            <div class="anh single-box">
                              <img src="${base }/user/img/M5TacXiMuoi.png">
                              <p>????? U???ng</p>
                            </div>
                            </a>
                          </div>
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/do-chay">
                            <div class="anh single-box">
                              <img src="${base }/user/img/M19_bannerdochay.jpeg">
                              <p>????? Chay</p>
                            </div>
                            </a>
                          </div>
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/trang-mieng">
                            <div class="anh single-box">
                              <img src="${base }/user/img/M40_kemly.jfif">
                              <p>Tr??ng Mi???ng</p>
                            </div>
                            </a>
                          </div>
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/mon-ga">
                            <div class="anh single-box">
                              <img src="${base }/user/img/M42_ganuongtieuden.jfif">
                              <p>M??n G??</p>
                            </div>
                          </a>
                        </div>
                        </div>
                      </div>
                      <div class="carousel-item">
                        <div class="row">
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/pizza">
                          <div class="anh single-box">
                            <img src="${base }/user/img/M32_pizzafomai.jfif">
                            <p>Pizza</p>
                            </div>
                            </a>
                          </div>
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/shushi">
                            <div class="anh single-box">
                              <img src="${base }/user/img/M28_shushicahoi.jpg">
                              <p>Shushi</p>
                            </div>
                            </a>
                          </div>
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/bia">
                            <div class="anh single-box">
                              <img src="${base }/user/img/BannerBeerKorean.jpg">
                              <p>Bia</p>
                            </div>
                            </a>
                          </div>
                          <div class=" col-sm-6 col-lg-3">
                            <a href="${base }/listProduct/lau">
                            <div class="anh single-box">
                              <img src="${base }/user/img/M34_LauNamTuXuyen.jfif">
                              <p>L???u</p>
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
          <hr/>
          <p class="title">C??c M??n C??m T???i C???a H??ng</p>
          <hr/>
        <div class="main_menu text-center">
          
            <div class="col-md-12">
              <div class="row">
                    <c:forEach items="${productsData.data}" var="product">
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
                      <p>????nh gi?? v??? m??n n??y</p>
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
//th??m s???n ph???m v??o gi??? h??ng
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
				alert("???? th??m m??n ??n v??o gi??? h??ng");
				let totalItems = jsonResult.totalItems;
				$("#totalCartItemId").text(totalItems);
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
</script>
</html>