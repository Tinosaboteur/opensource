<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/danhgia.css" />
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
<style>
        .add-review-container {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
        }

        .add-review-container h2 {
            margin-bottom: 20px;
        }

        .add-review-container input[type="text"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
        }

        .add-review-container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 24px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-review-container button:hover {
            background-color: #45a049;
        }

        .customer-card p:before {
            content: "-";
            margin-right: 5px;
        }
    </style>
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

 <script>
 var khachhangData = [];
 var danhgiaData = [];

 function searchKhachhang() {
     var searchValue = $('#name').val().toLowerCase();
     var filteredData = khachhangData.filter(function(khachhang) {
         return khachhang.name.toLowerCase().includes(searchValue);
     });
     renderKhachhangList(filteredData);
 }

 function renderKhachhangList(data) {
     var customerList = $('.customer-list');
     customerList.empty();
     if (data.length === 0) {
     	customerList.append('<p style="font-size: 3rem">Không tìm thấy...</p>');
     } else {
         $.each(data, function(i, khachhang) {
             var customerCard = $('<div>').addClass('customer-card');
             $('<b>').addClass('customer-info').text(khachhang.name).appendTo(customerCard);

             $.each(danhgiaData, function(j, danhgia){
                 if(danhgia.customerID == khachhang.customerID){
                     $('<p>').addClass('customer-info').text(danhgia.description).appendTo(customerCard);
                 }
             });

             customerCard.appendTo(customerList);
         });
     }
 }

 $(document).ready(function() {
     $.ajax({
         url: '/demospringmvc/user/danhgia/data',
         type: 'GET',
         success: function(data) {
             khachhangData = data.khachhang;
             danhgiaData = data.danhgia;
             renderKhachhangList(khachhangData);
         }
     });

     $('#name').on('keyup', searchKhachhang);
 });
</script>
<section class="customer-list">
   
</section>
<div class="add-review-container">
        <h2>Thêm đánh giá</h2>
        <input type="text" id="review" placeholder="Nhập đánh giá của bạn...">
        <button id="add-review">Thêm đánh giá</button>
    </div>

<script>
$('#add-review').on('click', function() {
    var review = $('#review').val();
    if (review) {
        // Gửi yêu cầu AJAX đến API /demospringmvc/user/danhgia/add để thêm đánh giá
        $.ajax({
            url: '/demospringmvc/user/danhgia/add',
            type: 'POST',
            data: JSON.stringify({description: review}), // Không cần thêm name vào dữ liệu
            contentType: 'application/json',
            success: function(data) {
                // Xử lý dữ liệu trả về từ API ở đây
                alert('Đánh giá của bạn đã được thêm thành công!');
                $('#review').val('');

                // Thêm đánh giá mới vào danh sách đánh giá
                danhgiaData.push(data);

                // Cập nhật danh sách khách hàng
                renderKhachhangList(khachhangData);
            }
        });
    } else {
        alert('Vui lòng nhập đánh giá của bạn!');
    }
});

</script>

	
    <footer id="footer"> <jsp:include page="/WEB-INF/view/add/footer.jsp" /></footer>
</body>
</html>