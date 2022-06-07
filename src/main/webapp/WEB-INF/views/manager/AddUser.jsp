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
				<a href="#">Dasboard</a>/AddUser
			</h2>
			<div class="content_basic">
				<p>Basic info</p>
				<hr />
				<sf:form id="product-form" name="product-form" methood="post"
					action="${base }/admin/addUser" modelAttribute="user"
					enctype="multipart/form-data">
					<lable>Vai Trò</lable>
					<select class="form-control col-6" id="role" name ="role">
						<c:forEach items="${roles}" var="role">
						<option value="${role.id}">${role.name }</option>
						</c:forEach>
					</select>

					<sf:hidden path="id" />

					<br />
					<label for="username">Full Name</label>
					<br />
					<sf:input type="text" path="fullname" id="fullname"
						class="form-control col-6" />
					<br />
					<label for="username">User Name</label>
					<br />
					<sf:input type="text" path="username" id="username"
						class="form-control col-6" />
					<br />
					<label for="email">Email</label>
					<br />
					<sf:input type="text" path="email" id="email"
						class="form-control col-6" />
					<br />
					<label for="email">Phone Number</label>
					<br />
					<sf:input type="text" path="phoneNumber" 
						class="form-control col-6" />
					<br />
					<label for="email">Address</label>
					<br />
					<sf:input type="text" path="address" 
						class="form-control col-6" />
					<br />
					<label for="username">Password</label>
					<br />
					<sf:input type="text" path="password" id="password"
						class="form-control col-6" />
					<br />
					<sf:select path="status" class="form-control col-6">
						<sf:option value="1">1</sf:option>
						<sf:option value="0">0</sf:option>
					</sf:select>
					
					
					
					
					<button type="submit">Lưu</button>
				</sf:form>
			</div>
		</div>
		

	</main>
	<jsp:include page="/WEB-INF/views/manager/layout/footer.jsp"></jsp:include>

</body>


	<script src="${base }/manager/js/Dasboard.js"></script>
	

</html>