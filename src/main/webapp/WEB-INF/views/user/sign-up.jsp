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
				<h1>????ng K??</h1>
			</div>
			<p>FullName</p>
			<div>
				<sf:input type="text" id="fname" placeholder="Nguy???n V??n A"
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
			<button type="submit" name="" id="gui">????ng K??</button>

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
				required: "Vui l??ng nh???p th??ng tin"
			},
			username: {
				required: "Vui l??ng nh???p th??ng tin"
			},
			email : {
				required: "Vui l??ng nh???p th??ng tin",
				email: "Email nh???p sai y??u c???u nh???p l???i"
				
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
                required: "Vui l??ng nh???p t??n ????ng nh???p",
                minlength: '????? d??i t???i thi???u 6 k?? t???',
            },
            email: {
                required: "Vui l??ng nh???p email",
                email: "Vui l??ng nh???p ????ng ?????nh d???ng email"
            },
            phoneNumber: {
            	required: "Vui l??ng nh???p s??? ??i???n tho???i",
                
            },
            fullname: {
            	required: "Vui l??ng nh???p H??? T??n",
                
            },
            address: {
            	required: "Vui l??ng nh???p ?????a ch???",
                
            },
            password: {
                required: "Vui l??ng nh???p m???t kh???u",
                minlength: '????? d??i t???i thi???u 6 k?? t???',
                // isPasswordSecure: 'M???t kh???u c???n c?? ??t nh???t 1 ch??? c??i v?? 1 ch??? s???'
            },
            confirmpassword: {
                required: "Vui l??ng x??c nh???n m???t kh???u",
                equalTo: "M???t kh???u x??c nh???n kh??ng ????ng",
            },
            'policy-agree': "Vui l??ng x??c nh???n",
        },
       /*  errorPlacement: function(errorElement, invalidElement) {
            errorElement.insertAfter( invalidElement.parent() );
        },
 */
});

jQuery.validator.addMethod( "isPasswordSecure", function(value) {
let regex = /^(?=.*[a-zA-Z])(?=.*[0-9])/g;
return regex.test(value);
}, 'M???t kh???u c???n c?? ??t nh???t 1 ch??? c??i v?? 1 ch??? s???' )

jQuery.validator.addMethod("isValidUserName", function(value){
const _1regex = /^[a-zA-Z]*$/g; // ch??? ch???a ch??? c??i
const _2regex = /^[a-zA-Z]+[a-zA-Z0-9]*$/g; // ch??? ch???a ch??? c??i v?? s???

return _1regex.test(value) || _2regex.test(value);
},"?????nh d???ng kh??ng h???p l???. Th??? nh???p ?????nh d???ng: anhtran ho???c anhtran123")
	jQuery.validator.addMethod("isPhoneNumber", function(value) {
   		const regex = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
   		if(regex.test(value) == true){
   			return true;
   		}
   		return false;
	}, "S??? ??T B???n Nh???p V??o Kh??ng H???p L???");
	
</script>
</html>