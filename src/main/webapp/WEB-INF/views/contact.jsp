<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Liên hệ</title>
    <link rel="stylesheet" href="/css/client.css" />
</head>
<body>

<div class="ct-page">
    <div class="ct-bg-shape"></div>
    <div class="ct-bg-shape2"></div>

    <div class="ct-container">

        <!-- Header -->
        <div class="ct-header">
            <div class="ct-eyebrow">
                <div class="ct-eyebrow-line"></div>
                <span class="ct-eyebrow-text">Liên hệ với chúng tôi</span>
                <div class="ct-eyebrow-line"></div>
            </div>
            <h1 class="ct-title">Hãy cùng<br><em>nói chuyện</em></h1>
            <p class="ct-subtitle">Điền thông tin bên dưới — chúng tôi sẽ<br>liên hệ lại trong vòng 24 giờ.</p>
        </div>

        <!-- Card -->
        <div class="ct-card" id="ct-card">

            <!-- Form -->
            <div id="ct-form-content">
                <form id="contactForm" action="/contact" method="post">
                    
                    <div class="ct-row">
                        <div class="ct-field">
                            <label for="name">Họ và tên <span class="ct-required">*</span></label>
                            <input type="text" id="name" name="name" placeholder="Nguyễn Văn A" required>
                        </div>
                        <div class="ct-field">
                            <label for="email">Email <span class="ct-required">*</span></label>
                            <input type="email" id="email" name="email" placeholder="example@gmail.com" required>
                        </div>
                    </div>

                    <div class="ct-field">
                        <label for="address">Địa chỉ</label>
                        <input type="text" id="address" name="address" placeholder="Số 1, Võ Văn Ngân, Thủ Đức...">
                    </div>

                    <div class="ct-field" style="margin-bottom: 0;">
                        <label for="message">Nội dung tin nhắn <span class="ct-required">*</span></label>
                        <textarea id="message" name="message" placeholder="Chia sẻ với chúng tôi điều bạn cần..." required></textarea>
                    </div>

                    <button type="submit" class="ct-submit-btn">
                        Gửi tin nhắn <span class="ct-arrow">&#8594;</span>
                    </button>

                </form>
            </div>

            <!-- Success State -->
            <div class="ct-success-overlay" id="ct-success">
                <div class="ct-check-circle">&#10003;</div>
                <div class="ct-success-title">Đã gửi thành công!</div>
                <p class="ct-success-sub">Cảm ơn bạn đã liên hệ.<br>Chúng tôi sẽ phản hồi sớm nhất có thể.</p>
            </div>

        </div>

        <p class="ct-footer-note">Thông tin của bạn được bảo mật tuyệt đối.</p>
    </div>
</div>

<script src="/js/script.js"></script>

</body>
</html>
