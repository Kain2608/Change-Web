<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tạo giày cầu lông</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <link rel="stylesheet" href="https://unpkg.com/filepond@^4/dist/filepond.css">
  <link rel="stylesheet" href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css">
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">

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
        <div class="inner-name">Le Van A</div>
        <div class="inner-role">Admin</div>
      </div>
    </div>
    <button class="inner-button-menu"><i class="fa-solid fa-bars"></i></button>
  </div>
</header>

<nav class="sider">
    <ul class="inner-menu">
        <li><a  href="#"><i class="fa-solid fa-gauge-high"></i> Tổng quan</a></li>
        <li><a class="active" href="/admin/category/list"><i class="fa-solid fa-table-cells-large"></i> Quản lý danh mục</a></li>
        <li><a href="/admin/product/list"><i class="fa-solid fa-table-list"></i> Quản lý sản phẩm</a></li>
        <li><a href="#"><i class="fa-solid fa-list-check"></i> Quản lý đơn hàng</a></li>
        <li><a href="#"><i class="fa-solid fa-user"></i> Quản lý người dùng</a></li>
        <li><a href='#'><i class="fa-solid fa-newspaper"></i>Quản lý tin tức</a></li>
        <li><a href="#"><i class="fa-solid fa-user-group"></i> Thông tin liên hệ và phản hồi</a></li>
    </ul>

    <hr>

    <ul class="inner-menu">
        <li><a href="#"><i class="fa-solid fa-gear"></i> Cài đặt chung</a></li>
        <li><a href="#"><i class="fa-solid fa-user-gear"></i> Thông tin cá nhân</a></li>
        <li><a class="inner-logout" href="/admin/logout"><i class="fa-solid fa-power-off"></i> Đăng xuất</a></li>
    </ul>
</nav>

<div class="sider-overlay"></div>

<main class="main">
  <h1 class="box-title">Tạo giày cầu lông</h1>

  <div class="section-8">
    <form id="shoes-create-form" method="post" action="/admin/product/shoes-create" enctype="multipart/form-data">

      <div class="inner-group">
        <label class="inner-label" for="name">Tên giày</label>
        <input type="text" id="name" name="name">
      </div>
      <div class="inner-group">
        <label class="inner-label" for="parent">Danh mục cha</label>
        <input type="text" id="parent" name="parent">
      </div>
      <div class="inner-group">
        <label class="inner-label">Trạng thái</label>
        <select name="status">
          <option value="active">Hoạt động</option>
          <option value="inactive">Dừng</option>
        </select>
      </div>
      <div class="inner-group">
        <label class="inner-label" for="size">Size</label>
        <input type="text" id="size" name="size" placeholder="vd: 40-45">
      </div>

      <div class="inner-group">
        <label class="inner-label" for="target">Đối tượng</label>
        <select id="target" name="target">
          <option>Nam</option>
          <option>Nữ</option>
          <option>Unisex</option>
        </select>
      </div>

      <div class="inner-group">
        <label class="inner-label" for="price">Giá</label>
        <input type="number" id="price" name="price" placeholder="vd: 1200000">
      </div>

      <div class="inner-group inner-two-col">
        <label class="inner-label" for="avatar">Ảnh</label>
        <div class="inner-upload-image">
          <input type="file" id="avatar" accept="image/*" image-default filepond-image name="avatar">
        </div>
      </div>

      <div class="inner-group inner-two-col">
        <label class="inner-label" for="description">Mô tả</label>
        <textarea id="description" textarea-mce name="description"></textarea>
      </div>

      <div class="inner-button inner-two-col">
        <button type="submit">Tạo giày</button>
      </div>

    </form>
    <div class="inner-back"><a href="#">Quay lại danh sách</a></div>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.6/Sortable.min.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
<script src="<c:url value='/js/script.js'/>"></script>

</body>
</html>