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
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/banner.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	<div class="main" style="max-width:1200px;margin: auto">
		
		<c:if test="${not empty thongbao }">
			<div class="alert alert-success" role="alert">
  				${thongbao }
			</div>
		</c:if>
		<!-- normal -->
		<%-- <form action="${base }/save-contact" method="post">
			<div class="mb-3">
				<label for="txtEmail" class="form-label">Email 
					address</label> <input type="email" class="form-control"
					id="txtEmail" name="txtEmail" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="txtContent" class="form-label">Content</label>
				<input type="text" class="form-control"
					id="txtContent" name="txtContent">
			</div>
			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form> --%>
		
		<!-- Spring form -->
		<sf:form id="contact-form" name="contact-form" action="${base }/save-contact" method="post" modelAttribute="SimpleContact">
			<div class="mb-3">
				<label for="txtEmail" class="form-label">Email 
					address</label> 
					<sf:input type="email" path="txtEmail" class="form-control" id="txtEmail" name="txtEmail" aria-describedby="emailHelp"/>
					
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3">
				<label for="txtContent" class="form-label">Content</label>
				<sf:input type="text" path="txtContent" class="form-control"
					id="txtContent" name="txtContent"/>
					
			</div>
			<div class="mb-3 form-check">
				<sf:checkbox path="chk" class="form-check-input" id="exampleCheck1" name="chk"></sf:checkbox>
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			
			
			<!-- KKhi goi ajax thi kieu khong duoc goi la submit -->
			<button type="button" class="btn btn-primary" onclick="saveContact()">Call ajax</button>
		</sf:form>
	</div>
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function saveContact(){
		//javascript object
		let simpleContact = {
				txtEmail: $("#txtEmail").val(), //lay theo id
				txtContent: $("#txtContent").val() // lay theo id
		};
		// $ ==== jQuery
		$.ajax({
			url : "/contact-ajax",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(simpleContact),
			
			dataType : "json", // kieu tra ve tuw controller la json
			success : function(jsonResult){
				alert(jsonResult.message)
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
</script>
</html>