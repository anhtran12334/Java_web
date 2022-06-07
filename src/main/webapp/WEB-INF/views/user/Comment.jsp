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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="${base }/user/css/danhgia.css">
<link rel="stylesheet" href="${base }/user/css/DoAn.css">
<link rel="stylesheet" href="${base }/user/css/tab.css">
<style type="text/css">
	body{
	margin: 0;
	}
	.main{
	padding: 20px;
	}
</style>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	<div class="flex">
	<!-- leftAccount -->
	<jsp:include page="/WEB-INF/views/user/layout/leftAccount.jsp"></jsp:include>
	<div class="main">
	<h1>Đánh giá món ăn của chúng tôi</h1>
	<c:forEach items="${saleOrderProduct.data}" var="product">
	<div class="saleOrder">
		<div class="saleOrder-img">
			<img src="${base }/upload/${product.saleProducts.avatar}" style="width: 200px;">
		</div>
		<div class="saleOrder-title">
			<p>${product.saleProducts.title}</p>
			<p>${product.saleProducts.price}</p>
			<p>${product.quality}</p>
		</div>
	</div>
	</c:forEach>
	<div class="star">
		<h6>Độ hài lòng</h6>
		<div id="rating" style="font-size: 20px;">
			<input type="radio" id="star5" name="rating" value="5" /> <label
				class="full" for="star5" title="Awesome - 5 stars"></label> <input
				type="radio" id="star4" name="rating" value="4" /> <label
				class="full" for="star4" title="Pretty good - 4 stars"></label> <input
				type="radio" id="star3" name="rating" value="3" /> <label
				class="full" for="star3" title="Meh - 3 stars"></label> <input
				type="radio" id="star2" name="rating" value="2" /> <label
				class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
				type="radio" id="star1" name="rating" value="1" /> <label
				class="full" for="star1" title="Sucks big time - 1 star"></label>
		</div>

	</div>
	<br />
	<br />
	<sf:form method="post" action="/saveComment" modelAttribute="comment" enctype="multipart/form-data">
		<sf:input type="hidden" path="users.id" value="${userLogined.id }"/>
		 <sf:input type="hidden" path="saleOrder.id" value="${saleOrder.id }"/> 
		<h6>Nhận Xét</h6>
		<br />
		<sf:textarea id='summernote' path="message"></sf:textarea>
		<br />

		

		<div class="form-group">
			<h6>Hình ảnh sản phẩm</h6> <input
				id="fileProductAvatar" name="productAvatar" type="file"
				class="form-control-file" size="60">
		</div>
		
		<br />
		<button type="submit" class="send">Đăng</button>
	</sf:form>
	</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
<script>
	$('#summernote')
			.summernote(
					{
						placeholder : 'Hãy chia sẻ cảm nhận của bạn để khách hàng để khách hàng khác đưa ra quyết định mua sắm',
						tabsize : 2,
						height : 200
					});
</script>
</html>