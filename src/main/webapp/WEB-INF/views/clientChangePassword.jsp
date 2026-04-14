<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu - ShopVnb Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/css/client.css'/>">
    <style>
        .auth-wrapper { padding: 40px 20px; min-height: 80vh; display: flex; align-items: center; justify-content: center; background-color: #f8f9fa; }
        .auth-container { background: #fff; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 450px; }
        .auth-title { text-align: center; margin-bottom: 24px; font-size: 24px; font-weight: 700; color: #333; }
        .auth-form .form-group { margin-bottom: 15px; }
        .auth-form label { display: block; margin-bottom: 8px; font-weight: 500; color: #555; }
        .auth-form input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; outline: none; transition: border-color 0.3s; }
        .auth-form input:focus { border-color: #007bff; }
        .auth-form .btn-submit { width: 100%; padding: 12px; background: #007bff; color: #fff; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; transition: background 0.3s; margin-top: 10px;}
        .auth-form .btn-submit:hover { background: #0056b3; }
        .alert { padding: 12px; margin-bottom: 20px; border-radius: 6px; }
        .alert-error { background: #f8d7da; color: #721c24; }
        .alert-success { background: #d4edda; color: #155724; }
        .back-link { display: block; text-align: center; margin-top: 20px; color: #555; text-decoration: none; }
        .back-link:hover { color: #007bff; text-decoration: underline; }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="brand-logo">ShopVnb<span>Store</span></a>
            <ul class="nav-links">
                <li><a href="<c:url value='/client/login'/>">Đăng nhập</a></li>
                <li><a href="<c:url value='/client/register'/>" class="btn-view-all">Đăng ký</a></li>
            </ul>
        </div>
    </nav>

    <div class="auth-wrapper">
        <div class="auth-container">
            <h2 class="auth-title">Đổi Mật Khẩu</h2>
            
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <form action="<c:url value='/client/change-password'/>" method="POST" class="auth-form">
                <div class="form-group">
                    <label>Mật khẩu hiện tại</label>
                    <input type="password" name="currentPassword" required placeholder="Nhập mật khẩu hiện tại">
                </div>
                <div class="form-group">
                    <label>Mật khẩu mới</label>
                    <input type="password" name="newPassword" required placeholder="Nhập mật khẩu mới">
                </div>
                <div class="form-group">
                    <label>Nhập lại mật khẩu mới</label>
                    <input type="password" name="confirmNewPassword" required placeholder="Xác nhận mật khẩu mới">
                </div>
                <button type="submit" class="btn-submit">Lưu Thay Đổi</button>
            </form>
            <a href="/" class="back-link"><i class="fa-solid fa-arrow-left"></i> Quay về trang chủ</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-brand">
                <h3>ShopVnb Store</h3>
            </div>
        </div>
    </footer>
</body>
</html>
