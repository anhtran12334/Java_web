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
<title>List SaleOrder</title>
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
<style>
* {
	font-size: 12px;
}
.x {
	background-color: #8195da;
	color: white;
	border-color: #8195da;
}
</style>


</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
	<main>
		<!-- left -->
		<jsp:include page="/WEB-INF/views/manager/layout/MainLeft.jsp"></jsp:include>
		<div class="right">
			<div class="products">
				<form action="${base }/admin/history/list" method="get">
					<div style="display: flex; justify-content: space-around;">
						<div>
							<label>Code Bill</label><br> <input type="text" name="code"
								class="data" value="${saleOrderModel.code }">
							<button type="button" class="x">X</button>
						</div>
						<div>
							<label>Created Date</label><br> <input type="text" name="createdDate"
								class="data" value="${saleOrderModel.createdDate }">
							<button type="button" class="x">X</button>
						</div>
						<div>
							<label>Phone Number</label><br> <input type="text" name="phoneNumber"
								class="data" value="${saleOrderModel.phoneNumber }">
							<button type="button" class="x">X</button>
						</div>
						<div>
							<label>Item</label><br> <input type="text" name="item"
								class="data" value="${saleOrderModel.item }">
							<button type="button" class="x">X</button>
						</div>
						<div>
							<label>Search</label><br> <input type="text" name="keyword"
								value="${saleOrderModel.keyword }" /> <input type="hidden"
								name="page" id="page" value="${saleOrderModel.page }">
							<button id="btnSearch" type="submit"
								style="background-color: #8195da; color: white; border-color: #8195da;">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Code</th>
								
								<th scope="col">Created Date</th>
								<th scope="col">FullName</th>
								<th scope="col">Number Phone</th>
								<th scope="col">Email</th>
								<th scope="col">Address</th>
								<th scope="col">Total Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${saleOrdersWithPaging.data}" var="saleOrder"
								varStatus="loop">
								<tr data-id="${saleOrder.id }">
									<th scope="row">${loop.index + 1 }</th>
									<td>${saleOrder.code }</td>
									
									<td>${saleOrder.createdDate }</td>
									<td>${saleOrder.customerName }</td>
									<td>${saleOrder.customerPhone }</td>
									<td>${saleOrder.customerEmail }</td>
									<td>${saleOrder.customerAddress }</td>
									<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${saleOrder.total }" type="currency" /></td>
									<td><a class="btn btn-primary edit-product"
										href="${base }/admin/saleOrderProducts/list/${saleOrder.id }"
										role="button" style="font-size: 13px;"><i
											class="fas fa-edit"></i> Detail </a>
											<a class="btn btn-info "
										href="${base }/admin/comment/${saleOrder.id }"
										role="button" style="font-size: 13px;"><i
											class="fas fa-edit"></i> Xem Đánh Giá </a>
											 <a class="btn btn-danger "
										href="#" role="button" style="font-size: 13px;" onclick="deleteSaleOrder(${saleOrder.id },${saleOrder.user.id })"><i
											class="fas fa-trash-alt"></i> </a></td>

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
<script src="${base }/manager/js/Dasboard.js"></script>
<script src="${base }/manager/js/jquery.simplePagination.js"></script>
<script>
	$('.x').on('click', function(){
		$(this).parent().find('.data').text("");
		$(this).parent().find('.data').val("");
	})
</script>
<script type="text/javascript">
	function deleteSaleOrder(id,userId){
		
		
		 const isConfirm = window.confirm('Bạn có chắc muốn xóa đơn hàng này?')
		if(!isConfirm) return
		let data = {
				id: id,// lay theo id
		};
		$.ajax({
			url : "/removeSaleOrder/" +id+"/"+userId,
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
<script type="text/javascript">
			$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${saleOrdersWithPaging.currentPage},
			        items: ${saleOrdersWithPaging.totalItems},
			        itemsOnPage: ${saleOrderModel.item },
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	 $('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click'); 					
					},
			    });
			});
		</script>
</html>