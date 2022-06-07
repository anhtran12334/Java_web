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
	

<link rel="stylesheet" href="${base }/manager/css/simplePagination.css">
<style>
		*{
			font-size: 18px;
		}
		.dark-theme .current {
    background: #ff5c0a;
    color: #FFF;
    border-color: #000;
    box-shadow: 0 1px 0 rgb(255 255 255 / 20%), 0 0 1px 1px rgb(0 0 0 / 10%) inset;
    cursor: default;
}
</style>
	<!-- css -->
<jsp:include page="/WEB-INF/views/user/layout/css_chung.jsp"></jsp:include>
    <link rel="stylesheet" href="${base }/user/css/tab.css">

</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	
	<div class="flex">
		<!-- leftAccount -->
	<jsp:include page="/WEB-INF/views/user/layout/leftAccount.jsp"></jsp:include>
		<main>
			<h3>Chi Tiết Đơn Hàng</h3>
			<div class="products">
				<%-- <form action="${base }/saleOrder/list" method="get">
						<input type="text" name="keyword" value="${saleOrderModel.keyword }"/>
						<input type="hidden" name="page" id="page" value="${saleOrderModel.page }">
					<button id ="btnSearch" name="btnSearch" type="submit" class="btn btn-primary">Search</button> --%>
					<table class="table table-striped" >
						<thead>
							<tr>
								<th scope="col">#</th>
								
								<th scope="col">Product Name</th>
								<th scope="col">Product Avatar</th>
								<th scope="col">Product Price</th>
								<th scope="col">quantity</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${saleOrderProduct.data}" var="saleOrderProduct" varStatus="loop">
								<tr data-id = "${product.id }">
								<th scope="row">${loop.index + 1 }</th>
								
								<td>
									${saleOrderProduct.saleProducts.title }
								</td>
								<td>
									<img src="${base }/upload/${saleOrderProduct.saleProducts.avatar }" style="width:230px;height:200px" >
								</td>
								<td>
									<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${saleOrderProduct.saleProducts.price }" type="currency" />
								</td>
								<td>
									${saleOrderProduct.quality }
								</td>
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- Paging -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center ">
								<div id="paging" class=""></div>
							</div>
						</div> 
				<!-- //</form> -->
			</div>
		
	</main>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	
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

<script src="${base }/manager/js/jquery.simplePagination.js"></script>
 <script type="text/javascript">
			$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${saleOrderProduct.currentPage},
			        items: ${saleOrderProduct.totalItems},
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