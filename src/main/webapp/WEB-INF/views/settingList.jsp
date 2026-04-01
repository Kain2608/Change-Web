<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cài đặt chung | Admin</title>
    
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
            <span class="current">Cài đặt chung</span>
        </nav>

        <h1 class="box-title">Cài đặt chung</h1>

        <div class="section-9">
            <a class="inner-item" href="/admin/setting/website">
                <div class="inner-icon"><i class="fa-solid fa-info"></i></div>
                <div class="inner-text">Thông tin website</div>
            </a>
            
            <a class="inner-item" href="/admin/setting/accounts">
                <div class="inner-icon"><i class="fa-solid fa-user-tie"></i></div>
                <div class="inner-text">Tài khoản quản trị</div>
            </a>
            
            <a class="inner-item" href="/admin/setting/role/list">
                <div class="inner-icon"><i class="fa-solid fa-user-gear"></i></div>
                <div class="inner-text">Nhóm quyền</div>
            </a>
        </div>
    </main>

    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
    
</body>
</html>