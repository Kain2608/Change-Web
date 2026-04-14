<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - ShopVnb Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/css/client.css'/>">
    <style>
        .auth-wrapper { padding: 80px 20px; min-height: 60vh; display: flex; align-items: center; justify-content: center; background-color: #f8f9fa; }
        .auth-container { background: #fff; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 400px; text-align: center;}
        .auth-title { margin-bottom: 24px; font-size: 24px; font-weight: 700; color: #333; }
        .auth-form .form-group { margin-bottom: 20px; text-align: left; }
        .auth-form label { display: block; margin-bottom: 8px; font-weight: 500; color: #555; }
        .auth-form input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; outline: none; transition: border-color 0.3s; }
        .auth-form input:focus { border-color: #007bff; }
        .auth-form .btn-submit { width: 100%; padding: 12px; background: #dc3545; color: #fff; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; transition: background 0.3s; }
        .auth-form .btn-submit:hover { background: #c82333; }
        .auth-links { margin-top: 20px; text-align: center; font-size: 14px; }
        .auth-links a { color: #007bff; text-decoration: none; }
        .auth-links a:hover { text-decoration: underline; }
        .alert { padding: 12px; margin-bottom: 20px; border-radius: 6px; text-align: left; }
        .alert-error { background: #f8d7da; color: #721c24; }
        .alert-success { background: #d4edda; color: #155724; }
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
            <h2 class="auth-title">Khôi Phục Mật Khẩu</h2>
            <p style="margin-bottom: 20px; color: #666; font-size: 14px;">Vui lòng nhập địa chỉ email bạn đã đăng ký để chúng tôi gửi mã OTP khôi phục.</p>
            
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <form action="<c:url value='/client/forgot-password'/>" method="POST" class="auth-form">
                <div class="form-group">
                    <label>Email đăng ký</label>
                    <input type="email" name="email" required placeholder="Nhập địa chỉ email của bạn">
                </div>
                <button type="submit" class="btn-submit">Nhận Mã Khôi Phục</button>
            </form>
            <div class="auth-links">
                <a href="<c:url value='/client/login'/>"><i class="fa-solid fa-arrow-left"></i> Quay lại đăng nhập</a>
            </div>
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
