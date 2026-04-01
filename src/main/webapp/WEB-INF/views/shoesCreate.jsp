<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tạo giày cầu lông - Admin</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  
  <link rel="stylesheet" href="https://unpkg.com/filepond@^4/dist/filepond.css">
  <link rel="stylesheet" href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
  
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  
  <script src="https://cdn.tiny.cloud/1/vmvrvx4s91ngnwxk4xwccnt0e8p93eqwn9ld96cu2xb9nkpd/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
  <script src="<c:url value='/js/tinymce-config.js'/>"></script>
</head>
<body>

<header class="header">
  <div class="inner-logo"><a href="#"><span>28</span><span>Admin</span></a></div>
  <div class="inner-wrap">
    <div class="inner-notify"><img src="<c:url value='/images/icon-bell.svg'/>" alt=""><span>6</span></div>
    <div class="inner-account">
      <div class="inner-avatar"><img src="<c:url value='/images/avatar.jpg'/>" alt=""></div>
      <div class="inner-text">
        <div class="inner-name">Admin</div>
        <div class="inner-role">Quản trị viên</div>
      </div>
    </div>
    <button class="inner-button-menu"><i class="fa-solid fa-bars"></i></button>
  </div>
</header>

<nav class="sider">
  <ul class="inner-menu">
    <li><a href="#"><i class="fa-solid fa-gauge-high"></i> Tổng quan</a></li>
    <li><a href="/admin/category/list"><i class="fa-solid fa-table-cells-large"></i> Quản lý danh mục</a></li>
    <li><a class="active" href="/admin/product/list"><i class="fa-solid fa-table-list"></i> Quản lý sản phẩm</a></li>
    <li><a href="#"><i class="fa-solid fa-list-check"></i> Quản lý đơn hàng</a></li>
    <li><a href="#"><i class="fa-solid fa-user"></i> Quản lý người dùng</a></li>
  </ul>
  <hr>
  <ul class="inner-menu">
    <li><a href="#"><i class="fa-solid fa-gear"></i> Cài đặt hệ thống</a></li>
    <li><a class="inner-logout" href="/admin/logout"><i class="fa-solid fa-power-off"></i> Đăng xuất</a></li>
  </ul>
</nav>

<div class="sider-overlay"></div>

<main class="main">
  <h1 class="box-title">Tạo giày cầu lông mới</h1>
  
  <div class="section-8">
    <form id="shoes-create-form" method="post" action="/admin/product/shoes-create" enctype="multipart/form-data">
      
      <div class="inner-group">
        <label class="inner-label" for="name">Tên giày</label>
        <input type="text" id="name" name="name" placeholder="VD: Giày Cầu Lông Yonex 65Z3">
      </div>
      
      <div class="inner-group">
        <label class="inner-label" for="categoryId">Danh mục</label>
        <select id="categoryId" name="categoryId">
          <option value="">-- Chọn danh mục --</option>
          <c:forEach items="${categories}" var="cat">
            <option value="${cat.id}">${cat.name}</option>
          </c:forEach>
        </select>
      </div>

      <div class="inner-group">
        <label class="inner-label" for="brandId">Thương hiệu</label>
        <select id="brandId" name="brandId">
          <option value="">-- Chọn thương hiệu --</option>
          <c:forEach items="${brands}" var="b">
            <option value="${b.id}">${b.name}</option>
          </c:forEach>
        </select>
      </div>

      <div class="inner-group">
        <label class="inner-label" for="target">Đối tượng</label>
        <select id="target" name="target">
          <option value="Nam">Nam</option>
          <option value="Nu">Nữ</option>
          <option value="Unisex">Unisex</option>
        </select>
      </div>

      <div class="inner-group">
        <label class="inner-label" for="price">Giá gốc (đ)</label>
        <input type="number" id="price" name="price" value="0">
      </div>

      <div class="inner-group">
        <label class="inner-label" for="newPrice">Giá khuyến mãi (đ)</label>
        <input type="number" id="newPrice" name="newPrice" value="0">
      </div>

      <div class="inner-group inner-two-col">
        <div class="inner-schedule section-8">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
            <label class="inner-label" style="margin-bottom: 0;">Quản lý Size & Màu sắc</label>
            <button type="button" class="inner-schedule-create" style="padding: 6px 12px; background: #28a745; color: white; border: none; cursor: pointer; border-radius: 4px;">
              <i class="fa-solid fa-plus"></i> Thêm biến thể
            </button>
          </div>
          
          <div class="inner-schedule-list">
            <div class="inner-schedule-item" style="border: 1px solid #ddd; padding: 15px; margin-bottom: 10px; border-radius: 5px; position: relative;">
              <div class="inner-schedule-head" style="display: flex; gap: 10px; align-items: center;">
                <div class="inner-move" style="cursor: move;"><i class="fa-solid fa-grip-vertical"></i></div>
                
                <select name="variant_sizes[]" style="flex: 1;" required>
                  <option value="">-- Size --</option>
                  <c:forEach items="${sizes}" var="s">
                    <option value="${s.id}">${s.name}</option>
                  </c:forEach>
                </select>

                <select name="variant_colors[]" style="flex: 1;" required>
                  <option value="">-- Màu --</option>
                  <c:forEach items="${colors}" var="c">
                    <option value="${c.id}">${c.name}</option>
                  </c:forEach>
                </select>

                <input type="number" name="variant_stocks[]" placeholder="Số lượng" style="flex: 1;" min="0" value="0">
                
                <div class="inner-remove" style="cursor: pointer; color: #dc3545; padding: 5px;"><i class="fa-solid fa-trash"></i></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="inner-group inner-two-col">
        <label class="inner-label" for="avatar">Ảnh sản phẩm</label>
        <div class="inner-upload-image">
          <input type="file" id="avatar" accept="image/*" filepond-image name="avatar">
        </div>
      </div>

      <div class="inner-group inner-two-col">
        <label class="inner-label" for="description">Mô tả chi tiết</label>
        <textarea id="description" textarea-mce name="description"></textarea>
      </div>

      <div class="inner-button inner-two-col" style="margin-top: 20px;">
        <button type="submit" style="width: 100%; padding: 12px; background: #007bff; color: white; border: none; font-weight: bold; border-radius: 4px; cursor: pointer;">
          LƯU SẢN PHẨM
        </button>
      </div>
    </form>
    
    <div style="text-align: center; margin-top: 15px;">
      <a href="/admin/product/list" style="color: #666; text-decoration: none;"><i class="fa-solid fa-arrow-left"></i> Quay lại danh sách</a>
    </div>
  </div>

  <c:if test="${not empty success}">
    <script>toastr.success("${success}");</script>
  </c:if>
  <c:if test="${not empty error}">
    <script>toastr.error("${error}");</script>
  </c:if>
</main>

<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.6/Sortable.min.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>

<script src="<c:url value='/js/script.js'/>"></script>

</body>
</html>