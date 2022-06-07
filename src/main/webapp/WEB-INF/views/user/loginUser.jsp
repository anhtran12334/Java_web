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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${base }/user/css/Sign-up.css">
    <style>
        input{
            border-color: red;
        }
        .required{
            color: red;
        }
    </style>
</head>
<body>
    <!-- menu -->
<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
    <div class="login text-center">
        <form id="myForm" method="post" action = "/perform_login">
        <h1>Log in</h1>
        <c:if test="${not empty param.login_error }">
        	<div class="alert alert-danger" role="alert" >
        		Thông tin đăng nhập không đúng. Vui lòng đăng lại !!!! 
        	</div>
        
        </c:if>
        <p class="t">UserName</p>
        <div>
        <input type="text" name="username" placeholder="UserName" required="required">
        <p class="required"></p>
        </div>
        <p class="t">Password</p>
        <div>
        <input type='password' name='password' required="required">
        <p class="required"></p>
        </div>
        <div>
        <button type="submit" name="login">Log in</button><br/>
        </div>
        <div>
        <div>
            <input type="checkbox" id='checkbox'>
            <lable>Remmeber me</lable>
            <span style="margin-left: 50px;"><a href="#">Forgot Password?</a></span>
        </div>
        <p style="text-align: center;"><a href="./Sign-out.html">Create an Account</a></p>
        </div>
        </form>
        
    </div>
    <hr/>
     <!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="./../../bai9_jquery/bai9_jquery/js/jquery.min.js"></script>

</html>