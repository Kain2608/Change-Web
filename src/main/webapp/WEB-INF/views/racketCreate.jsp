<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tạo vợt cầu lông</title>
    <%@ include file="/WEB-INF/views/layout/default.jsp" %>
</head>
<body>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<%@ include file="/WEB-INF/views/layout/sider.jsp" %>

<div class="sider-overlay"></div>

<main class="main">
    <h1 class="box-title">Tạo vợt cầu lông</h1>

    <div class="section-8">
        <form id="racket-create-form" method="post" action="<c:url value='/admin/product/racket-create'/>" enctype="multipart/form-data">

            <div class="inner-group">
                <label class="inner-label" for="name">Tên vợt</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="inner-group">
                <label class="inner-label" for="categoryId">Danh mục</label>
                <select id="categoryId" name="category.id">
                    <option value="">-- Chọn danh mục --</option>
                    <c:forEach items="${categories}" var="cat">
                        <option value="${cat.id}">${cat.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="inner-group">
                <label for="brandId" class="inner-label">Thương hiệu</label>
                <select name="brand.id" id="brandId">
                    <option value="">-- Chọn thương hiệu --</option>
                    <c:forEach items="${brands}" var="b">
                        <option value="${b.id}">${b.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="inner-group">
                <label class="inner-label">Trạng thái</label>
                <select name="status" id="status">
                    <option value="active">Còn hàng</option>
                    <option value="inactive">Hết hàng</option>
                    <option value="new">Mới</option>
                    <option value="sales">Hàng khuyến mãi</option>
            </select>
            </div>

            <div class="inner-group">
                <label class="inner-label" for="price">Giá gốc</label>
                <input type="number" id="price" name="price" value="0">
            </div>

            <div class="inner-group">
                <label class="inner-label" for="newPrice">Giá mới</label>
                <input type="number" id="newPrice" name="newPrice" value="0">
            </div>

            <div class="inner-group">
                <label class="inner-label" for="stock">Số lượng tồn kho</label>
                <input type="number" id="stock" name="stock" value="0">
            </div>

            <div class="inner-group">
                <label class="inner-label" for="weight">Trọng lượng</label>
                <input type="text" id="weight" name="weight" placeholder="vd: 3U, 4U">
            </div>

            <div class="inner-group">
                <label class="inner-label" for="tension">Mức căng tối đa</label>
                <input type="text" id="tension" name="tension" placeholder="vd: 30 Lbs">
            </div>

            <div class="inner-group">
                <label class="inner-label" for="stiffness">Độ cứng</label>
                <select id="stiffness" name="stiffness">
                    <option value="Stiff">Cứng</option>
                    <option value="Medium">Trung bình</option>
                    <option value="Flexible">Dẻo</option>
                </select>
            </div>

            <div class="inner-group">
                <label class="inner-label" for="balancePoint">Điểm cân bằng</label>
                <select id="balancePoint" name="balancePoint">
                    <option value="Head Heavy">Công (Nặng đầu)</option>
                    <option value="Head Light">Thủ (Nhẹ đầu)</option>
                    <option value="Even Balance">Cân bằng</option>
                </select>
            </div>

            <div class="inner-group">
                <label class="inner-label" for="length">Chiều dài</label>
                <input type="text" id="length" name="length" >
            </div>

            <div class="inner-group inner-two-col">
                <label class="inner-label" for="avatar">Ảnh đại diện</label>
                <div class="inner-upload-image">
                    <input type="file" id="avatar" accept="image/*" filepond-image name="avatar">
                </div>
            </div>

            <div class="inner-group inner-two-col">
                <label class="inner-label" for="description">Mô tả</label>
                <textarea id="description" textarea-mce name="description"></textarea>
            </div>

            <div class="inner-button inner-two-col">
                <button type="submit">Tạo vợt</button>
            </div>

        </form>
        <div class="inner-back"><a href="/admin/product/list">Quay lại danh sách</a></div>
    </div>
</main>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

</body>
</html>