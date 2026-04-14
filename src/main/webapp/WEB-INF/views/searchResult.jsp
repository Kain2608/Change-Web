<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm cho "Vợt cầu lông Yonex" - ShopVnb Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="/css/client.css">
</head>
<body class="search-page-body">
    
    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="brand-logo">ShopVnb<span>Store</span></a>
            <ul class="nav-links">
                <li><a href="#" class="active">Tất cả</a></li>
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
                    <c:choose>
                        <c:when test="${not empty sessionScope.clientUser}">
                            <div class="user-profile">
                                <i class="fa-solid fa-user"></i>
                                <span class="user-name">${sessionScope.clientUser.fullName}</span>
                                <a href="<c:url value='/client/logout'/>" class="logout-btn">
                                    <i class="fa-solid fa-right-from-bracket"></i>
                                    <span>Đăng xuất</span>
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/client/login'/>"><i class="fa-solid fa-user"></i></a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <main class="search-layout-container">
        <div class="search-main-content">
            <header class="search-header-info">
                <div>
                    <h1 class="search-result-title">Kết quả cho <span>"Vợt cầu lông Yonex"</span></h1>
                    <p class="search-count">Tìm thấy <strong>4</strong> sản phẩm phù hợp</p>
                </div>

                <div class="search-sort-bar">
                    <span class="sort-label">SẮP XẾP:</span>
                    <div class="sort-options">
                        <button class="sort-btn active">Mới nhất</button>
                        <button class="sort-btn">Giá thấp đến cao</button>
                        <button class="sort-btn">Giá cao đến thấp</button>
                    </div>
                </div>
            </header>

            <div class="search-product-grid">
                
                <div class="search-card">
                    <div class="search-card-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Astrox 99 Pro">
                    </div>
                    <div class="search-card-info">
                        <h3 class="card-prod-name">Vợt Cầu Lông Yonex Astrox 99 Pro</h3>
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 4.8 (120)</div>
                        <div class="card-price">3.500.000 đ</div>
                    </div>
                </div>
                
                <div class="search-card">
                    <div class="search-card-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Nanoflare 800">
                    </div>
                    <div class="search-card-info">
                        <h3 class="card-prod-name">Vợt Cầu Lông Yonex Nanoflare 800</h3>
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 4.9 (85)</div>
                        <div class="card-price">3.200.000 đ</div>
                    </div>
                </div>
                
                <div class="search-card">
                    <div class="search-card-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Arcsaber 11 Pro">
                    </div>
                    <div class="search-card-info">
                        <h3 class="card-prod-name">Vợt Cầu Lông Yonex Arcsaber 11 Pro</h3>
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 5.0 (200)</div>
                        <div class="card-price">3.800.000 đ</div>
                    </div>
                </div>
                
                <div class="search-card">
                    <div class="search-card-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Voltric Z-Force II">
                    </div>
                    <div class="search-card-info">
                        <h3 class="card-prod-name">Vợt Cầu Lông Yonex Voltric Z-Force II</h3>
                        <div class="card-rating"><i class="fa-solid fa-star"></i> 4.7 (150)</div>
                        <div class="card-price">2.900.000 đ</div>
                    </div>
                </div>

            </div>

            <div class="search-pagination">
                <button class="page-arrow"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="page-num active">1</button>
                <button class="page-num">2</button>
                <button class="page-num">3</button>
                <button class="page-arrow"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-brand">
                <h3>ShopVnb Store</h3>
                <p>Hệ thống cửa hàng số 1 Việt Nam với hơn 50 chi nhánh trên toàn quốc.</p>
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