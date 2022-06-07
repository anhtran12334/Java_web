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
    <style>
        body{
            max-width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <h2>NewsLetter</h2>
    <form>
        <input type="email" id="email" name="email2" placeholder="Enter email for newsletter..."/>
        <button type="button" onclick="saveAccount()">go</button>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function saveAccount(){
		//javascript object
		let simpleLetter = {
				email: $("#email").val() //lay theo id
				//
				
		};
		// $ ==== jQuery
		$.ajax({
			url : "/letter-ajax",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(simpleLetter),
			
			dataType : "json", // kieu tra ve tuw controller la json
			success : function(jsonResult){
				console.log(jsonResult);
			},
			error  : function(jqXhr, textStatus, errorMessage){ // error callback
				
			}
		})
	}
</script>
</html>