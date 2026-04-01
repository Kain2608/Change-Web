<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Cập nhật</title>

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
      <link rel="stylesheet" href="https://unpkg.com/filepond@^4/dist/filepond.css">
      <link rel="stylesheet"
        href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
      <link rel="stylesheet" href="<c:url value='/css/style.css'/>">

      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
      <script src="https://cdn.tiny.cloud/1/vmvrvx4s91ngnwxk4xwccnt0e8p93eqwn9ld96cu2xb9nkpd/tinymce/7/tinymce.min.js"
        referrerpolicy="origin"></script>
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
          <li><a href="#"><i class="fa-solid fa-gauge-high"></i> Tong quan</a></li>
          <li><a href="/admin/category/list"><i class="fa-solid fa-table-cells-large"></i> Quan ly danh mục</a></li>
          <li><a class="active" href="/admin/product/list"><i class="fa-solid fa-table-list"></i> Quan ly sản phẩm</a>
          </li>
          <li><a href="#"><i class="fa-solid fa-list-check"></i> Quan ly don hang</a></li>
          <li><a href="#"><i class="fa-solid fa-user"></i> Quan ly nguoi dung</a></li>
          <li><a href="#"><i class="fa-solid fa-newspaper"></i> Quan ly tin tuc</a></li>
          <li><a href="#"><i class="fa-solid fa-user-group"></i> Thong tin lien he va phan hoi</a></li>
        </ul>

        <hr>

        <ul class="inner-menu">
          <li><a href="#"><i class="fa-solid fa-gear"></i> Cai dat chung</a></li>
          <li><a href="#"><i class="fa-solid fa-user-gear"></i> Thong tin ca nhan</a></li>
          <li><a class="inner-logout" href="/admin/logout"><i class="fa-solid fa-power-off"></i> Dang xuat</a></li>
        </ul>
      </nav>

      <div class="sider-overlay"></div>

      <main class="main">
        <h1 class="box-title">Chỉnh sửa giày cầu lông</h1>

        <div class="section-8">
          <form method="post" action="<c:url value='/admin/product/edit/shoes/${shoesDetail.id}'/>">
            <div class="inner-group">
              <label class="inner-label" for="name">Ten giay</label>
              <input type="text" id="name" name="name" value="${shoesDetail.name}">
            </div>

            <div class="inner-group">
              <label class="inner-label" for="category">Danh muc</label>
              <input type="text" id="category" name="category" value="${shoesDetail.category}">
            </div>

            <div class="inner-group">
              <label class="inner-label" for="brand">Thuong hieu</label>
              <input type="text" id="brand" name="brand" value="${shoesDetail.brand}">
            </div>

            <div class="inner-group">
              <label class="inner-label" for="status">Trang thai</label>
              <select id="status" name="status">
                <option value="active" ${shoesDetail.status=='active' ? 'selected' : '' }>Hoat dong</option>
                <option value="inactive" ${shoesDetail.status=='inactive' ? 'selected' : '' }>Dung</option>
              </select>
            </div>

            <div class="inner-group">
              <label class="inner-label" for="size">Size</label>
              <input type="text" id="size" name="size" value="${shoesDetail.size}">
            </div>

            <div class="inner-group">
              <label class="inner-label" for="target">Doi tuong</label>
              <select id="target" name="target">
                <option value="Nam" ${shoesDetail.target=='Nam' ? 'selected' : '' }>Nam</option>
                <option value="Nu" ${shoesDetail.target=='Nu' ? 'selected' : '' }>Nu</option>
                <option value="Unisex" ${shoesDetail.target=='Unisex' ? 'selected' : '' }>Unisex</option>
              </select>
            </div>

            <div class="inner-group">
              <label class="inner-label" for="price">Gia</label>
              <input type="number" id="price" name="price" value="${shoesDetail.price}">
            </div>

            <div class="inner-group inner-two-col">
              <label class="inner-label" for="avatar">Anh</label>
              <div class="inner-upload-image">
                <img src="${shoesDetail.avatar}" style="width:100px; display:block; margin-bottom:10px;">
                <input type="file" name="avatar">
              </div>
            </div>

            <div class="inner-group inner-two-col">
              <label class="inner-label" for="description">Mo ta</label>
              <textarea id="description" textarea-mce name="description"></textarea>
            </div>

            <div class="inner-button inner-two-col">
              <button type="submit">Tao giay</button>
            </div>
          </form>

          <div class="inner-back"><a href="#">Quay lai danh sach</a></div>
        </div>

        <c:if test="${not empty success}">
          <script>
            toastr.success("${success}");
          </script>
        </c:if>
        <c:if test="${not empty error}">
          <script>
            toastr.error("${error}");
          </script>
        </c:if>
      </main>

      <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.6/Sortable.min.js"></script>
      <script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
      <script
        src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
      <script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
      <script src="<c:url value='/js/script.js'/>"></script>

    </body>

    </html>