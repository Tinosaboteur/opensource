<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Thông Tin Nhân Viên</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/nhanvien.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/menu.css" />

</head>
<body>
   <header>
      <div class="dropdown ">
        <button class="dropbtn">
            <i class="fa-solid fa-bars fa-sm"></i>
        </button>
        <div class="dropdown-content">
                      <a href="/demospringmvc/admin/home">Trang Chủ</a> 
            <a href="/demospringmvc/admin/chitietgoitap">Chi Tiết Gói Tập</a> 
            <a href="/demospringmvc/admin/dangkiloptap">Đăng Ký Lớp Tập</a> 
            <a href="/demospringmvc/admin/khachhang">Khách Hàng</a>
            <a href="/demospringmvc/admin/nhanvien">Nhân Viên</a> 
            <a href="/demospringmvc/admin/thietbi">Thiết bị</a> 
            <a href="/demospringmvc/admin/phukien">Phụ kiện</a> 
        </div>
    </div>
    <a id="tool" href="javascript:void(0);" onclick="editMode()"><i class="fa-solid fa-wrench"></i></a>
    <a id="add" href="javascript:void(0);" onclick="addNhanvienForm()"><i class="fa-solid fa-square-plus"></i></a>
    <div class="search-container">
        <span class="search-icon"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: rgb(222, 17, 17);"></i></span>
        <input type="text" placeholder="Tìm kiếm..." id="name" name="name">
    </div> 
</header>
     
<div id="addNhanvienForm" style="display:none;">
    <h2>Thêm Nhân Viên</h2>
    <div class="nhanvien-card">
        <input type="text" placeholder="Tên" id="newName">
        <input type="text" placeholder="Vị trí" id="newPosition">
        <input type="text" placeholder="SĐT" id="newPhoneNumber">
        <input type="text" placeholder="Email" id="newEmail">
        <input type="text" placeholder="Lương" id="newSalary">
        <input type="text" placeholder="Ngày bắt đầu" id="newStartDate">
        <button onclick="addNhanvien()">Thêm</button>
    </div>
</div>
<section class="nhanvien-info-container">
</section>

<script>
var editModeEnabled = false;

function editMode() {
    editModeEnabled = !editModeEnabled;
    if (editModeEnabled) {
        renderNhanvienList(nhanvienData);
    } else {
        location.reload();
    }
}


    function addNhanvienForm() {
        $('#addNhanvienForm').toggle();
    }

    function addNhanvien() {
        var confirmAdd = confirm("Bạn có chắc chắn muốn thêm nhân viên này không?");
        if (confirmAdd) {
        	location.reload();
            var newNhanvien = {
                name: $('#newName').val(),
                position: $('#newPosition').val(),
                phoneNumber: $('#newPhoneNumber').val(),
                email: $('#newEmail').val(),
                salary: $('#newSalary').val(),
                startDate: new Date($('#newStartDate').val()).getTime()
            };
            $.ajax({
                url: '/demospringmvc/admin/nhanvien/add',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(newNhanvien),
                success: function(response) {
                    alert(response);
                    $('#addNhanvienForm').hide();
                    renderNhanvienList(nhanvienData);
                }
            });
        }
    }

    $(document).ready(function() {
        $.ajax({
            url: '/demospringmvc/admin/nhanvien/data',
            type: 'GET',
            success: function(data) {
                nhanvienData = data;
                renderNhanvienList(nhanvienData);
            }
        });

        $('#name').on('input', function() {
            searchNhanvien(); 
        });

        $('.close-icon').on('click', function() {
            $('#name').val('');
            renderNhanvienList(nhanvienData);
        });
    });

    function searchNhanvien() {
        var searchValue = $('#name').val().toLowerCase();
        var filteredData = nhanvienData.filter(function(nhanvien) {
            return nhanvien.name.toLowerCase().includes(searchValue); 
        });
        renderNhanvienList(filteredData); 
    }

    function renderNhanvienList(data) {
        var nhanvienList = $('.nhanvien-info-container');
        nhanvienList.empty();
        if (data.length === 0) {
            nhanvienList.append('<p style="font-size: 3rem">Không tìm thấy thông tin nhân viên...</p>');
        } else {
            $.each(data, function(i, nhanvien) {
                var nhanvienCard = $('<div>').addClass('nhanvien-card');
                if(editModeEnabled) {
                    $('<input>').attr('type', 'hidden').val(nhanvien.employeeID).appendTo(nhanvienCard);
                    $('<input>').attr('type', 'text').val(nhanvien.name).appendTo(nhanvienCard);
                    $('<input>').attr('type', 'text').val(nhanvien.position).appendTo(nhanvienCard);
                    $('<input>').attr('type', 'text').val(nhanvien.phoneNumber).appendTo(nhanvienCard);
                    $('<input>').attr('type', 'text').val(nhanvien.email).appendTo(nhanvienCard);
                    $('<input>').attr('type', 'text').val(nhanvien.salary).appendTo(nhanvienCard);
                    $('<input>').attr('type', 'text').val(new Date(parseInt(nhanvien.startDate)).toLocaleDateString('vi-VN')).appendTo(nhanvienCard);
                    $('<button>').text('OK').on('click', function() {
                        updateNhanvien(nhanvienCard, nhanvien);
                    }).appendTo(nhanvienCard);
                    $('<button>').text('Xóa').css('background-color', 'red').on('click', function() {
                        deleteNhanvien(nhanvien.employeeID);
                    }).appendTo(nhanvienCard);
                } else {
                    $('<input>').attr('type', 'hidden').val(nhanvien.employeeID).appendTo(nhanvienCard);
                    $('<h2>').addClass('nhanvien-name').text(nhanvien.name).appendTo(nhanvienCard);
                    $('<p>').addClass('nhanvien-info').text('Vị trí: ' + nhanvien.position).appendTo(nhanvienCard);
                    $('<p>').addClass('nhanvien-info').text('SĐT: ' + nhanvien.phoneNumber).appendTo(nhanvienCard);
                    $('<p>').addClass('nhanvien-info').text('Email: ' + nhanvien.email).appendTo(nhanvienCard);
                    $('<p>').addClass('nhanvien-info').text('Lương: ' + nhanvien.salary).appendTo(nhanvienCard);
                    $('<p>').addClass('nhanvien-info').text('Ngày bắt đầu: ' + new Date(parseInt(nhanvien.startDate)).toLocaleDateString('vi-VN')).appendTo(nhanvienCard);
                }
                nhanvienCard.appendTo(nhanvienList);
            });
        }
    }

    function updateNhanvien(nhanvienCard, nhanvien) {
        var updatedNhanvien = {
            employeeID: parseInt(nhanvienCard.find('input').eq(0).val()),
            name: nhanvienCard.find('input').eq(1).val(),
            position: nhanvienCard.find('input').eq(2).val(),
            phoneNumber: nhanvienCard.find('input').eq(3).val(),
            email: nhanvienCard.find('input').eq(4).val(),
            salary: nhanvienCard.find('input').eq(5).val(),
            startDate: new Date(nhanvienCard.find('input').eq(6).val()).getTime()
        };

        $.ajax({
            url: '/demospringmvc/admin/nhanvien/update',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(updatedNhanvien),
            success: function(responseNhanvien) {
                var index = nhanvienData.findIndex(function(nv) {
                    return nv.employeeID === responseNhanvien.employeeID;
                });
                if(index !== -1) {
                    nhanvienData[index] = responseNhanvien;
                }
                renderNhanvienList(nhanvienData);
            }
        });
    }

    function deleteNhanvien(id) {
        var confirmDelete = confirm("Bạn có chắc chắn muốn xóa nhân viên này không?");
        if (confirmDelete) {
            $.ajax({
                url: '/demospringmvc/admin/nhanvien/delete/' + id,
                type: 'DELETE',
                success: function(response) {
                    alert(response);
                    renderNhanvienList(nhanvienData);
                },
                
            });
        }
    }


</script>

</body>
</html>
