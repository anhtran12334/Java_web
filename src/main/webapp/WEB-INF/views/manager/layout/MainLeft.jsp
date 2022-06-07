<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- directive cua jstl-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <style>
    	.left a, .page, .sale, i{
    		font-size:16px;
    	}
    </style>
<div class="left" style="font-size:10px">
            <ul>
                <li><a href="${base }/admin/home">Dasboard</a></li>
                <li><a href="${base }/admin/category/list">Categories</a></li>
                <li><a href="${base }/admin/product/list">Products</a></li>
                 <li class="sale">
                    SaleOrder<span id='icon'>
                        <i class="fas fa-chevron-right"></i>
                        </span>
                        <ul class="sub_sale" style="display: none;">
                            <li><a href="${base }/admin/saleOrder/list" >Chờ tiếp nhận</a></li>
                            <li><a href="${base }/admin/saleOrderReceived/list" >Đã tiếp nhận</a></li>
                            <li><a href="${base }/admin/commentSaleOrder/list" >Chờ đánh giá</a></li>
                            <li><a href="${base }/admin/history/list" >Lịch sử đơn hàng </a></li>
                           
                            
                        </ul>
                    
                </li>
                <c:if test="${isAdmin }">
                <li class="page">User <i class="fas fa-chevron-right"></i>
                	<ul class="sub_pages">
                		<li><a href="${base }/admin/user/list">Admin</a></li>
                		<li><a href="${base }/admin/user/manager/list">Manager</a></li>
                		<li><a href="${base }/admin/user/guest/list">Guest</a></li>
                		<li><a href="${base }/admin/addUser">Add Account</a></li>
                	</ul>
                </li>
                </c:if>
                <li><a href="${base }/admin/contact/list">Contact</a></li>
                <li><a href="./Orderpages.html">Edit Oder</a></li>
                
                <li>
                        <div class="page">
                        Pages<span id='icon'>
                            <i class="fas fa-chevron-right"></i>
                            </span>
                        </div>
                    <ul class="sub_pages">
                        <li class="authen">
                            <div class="authens">
                            Authentication
                            <span id='icon1'>
                                <i class="fas fa-chevron-right"></i>
                            </span>
                            </div>
                            <ul class="sub_authen">
                                <li><a href="./login.html">Login</a></li>
                                <li><a href="./logout.html">Log out</a></li>
                                <li><a href="./forgetpassword.html">Forgot password</a></li>
                            </ul>
                        </li>
                        <li class="error">
                            <div class="errors">
                                Error
                                <span id='icon2'>
                                    <i class="fas fa-chevron-right"></i>
                                </span>
                                </div>
                            <ul class="sub_error">
                                <li><a href="./error401page.html">401 Pages</a></li>
                                <li><a href="./error404pages.html">404 Pages</a></li>
                                <li><a href="./error500pages.html">500 Pages</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>