<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông Tin Phụ Kiện</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
<link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/EQAD.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/menu.css" />

</head>
<body>
<header>
    <div class="dropdown">
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
    <a id="add" href="javascript:void(0);" onclick="addPhukienForm()"><i class="fa-solid fa-square-plus"></i></a>
    <div class="search-container">
        <span class="search-icon"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: rgb(222, 17, 17);"></i></span>
        <input type="text" placeholder="Tìm kiếm..." id="name" name="name">
    </div> 
</header>

<div id="addPhukienForm" style="display:none;">
    <h2>Thêm Phụ Kiện</h2>
    <div class="phukien-card">
        <input type="text" placeholder="Tên" id="newName">
        <input type="text" placeholder="Mô tả" id="newDescription">
        <input type="text" placeholder="Số lượng" id="newQuantity">
        <input type="text" placeholder="Trạng thái" id="newStatus">
        <input type="text" placeholder="Link ảnh" id="newImg">
        <input type="text" placeholder="Giá" id="newPrice">
        <button onclick="addPhukien()">Thêm</button>
    </div>
</div>

<section class="phukien-info-container">
</section>

<script>
var editModeEnabled = false;

function editMode() {
    editModeEnabled = !editModeEnabled;
    if (editModeEnabled) {
        renderPhukienList(phukienData);
    } else {
        location.reload();
    }
}

function addPhukienForm() {
    $('#addPhukienForm').toggle();
}

function addPhukien() {
    var confirmAdd = confirm("Bạn có chắc chắn muốn thêm phụ kiện này không?");
    if (confirmAdd) {
        location.reload();
        var newPhukien = {
            name: $('#newName').val(),
            description: $('#newDescription').val(),
            quantity: $('#newQuantity').val(),
            status: $('#newStatus').val(),
            img: $('#newImg').val(),
            price: $('#newPrice').val()
        };
        $.ajax({
            url: '/demospringmvc/admin/phukien/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(newPhukien),
            success: function(response) {
                alert(response);
                $('#addPhukienForm').hide();
                renderPhukienList(phukienData);
            }
        });
    }
}

$(document).ready(function() {
    $.ajax({
        url: '/demospringmvc/admin/phukien/data',
        type: 'GET',
        success: function(data) {
            phukienData = data;
            renderPhukienList(phukienData);
        }
    });

    $('#name').on('input', function() {
        searchPhukien(); 
    });

    $('.close-icon').on('click', function() {
        $('#name').val('');
        renderPhukienList(phukienData);
    });
});

function searchPhukien() {
    var searchValue = $('#name').val().toLowerCase();
    var filteredData = phukienData.filter(function(phukien) {
        return phukien.name.toLowerCase().includes(searchValue); 
    });
    renderPhukienList(filteredData); 
}

function renderPhukienList(data) {
    var phukienList = $('.phukien-info-container');
    phukienList.empty();
    if (data.length === 0) {
        phukienList.append('<p style="font-size: 3rem">Không tìm thấy thông tin phụ kiện...</p>');
    } else {
        $.each(data, function(i, phukien) {
            var phukienCard = $('<div>').addClass('phukien-card');
            if(editModeEnabled) {
                $('<input>').attr('type', 'hidden').val(phukien.phukienID).appendTo(phukienCard);
                $('<input>').attr('type', 'text').val(phukien.name).appendTo(phukienCard);
                $('<input>').attr('type', 'text').val(phukien.description).appendTo(phukienCard);
                $('<input>').attr('type', 'text').val(phukien.quantity).appendTo(phukienCard);
                $('<input>').attr('type', 'text').val(phukien.status).appendTo(phukienCard);
                $('<input>').attr('type', 'text').val(phukien.img).appendTo(phukienCard);
                $('<input>').attr('type', 'text').val(phukien.price).appendTo(phukienCard);
                $('<button>').text('OK').on('click', function() {
                    updatePhukien(phukienCard, phukien);
                }).appendTo(phukienCard);
                $('<button>').text('Xóa').css('background-color', 'red').on('click', function() {
                    deletePhukien(phukien.phukienID);
                }).appendTo(phukienCard);
            } else {
                $('<input>').attr('type', 'hidden').val(phukien.phukienID).appendTo(phukienCard);
                $('<h2>').addClass('phukien-name').text(phukien.name).appendTo(phukienCard);
                $('<p>').addClass('phukien-info').text('Mô tả: ' + phukien.description).appendTo(phukienCard);
                $('<p>').addClass('phukien-info').text('Số lượng: ' + phukien.quantity).appendTo(phukienCard);
                $('<p>').addClass('phukien-info').text('Trạng thái: ' + phukien.status).appendTo(phukienCard);
                $('<img>').addClass('phukien-image').attr('src', phukien.img).appendTo(phukienCard);
                $('<p>').addClass('phukien-info').text('Giá: ' + phukien.price).appendTo(phukienCard);
            }
            phukienCard.appendTo(phukienList);
        });
    }
}

function updatePhukien(phukienCard, phukien) {
    var updatedPhukien = {
        phukienID: parseInt(phukienCard.find('input').eq(0).val()),
        name: phukienCard.find('input').eq(1).val(),
        description: phukienCard.find('input').eq(2).val(),
        quantity: phukienCard.find('input').eq(3).val(),
        status: phukienCard.find('input').eq(4).val(),
        img: phukienCard.find('input').eq(5).val(),
        price: phukienCard.find('input').eq(6).val()
    };

    $.ajax({
        url: '/demospringmvc/admin/phukien/update',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(updatedPhukien),
        success: function(responsePhukien) {
            var index = phukienData.findIndex(function(pk) {
                return pk.phukienID === responsePhukien.phukienID;
            });
            if(index !== -1) {
                phukienData[index] = responsePhukien;
            }
            renderPhukienList(phukienData);
        }
    });
}

function deletePhukien(id) {
    var confirmDelete = confirm("Bạn có chắc chắn muốn xóa phụ kiện này không?");
    if (confirmDelete) {
        $.ajax({
            url: '/demospringmvc/admin/phukien/delete/' + id,
            type: 'DELETE',
            success: function(response) {
                alert(response);
                renderPhukienList(phukienData);
            },
            
        });
    }
}
</script>

</body>
</html>
