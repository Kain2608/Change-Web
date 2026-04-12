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
    <form action="<c:url value='/tat-ca-san-pham'/>" method="GET">
        
        <div class="velocity-filter-group">
            <h3 class="velocity-filter-title">Sắp xếp theo</h3>
            <select name="sort" class="velocity-filter-select" onchange="this.form.submit()">
                <option value="newest" ${param.sort == 'newest' ? 'selected' : ''}>Mới nhất</option>
                <option value="priceAsc" ${param.sort == 'priceAsc' ? 'selected' : ''}>Giá: Thấp đến cao</option>
                <option value="priceDesc" ${param.sort == 'priceDesc' ? 'selected' : ''}>Giá: Cao xuống thấp</option>
            </select>
        </div>

        <div class="velocity-filter-group">
            <h3 class="velocity-filter-title">Trạng thái</h3>
            <label class="velocity-checkbox-item">
                <input type="checkbox" name="stt" value="new" onchange="this.form.submit()"
                    <c:forEach items="${paramValues.stt}" var="s">
                        <c:if test="${s == 'new'}">checked</c:if>
                    </c:forEach>> Hàng mới về
            </label>
            <label class="velocity-checkbox-item">
                <input type="checkbox" name="stt" value="sales" onchange="this.form.submit()"
                    <c:forEach items="${paramValues.stt}" var="s">
                        <c:if test="${s == 'sales'}">checked</c:if>
                    </c:forEach>> Đang khuyến mãi
            </label>
        </div>

        <div class="velocity-filter-group">
            <h3 class="velocity-filter-title">Danh mục</h3>
            <c:forEach items="${allCategories}" var="cat">
                <label class="velocity-checkbox-item">
                    <input type="checkbox" name="cateIds" value="${cat.id}" onchange="this.form.submit()"
                        <c:forEach items="${paramValues.cateIds}" var="pId">
                            <c:if test="${pId == cat.id.toString()}">checked</c:if>
                        </c:forEach>> ${cat.name}
                </label>
            </c:forEach>
        </div>

        <div class="velocity-filter-group">
    <h3 class="velocity-filter-title">Thương hiệu</h3>
    <c:forEach items="${brands}" var="brand">
        <label class="velocity-checkbox-item">
            <%-- name="brandIds" phải khớp chính xác với biến List trong Java --%>
            <input type="checkbox" name="brandIds" value="${brand.id}" onchange="this.form.submit()"
                <c:forEach items="${paramValues.brandIds}" var="bId">
                    <c:if test="${bId == brand.id.toString()}">checked</c:if>
                </c:forEach>> ${brand.name}
        </label>
    </c:forEach>
</div>

        <div style="margin-top: 20px; text-align: center;">
            <a href="<c:url value='/tat-ca-san-pham'/>" style="text-decoration: none; color: #d0021b; font-size: 13px;">
                <i class="fa-solid fa-rotate-right"></i> Làm mới bộ lọc
            </a>
        </div>
    </form>
</aside>

        <main class="velocity-main-content">
           <div class="velocity-catalog-grid">
                <c:forEach var="prod" items="${listProduct}">
                    <div class="velocity-card-box">
                        <div class="velocity-card">
                            <div class="velocity-card-img">
                                <a href="<c:url value='/product-detail/${prod.id}'/>">
                                    <img src="${prod.avatar}" alt="${prod.name}">
                                </a>
                            </div>
                        </div>
                        <div class="velocity-card-info">
                            <h3 class="velocity-product-name">${prod.name}</h3>
                            <div class="velocity-product-price">
                                <fmt:formatNumber value="${prod.price}" type="number" pattern="#,###" /> VNĐ
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
                <a href="#">Về chúng tôi</a>
                <a href="#">Chính sách giao hàng</a>
                <a href="#">Hệ thống cửa hàng</a>
                <a href="#">Liên hệ hỗ trợ</a>
            </div>
        </div>
    </footer>

    <script src="<c:url value='/js/client.js'/>"></script>
</body>
</html>