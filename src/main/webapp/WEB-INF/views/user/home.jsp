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
<!-- jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery validation -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	integrity="sha512-37T7leoNS06R80c8Ulq7cdCDU5MNQBwlYoy1TX/WUsLFC2eYNqtKlV0QjH7r8JpG/S0GUMZwebnVFLPd6SU5yg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${base }/user/css/style.css">
<style type="text/css">
        .load{
            height: 250px;
            width: 400px;
            background: white;
            border: 5px solid rgb(245, 101, 6);
            position: fixed;
            top: 150px;
            left: 35%;
            box-shadow: 5px 10px 15px rgb(231, 105, 74);
             display: none; 
        }
        .pre{
            width: 50px; height: 50px; 
            border: 5px solid orange;
            border-bottom-color: transparent;
            /* border-left-color: transparent;  */
            border-radius: 50% ;
            margin: 85px auto;
            animation: rotate1 linear 2s infinite;
            position: relative;
        }
        /* .pre::before{
            content:'';
            position: absolute;
            top:-78px;
            left: 7px;
            right: 10px;
            bottom: 10px;
            width: 30px; height: 30px;
            border: 3px solid orange;
            border-bottom-color: transparent;
            
            border-radius: 50% ;
            margin: 85px auto;
            animation: rotate2 linear 2s infinite;
        } */
        /* .pre::after{
            content:'';
            position: absolute;
            top:-70px;
            left: 13px;
            right: 12px;
            bottom: 10px;
            width: 15px; height: 15px;
            border: 2px solid orange;
            border-bottom-color: transparent;
           
            border-radius: 50% ;
            margin: 85px auto;
            animation: rotate1 linear 2s infinite;
        } */
        @keyframes rotate1{
            0%{
                transform: rotate(0deg);
            }
            100%{
                transform: rotate(360deg);
            }
        }
        @keyframes rotate2{
            0%{
                transform: rotate(0deg);
            }
            100%{
                transform: rotate(-720deg);
            }
        }
        .load h5{
            position:absolute;
            top: 150px;
            left: 80px;
            
        }
    </style>
</head>
<body>
	<div class="message">
		<i class="fab fa-facebook-messenger"></i>
	</div>

	</div>
	<div class="title">
		<span class="tleft">
			<div>
				<i class="fas fa-map-marker-alt"></i> H?? N???i<br /> <i
					class="fas fa-clock"></i> 7:00-21:00
			</div>

		</span>
		<div>
			<img src="${base}/user/img/logo_2.png" width="100px"> <span>H??m
				Nay ??n G??</span>
		</div>
		<div class="tright">
			<div>
				<span><a href="${base }/signUp"><i
						class="fas fa-sign-out-alt"></i>????ng k??</a></span><br />
				<span><a href="${base }/login"><i
						class="fas fa-sign-in-alt"></i>????ng nh???p</a></span>
			</div>
		</div>
	</div>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${base}/user/img/davide-cantelli-jpkfc5_d-DI-unsplash.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${base}/user/img/jay-wennington-N_Y88TWmGwA-unsplash.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${base}/user/img/leo-roza-P_z_xlMGuEk-unsplash.jpg"
					class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<main>
		
		<div class="top_content">
              <span class="order"><a href="#">?????t Ngay</a></span>
              <div class="search-box">
                <form class="form-search" action="${base}/resultSearch/list" method="get">
                    <div class="box-input-wrap">
                    <input type="hidden" id="page" name="page">
                     <input type="text" name="keyword" class="box-input" placeholder="search..."> 
                     <c:if test="${isMember }">
                     <div class="search-history">
                       <h5 class="heading-history">L???ch s??? t??m ki???m...</h5>
                       <ul >
                       <c:forEach items="${resultSearchList.data }" var="keyword">
                          <li><a href="${base }/resultSearch/list/${keyword.keyword}">${keyword.keyword}</a></li>
                         </c:forEach>
                       </ul>
                     </div>
                     </c:if>
                    </div>
                   
                     <button type="submit" class="icon-search"><i class="fas fa-search"></i></button> 
                    
                </form>
              </div>
              <span class="cart"><a href="${base }/cart/view"><i class="fas fa-shopping-cart"></i></a></span>
              <span id="totalCartItemId" class="badge badge-dark" style="background-color:black;margin: 0 0 30px 5px">${totalItems }</span>
              
              
             
              
          </div>
		<div class="content">
			<div class="Td">
				<span>Th???c ????n</span>
				<p>T???t c??? c??c m??n ??n b??n ch??ng t??i t??? c??m tr???ng, c??m rang, m?? ??,
					m?? x??o. v?? ch??ng m??nh s??? c???p nh???t m??n m???i tu???n. H??y th?????ng th???c h???t
					nh??.</p>
			</div>
			<div class="menu">
				<ul>
					<c:forEach items="${categories}" var="category">
						<li><a href="${base }/listProduct/${category.seo}">${category.name }</a></li>
					</c:forEach>

				</ul>
			</div>
		</div>
		<div class="testfood">
			<div class="word">
				<span>N??n ??n Th???</span>
				<p>Nh???ng m??n ??n ???????c n??m ?????m ???? h????ng v??? v?? c?? m??i r???t
					ri??ng.Theo ch??ng m??nh ????nh gi?? c??c b???n n??n ??n th???. V?? ch??ng qu??
					ngon</p>
			</div>
			<div class="container" style="background-color: #ccc;">
				<div class="row">
					<div class="col-md-12">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="row">

										<c:forEach items="${products}" var="product">
											<c:if
												test="${product.isHot == true && product.categories.id == 39}">
												<div class="col-md-3">
													<a href='${base }/detailProduct/${product.seo}'>
														<div class="single-box">
															<div class="img-area">
																<img src="${base }/upload/${product.avatar }" alt=''>
															</div>
															<div class="img-text">
																<h2>${product.title }</h2>
																<p>${product.shortDescription }</p>
																<span>${product.price }</span>
															</div>
														</div>
													</a>
												</div>
											</c:if>
										</c:forEach>

									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<c:forEach items="${products}" var="product">
											<c:if
												test="${product.isHot == true && product.categories.id == 40}">
												<div class="col-md-3">
													<a href='${base }/detailProduct/${product.seo}'>
														<div class="single-box">
															<div class="img-area">
																<img src="${base }/upload/${product.avatar }" alt=''>
															</div>
															<div class="img-text">
																<h2>${product.title }</h2>
																<p>${product.shortDescription }</p>
																<span>${product.price }</span>
															</div>
														</div>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<c:forEach items="${products}" var="product">
											<c:if
												test="${product.isHot == true && product.categories.id == 42}">
												<div class="col-md-3">
													<a href='${base }/detailProduct/${product.seo}'>
														<div class="single-box">
															<div class="img-area">
																<img src="${base }/upload/${product.avatar }" alt=''>
															</div>
															<div class="img-text">
																<h2>${product.title }</h2>
																<p>${product.shortDescription }</p>
																<span>${product.price }</span>
															</div>
														</div>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>

							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="gt">
			<div>
				<h1>H??m Nay ??n G??</h1>
				<p>H??m nay ??n g?? l?? ?????a ??i???m g???i ?? cho b???n nh???ng m??n ??n ngon m???i
					ng??y , l?? n??i ????a b???n ?????n nh???ng c???m nh???n c???a nh???ng b???a c??m gia ????nh
					v???i c??ch chinh ph???c b???ng nh???ng m??n ??n truy???n th???ng, h??i h??a gi???a
					c??c gia v???. Nh???ng b???a c??m c???a H??m Nay ??n G?? h???t s???c phong ph?? ??a
					d???ng mang phong c??ch thu???n Vi???t c???a c??c b??a c??m gia ????nh Vi???t nam.
					H??m Nay ??n g?? hi???u ???????c nh??ng ??i???u b???n mu???n cho m???t b???a ??n.
			</div>
			</p>
		</div>
		<div class="feedback">
			<div class="vb">
				<h1>????nh Gi?? Kh??ch H??ng</h1>
				<p>C???m ??n nh???ng b???n ???? y??u qu??, tin t?????ng ch??ng m??nh</p>
			</div>
			<div class="customer" style="background-color: #ccc;">
				<div class="row">
					<div class="col-md-12">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">

									<div class="row">
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/AVA1.jfif"><span>A
													h??ng</span>

											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/Ava2.jfif"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/ava3.jfif"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
									</div>

								</div>
								<div class="carousel-item">
									<div class="row">
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/ava5.png"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/ava6.jfif"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/ava8.jfif"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/avatar.png"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/ava3.jfif"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												Tuy???t v???i !
											</div>
										</div>
										<div class="col-md-4 box">
											<div class="anh">
												<img src="${base}/user/img/avatar.png"><span>A
													h??ng</span>
											</div>
											<div class="text">
												<p>
													<i class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i><i class="fas fa-star"></i><i
														class="fas fa-star"></i>
												</p>
												M??n ngon ??i???m 10
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- <div class="alert alert-success tb" role="alert">
		 ????ng k?? th??nh c??ng!<i class="fas fa-check-circle"></i> <i
			class="far fa-times-circle delete"
			style="margin-left: 50px; color: red"></i>
	</div>
	<div class="alert alert-danger tbl" role="alert">
		 Email Kh??ng h???p l???! <i
			class="far fa-times-circle deleted"
			style="margin-left: 50px; color: red"></i>
	</div> -->
	 <div class="feedback">
	 <div class="vb">
				<h1>????ng K?? Nh???n Th??ng Tin T??? Ch??ng T??i</h1>
				<p>H??y ????? l???i ?????a ch??? email ????? nh???n nh???ng th??ng tin khuy???n m??i hot nh???t t??? ch??ng t??i</p>
			</div>
	<div align="center"
		style="background-color: #ccc; height: 150px; padding: 50px">
		<form id= "myForm" class="form-inline" style="font-size: 15px">
			<input id="email" type="text" name="emailma"
				placeholder="????ng k?? ????? nh???n th??ng tin"
				style="width: 400px; height: 50px; padding-left: 15px;" required="required"
				aria-describedby="emailHelp">
			<button id="send" onclick="saveAccount()" type="button"
				style="height: 50px" class='btn btn-primary'>????ng k??</button>
		</form>
	</div>
	</div>
	<div class="load">
        <div class="pre"></div>
        <h5>Xin vui l??ng ?????i trong gi??y l??t</h5>
    </div>
	<footer class="row col-md-12 text-center " style="margin: 0;">


		<div class="col-md-4">
			<img src="${base }/user/img/logo_2.png">
		</div>
		<div class="col-md-4 text-center">
			<h2>V??? ch??ng t??i</h2>
			<p>
				<i class="fas fa-map-marker-alt"></i> Minh Khai,B???c T??? Li??m , H?? N???i
			</p>
			<p>
				<i class="fas fa-phone"></i> +84.123.456.789
			</p>
			<p>
				<i class="far fa-envelope"></i> homnayangimammam@gmail.com
			</p>
			<p class="icon">
				<i class="fab fa-facebook"></i><i class="fab fa-instagram"></i><i
					class="fab fa-youtube"></i>
			</p>
		</div>
		<div class="col-md-4">
			<h2>?????a ch???</h2>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29786.602140076946!2d105.72967036685665!3d21.059667202201954!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454e33407ecc7%3A0x6b9d843be64f7f06!2zTWluaCBLaGFpLCBC4bqvYyBU4burIExpw6ptLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1626112257470!5m2!1svi!2s"
				style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
		</div>

	</footer>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
 <script src="${base }user/js/home.js"></script>
<%-- <script src="${base}/user/js/home.js"></script>  --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function saveAccount() {
		//javascript object
		/* var message = null; */
		 var email = $('#email').val();
		 var ktra = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (!ktra.test(email)) {
			 alert('Email Kh??ng H???p L???!'); 
			return;
		}  
		 $('.load').css('display', 'block');
		 $('.load').delay(8000).fadeOut('slow');
		/* $('.load').hide(3500);  */
		/* $('.load').css('display', 'none'); */
		let simpleLetter = {
			email : $('#email').val()
		//lay theo id

		};
		// $ ==== jQuery
		$.ajax({
			url : "/ajax-contact",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(simpleLetter),

			dataType : "json", // kieu tra ve tuw controller la json

			success : function(jsonResult) {
			  alert(jsonResult.message);
				
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback

			}
		})
	}

	$('#myForm').validate({
        rules: {
			email: {
				email: true,
			}
        },
        messages: {
            email: {
                required: "Vui l??ng nh???p email",
                email: "Vui l??ng nh???p ????ng ?????nh d???ng email"
            }
        }
	});
</script>

</html>