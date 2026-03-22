<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
  <title>Tạo danh mục</title>
  <%@ include file="/WEB-INF/views/layout/default.jsp" %>
</head>

<body>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/layout/sider.jsp" %>
<div class="sider-overlay"></div>

<main class="main">
  <h1 class="box-title">Tạo danh mục</h1>

  <div class="section-8">
    <form method="post" action="/admin/category/create" enctype="multipart/form-data">

      <div class="inner-group">
        <label class="inner-label">Tên danh mục</label>
        <input type="text" name="name">
      </div>

      <div class="inner-group">
        <label class="inner-label">Trạng thái</label>
        <select name="status">
          <option value="active">Hoạt động</option>
          <option value="inactive">Dừng</option>
        </select>
      </div>

      <div class="inner-group inner-two-col">
        <label class="inner-label">Ảnh</label>
        <div class="inner-upload-image">
          <input type="file" name="avatar" filepond-image accept="image/*">
        </div>
      </div>

      <div class="inner-group inner-two-col">
        <label class="inner-label">Mô tả</label>
        <textarea name="description" textarea-mce></textarea>
      </div>

      <div class="inner-button inner-two-col">
        <button type="submit">Tạo danh mục</button>
      </div>

    </form>

    <div class="inner-back">
      <a href="/admin/category/list">Quay lại danh sách</a>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

</body>
</html>