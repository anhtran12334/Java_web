<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- directive cua jstl-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="header">
	<div class="left">
		<span> <img src="${base }/user/img/logo_2.png" width="60px"
			height="60px" style="border-radius: 50%;">
		</span> <span> <i class="fas fa-bars" id="bar" style="padding: 10px"></i>
		</span>
	</div>
	<div class="right">
		<!-- <span>
			<form class="form-inline" style="padding: 12px">
				<input type="text" id="search" placeholder="search..."
					style="width: 250px; height: 35px">
				<button type="button" data-bs-target="#carouselExampleControls"
					data-bs-slide="" style="height: 35px">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</span> --> <span> <i class="fas fa-bell" style="padding: 20px"></i>
		</span> <span> <i class="fas fa-comment-alt" style="padding: 20px"></i>
		</span> <span> 
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img src="${base }/user/img/AVA1.jfif" width="40px"
			height="40px" style="border-radius: 50%;"></button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">Action</a> 
					<c:if test="!${isAdmin }">
						<a class="dropdown-item" href="#">Another action</a> 
					</c:if>
					<a class="dropdown-item" href="${base }/logout">Logout(${userLogined.email })</a>
				</div>
			</div>
		</span>
	</div>
</div>