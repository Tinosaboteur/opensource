<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLOGS</title>
    <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

	 <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/home.css" />
    
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">


<link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/header.css" />
<script src="https://kit.fontawesome.com/37c51843b5.js"crossorigin="anonymous"></script>

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
		
		<a id="link" target="_blank"
			href="https://www.tiktok.com/@phamducthongxoxo"><i
			class="fa-brands fa-tiktok"></i></a> <a id="link" target="_blank"
			href="https://www.facebook.com/thongzoke"><i
			class="fa-brands fa-facebook"></i></a> <a id="link" target="_blank"
			href="https://www.instagram.com/phamthong16.7/"><i
			class="fa-brands fa-instagram"></i></a>
	</header>
    <div class="slick-list">
            <img src="https://cali.vn/storage/app/media/2024/Homepage/Womens%20Day%202024/WebBanner_Desktop_8-3.png"
                alt="">
        <img src="https://cali.vn/storage/app/media/2024/Homepage/Monopoly/California%20Monopoly_Web%20Banner_Desktop.png"
            alt="">
        <img src="https://cali.vn/storage/app/media/2023/Home%20page/Head%20Banner/Dues_Headbanner_Desktop_1900x800.jpg"
            alt="">
    </div>

    <script type="text/javascript">
        $('.slick-list').slick({
    draggable: true,
    autoplay: true,
    autoplaySpeed: 2000,
    cssEase: 'ease-out',
    prevArrow: false,
    nextArrow: false
});
    </script>
    
    <div class="introduce">
        <b>CHÚNG TÔI LÀ NHÓM 11</b>
        <p>
        <ul>
            <li>NHÓM 11 là một phòng gym hàng đầu, nổi tiếng với sự cam kết mang đến sức khỏe và sự phát triển toàn diện
                cho
                cộng đồng.</li>
            <li>
                Tại NHÓM 11, chúng tôi cung cấp một loạt các dịch vụ và tiện ích, bao gồm các lớp tập nhóm, dịch vụ huấn
                luyện cá nhân, và các thiết bị tập luyện hiện đại. Phòng gym của chúng tôi được thiết kế để tạo ra một
                môi
                trường thoải mái và thân thiện, giúp mọi người có thể tập luyện một cách hiệu quả và an toàn.
            </li>
            <li>
                Chúng tôi tự hào về đội ngũ huấn luyện viên chuyên nghiệp và tận tâm của mình, luôn sẵn lòng hỗ trợ và
                hướng
                dẫn bạn đạt được mục tiêu sức khỏe và thể chất của mình.
            </li>
            <li>
                Dù bạn là người mới bắt đầu hay là một vận động viên có kinh nghiệm, NHÓM 11 đều có thể đáp ứng nhu cầu
                của
                bạn. Hãy đến với NHÓM 11 để trải nghiệm sự khác biệt và bắt đầu hành trình tập luyện của bạn ngay hôm
                nay!
            </li>
        </ul>
        </p>
    </div>

    <div class="container">
        <div>
            <img src="https://th.bing.com/th/id/OIP.dd0FZmC_ezUflCxVUGXE9wHaHa?w=156&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"
                alt="" height="350" width="300">
            <b>HUẤN LUYỆN VIÊN CÁ NHÂN AI</b>
            <p>🏋️‍♂️ Huấn luyện viên cá nhân AI là một công nghệ tiên tiến, được thiết kế để giúp bạn đạt được mục tiêu
                sức khỏe và thể hình của mình. Dựa trên thuật toán thông minh, AI sẽ tạo ra các bài tập tập luyện cá
                nhân hóa, phù hợp với mục tiêu, khả năng và thời gian rảnh rỗi của bạn.</p>
        </div>
        <div>
            <img src="https://th.bing.com/th/id/OIP.kCWXrbAe2P6Q-1pM4kGJRgHaHa?w=160&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"
                alt="" height="350" width="300">
            <b>CÔNG CỤ TÍNH TDEE/BMR ONLINE CHO KHÁCH HÀNG</b>
            <p>Bạn muốn giảm cân, tăng cân, hay duy trì cân nặng hiện tại nhưng không biết cần bao nhiêu calo mỗi ngày?
                Đừng lo lắng, công cụ tính TDEE/BMR trực tuyến của chúng tôi sẽ giúp bạn!</p>
        </div>
        <div>
            <img src="https://th.bing.com/th?q=Fitness+Accessories+Product&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.5&pid=InlineBlock&mkt=en-WW&cc=VN&setlang=en&adlt=moderate&t=1&mw=247"
                alt="" height="350" width="300"></img>
            <b>BÁN PHỤ KIỆN TẬP LUYỆN ONLINE</b>
            <p>Bạn đang tìm kiếm dụng cụ tập luyện chất lượng cao để nâng cao hiệu suất tập luyện của mình? Hãy khám phá
                cửa hàng trực tuyến của chúng tôi, nơi cung cấp một loạt các dụng cụ tập luyện từ các thương hiệu hàng
                đầu.</p>
        </div>
        <div>
            <img src="https://th.bing.com/th/id/OIP.DCvLkYc2zbOA5NEMzxirBgHaEK?w=274&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"
                alt="" height="350" width="300"></img>
            <b>TẬP LUYỆN KHÔNG GIỚI HẠN</b>
            <p>🚀 Với chúng tôi, bạn không chỉ tập luyện mà còn được trải nghiệm sự tự do. Bạn có thể tập luyện theo
                cách của mình, tạo ra lịch trình tập luyện phù hợp với mình và không bao giờ phải lo lắng về việc bị
                giới hạn.</p>
        </div>
    </div>
     <footer id="footer">
        <jsp:include page="/WEB-INF/view/add/footer.jsp" />
    </footer>
</body>

</html>