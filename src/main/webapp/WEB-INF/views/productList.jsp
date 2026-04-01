<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Quản lý sản phẩm</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
</head>
<body>
  <%@ include file="/WEB-INF/views/layout/header.jsp" %>
  <%@ include file="/WEB-INF/views/layout/sider.jsp" %>
  <div class="sider-overlay"></div>

  <main class="main">
    <h1 class="box-title">Quản lý sản phẩm</h1>
    
    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-icon si-blue"><i class="fa-solid fa-table-cells"></i></div>
        <div>
          <div class="stat-val">${totalProduct}</div>
          <div class="stat-lbl">Tổng sản phẩm</div>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon si-green"><i class="fa-solid fa-circle-check"></i></div>
        <div>
          <div class="stat-val">${totalActive}</div>
          <div class="stat-lbl">Đang hoạt động</div>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon si-red"><i class="fa-solid fa-circle-xmark"></i></div>
        <div>
          <div class="stat-val">${totalInactive}</div>
          <div class="stat-lbl">Tạm dừng</div>
        </div>
      </div>
    </div>

    <div class="section-4">
      <div class="inner-wrap">
        <div class="inner-item inner-label"><i class="fa-solid fa-filter"></i> Bộ lọc</div>
        <div class="inner-item">
          <select id="filterType">
            <option value="">Loại sản phẩm</option>
            <option value="shoes">Giày</option>
            <option value="racket">Vợt</option>
          </select>
        </div>
        <div class="inner-item">
          <select filter-status>
            <option value="">Trạng thái</option>
            <option value="active">Hoạt động</option>
            <option value="inactive">Tạm dừng</option>
          </select>
        </div>
        <div class="inner-item">
          <select filter-create-by>
            <option value="">Người tạo</option>
            <c:forEach var="user" items="${userList}">
              <option value="${user.fullName}">${user.fullName}</option>
            </c:forEach>
          </select>
        </div>
        <div class="inner-item inner-reset" btn-reset><i class="fa-solid fa-rotate-left"></i> Xóa bộ lọc</div>
      </div>
    </div>

    <div class="section-5">
      <div class="inner-wrap">
        <div class="inner-search">
          <i class="fa-solid fa-magnifying-glass"></i>
          <input type="text" placeholder="Tìm kiếm tên sản phẩm..." />
        </div>
        <div class="inner-button-create">
          <button onclick="openModal()">+ Tạo mới</button>
        </div>
        
        <div id="modal" class="modal hidden">
          <div class="modal-content">
            <h3>Chọn loại sản phẩm</h3>
            <button onclick="goTo('shoes-create')">TẠO GIÀY</button>
            <button onclick="goTo('racket-create')">TẠO VỢT</button>
            <button class="close-btn" onclick="closeModal()">Đóng</button>
          </div>
        </div>
      </div>
    </div>

    <div class="section-6">
      <div class="table-2">
        <table>
          <thead>
            <tr>
              <th class="inner-center"><input type="checkbox" /></th>
              <th>Ảnh</th>
              <th>Tên sản phẩm</th>
              <th>Phân loại</th>
              <th>Danh mục</th>
              <th>Thương hiệu</th>
              <th class="inner-center">Trạng thái</th>
              <th>Người tạo</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="item" items="${productList}">
              <tr data-type="${item.type}">
                <td class="inner-center"><input type="checkbox" /></td>
                <td><img class="inner-avatar" src="${item.avatar}" alt="${item.name}" /></td>
                <td style="font-weight: 500;">${item.name}</td>
                <td>
                  <c:choose>
                    <c:when test="${item.type == 'shoes'}"><span class="badge" style="background: #e3f2fd; color: #1976d2;">Giày</span></c:when>
                    <c:otherwise><span class="badge" style="background: #f3e5f5; color: #7b1fa2;">Vợt</span></c:otherwise>
                  </c:choose>
                </td>
                
                <td>${item.category != null ? item.category.name : "N/A"}</td>
                <td>${item.brand != null ? item.brand.name : "N/A"}</td>
                
                <td class="inner-center">
                  <c:choose>
                    <c:when test="${item.status == 'active'}"><div class="badge badge-green">Hoạt động</div></c:when>
                    <c:otherwise><div class="badge badge-red">Tạm dừng</div></c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <div>${item.createdBy}</div>
                  <div class="inner-time">${item.getCreatedAtFormatted()}</div>
                </td>
                <td>
                  <div class="btn-group" style="display: flex; gap: 5px;">
                    <a href="/admin/product/edit/${item.type}/${item.id}" class="btn-edit" style="color: #4379EE;"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="/admin/product/delete/${item.type}/${item.id}" class="btn-delete" style="color: #EF3826;" onclick="return confirm('Bạn có muốn xóa sản phẩm này không?')"><i class="fa-solid fa-trash"></i></a>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <div class="section-7">
      <span class="inner-label">Trang </span>
      <select class="inner-pagination" filter-page>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
      </select>
    </div>
  </main>

  <c:if test="${not empty success}"><script>toastr.success("${success}");</script></c:if>
  <c:if test="${not empty error}"><script>toastr.error("${error}");</script></c:if>

  <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>