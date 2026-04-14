<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận OTP - ShopVnb Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/css/client.css'/>">
    <style>
        .auth-wrapper { padding: 80px 20px; min-height: 60vh; display: flex; align-items: center; justify-content: center; background-color: #f8f9fa; }
        .auth-container { background: #fff; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 400px; text-align: center; }
        .auth-title { margin-bottom: 10px; font-size: 24px; font-weight: 700; color: #333; }
        .auth-subtitle { margin-bottom: 24px; font-size: 14px; color: #666; }
        .auth-form .form-group { margin-bottom: 20px; text-align: left; }
        .auth-form label { display: block; margin-bottom: 8px; font-weight: 500; color: #555; }
        .auth-form input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; outline: none; text-align: center; font-size: 18px; letter-spacing: 2px; font-weight: bold; transition: border-color 0.3s; }
        .auth-form input:focus { border-color: #007bff; }
        .auth-form .btn-submit { width: 100%; padding: 12px; background: #28a745; color: #fff; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; transition: background 0.3s; }
        .auth-form .btn-submit:hover { background: #218838; }
        .alert { padding: 12px; margin-bottom: 20px; border-radius: 6px; text-align: left; }
        .alert-error { background: #f8d7da; color: #721c24; }
        .alert-success { background: #d4edda; color: #155724; }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="brand-logo">ShopVnb<span>Store</span></a>
            <c:choose>
                <c:when test="${not empty sessionScope.clientUser}">
                    <div class="nav-actions">
                        <div class="icon-btns">
                            <div class="user-profile">
                                <i class="fa-solid fa-user"></i>
                                <span class="user-name">${sessionScope.clientUser.fullName}</span>
                                <a href="<c:url value='/client/logout'/>" class="logout-btn">
                                    <i class="fa-solid fa-right-from-bracket"></i>
                                    <span>Đăng xuất</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <ul class="nav-links">
                        <li><a href="<c:url value='/client/login'/>">Đăng nhập</a></li>
                        <li><a href="<c:url value='/client/register'/>" class="btn-view-all">Đăng ký</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

    <div class="auth-wrapper">
        <div class="auth-container">
            <h2 class="auth-title">Xác Nhận Email</h2>
            <p class="auth-subtitle">Chúng tôi đã gửi 1 mã OTP vào email của bạn. Vui lòng kiểm tra và nhập mã xác thực.</p>
            
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <form action="<c:url value='/client/verify-otp'/>" method="POST" class="auth-form">
                <div class="form-group">
                    <input type="text" name="otpCode" required placeholder="X X X X X X" maxlength="6">
                </div>
                <button type="submit" class="btn-submit">Xác Thực Tài Khoản</button>
            </form>
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