<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- directive cua jstl-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Product</title>
<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${base }/manager/css/Dasboard.css">
<link rel="stylesheet" href="${base }/manager/css/simplePagination.css">


</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
	<main>
		<!-- left -->
		<jsp:include page="/WEB-INF/views/manager/layout/MainLeft.jsp"></jsp:include>
		<div class="right">
			<div class="products">
				<form action="${base }/admin/product/list" method="get">
					<a class="btn btn-outline-primary mb-1"
						href="${base }/admin/product" role="button">Add New</a>
						<input type="hidden" id="page" name="page">
						<input type="text" name="keyword" value="${searchModel.keyword }"/>
						<select name = "categoryId" id="categoryId" style="text-align:center">
						<option value="" selected>--All--</option>
						<c:forEach items="${categories}" var="category">
							 <option value="${category.id}" >${category.name}</option> 
							<c:if test = "${category.id == searchModel.categoryId}">
								<option value="${category.id}" selected>${category.name}</option>
							</c:if>
							
						</c:forEach>
						</select>
					<button id ="btnSearch" name="btnSearch" type="submit" class="btn btn-primary">Search</button>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Title</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Status</th>
								<th scope="col">Avatar</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productsWithPaging.data}" var="product" varStatus="loop">
								<tr data-id = "${product.id }">
								<th scope="row">${loop.index + 1 }</th>
								<td>${product.title }</td>
								<td>
									<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${product.price }" type="currency" />
									<%-- ${product.price } --%>
								</td>
								<td>${product.categories.name }</td>
								<td>
									<span id="_product_status_${product.id }"> 
											<c:choose>
												<c:when test="${product.status }">
													<span class="badge badge-primary">Active</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-warning">InActive</span>
												</c:otherwise>
											</c:choose>
									</span>
								</td>
								<td>
									<img class="picture" alt=""
									src="${base }/upload/${product.avatar}" style="width: 70px;">
								</td>
								<%-- <td><img class="picture" alt=""
										src="${base }/upload/${product.avatar}" style="width: 70px;"></td> --%>
									<td><a class="btn btn-primary edit-product"
										href="${base }/admin/product/edit/${product.id}"
										role="button" style="font-size: 13px;"><i
											class="fas fa-edit"></i> Edit </a>
										<button type="button" style="font-size: 13px;"
											class="btn btn-danger"
											onclick="deleteProduct(${product.id});">
											<i class="fas fa-trash-alt"></i> Delete
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- Paging -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center btn btn-primary">
								<div id="paging" class=""></div>
							</div>
						</div> 
				</form>
			</div>
		</div>
	</main>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/manager/layout/footer.jsp"></jsp:include>
	
</body>
<script type="text/javascript">
	function deleteProduct(id){
		
		
		 const isConfirm = window.confirm('Bạn có chắc muốn xóa sản phẩm này?')
		if(!isConfirm) return
		let data = {
				id: id,// lay theo id
		};
		$.ajax({
			url : "/removeProduct/" +id,
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			dataType: "json", // kieu du lieu tra ve la json
			success: function(jsonResult){
				
				const selector = "tr[data-id='" + jsonResult.id + "']";
				$(selector).remove();
				alert(jsonResult.message); 
				
			},
			error: function(jqXhr, textStatus, errorMessage){
				
				}
			}); 
	}
	</script>
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
<script src="./../../../bai9_jquery/bai9_jquery/js/jquery.min.js"></script>
<script src="${base }/manager/js/Dasboard.js"></script>
<script src="${base }/manager/js/jquery.simplePagination.js"></script>
 <script type="text/javascript">
			$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalItems},
			        itemsOnPage: 5,
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	 $('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click'); 					
					},
			    });
			});
		</script>
</html>