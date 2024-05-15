<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="shortcut icon"
	href="https://scontent.xx.fbcdn.net/v/t1.15752-9/346164529_247480751282136_649087972543876077_n.png?stp=dst-png_p403x403&_nc_cat=108&ccb=1-7&_nc_sid=aee45a&_nc_ohc=68B7JUNNoLQAX-lx2KA&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdTHsOcpuf00BkpEXk81ZEN4cojUikII-I3pNUFWTp5BjA&oe=64896273"
	type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/homeAD.css" />
</head>
<body id="trang-chu">
		
<div class="grid-container" >
  <div class="grid-item" onclick="window.location.href='/demospringmvc/admin/chitietgoitap'">Chi Tiết Gói Tập</div>
  <div class="grid-item" onclick="window.location.href='/demospringmvc/admin/dangkiloptap'">Đăng Ký Lớp Tập</div>  
  <div class="grid-item" onclick="window.location.href='/demospringmvc/admin/khachhang'">Khách Hàng</div>
  <div class="grid-item" onclick="window.location.href='/demospringmvc/admin/nhanvien'">Nhân Viên</div>
  <div class="grid-item" onclick="window.location.href='/demospringmvc/admin/thietbi'">Thiết bị</div>
  <div class="grid-item" onclick="window.location.href='/demospringmvc/admin/phukien'">Phụ kiện</div>
</div>

</body>
</html>