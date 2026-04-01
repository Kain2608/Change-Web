<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SportStore - <%= request.getParameter("name") != null ? request.getParameter("name") : "Chi Tiết Sản Phẩm" %></title>
    
    <link rel="stylesheet" href="css/client.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <!-- Header -->
    <header>
        <div class="top-bar">
            <div class="container">
                <p>🚚 Miễn phí vận chuyển cho đơn hàng từ 500.000đ | Hotline: 0123 456 789</p>
            </div>
        </div>
        
        <nav class="navbar">
            <div class="container">
                <div class="logo">
                    <h1><a href="index.jsp">Sport<span>Store</span></a></h1>
                </div>
                <div class="search-bar">
                    <input type="text" id="searchInput" placeholder="Tìm kiếm sản phẩm...">
                    <button onclick="searchProduct()"><i class="fas fa-search"></i></button>
                </div>
                <div class="nav-icons">
                    <a href="index.jsp" class="icon-link"><i class="fas fa-home"></i></a>
                    <a href="#" class="icon-link cart-icon" onclick="viewCart()">
                        <i class="fas fa-shopping-cart"></i>
                        <span class="cart-count" id="cartCount">0</span>
                    </a>
                </div>
            </div>
        </nav>
    </header>

    <!-- Breadcrumb -->
    <div class="breadcrumb">
        <div class="container">
            <a href="index.jsp">Trang chủ</a> &gt; 
            <span id="breadcrumbCategory">Vợt cầu lông</span>
        </div>
    </div>

    <section class="product-detail">
        <div class="container">
            <div class="product-detail-grid">
                
                <!-- Hình ảnh -->
                <div class="product-images">
                    <div class="main-image">
                        <img id="mainImg" 
                             src="https://source.unsplash.com/800x800/?yonex,astrox" 
                             alt="Yonex Astrox 100 ZZ">
                    </div>
                </div>

                <!-- Thông tin sản phẩm -->
                <div class="product-info-detail">
                    <div class="brand">YONEX</div>
                    <h1 class="product-title">Yonex Astrox 100 ZZ</h1>
                    
                    <div class="rating-detail">
                        ★★★★☆ <span>(87 đánh giá)</span>
                    </div>

                    <div class="price-box">
                        <span class="current-price">2.450.000 ₫</span>
                        <span class="original-price">2.890.000 ₫</span>
                    </div>

                    <div class="stock-status">
                        <i class="fas fa-check-circle"></i> Còn hàng: 35 sản phẩm
                    </div>

                    <!-- Thông số kỹ thuật - Fix cứng cho Vợt -->
                    <div class="specific-info">
                        <h3>Thông số kỹ thuật</h3>
                        <p><strong>Trọng lượng:</strong> 4U</p>
                        <p><strong>Điểm cân bằng:</strong> Head Heavy</p>
                        <p><strong>Độ cứng:</strong> Stiff</p>
                        <p><strong>Dòng sản phẩm:</strong> Vợt cầu lông</p>
                    </div>

                    <!-- Mô tả -->
                    <div class="short-desc">
                        <h3>Mô tả sản phẩm</h3>
                        <p>Yonex Astrox 100 ZZ là cây vợt tấn công mạnh mẽ với công nghệ Rotational Generator System giúp tăng tốc độ vung vợt và sức mạnh smash.</p>
                    </div>

                    <!-- Nút hành động -->
                    <div class="action-buttons">
                        <button class="btn-add-cart" onclick="addToCartDetail()">
                            <i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
                        </button>
                        <button class="btn-buy-now" onclick="buyNow()">
                            Mua ngay
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-col">
                    <h3>SportStore</h3>
                    <p>Cửa hàng đồ thể thao uy tín</p>
                </div>
                <div class="footer-col">
                    <h4>Liên hệ</h4>
                    <p>Hotline: 0123 456 789</p>
                    <p>Email: support@sportstore.vn</p>
                </div>
            </div>
            <div class="copyright">© 2026 SportStore. All rights reserved.</div>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>