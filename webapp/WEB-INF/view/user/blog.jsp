<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/blog.css" />
    <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">
  
<link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/header.css" />
<script src="https://kit.fontawesome.com/37c51843b5.js"crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$(".search-icon").click(function(e) {
		e.stopPropagation();
			$(".search-container").css("width", "40%");
			$(".search-container input[type='text']").show();
			$(this).hide();
			$(".close-icon").show();
		});

		$(".close-icon").click(function(e) {
			e.stopPropagation();
			$(".search-container").css("width", "75px");
			$(".search-container input[type='text']").hide();
			$(this).hide();
			$(".search-icon").show();
		});
	});

</script>
</head>
<body>
    <header>
		<div class="dropdown ">
			<button class="dropbtn">
				<i class="fa-solid fa-bars fa-sm"></i>
			</button>
			<div class="dropdown-content">
				<a href="/demospringmvc/user/home">Trang Chủ</a> 
				<a href="/demospringmvc/user/AI">Huấn Luyện Viên AI</a>
				<a href="/demospringmvc/user/TDEE-BMR">Tính TDEE/BMR</a>
				<a href="/demospringmvc/user/lichtap">Lớp Học</a> 
				<a href="/demospringmvc/user/goitap">Hội Viên</a>
				<a href="/demospringmvc/user/thietbi">Thiết Bị</a> 
				<a href="/demospringmvc/user/danhgia">Đánh Giá</a>				
				<a href="/demospringmvc/user/phukien">Phụ Kiện</a>
				<a href="/demospringmvc/user/blog">Blog</a> 
				<a href="/demospringmvc/dangnhap">Log Out</a>
			</div>
		</div>
		<a href="#" id="logo"> NHÓM 11 FITNESS & YOGA </a>
		<div class="search-container">
			<span class="search-icon"><i
				class="fa-solid fa-magnifying-glass fa-xl"
				style="color: rgb(222, 17, 17);"></i></span>
			<form action="/demospringmvc/user/goitap/find" method="get">
				<input type="text" placeholder="Tìm kiếm..." id="name" name="name">
			</form>
			<span class="close-icon">&times;</span>
		</div>
		<a id="link" target="_blank"
			href="https://www.tiktok.com/@phamducthongxoxo"><i
			class="fa-brands fa-tiktok"></i></a> <a id="link" target="_blank"
			href="https://www.facebook.com/thongzoke"><i
			class="fa-brands fa-facebook"></i></a> <a id="link" target="_blank"
			href="https://www.instagram.com/phamthong16.7/"><i
			class="fa-brands fa-instagram"></i></a>
	</header>

    <section>
        <ul id="tieude">
            <li>TIN TỨC & SỰ KIỆN</li>
            <li>KIẾN THỨC TẬP LUYỆN</li>
            <li>BÀI TẬP</li>
            <li>DINH DƯỠNG</li>
            <li>CẨM NANG SỨC KHỎE</li>
            <li>CÂU CHUYỆN TẬP LUYỆN</li>
        </ul>
        <img src="https://cali.vn/storage/app/media/2023/Blog/coaching/online_coaching_new_compress.webp" alt="" width="50%">
    </section>

    <footer id="footer"><jsp:include page="/WEB-INF/view/add/footer.jsp" /></footer>
</body>

</html>