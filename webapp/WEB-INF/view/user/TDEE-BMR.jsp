<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/TB.css" />
    <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
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

    <section>
<div class="calculator">
    <h1>Máy tính TDEE/BMR</h1>
    <label for="weight">Cân nặng (kg):</label>
    <input type="number" id="weight" required><br>
    <label for="height">Chiều cao (cm):</label>
    <input type="number" id="height" required><br>
    <label for="age">Độ tuổi (năm):</label>
    <input type="number" id="age" required><br>
    <label for="gender">Giới tính:</label>
    <select id="gender" required>
      <option value="male">Nam</option>
      <option value="female">Nữ</option>
    </select><br>
    <label for="activity">Mức độ hoạt động:</label>
    <select id="activity" required>
      <option value="sedentary">Ít vận động</option>
      <option value="lightly active">Vận động nhẹ</option>
      <option value="moderately active">Vận động vừa phải</option>
      <option value="very active">Vận động mạnh</option>
      <option value="extra active">Vận động rất mạnh</option>
    </select><br>
    <button onclick="calculate()">Tính toán</button>
    <div id="result"></div>
  </div>
<script>
  function calculate() {
    var weight = parseFloat(document.getElementById("weight").value);
    var height = parseFloat(document.getElementById("height").value);
    var age = parseInt(document.getElementById("age").value);
    var gender = document.getElementById("gender").value;
    var activity = document.getElementById("activity").value;
  
    var bmr, tdee;
    if (gender === "male") {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else if (gender === "female") {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    } else {
      alert("Vui lòng chọn giới tính hợp lệ.");
      return;
    }
  
    var activityFactors = {
      "sedentary": 1.2,
      "lightly active": 1.375,
      "moderately active": 1.55,
      "very active": 1.725,
      "extra active": 1.9
    };
  
    if (!(activity in activityFactors)) {
      alert("Vui lòng chọn mức độ hoạt động hợp lệ.");
      return;
    }
  
    tdee = bmr * activityFactors[activity];
  
    var resultDiv = document.getElementById("result");
    resultDiv.innerHTML = "<p>Tỷ lệ trao đổi chất cơ bản (BMR): " + bmr.toFixed(2) + " cal</p>" +
                          "<p>Tổng lượng calo tiêu thụ hàng ngày (TDEE): " + tdee.toFixed(2) + " cal</p>";
}
</script>
	</section>

    <footer id="footer"><jsp:include page="/WEB-INF/view/add/footer.jsp" /></footer>
</body>

</html>