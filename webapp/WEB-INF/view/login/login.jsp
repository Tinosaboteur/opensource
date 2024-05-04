<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/login.css" />
    <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">

</head>

<body id="login">
<header id="header">
        <jsp:include page="/WEB-INF/view/add/header.jsp" />
    </header>
    <section id="login">
        <div id="login">
            <p><b>ĐĂNG NHẬP</b></p>
            <legend>
                <form action="/demospringmvc/dangnhap" method="post">
                    <input type="text" name="username" id="user" placeholder="User" required><br>
                    <input type="password" name="password" id="password" placeholder="Password" required><br>
                    <br><b>Chưa Có Tài Khoản?  </b><a href="/demospringmvc/dangky" style="color: rgb(222, 17, 17);">ĐĂNG KÝ</a>
                    <div id="button">
                        <button type="reset" id="huy"><b>HỦY</b></button>
                        <button type="submit" id="dangnhap"><b>ĐĂNG NHẬP</b></button>
                    </div>
                </form>
                     <b class="message">${message}</b>
            </legend>
        </div>

    </section>
    <article>
        <b>LỢI ÍCH THÀNH VIÊN </b>
        <ul>
            <li>Vị trí CLB thuận tiện khắp cả nước</li>
            <li>Chương trình tập luyện không giới hạn</li>
            <li>HLV tiêu chuẩn Quốc Tế</li>
            <li>Đa dạng gói hội viên phù hợp với nhu cầu</li>
            <li>Ưu đãi sức khoẻ từ ứng dụng đổi điểm lấy quà Livwell</li>
            <li>Bảo hiểm tai nạn cá nhân lên đến 01 tỷ đồng dành cho hội viên mới</li>
            <li>Đa dạng ưu đãi từ đối tác</li>
        </ul>
    </article>
    <img id="article" src="https://cali.vn/storage/app/media/2021/Register/register_benefit.jpg" alt="đây là hình">
<footer id="footer">
        <jsp:include page="/WEB-INF/view/add/footer.jsp" />
    </footer>
    </body>

</html>