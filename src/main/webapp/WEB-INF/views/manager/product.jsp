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
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${base }/manager/css/Dasboard.css">
<link rel="stylesheet" href="${base }/manager/css/Addfood.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
	<main>
	<jsp:include page="/WEB-INF/views/manager/layout/MainLeft.jsp"></jsp:include>
		<div class="right">
			<h1>Add Food</h1>
			<h2>
				<a href="#">Dasboard</a>/Add Food
			</h2>
			<div class="content_basic">
				<p>Basic info</p>
				<hr />
				<sf:form id="product-form" name="product-form" method="post"
					action="${base }/admin/product" modelAttribute="product"
					enctype="multipart/form-data">

					<label for="category">Category</label>
					<br />
					<sf:select path="categories.id" class="form-control col-6"
						id="category">
						<sf:options items="${categories}" itemValue="id" itemLabel="name" />
					</sf:select>

					<sf:hidden path="id" />

					<br />
					<label for="title">FoodName</label>
					<br />
					<sf:input type="text" path="title" id="title"
						class="form-control col-6" />
					<br />
					<label for="price">Giá</label>
					<br />
					<sf:input type="text" path="price" id="price" name="price"
						class="form-control col-6" />
					<br />
					<label for="description">Miêu tả ngắn</label>
					<br />
					<sf:textarea id="description" path="shortDescription"
						name="description" class="form-control col-6" style="height:100px"></sf:textarea>
					<label for="description">Miêu tả</label>
					<br />
					<sf:textarea id="summernote" path="detailDescription"
						name="description" class="form-control col-12"
						style="height:300px"></sf:textarea>

					<div class="form-group">
						<label for="fileProductAvatar">Avatar</label> <input
							id="fileProductAvatar" name="productAvatar" type="file"
							class="form-control-file">
					</div>

					<div class="form-group">
						<label for="fileProductPictures">Picture(Multiple)</label> <input
							id="fileProductPictures" name="productPictures" type="file"
							class="form-control-file" multiple="multiple">
					</div>
					<label for="description">Is Hot</label>
					
					<sf:checkbox path="isHot"/>
					<br/>
					<button type="submit">Lưu</button>
				</sf:form>
				<%-- <c:if test="${not empty thongbao }">
					<div class="alert alert-success" role="alert">${thongbao }</div>
				</c:if> --%>
				<div class="text-right end">
					<p sty>
						<a href="#">Thêm Món Khác</a>
					</p>

				</div>
			</div>
		</div>
		

	</main>
	<jsp:include page="/WEB-INF/views/manager/layout/footer.jsp"></jsp:include>

</body>


	<script src="${base }/manager/js/Dasboard.js"></script>
	<script>
      $('#summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 300
      });
    </script>

</html>