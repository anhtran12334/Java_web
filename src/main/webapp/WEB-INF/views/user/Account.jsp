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
	
  <%--  	<!-- css -->
<jsp:include page="/WEB-INF/views/user/layout/css_chung.jsp"></jsp:include> --%>
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
    <link rel="stylesheet" href="${base }/user/css/tab.css">
    <link rel="stylesheet" href="${base }/user/css/DoAn.css">
    <!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
</head>
<body>
    <div class="flex">
        <!-- leftAccout -->
		<jsp:include page="/WEB-INF/views/user/layout/leftAccount.jsp"></jsp:include>
    <main>
        <h3 style="color: orangered">Đơn hàng của tôi</h3>
        <div class="tabs">
        	
            <div class="tab-item active">
                Chờ tiếp nhận
            </div>
            
            
            <div class="tab-item">
                Chờ giao hàng
            </div>
            
            <div class="tab-item">
                Chờ đánh giá
            </div>
            <div class="tab-item">
                Lịch sử đơn hàng
            </div>
            <div class="line"></div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active">
                <h2>Chờ tiếp nhận</h2>
       <!--  <p>React makes it painless to create interactive UIs.
            Design simple views for each state in your application,
                and React will efficiently update and render 
                just the right components when your data changes.
            </p> -->
            <table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Code</th>
								
								<th scope="col">Created Date</th>
								<th scope="col">FullName</th>
								<!-- <th scope="col">Number Phone</th>
								<th scope="col">Email</th>
								<th scope="col">Address</th> -->
								<th scope="col">Total Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${saleOrderReceive.data}" var="saleOrder"
								varStatus="loop">
								<tr data-id="${saleOrder.id }">
									<th scope="row">${loop.index + 1 }</th>
									<td>${saleOrder.code }</td>
									
									<td>${saleOrder.createdDate }</td>
									<td>${saleOrder.customerName }</td>
									<%-- <td>${saleOrder.customerPhone }</td>
									<td>${saleOrder.customerEmail }</td>
									<td>${saleOrder.customerAddress }</td> --%>
									<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${saleOrder.total }" type="currency" /></td>
									<td><a class="btn btn-primary edit-product"
										href="${base }/saleOrderProducts/list/${saleOrder.id }"
										role="button" style="font-size: 13px;"><i
											class="fas fa-edit"></i> Detail </a> 
											</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
            </div>
            <div class="tab-pane">
                <h2>Chờ giao hàng</h2>
                
       			<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Code</th>
								
								<th scope="col">Created Date</th>
								<th scope="col">FullName</th>
								
								<th scope="col">Total Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${saleOrderReceived.data}" var="saleOrder"
								varStatus="loop">
								<tr data-id="${saleOrder.id }">
									<th scope="row">${loop.index + 1 }</th>
									<td>${saleOrder.code }</td>
									
									<td>${saleOrder.createdDate }</td>
									<td>${saleOrder.customerName }</td>
									<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${saleOrder.total }" type="currency" /></td>
									<td><a class="btn btn-primary edit-product"
										href="${base }/saleOrderProducts/list/${saleOrder.id }"
										role="button" style="font-size: 13px;"><i
											class="fas fa-edit"></i> Detail </a>
											<button class="btn btn-success" type="button" onclick="receiveSaleOrder(${saleOrder.id})">
											Đã nhận hàng
											</button> 
											</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					
            </div>
            <div class="tab-pane">
                <h2>Chờ đánh giá</h2>
        		<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Code</th>
								
								<th scope="col">Created Date</th>
								<th scope="col">FullName</th>
								
								<th scope="col">Total Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${historySaleOrder.data}" var="saleOrder"
								varStatus="loop">
								<tr data-id="${saleOrder.id }">
									<th scope="row">${loop.index + 1 }</th>
									<td>${saleOrder.code }</td>
									
									<td>${saleOrder.createdDate }</td>
									<td>${saleOrder.customerName }</td>
									<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${saleOrder.total }" type="currency" /></td>
									<td><a class="btn btn-primary edit-product"
										href="${base }/commentSaleOrder/list/${saleOrder.id }"
										role="button" style="font-size: 13px;"><i class="fas fa-comments"></i> Đánh giá </a> 
											</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
            </div>
            <div class="tab-pane">
                <h2>Lịch sử mua hàng</h2>
        		<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Code</th>
								
								<th scope="col">Created Date</th>
								<th scope="col">FullName</th>
								
								<th scope="col">Total Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${historySaleOrderAfterComment.data}" var="saleOrder"
								varStatus="loop">
								<tr data-id="${saleOrder.id }">
									<th scope="row">${loop.index + 1 }</th>
									<td>${saleOrder.code }</td>
									
									<td>${saleOrder.createdDate }</td>
									<td>${saleOrder.customerName }</td>
									<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${saleOrder.total }" type="currency" /></td>
									<td><a class="btn btn-primary edit-product"
										href="#"
										role="button" style="font-size: 13px;"><i class="fas fa-shopping-bag"></i> Mua Lại </a> 
											</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
            </div>
        </div>
    </main>
    
</div>
<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script> -->
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
	<script type="text/javascript">
function receiveSaleOrder(id){
	
	
	 const isConfirm = window.confirm('Bạn có chắc là đã nhận được đơn hàng này không ?')
	if(!isConfirm) return
	let data = {
			id: id,// lay theo id
	};
	$.ajax({
		url : "/receive/" +id,
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
<script>
    var $$$ = document.querySelector.bind(document);
    var $$ = document.querySelectorAll.bind(document);
    const tabs = $$('.tab-item');
    const panes = $$('.tab-pane');

    const tabActive = $$$('.tab-item.active');
    const line = $$$('.tabs .line');

    line.style.left = tabActive.offsetLeft + "px";
    line.style.width = tabActive.offsetWidth + "px";

    tabs.forEach((tab,index) => {
        const pane = panes[index];

        tab.onclick = function() {
            $$$('.tab-item.active').classList.remove('active');
            $$$('.tab-pane.active').classList.remove('active');

            line.style.left = this.offsetLeft + "px";
            line.style.width = this.offsetWidth + "px";


            this.classList.add('active');
            pane.classList.add('active');
        }
    })

</script>

</html>