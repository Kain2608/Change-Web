<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tất cả sản phẩm - ShopVnb Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/css/client.css'/>">
</head>
<body class="velocity-body">

    <nav class="navbar">
        <div class="nav-container">
            <a href="/" class="brand-logo">ShopVnb<span>Store</span></a>
            <ul class="nav-links">
                <li><a href="/" class="active">Tất cả</a></li>
                <li><a href="#">Giày</a></li>
                <li><a href="#">Vợt</a></li>
                <li><a href="#">Khuyến mãi</a></li>
            </ul>
            <div class="nav-actions">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <div class="icon-btns">
                    <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
                    <a href="#"><i class="fa-solid fa-user"></i></a>
                </div>
            </div>
        </div>
    </nav>

    <header class="velocity-page-header">
        <h1 class="velocity-main-title">THE KINETIC COLLECTION</h1>
        <p class="velocity-subtitle">Engineered for elite performance. Experience the fusion of oceanic fluidity and high-velocity power.</p>
    </header>

    <div class="velocity-catalog-layout">
        
        <aside class="velocity-sidebar">
            <div class="velocity-filter-group">
                <h3 class="velocity-filter-title">Sort By</h3>
                <select class="velocity-filter-select">
                    <option>Latest Arrivals</option>
                    <option>Price: Low to High</option>
                    <option>Price: High to Low</option>
                </select>
            </div>

            <div class="velocity-filter-group">
                <h3 class="velocity-filter-title">Category</h3>
                <label class="velocity-checkbox-item"><input type="checkbox"> Badminton Shoes</label>
                <label class="velocity-checkbox-item"><input type="checkbox"> Pro Rackets</label>
            </div>

            <div class="velocity-filter-group">
                <h3 class="velocity-filter-title">Brand</h3>
                <label class="velocity-checkbox-item"><input type="checkbox"> Yonex</label>
                <label class="velocity-checkbox-item"><input type="checkbox"> Victor</label>
                <label class="velocity-checkbox-item"><input type="checkbox"> Lining</label>
            </div>

            <div class="velocity-filter-group">
                <h3 class="velocity-filter-title">Price Range</h3>
                <input type="range" style="width: 100%; accent-color: var(--velocity-primary);" min="50" max="500">
                <div style="display: flex; justify-content: space-between; font-size: 0.8rem; margin-top: 10px; color: var(--velocity-text-light);">
                    <span>$50</span>
                    <span>$500+</span>
                </div>
            </div>
        </aside>

        <main class="velocity-main-content">
            <div class="velocity-catalog-grid">
                
                <div class="velocity-card-box">
                    <div class="velocity-card">
                        
                        <c:if test="${prod.status == 'new'}">
                            <div class="velocity-card-badge velocity-badge-blue">NEW EVOLUTION</div>
                        </c:if>
                        <c:if test="${prod.status == 'pro'}">
                            <div class="velocity-card-badge velocity-badge-purple">PRO CHOICE</div>
                        </c:if>

                        <div class="velocity-card-img">
                            <img src="${prod.avatar}" alt="${prod.name}">
                        </div>
                    </div>
                    
                    <div class="velocity-card-info">
                        <div class="velocity-card-header">
                            <h3 class="velocity-product-name">${prod.name}</h3>
                            <span class="velocity-rating"><i class="fa-solid fa-star"></i> ${prod.getRandomRating()}</span>
                        </div>
                        <p class="velocity-product-desc">${prod.description}</p>
                        <div class="velocity-product-price">
                             <fmt:formatNumber value="${prod.newPrice}" type="number" pattern="#,###" /> đ
                        </div>
                    </div>
                </div>
                </div>

            <div class="velocity-pagination">
                <button class="velocity-page-btn"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="velocity-page-btn velocity-active">1</button>
                <button class="velocity-page-btn">2</button>
                <button class="velocity-page-btn">3</button>
                <button class="velocity-page-btn"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
        </main>
    </div>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-brand">
                <h3>ShopVnb Store</h3>
                <p>© 2024 ShopVnb Store. The Kinetic Ocean Experience.</p>
            </div>
            <div class="velocity-footer-links">
                <a href="#">About Us</a>
                <a href="#">Shipping Policy</a>
                <a href="#">Store Locator</a>
                <a href="#">Contact Support</a>
            </div>
        </div>
    </footer>

    <script src="<c:url value='/js/client.js'/>"></script>
</body>
</html>