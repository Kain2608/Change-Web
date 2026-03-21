<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quản lý danh mục</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  </head>
  <body>
    <header class="header">
      <div class="inner-logo">
        <a href="/admin/dashboard"><span>Shop</span><span>VnbAdmin</span></a>
      </div>

      <div class="inner-wrap">
        <div class="inner-notify">
          <img src="<c:url value='/images/icon-bell.svg'/>" />
          <span>6</span>
        </div>

        <div class="inner-account">
          <div class="inner-avatar">
            <img src="<c:url value='/images/avatar.jpg'/>" />
          </div>
          <div class="inner-text">
            <div class="inner-name">Le Van A</div>
            <div class="inner-role">Admin</div>
          </div>
        </div>

        <button class="inner-button-menu">
          <i class="fa-solid fa-bars"></i>
        </button>
      </div>
    </header>

    <nav class="sider">
    <ul class="inner-menu">
        <li><a href="#"><i class="fa-solid fa-gauge-high"></i> Tổng quan</a></li>
        <li><a class="active" href="/admin/category/list"><i class="fa-solid fa-table-cells-large"></i> Quản lý danh mục</a></li>
        <li><a href="#"><i class="fa-solid fa-table-list"></i> Quản lý sản phẩm</a></li>
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

    <main class="main">
      <h1 class="box-title">Quản lý danh mục</h1>
      <div class="section-4">
        <div class="inner-wrap">
          <div class="inner-item inner-label"><i class="fa-solid fa-filter"></i> Bộ lọc</div>
          <div class="inner-item">
            <select>
              <option value="">Trạng thái</option>
              <option value="">Hoạt động</option>
              <option value="">Tạm dừng</option>
            </select>
          </div>
          <div class="inner-item">
            <select>
              <option value="">Người tạo</option>
              <option value="">Lê Văn A</option>
              <option value="">Lê Văn B</option>
            </select>
          </div>
          <div class="inner-item inner-reset"><i class="fa-solid fa-rotate-left"></i> Xóa bộ lọc</div>
        </div>
      </div>
      <div class="section-5">
        <div class="inner-wrap">
          
          <div class="inner-search"><i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" placeholder="Tìm kiếm">
          </div>
          <div class="create-box">
          <button class="create-btn" onclick="toggleMenu()">
            + Tạo mới
          </button>

          <div id="createMenu" class="create-menu">
            <a href="/admin/category/racket-create" class="menu-item">
              <i class="fa-solid fa-table-tennis-paddle-ball"></i>
              Vợt
            </a>
            <a href="/admin/category/shoes-create" class="menu-item">
              <i class="fa-solid fa-shoe-prints"></i>
              Giày
            </a>
          </div>
          </div>
        </div>
      </div>
      <div class="section-6">
        <div class="table-2">
          <table>
            <thead>
              <tr>
                
                <th class="inner-center">
                  <input type="checkbox" />
                </th>
                <th class="inner-center">Vị trí</th>
                <th>Tên danh mục</th>
                <th>Ảnh đại diện</th>
                <th class="inner-center">Trạng thái</th>
                <th>Tạo bởi</th>
                <th>Cập nhật bởi</th>
                <th>Hành động</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td class="inner-center"><input type="checkbox" /></td>
                <td class="inner-center">1</td>
                <td>Danh mục 1</td>
                <td>
                  <img class="inner-avatar" src="<c:url value=''/>" />
                </td>
                <td class="inner-center">
                  <div class="badge badge-green">Hoạt động</div>
                </td>
                <td>
                  <div>Lê Văn A</div>
                  <div class="inner-time">16:30 - 20/10/2024</div>
                </td>
                <td>
                  <div>Lê Văn A</div>
                  <div class="inner-time">16:30 - 20/10/2024</div>
                </td>
                <td>
                  <button>Sửa</button>
                  <button>Xóa</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
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
