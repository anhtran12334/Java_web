<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div >
				<form action="${base }/admin/category/list" method="get">
					<a class="btn btn-outline-primary mb-1"
						href="${base }/admin/addCategory" role="button">Add New</a> <input
						type="hidden" id="page" name="page"> <input type="text"
						name="keyword" value="${searchModel.keyword }" /> 
					<button id="btnSearch" name="btnSearch" type="submit"
						class="btn btn-primary">Search</button>

					<c:forEach items="${categoriesWithPaging.data}" var="category">
						<div class='content_area' data-id="${category.id }">
							<div class="image">
								<img src="${base }/upload/${category.avatar}" width="250px"
									height="250px">
							</div>
							<div class="text-area">
								<h2>${category.name }</h2>
								<p>${category.description }</p>
								<p>
									<i class="fas fa-list"></i><span>Created Date : </span> 
									<span><i class="far fa-clock"></i>${category.createdDate}</span> 
									<i class="fas fa-list"></i><span>UpDated Date : </span> 
									<span><i class="far fa-clock"></i>${category.updatedDate}</span> 
									<i class="fas fa-list"></i><span>Status : </span> 
									<span id="_product_status_${category.id }"> <c:choose>
											<c:when test="${category.status }">
												<span class="badge badge-primary">Active</span>
											</c:when>
											<c:otherwise>
												<span class="badge badge-warning">InActive</span>
											</c:otherwise>
										</c:choose>
									</span>
								</p>
								
								<hr />
								
								<!-- <div class="button-order">  -->
							
									<a class="btn btn-primary edit-product order-edit "
										href="${base }/admin/category/edit/${category.id}" role="button"
										style="font-size: 13px;"><i class="fas fa-edit"></i> Edit
									</a>
									<button type="button" style="font-size: 13px;"
										class="btn btn-danger order-cancel" onclick="deleteCategory(${category.id});">
										<i class="fas fa-trash-alt"></i> Delete
									</button>
									
								<!--  </div> -->
							</div>
						</div>
					</c:forEach>
					
					
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
</body>
<script type="text/javascript">
	function deleteCategory(id){
		
		/* var arr = $(this).closest('tr'); */
		/* console.log(this);
		console.log(id); */
		
		/* console.log(id)
		console.log(123); */
		
		 const isConfirm = window.confirm('Bạn có chắc muốn xóa sản phẩm này?')
		if(!isConfirm) return
		let data = {
				id: id,// lay theo id
		};
		$.ajax({
			url : "/removeCategory/" +id,
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
			dataType: "json", // kieu du lieu tra ve la json
			success: function(jsonResult){
				
				const selector = "div[data-id='" + jsonResult.id + "']";
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
					currentPage: ${categoriesWithPaging.currentPage},
			        items: ${categoriesWithPaging.totalItems},
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