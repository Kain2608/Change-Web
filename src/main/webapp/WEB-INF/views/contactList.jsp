<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Thông tin liên hệ và phản hồi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
  </head>
  <body>
    <%@ include file="/WEB-INF/views/layout/header.jsp" %> <%@ include
    file="/WEB-INF/views/layout/sider.jsp" %>
    <div class="sider-overlay"></div>

    <main class="main">
      <h1 class="box-title">Thông tin liên hệ và phản hồi</h1>
      <div class="section-4">
        <div class="inner-wrap">
          <div class="inner-item inner-label">
            <i class="fa-solid fa-filter"></i> Bộ lọc
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
                <option value="${user.fullName}">
                  ${user.fullName}
                </option>
              </c:forEach>
              
            </select>
          </div>
          <div class="inner-item inner-reset" btn-reset>
            <i class="fa-solid fa-rotate-left"></i> Xóa bộ lọc
          </div>
        </div>
      </div>
      <div class="section-5">
        <div class="inner-wrap">
          <div class="inner-search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" placeholder="Tìm kiếm" />
          </div>
          <div class="inner-button-create">
            <button><a href="/admin/contact/create">+ Tạo mới</a></button>
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
                <td class="inner-center"></td>
                <td></td>
                <td>
                  <img class="inner-avatar" src= "" />
                </td>
                <td class="inner-center">
                  
                    
                      <div class="badge badge-green">Hoạt động</div>

                      <div class="badge badge-red">Tạm dừng</div>
                    
                </td>
                <td>
                  <div></div>
                  <div class="inner-time"></div>
                </td>
                <td>
                  <div></div>
                  <div class="inner-time"></div>
                </td>
                <td>
                  <button><a href="/admin/contact/edit">Sửa</a></button>
                  <button><a href="/admin/contact/delete" onclick="return confirm('Bạn có muốn xóa danh mục này không')">Xóa</a></button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="section-7"><span class="inner-label">Trang </span>
        <select class="inner-pagination">
          <option>1</option>
          <option>2</option>
          <option>3</option>
        </select>
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
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
  </body>
</html>
