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
<!-- jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery validation -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	integrity="sha512-37T7leoNS06R80c8Ulq7cdCDU5MNQBwlYoy1TX/WUsLFC2eYNqtKlV0QjH7r8JpG/S0GUMZwebnVFLPd6SU5yg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
<link rel="stylesheet" href="${base }/user/css/Sign-up.css">
<style>
input {
	border-color: red;
}

.required {
	color: red;
	text-align:left;
}
#myForm input{
	margin-right: 0;
}
.error {
	color: red;
	font-size: 15px;
	width: 800px;
	width: 500px;
    text-align: left;
    margin-right: 200px;
}
</style>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	<div class="main">
		<sf:form name="myForm" id="myForm" method="post"
			action="${base }/savesignUp" modelAttribute="user">
			<div class="msg">
				<h1>Đăng Ký</h1>
			</div>
			<p>FullName</p>
			<div>
				<sf:input type="text" id="fname" placeholder="Nguyễn Văn A"
					required="required" path="fullname" />
				<p class="required"></p>
			</div>
			<p>UserName</p>
			<div>
				<sf:input type="text" id="uname" placeholder="nguyenvana"
					required="required" path="username" />
				<p class="required"></p>
			</div>
			<p>Email</p>
			<div>
				<sf:input type="email" id="email" name="email"
					placeholder="example@gmail.com" required="required" path="email" />
				<p class="required"></p>
			</div>
			<p>PhoneNumber</p>
			<div>
				<sf:input type="tel" id="phone" placeholder="123456789"
					required="required" path="phoneNumber" />
				<p class="required"></p>
			</div>
			<p>Address</p>
			<div>
				<sf:input type="text" id="address" name="address"
					required="required" path="address" />
				<p class="required"></p>
			</div>
			<p>Password</p>
			<div>
				<sf:input type='password' id="password" name='password'
					required="required" path="password" />
				<p class="required"></p>
			</div>
			<p>Confirm Password</p>
			<div>
				<input type='password' id="confirmpassword" required="required"
					name='confirmpassword'>
				<p class="required"></p>
			</div>
			<button type="submit" name="" id="gui">Đăng Ký</button>

		</sf:form>
	</div>
	<hr />
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script> -->
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

<%-- <script src="${base }/user/js/Sign-out.js"></script> --%>
<script type="text/javascript">
	/* $('#myForm').validate({
		rules: {
			fullname: {
				require: true
			},
			username: {
				require: true
			},
			email : {
				require: true,
				email: true
				
			},
			phoneNumber: {
				isPhoneNumber: true
			}
		}
		/* message{
			fullname: {
				required: "Vui lòng nhập thông tin"
			},
			username: {
				required: "Vui lòng nhập thông tin"
			},
			email : {
				required: "Vui lòng nhập thông tin",
				email: "Email nhập sai yêu cầu nhập lại"
				
			},
		} 
	}); */
	$('#myForm').validate({
        rules: {
			email: {
				email: true,
			},
			confirmpassword: {
                 equalTo: '[name="password"]',
            },
            phoneNumber: {
            	isPhoneNumber: true,
            },
            username: {
                minlength: 6,
                isValidUserName: true,
            },
            password: {
                minlength: 6,
                isPasswordSecure: true,
            }
        },
        messages: {
            username: {
                required: "Vui lòng nhập tên đăng nhập",
                minlength: 'Độ dài tối thiểu 6 ký tự',
            },
            email: {
                required: "Vui lòng nhập email",
                email: "Vui lòng nhập đúng định dạng email"
            },
            phoneNumber: {
            	required: "Vui lòng nhập số điện thoại",
                
            },
            fullname: {
            	required: "Vui lòng nhập Họ Tên",
                
            },
            address: {
            	required: "Vui lòng nhập địa chỉ",
                
            },
            password: {
                required: "Vui lòng nhập mật khẩu",
                minlength: 'Độ dài tối thiểu 6 ký tự',
                // isPasswordSecure: 'Mật khẩu cần có ít nhất 1 chữ cái và 1 chữ số'
            },
            confirmpassword: {
                required: "Vui lòng xác nhận mật khẩu",
                equalTo: "Mật khẩu xác nhận không đúng",
            },
            'policy-agree': "Vui lòng xác nhận",
        },
       /*  errorPlacement: function(errorElement, invalidElement) {
            errorElement.insertAfter( invalidElement.parent() );
        },
 */
});

jQuery.validator.addMethod( "isPasswordSecure", function(value) {
let regex = /^(?=.*[a-zA-Z])(?=.*[0-9])/g;
return regex.test(value);
}, 'Mật khẩu cần có ít nhất 1 chữ cái và 1 chữ số' )

jQuery.validator.addMethod("isValidUserName", function(value){
const _1regex = /^[a-zA-Z]*$/g; // chỉ chứa chữ cái
const _2regex = /^[a-zA-Z]+[a-zA-Z0-9]*$/g; // chỉ chứa chữ cái và số

return _1regex.test(value) || _2regex.test(value);
},"Định dạng không hợp lệ. Thử nhập định dạng: anhtran hoặc anhtran123")
	jQuery.validator.addMethod("isPhoneNumber", function(value) {
   		const regex = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
   		if(regex.test(value) == true){
   			return true;
   		}
   		return false;
	}, "Số ĐT Bạn Nhập Vào Không Hợp Lệ");
	
</script>
</html>