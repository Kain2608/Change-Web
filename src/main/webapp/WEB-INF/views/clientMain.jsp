
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopVnb Store - Giày & Vợt Cầu Lông Chuyên Nghiệp</title>
    <!-- Google Fonts & FontAwesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
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
                <li><a href="#" class="active">Tất cả</a></li>
                <li><a href="#">Giày</a></li>
                <li><a href="#">Vợt</a></li>
                <li><a href="#">Phụ kiện</a></li>
                <li><a href="#">Khuyến mãi</a></li>
                <li><a href="#">Tin tức</a></li>
            </ul>
            <div class="nav-actions">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm sản phẩm...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <div class="icon-btns">
                    <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
                    <a href="#"><i class="fa-solid fa-user"></i></a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero">
        <div class="hero-content">
            <span class="hero-subtitle">Bứt phá giới hạn</span>
            <h1 class="hero-title">NÂNG TẦM<br>HIỆU SUẤT</h1>
            <p class="hero-desc">Khám phá bộ sưu tập dụng cụ cầu lông chuyên nghiệp. Từ những đôi giày tốc độ đến những cây vợt đầy uy lực.</p>
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

            <div class="cat-card cat-shoes">
                <div class="cat-info">
                    <h2>Giày Thể Thao</h2>
                    <p>Công nghệ đệm Power Cushion+ êm ái tối đa.</p>
                    <a href="#" class="cat-link">
                        Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="cat-card cat-rackets">
                <div class="cat-info">
                    <h2>Vợt Cầu Lông</h2>
                    <p>Uy lực và kiểm soát tuyệt đối.</p>
                    <a href="#" class="cat-link">
                        Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="cat-card cat-accessories">
                <div class="cat-info">
                    <h2>Phụ Kiện</h2>
                    <p>Đầy đủ trang bị cho mọi trận đấu.</p>
                    <a href="#" class="cat-link">
                        Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>

        </div>
    </div>

</section>


    <section class="product-section">
        <div class="section-header">
            <h2 class="section-title">Giày Thể Thao</h2>
            <div class="slider-controls">
                <button class="slider-btn prev"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="slider-btn next"><i class="fa-solid fa-chevron-right"></i></button>
                <a href="#" class="view-all-link">Xem thêm</a>
            </div>
        </div>
        <div class="product-slider-wrapper">
            <div class="product-slider">
                <!-- Product Card 1 -->
                <div class="product-card">
                    <div class="badge-new">MỚI</div>
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400" alt="Yonex Power Cushion">
                    </div>
                    <div class="product-info">
                        <div class="rating"><i class="fa-solid fa-star"></i> 4.9 (120)</div>
                        <h3 class="product-name">Yonex Power Cushion 65Z3</h3>
                        <div class="product-price">3.250.000₫</div>
                    </div>
                </div>
                <!-- Product Card 2 -->
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400" alt="Victor P9200II">
                    </div>
                    <div class="product-info">
                        <div class="rating"><i class="fa-solid fa-star"></i> 4.8 (85)</div>
                        <h3 class="product-name">Victor P9200II Blue</h3>
                        <div class="product-price">2.890.000₫</div>
                    </div>
                </div>
                <!-- Product Card 3 -->
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400" alt="Lining Blade">
                    </div>
                    <div class="product-info">
                        <div class="rating"><i class="fa-solid fa-star"></i> 5.0 (42)</div>
                        <h3 class="product-name">Lining Blade DF-01</h3>
                        <div class="product-price">1.650.000₫</div>
                    </div>
                </div>
                <!-- Product Card 4 -->
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=400" alt="Mizuno Wave Claw">
                    </div>
                    <div class="product-info">
                        <div class="rating"><i class="fa-solid fa-star"></i> 4.7 (210)</div>
                        <h3 class="product-name">Mizuno Wave Claw 2</h3>
                        <div class="product-price">2.450.000₫</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Special Banner -->
    <section class="promo-banner">
        <div class="promo-content">
            <h2 class="promo-title">YONEX ASTROX 100ZZ<br>PHIÊN BẢN GIỚI HẠN</h2>
            <p>Trải nghiệm sức mạnh bùng nổ từ cây vợt được tin dùng bởi các nhà vô địch thế giới.</p>
            <a href="#" class="btn btn-white">SỞ HỮU NGAY</a>
        </div>
        <div class="promo-img">
            <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=800" alt="Yonex Astrox 100ZZ">
        </div>
    </section>

    <!-- Featured Section: Rackets (Slider Version) -->
    <section class="product-section">
        <div class="section-header">
            <h2 class="section-title">Vợt Cầu Lông</h2>
            <div class="slider-controls">
                <button class="slider-btn prev"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="slider-btn next"><i class="fa-solid fa-chevron-right"></i></button>
                <a href="#" class="view-all-link">Xem tất cả</a>
            </div>
        </div>
        <div class="product-slider-wrapper">
            <div class="product-slider">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Astrox 88D Pro">
                    </div>
                    <div class="product-info">
                        <h3 class="product-name">Yonex Astrox 88D Pro</h3>
                        <div class="product-price">4.150.000₫</div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Thruster Ryuga">
                    </div>
                    <div class="product-info">
                        <h3 class="product-name">Victor Thruster Ryuga II</h3>
                        <div class="product-price">3.850.000₫</div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Aeronaut 9000C">
                    </div>
                    <div class="product-info">
                        <h3 class="product-name">Lining Aeronaut 9000C</h3>
                        <div class="product-price">4.500.000₫</div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://images.unsplash.com/photo-1626225967045-2c3606624644?w=400" alt="Nanoflare 800">
                    </div>
                    <div class="product-info">
                        <h3 class="product-name">Yonex Nanoflare 800</h3>
                        <div class="product-price">3.950.000₫</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
                    <li><a href="#">Hướng dẫn chọn vợt</a></li>
                    <li><a href="#">Chính sách đổi trả</a></li>
                    <li><a href="#">Hệ thống cửa hàng</a></li>
                </ul>
            </div>
            <div class="footer-links">
                <h4>Thông Tin</h4>
                <ul>
                    <li><a href="#">Liên hệ hỗ trợ</a></li>
                    <li><a href="#">Điều khoản dịch vụ</a></li>
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
</body>
</html>