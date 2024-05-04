<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BLOGS</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/cssfile/header.css" />
<script src="https://kit.fontawesome.com/37c51843b5.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<a href="/demospringmvc/user/lophoc">Lớp Học</a> 
				<a href="/demospringmvc/user/caulacbo">Câu Lạc Bộ</a>
				<a href="/demospringmvc/user/hoivien">Hội Viên</a>
				<a href="/demospringmvc/user/thietbi">Thiết Bị</a> 
				<a href="/demospringmvc/user/danhgia">Đánh Giá</a>
				<a href="/demospringmvc/user/blog">Blog</a> 
				<a href="/demospringmvc/dangnhap">Log Out</a>
			</div>
		</div>
		<a href="#" id="logo"> NHÓM 11 FITNESS & YOGA </a>
		<div class="search-container">
			<span class="search-icon"><i
				class="fa-solid fa-magnifying-glass fa-xl"
				style="color: rgb(222, 17, 17);"></i></span>
			<form action="">
				<input type="text" placeholder="Tìm kiếm...">
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
</body>
</html>