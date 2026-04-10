<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tổng quan</title>

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/filepond@^4/dist/filepond.css">
    <link rel="stylesheet" href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <script src="https://cdn.tiny.cloud/1/2jjjif4o7p3z3f8twez7gac93qamazyt9cg88jwfncgtc8rr/tinymce/8/tinymce.min.js"></script>
    <script src="<c:url value='/js/tinymce-config.js'/>"></script>

<body>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sider.jsp" %>
<div class="sider-overlay"></div>

<main class="main">
    <h1 class="box-title">Tổng quan</h1>

    <div class="section-1">
        <div class="inner-item">
            <div class="inner-icon">
                <img src="<c:url value='/images/section-1-icon-1.svg'/>">
            </div>
            <div class="inner-content">
                <div class="inner-title">Người dùng</div>
                <div class="inner-number">1.200</div>
            </div>
        </div>

        <div class="inner-item">
            <div class="inner-icon">
                <img src="<c:url value='/images/section-1-icon-2.svg'/>">
            </div>
            <div class="inner-content">
                <div class="inner-title">Đơn hàng</div>
                <div class="inner-number">3.600</div>
            </div>
        </div>

        <div class="inner-item">
            <div class="inner-icon">
                <img src="<c:url value='/images/section-1-icon-3.svg'/>">
            </div>
            <div class="inner-content">
                <div class="inner-title">Doanh thu</div>
                <div class="inner-number">300.000.000đ</div>
            </div>
        </div>
    </div>
    <c:if test="${not empty error}">
      <script>
        toastr.error("${error}");
      </script>
    </c:if>
    <c:if test="${not empty success}">
      <script>
        toastr.success("${success}");
      </script>
    </c:if>

</main>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>