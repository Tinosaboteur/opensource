<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
  <title>Nhắn tin với Trí tuệ Nhân tạo</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
  <h2>Nhắn tin với Trí tuệ Nhân tạo</h2>
  <div id="chatbox"></div>
  <form id="chatForm">
    <input type="text" id="message" placeholder="Nhập tin nhắn của bạn ở đây..." required>
    <input type="submit" value="Gửi">
  </form>
  <script>
  $(document).ready(function() {
	    var previousQuestion = "";

	    $('#chatForm').on('submit', function(e) {
	        e.preventDefault();
	        var message = $('#message').val();

	        // Lưu trữ câu hỏi trước đó
	        previousQuestion = message;

	        $.ajax({
	            url: '/demospringmvc/chat',
	            method: 'POST',
	            data: { message: encodeURIComponent(message), previousQuestion: encodeURIComponent(previousQuestion) },
	            success: function(response) {
	                // Phân tích cú pháp của phản hồi JSON
	                var data = JSON.parse(response);

	                // Trích xuất nội dung từ lựa chọn đầu tiên của AI
	                // Giải mã chuỗi JSON để hiển thị tiếng Việt chính xác
	                var aiContent = decodeURIComponent(data.choices[0].message.content);

	                // Cập nhật chatbox với nội dung của AI và câu hỏi trước đó
	                $('#chatbox').append('<p>**Bạn:** ' + previousQuestion + '</p>');
	                $('#chatbox').append('<p>AI: ' + aiContent + '</p>');
	                $('#message').val('');
	            }
	        });
	    });
	});


  </script>
</body>
</html>
