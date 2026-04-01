<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>403 Forbidden - Truy cập bị từ chối</title>
     <%@ include file="/WEB-INF/views/layout/default.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <%@ include file="/WEB-INF/views/layout/sider.jsp" %>
    
    <div class="sider-overlay"></div>

    <main class="main">
        <div class="error-container" style="display: flex; justify-content: center; align-items: center; min-height: 70vh;">
            <div class="error-card" style="text-align: center; background: #fff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                <div class="error-icon-wrapper">
                    <h1 class="error-code" style="font-size: 80px; color: #e74c3c; margin: 0;">403</h1>
                    <div class="accent-line" style="height: 4px; width: 60px; background: #e74c3c; margin: 10px auto;"></div>
                </div>
                
                <h2 class="error-title" style="margin-top: 20px;">TRUY CẬP BỊ TỪ CHỐI</h2>
                <p class="error-desc" style="color: #666; max-width: 400px; margin: 15px auto;">
                    Tài khoản của bạn không có đủ quyền hạn để truy cập vào trang này. 
                    Vui lòng liên hệ quản trị viên nếu bạn cho rằng đây là một sai sót.
                </p>

                <div class="actions" style="margin-top: 30px;">
                    <a href="/admin/dashboard" class="btn-primary" style="text-decoration: none; padding: 10px 20px; background: #3498db; color: #fff; border-radius: 5px; display: inline-block;">
                        <i class="fa-solid fa-house"></i> Về Dashboard
                    </a>
                    <button onclick="history.back()" style="margin-left: 10px; padding: 10px 20px; cursor: pointer; border: 1px solid #ccc; border-radius: 5px; background: #f9f9f9;">
                        <i class="fa-solid fa-arrow-left"></i> Quay lại
                    </button>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>

    <c:if test="${not empty error}">
        <script>
            toastr.error("${error}");
        </script>
    </c:if>
</body>
</html>