<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tổng quan</title>

    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/filepond@^4/dist/filepond.css">
    <link rel="stylesheet" href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css">
    <script src="https://cdn.tiny.cloud/1/vmvrvx4s91ngnwxk4xwccnt0e8p93eqwn9ld96cu2xb9nkpd/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="<c:url value='/js/tinymce-config'/>"></script>

<body>

<header class="header">
    <div class="inner-logo">
        <a href="/admin/dashboard"><span>Shop</span><span>VnbAdmin</span></a>
    </div>

    <div class="inner-wrap">
        <div class="inner-notify">
            <img src="<c:url value='/images/icon-bell.svg'/>">
            <span>6</span>
        </div>

        <div class="inner-account">
            <div class="inner-avatar">
                <img src="<c:url value='/images/avatar.jpg'/>">
            </div>
            <div class="inner-text">
                <div class="inner-name">Le Van A</div>
                <div class="inner-role">Admin</div>
            </div>
        </div>

        <button class="inner-button-menu">
            <i class="fa-solid fa-bars"></i>
        </button>
    </div>
</header>

<nav class="sider">
    <ul class="inner-menu">
        <li><a class="active" href="#"><i class="fa-solid fa-gauge-high"></i> Tổng quan</a></li>
        <li><a href="/admin/category/list"><i class="fa-solid fa-table-cells-large"></i> Quản lý danh mục</a></li>
        <li><a href="#"><i class="fa-solid fa-table-list"></i> Quản lý sản phẩm</a></li>
        <li><a href="#"><i class="fa-solid fa-list-check"></i> Quản lý đơn hàng</a></li>
        <li><a href="#"><i class="fa-solid fa-user"></i> Quản lý người dùng</a></li>
        <li><a href='#'><i class="fa-solid fa-newspaper"></i>Quản lý tin tức</a></li>
        <li><a href="#"><i class="fa-solid fa-user-group"></i> Thông tin liên hệ và phản hồi</a></li>
    </ul>

    <hr>

    <ul class="inner-menu">
        <li><a href="#"><i class="fa-solid fa-gear"></i> Cài đặt chung</a></li>
        <li><a href="#"><i class="fa-solid fa-user-gear"></i> Thông tin cá nhân</a></li>
        <li><a class="inner-logout" href="/admin/logout"><i class="fa-solid fa-power-off"></i> Đăng xuất</a></li>
    </ul>
</nav>

<div class="sider-overlay"></div>

<main class="main">
    <h1 class="box-title">Tổng quan</h1>

    <div class="section-1">
        <div class="inner-item">
            <div class="inner-icon">
                <img src="<c:url value='/images/section-1-icon-1.svg'/>">
            </div>
            <div class="inner-content">
                <div class="inner-title">Người dùng</div>
                <div class="inner-number">1.200</div>
            </div>
        </div>

        <div class="inner-item">
            <div class="inner-icon">
                <img src="<c:url value='/images/section-1-icon-2.svg'/>">
            </div>
            <div class="inner-content">
                <div class="inner-title">Đơn hàng</div>
                <div class="inner-number">3.600</div>
            </div>
        </div>

        <div class="inner-item">
            <div class="inner-icon">
                <img src="<c:url value='/images/section-1-icon-3.svg'/>">
            </div>
            <div class="inner-content">
                <div class="inner-title">Doanh thu</div>
                <div class="inner-number">300.000.000đ</div>
            </div>
        </div>
    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value='/js/script.js'/>"></script>

</body>
</html>