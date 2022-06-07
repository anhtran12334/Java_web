<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- directive cua jstl-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav class="navbar navbar-expand-md narbar-light bg-light sticky-top" style="padding: 0;">
        <div class="container-fluid">
            <a class="navbar-branch" href="#">
                <img src="${base }/user/img/logo_2.png" height="50" style="border-radius:100%">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarResponsive">
                <span class="icons"><i class="fas fa-bars" style="font-size:100px"></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${base }/home">Trang chủ</a>
                    </li>
                    <li class="nav-item"> 
                        <a class="nav-link" href="#">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Tin Tức</a>
                    </li>
                    
                </ul>
                
                  <ul class="navbar-nav ml-auto">
                    <!-- <li class="nav-item ">
                        <form class="form-inline">
                           
                            <input type="text" id="search" placeholder="search...">
                            <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide=""><i class="fas fa-search"></i></button>
                          </form>
                    </li> -->
                  <li class="nav-item ">
                    <a class="nav-link " href="${base }/signUp">Đăng kí</a>
                  </li>
                  
                  <li class="nav-item ">
                    <a class="nav-link" href="${base }/login">Đăng nhập</a>
                  </li>
                  <li class="nav-item ">
                    <a class="nav-link " href="${base }/cart/view"><i class="fas fa-shopping-cart"></i>
                    Giỏ hàng
                    <span id="totalCartItemId" class="badge badge-dark">${totalItems }</span>
                    
                    </a>
                  </li>
                  <li class="nav-item ">
                  <c:if test="${isMember }">
                  	<a class="nav-link " href="${base }/account" style="text-decoration:none;">Tài Khoản <i class="fas fa-user-circle" ></i></a>
                  </c:if>
                  </li>
                </ul>
            </div>
        </div>
    </nav>