<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
</head>
<body>
<div class="page-account">
    <div class="form-account">
        <h2 class="inner-title">Đăng nhập</h2>
        <p class="inner-desc">Vui lòng nhập email và mật khẩu để tiếp tục</p>
        <form class="inner-form" id="login-form" method="post" action="/admin/login">
            <div class="inner-group">
                <label class="inner-label" for="email">Email</label>
                <input class="inner-control" type="email" name="email" id="email"
                       placeholder="Nhập email"/>
            </div>
            <div class="inner-group">
                <label class="inner-label" for="password">Mật khẩu</label>
                <input class="inner-control" type="password" name="password" id="password"/>
            </div>
            <div class="inner-meta">
                <div class="inner-confirm">
                    <input class="inner-check" type="checkbox" name="rememberPassword" id="remember-password"/>
                    <label class="inner-label" for="remember-password">Nhớ mật khẩu</label>
                </div>
                <a class="inner-forgot-password" href="#">Quên mật khẩu?</a>
            </div>
            <button class="inner-button" type="submit">Đăng Nhập</button>
        </form>

        <div class="inner-more"><span>Bạn chưa có tài khoản?</span><a href="#">Tạo tài khoản</a></div>
    </div>
</div>

<!-- JS -->
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
<script src="<c:url value='/js/account.js'/>"></script>
</body>
</html>