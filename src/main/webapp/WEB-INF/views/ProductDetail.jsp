<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${product.name} - ShopVnb Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/css/client.css'/>">
    <style>
        .detail-layout { display: flex; gap: 40px; padding: 40px; max-width: 1200px; margin: 0 auto; }
        .detail-img { flex: 1; border-radius: 12px; overflow: hidden; background: #f9f9f9; }
        .detail-img img { width: 100%; transition: transform 0.3s; }
        .detail-content { flex: 1; }
        .brand-badge { color: #3498db; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; }
        .price-large { font-size: 32px; color: #e74c3c; font-weight: 800; margin: 20px 0; }
        .old-price { text-decoration: line-through; color: #999; font-size: 18px; margin-right: 10px; }
        .desc-box { line-height: 1.6; color: #444; margin-top: 30px; border-top: 1px solid #eee; padding-top: 20px; }
        .btn-add-cart { background: #000; color: #fff; padding: 15px 40px; border: none; border-radius: 50px; font-weight: 700; cursor: pointer; width: 100%; margin-top: 20px; transition: 0.3s; }
        .btn-add-cart:hover { background: #333; transform: translateY(-2px); }
    </style>
</head>
<body class="velocity-body">

    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="brand-logo">ShopVnb<span>Store</span></a>
            <ul class="nav-links">
                <li><a href="<c:url value='/tat-ca-san-pham'/>">Tất cả</a></li>
                <li><a href="#">Giày</a></li>
                <li><a href="#">Vợt</a></li>
            </ul>
        </div>
    </nav>

    <main class="detail-layout">
        <div class="detail-img">
            <img src="${product.avatar}" alt="${product.name}">
        </div>

        <div class="detail-content">
            <span class="brand-badge">${product.brand.name}</span>
            <h1 style="font-size: 40px; margin: 10px 0;">${product.name}</h1>
            
            <div class="velocity-rating">
                <i class="fa-solid fa-star"></i> ${product.rating} 
                <span style="color: #888; font-weight: 400; font-size: 14px;">(${product.reviewCount} đánh giá)</span>
            </div>

            <div class="price-box">
                <c:if test="${product.price > product.newPrice}">
                    <span class="old-price"><fmt:formatNumber value="${product.price}" pattern="#,###"/>đ</span>
                </c:if>
                <div class="price-large">
                    <fmt:formatNumber value="${product.newPrice}" pattern="#,###"/>đ
                </div>
            </div>

            <p><strong>Trạng thái:</strong> 
                <span style="color: ${product.status == 'active' ? '#27ae60' : '#e74c3c'}">
                    ${product.status == 'active' ? 'Còn hàng' : 'Hết hàng'}
                </span>
            </p>

            <button class="btn-add-cart">THÊM VÀO GIỎ HÀNG</button>

            <div class="desc-box">
                <h3>Đặc điểm nổi bật</h3>
                <div>${product.description}</div>
            </div>
        </div>
    </main>

    <footer class="footer" style="margin-top: 50px;">
        <p align="center">© 2026 ShopVnb Store. The Kinetic Experience.</p>
    </footer>

</body>
</html>