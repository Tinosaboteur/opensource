<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Thông Tin Khách Hàng</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/khachhang.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/khachhang.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/menu.css" />
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
        </div>
    </div>
    <a id="tool" href="javascript:void(0);" onclick="editMode()"><i class="fa-solid fa-wrench"></i></a>
    <a id="add" href="javascript:void(0);" onclick="addKhachhangForm()"><i class="fa-solid fa-square-plus"></i></a>
    <div class="search-container">
        <span class="search-icon"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: rgb(222, 17, 17);"></i></span>
        <input type="text" placeholder="Tìm kiếm..." id="name" name="name">
    </div> 
    
</header>
    <div id="addKhachhangForm" style="display:none;">
        <h2>Thêm Khách Hàng</h2>
        <div class="khachhang-card">
            <input type="text" placeholder="Tên" id="newName">
            <input type="text" placeholder="Địa chỉ" id="newAddress">
            <input type="text" placeholder="SĐT" id="newPhoneNumber">
            <input type="text" placeholder="Email" id="newEmail">
            <input type="text" placeholder="Ngày sinh (YYYY-MM-DD)" id="newDateOfBirth">
            <input type="text" placeholder="Giới tính" id="newGender">
            <input type="text" placeholder="Ngày tham gia (YYYY-MM-DD)" id="newJoinDate">
            <button onclick="addKhachhang()">Thêm</button>
        </div>
</div>
<section class="customer-info-container">
</section>

<script>
var editModeEnabled = false;

function editMode() {
    editModeEnabled = !editModeEnabled;
    if (editModeEnabled) {
        renderCustomerList(customerData);
    } else {
        location.reload();
    }
}

    $(document).ready(function() {
        $.ajax({
            url: '/demospringmvc/admin/khachhang/data',
            type: 'GET',
            success: function(data) {
                customerData = data;
                renderCustomerList(customerData);
            }
        });

        $('#name').on('input', function() {
            searchCustomer(); 
        });

        $('.close-icon').on('click', function() {
            $('#name').val('');
            renderCustomerList(customerData);
        });
    });

    function searchCustomer() {
        var searchValue = $('#name').val().toLowerCase();
        var filteredData = customerData.filter(function(khachhang) {
            return khachhang.name.toLowerCase().includes(searchValue); 
        });
        renderCustomerList(filteredData); 
    }

    function renderCustomerList(data) {
        var customerList = $('.customer-info-container');
        customerList.empty();
        if (data.length === 0) {
            customerList.append('<p style="font-size: 3rem">Không tìm thấy thông tin khách hàng...</p>');
        } else {
            $.each(data, function(i, khachhang) {
                var customerCard = $('<div>').addClass('customer-card');
                if(editModeEnabled) {
                    $('<input>').attr('type', 'text').val(khachhang.name).appendTo(customerCard);
                    $('<input>').attr('type', 'text').val(new Date(khachhang.dateOfBirth).toLocaleDateString('vi-VN')).appendTo(customerCard);
                    $('<input>').attr('type', 'text').val(khachhang.gender).appendTo(customerCard);
                    $('<input>').attr('type', 'text').val(khachhang.address).appendTo(customerCard);
                    $('<input>').attr('type', 'text').val(khachhang.phoneNumber).appendTo(customerCard);
                    $('<input>').attr('type', 'text').val(khachhang.email).appendTo(customerCard);
                    $('<input>').attr('type', 'text').val(new Date(parseInt(khachhang.joinDate)).toLocaleDateString('vi-VN')).appendTo(customerCard);
                    $('<button>').text('OK').on('click', function() {
                        updateCustomer(khachhang, customerCard);
                    }).appendTo(customerCard);
                } else {
                    $('<h2>').addClass('customer-name').text(khachhang.name).appendTo(customerCard);
                    $('<p>').addClass('customer-info').text('Ngày sinh: ' + new Date(khachhang.dateOfBirth).toLocaleDateString('vi-VN')).appendTo(customerCard);
                    $('<p>').addClass('customer-info').text('Giới tính: ' + khachhang.gender).appendTo(customerCard);
                    $('<p>').addClass('customer-info').text('Địa chỉ: ' + khachhang.address).appendTo(customerCard);
                    $('<p>').addClass('customer-info').text('SĐT: ' + khachhang.phoneNumber).appendTo(customerCard);
                    $('<p>').addClass('customer-info').text('Email: ' + khachhang.email).appendTo(customerCard);
                    $('<p>').addClass('customer-info').text('Ngày tham gia: ' + new Date(parseInt(khachhang.joinDate)).toLocaleDateString('vi-VN')).appendTo(customerCard);
                }
                customerCard.appendTo(customerList);
            });
        }
    }
    function addKhachhangForm() {
        $('#addKhachhangForm').toggle();
    }

    function addKhachhang() {
        var confirmAdd = confirm("Bạn có chắc chắn muốn thêm khách hàng này không?");
        if (confirmAdd) {
        	location.reload();
            var newKhachhang = {
                name: $('#newName').val(),
                address: $('#newAddress').val(),
                phoneNumber: $('#newPhoneNumber').val(),
                email: $('#newEmail').val(),
                dateOfBirth: $('#newDateOfBirth').val(),
                gender: $('#newGender').val(),
                joinDate: $('#newJoinDate').val()
            };
            $.ajax({
                url: '/demospringmvc/admin/khachhang/add',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(newKhachhang),
                success: function(response) {
                    alert(response);
                    $('#addKhachhangForm').hide();
                    renderKhachhangList(khachhangData);
                }
            });
        }
    }

    function updateCustomer(khachhang, customerCard) {
        khachhang.name = customerCard.find('input').eq(0).val();
        khachhang.dateOfBirth = new Date(customerCard.find('input').eq(1).val()).getTime();
        khachhang.gender = customerCard.find('input').eq(2).val();
        khachhang.address = customerCard.find('input').eq(3).val();
        khachhang.phoneNumber = customerCard.find('input').eq(4).val();
        khachhang.email = customerCard.find('input').eq(5).val();
        khachhang.joinDate = new Date(customerCard.find('input').eq(6).val()).getTime();

        $.ajax({
            url: '/demospringmvc/admin/khachhang/update',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(khachhang),
            success: function(updatedKhachhang) {
                var index = customerData.findIndex(function(kh) {
                    return kh.id === updatedKhachhang.id;
                });
                if(index !== -1) {
                    customerData[index] = updatedKhachhang;
                }
                renderCustomerList(customerData);
            }
        });
    }
</script>

</body>
</html>
