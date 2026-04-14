
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<fmt:setBundle basename="messages"/>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopVnb Store - Giày & Vợt Cầu Lông Chuyên Nghiệp</title>
    <!-- Google Fonts & FontAwesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <!-- Link to external CSS -->
    
    <link rel="stylesheet" href="<c:url value='/css/client.css'/>">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="brand-logo">ShopVnb<span>Store</span></a>
            <ul class="nav-links">
                <li><a href="<c:url value='/tat-ca-san-pham'/>" class="btn-view-all">Tất cả</a></li>
                <li><a href="#">Giày</a></li>
                <li><a href="#">Vợt</a></li>
                <li><a href="#">Khuyến mãi</a></li>
            </ul>
            <div class="nav-actions">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm sản phẩm...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <div class="icon-btns">
                    <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
                    <a href="<c:url value='/client/login'/>"><i class="fa-solid fa-user"></i></a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->

    <header class="hero">
        <div class="hero-content">
            
            <span class="hero-subtitle">Bứt phá giới hạn</span>
            <h1 class="hero-title">NÂNG TẦM<br>HIỆU SUẤT</h1>
            <p class="hero-desc">Khám phá bộ sưu tập giày, vợt cao cấp. Từ những đôi giày tốc độ đến những cây vợt đầy uy lực.</p>
            <div class="hero-btns">
                <a href="#" class="btn btn-primary">Mua Ngay</a>
                <a href="#" class="btn btn-outline">Khám Phá BST</a>
            </div>
        </div>
    </header>

<section class="category-slider-section">

    <div class="section-header">
        <h2 class="section-title">Danh Mục</h2>
        <div class="slider-controls">
            <button class="slider-btn" id="cat-prev">
                <i class="fa-solid fa-chevron-left"></i>
            </button>
            <button class="slider-btn" id="cat-next">
                <i class="fa-solid fa-chevron-right"></i>
            </button>
        </div>
    </div>

    <div class="product-slider-wrapper">
        <div class="product-slider" id="cat-slider">
            <c:forEach var="item" items="${shoeCategories}">
                <%-- Chèn ảnh đại diện vào làm background --%>
                <div class="cat-card cat-shoes" style="background-image: linear-gradient(to top, rgba(0,0,0,0.4) 0%, rgba(0,0,0,0) 50%), url('${item.avatar}');">
                    <div class="cat-info">
                        <h2>${item.name}</h2>
                        <p>${item.description}</p>
                        <a href="/category/${item.slug}" class="cat-link">
                            Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </c:forEach>
            
            <c:forEach var="item" items="${racketCategories}">
                <div class="cat-card cat-rackets" style="background-image: linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.6)), url('${item.avatar}');">
                    <div class="cat-info">
                        <h2>${item.name}</h2>
                        <p>${item.description}</p>
                        <a href="/category/${item.slug}" class="cat-link">
                            Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

<c:forEach var="item" items="${cateMap}">
    <section class="product-section">
        <div class="section-header">
            <h2 class="section-title">${item.key.name}</h2>
            <div class="slider-controls">
                <button class="slider-btn prev"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="slider-btn next"><i class="fa-solid fa-chevron-right"></i></button>
                <a href="/${item.key.slug}" class="view-all-link">Xem tất cả</a>
            </div>
        </div>
        <div class="product-slider-wrapper">
            <div class="product-slider">
                 <c:forEach var="prod" items="${item.value}">
                <div class="product-card">
                    <div class="badge-new">MỚI</div>
                    <div class="product-img">
                        <a href="/product/${item.key.slug}/${prod.slug}"> 
                            <img src="${prod.avatar}" alt="${prod.name}">
                        </a>
                    </div>
                    <div class="product-info">
                        <div class="rating"><i class="fa-solid fa-star"></i> ${prod.rating} (${prod.reviewCount})</div>
                        <h3 class="product-name">${prod.name}</h3>
                        <div class="product-price">
                            <fmt:formatNumber value="${prod.newPrice}" type="number" pattern="#,###" /> đ
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:forEach>
    <!-- Special Banner -->
    <!-- <section class="promo-banner">
        <div class="promo-content">
            <h2 class="promo-title">YONEX ASTROX 100ZZ<br>PHIÊN BẢN GIỚI HẠN</h2>
            <p>Trải nghiệm sức mạnh bùng nổ từ cây vợt được tin dùng bởi các nhà vô địch thế giới.</p>
            <a href="#" class="btn btn-white">SỞ HỮU NGAY</a>
        </div>
        <div class="promo-img">
            <img src="/images/screen.png" alt="Yonex Astrox 100ZZ">
        </div>
    </section> -->

    <!-- Featured Section: Rackets (Slider Version) -->
<c:forEach var="item" items="${cateMapping}">
    <section class="product-section">
        <div class="section-header">
            <h2 class="section-title">${item.key.name}</h2>
            <div class="slider-controls">
                <button class="slider-btn prev"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="slider-btn next"><i class="fa-solid fa-chevron-right"></i></button>
                <a href="/${item.key.slug}" class="view-all-link">Xem tất cả</a>
            </div>
        </div>
        <div class="product-slider-wrapper">
            <div class="product-slider">
                <c:forEach var="racket" items="${item.value}">
                <div class="product-card">
                    <div class="product-img">
                        <a href="/product/${item.key.slug}/${racket.slug}"> 
                            <img src="${racket.avatar}" alt="${racket.name}">
                        </a>
                    </div>
                    <div class="product-info">
                        <div class="rating"><i class="fa-solid fa-star"></i> ${racket.rating} (${racket.reviewCount})</div>
                        <h3 class="product-name">${racket.name}</h3>
                        <div class="product-price">
                            <fmt:formatNumber value="${racket.newPrice}" type="number" pattern="#,###" /> đ
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:forEach>

    <!-- Info Section -->
    <section class="info-strip">
        <div class="info-item">
            <i class="fa-solid fa-truck-fast"></i>
            <div>
                <h4>Giao Hàng Toàn Quốc</h4>
                <p>Miễn phí cho hóa đơn từ 1.000.000₫</p>
            </div>
        </div>
        <div class="info-item">
            <i class="fa-solid fa-shield-check"></i>
            <div>
                <h4>Chính Hãng 100%</h4>
                <p>Cam kết sản phẩm nhập khẩu chính ngạch</p>
            </div>
        </div>
        <div class="info-item">
            <i class="fa-solid fa-headset"></i>
            <div>
                <h4>Hỗ Trợ 24/7</h4>
                <p>Đội ngũ tư vấn giàu kinh nghiệm</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-brand">
                <h3>ShopVnb Store</h3>
                <p>Hệ thống cửa hàng cầu lông số 1 Việt Nam với hơn 50 chi nhánh trên toàn quốc.</p>
            </div>
            <div class="footer-links">
                <h4>Hỗ Trợ Khách Hàng</h4>
                <ul>
                    <li><a href="/contact">Liên hệ hỗ trợ khách hàng</a></li>
                </ul>
            </div>
            
            <div class="footer-social">
                <h4>Theo Dõi Chúng Tôi</h4>
                <div class="social-icons">
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-youtube"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 ShopVnb Store. The Kinetic Ocean Experience.</p>
        </div>
    </footer>
    
    <script src="/js/client.js"></script>
</body>
</html>