CREATE DATABASE IF NOT EXISTS sport;
USE sport;
-- Dữ liệu cho bảng Category (Vợt cầu lông, Vợt...)
INSERT IGNORE INTO category (id, name, status, avatar, created_at, updated_at, created_by, updated_by) 
VALUES 
(1, 'Vợt cầu lông', 'inactive', 'https://res.cloudinary.com/dyewsn1lc/image/upload/v1774195406/category/rtqfk1kte1cqscev0yrh.jpg', '2026-03-22 23:03:30', '2026-03-30 00:18:44', 'Nguyen Cong M', 'Nguyen Cong M'),
(3, 'Vợt', 'active', 'https://res.cloudinary.com/dyewsn1lc/image/upload/v1774196334/category/bykvblhknekvkilxq2dy.jpg', '2026-03-22 23:18:57', '2026-03-22 23:18:57', 'Nguyen Cong M', 'Nguyen Cong M'),
(6, 'V', 'active', 'https://res.cloudinary.com/dyewsn1lc/image/upload/v1774858248/category/pztqby8crfzvlamfa0y0.jpg', '2026-03-30 15:10:52', '2026-03-30 15:10:52', 'Nguyen Cong M', 'Nguyen Cong M');

-- Nếu bạn có bảng User để hiển thị Profile, hãy thêm vào đây luôn
INSERT IGNORE INTO users (id, full_name, role, avatar)
VALUES (1, 'Nguyen Cong M', 'ADMIN', 'https://res.cloudinary.com/dyewsn1lc/image/upload/v1774195406/avatar.jpg');
INSERT IGNORE INTO permission (id, code, name) VALUES 
(15, 'USER_READ', 'Xem user'),
(16, 'USER_CREATE', 'Thêm user'),
(17, 'USER_UPDATE', 'Sửa user'),
(18, 'USER_DELETE', 'Xoá user'),
(19, 'ROLE_READ', 'Xem role'),
(20, 'ROLE_CREATE', 'Thêm role'),
(21, 'ROLE_UPDATE', 'Sửa role'),
(22, 'ROLE_DELETE', 'Xoá role'),
(23, 'PRODUCT_READ', 'Xem sản phẩm'),
(24, 'PRODUCT_CREATE', 'Thêm sản phẩm'),
(25, 'PRODUCT_UPDATE', 'Sửa sản phẩm'),
(26, 'PRODUCT_DELETE', 'Xoá sản phẩm'),
(27, 'ORDER_READ', 'Xem đơn hàng'),
(28, 'ORDER_UPDATE', 'Cập nhật đơn hàng');
INSERT IGNORE INTO role_permission (role_id, permission_id) VALUES 
(3, 15), (3, 16), (3, 17), (3, 18), (3, 19), (3, 20), (3, 21), 
(3, 22), (3, 23), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28),
(4, 23), (4, 24), (4, 25), (4, 26), (4, 27), (4, 28); 
INSERT IGNORE INTO role (id, name, description) VALUES 
(3, 'Admin', 'Quản lý toàn hệ thống'),
(4, 'Manager', 'Quản lý danh mục, sản phẩm và đơn hàng'),
(5, 'User', 'Người dùng hệ thống');

INSERT INTO brands (name, description, status) VALUES 
('Yonex', 'Thương hiệu cầu lông số 1 thế giới đến từ Nhật Bản.', 'active'),
('Victor', 'Thương hiệu lớn từ Đài Loan, tài trợ cho nhiều tay vợt hàng đầu.', 'active'),
('Lining', 'Gã khổng lồ thể thao đến từ Trung Quốc, thiết kế rất bắt mắt.', 'active'),
('Mizuno', 'Nổi tiếng với công nghệ giày êm ái và bền bỉ từ Nhật Bản.', 'active'),
('Kawasaki', 'Thương hiệu lâu đời với phân khúc giá dễ tiếp cận.', 'active'),
('Asics', 'Chuyên gia về giày thể thao với công nghệ đệm Gel cực êm.', 'active'),
('Lefus', 'Thương hiệu giày cầu lông giá rẻ phổ biến cho người mới chơi.', 'active');