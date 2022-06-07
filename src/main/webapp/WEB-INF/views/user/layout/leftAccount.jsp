<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="left">
        <h6 style="padding-left: 30px;">Xin Chào! ${userLogined.fullname }</h6>
            <ul>
                <li class="bole"><a href="#">Quản lý tài khoản </a>
                    <ul>
                        <li><a href="#">Thông tin Cá nhân </a></li>
                        <li><a href="#">Mã giảm giá </a></li>
                    </ul>
                </li>
                <li class="bole"><a href="#">Đơn hàng của tôi </a>
                    <ul>
                        <li><a href="#">Đơn hàng đổi trản </a></li>
                        <li><a href="#">Đơn hàng hủy </a></li>
                    </ul>
                </li>
                <li class="bole"><a href="${base }/logout">Đăng xuất </a></li>
                
            </ul>
        </div>