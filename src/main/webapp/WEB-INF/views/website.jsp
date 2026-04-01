<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin website | Admin</title>
    <%@ include file="/WEB-INF/views/layout/default.jsp" %>
</head>
<body>

    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <%@ include file="/WEB-INF/views/layout/sider.jsp" %>

    <div class="sider-overlay"></div>

    <main class="main">
        <nav class="breadcrumb">
            <a href="/admin/dashboard"><i class="fa-solid fa-house"></i></a>
            <span class="sep"><i class="fa-solid fa-chevron-right"></i></span>
            <a href="/admin/settings">Cài đặt chung</a>
            <span class="sep"><i class="fa-solid fa-chevron-right"></i></span>
            <span class="current">Thông tin website</span>
        </nav>

        <h1 class="box-title">Thông tin website</h1>

        <div class="section-8">
            <form id="setting-website-info-form" 
                  method="POST" 
                  action="/admin/settings/website/update" 
                  enctype="multipart/form-data">
                
                <div class="inner-group">
                    <label class="inner-label" for="websiteName">Tên website</label>
                    <input type="text" id="websiteName" name="websiteName" 
                           value="${not empty settings.websiteName ? settings.websiteName : ''}">
                </div>

                <div class="inner-group">
                    <label class="inner-label" for="phone">Số điện thoại</label>
                    <input type="text" id="phone" name="phone" 
                           value="${not empty settings.phone ? settings.phone : ''}">
                </div>

                <div class="inner-group">
                    <label class="inner-label" for="email">Email</label>
                    <input type="text" id="email" name="email" 
                           value="${not empty settings.email ? settings.email : ''}">
                </div>

                <div class="inner-group">
                    <label class="inner-label" for="address">Địa chỉ</label>
                    <input type="text" id="address" name="address" 
                           value="${not empty settings.address ? settings.address : ''}">
                </div>

                <div class="inner-group" image-default="${settings.logo}">
                    <label class="inner-label" for="logo">Logo</label>
                    <div class="inner-upload-image">
                        <input type="file" id="logo" accept="image/*" filepond-image name="logo">
                    </div>
                </div>

                <div class="inner-group" image-default="${settings.favicon}">
                    <label class="inner-label" for="favicon">Favicon</label>
                    <div class="inner-upload-image">
                        <input type="file" id="favicon" accept="image/*" filepond-image name="favicon">
                    </div>
                </div>

                <div class="inner-button inner-two-col">
                    <button type="submit" class="btn-primary">
                        <i class="fa-solid fa-rotate"></i> Cập nhật
                    </button>
                </div>
            </form>
            <div class="inner-back">
                <a href="/admin/setting/list"><i class="fa-solid fa-arrow-left"></i> Quay lại danh sách</a>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>

</body>
</html>