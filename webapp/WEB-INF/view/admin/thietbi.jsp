<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông Tin Thiết Bị</title>
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
    <a id="add" href="javascript:void(0);" onclick="addThietbiForm()"><i class="fa-solid fa-square-plus"></i></a>
    <div class="search-container">
        <span class="search-icon"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: rgb(222, 17, 17);"></i></span>
        <input type="text" placeholder="Tìm kiếm..." id="name" name="name">
    </div> 
</header>

<div id="addThietbiForm" style="display:none;">
    <h2>Thêm Thiết Bị</h2>
    <div class="thietbi-card">
        <input type="text" placeholder="Tên" id="newName">
        <input type="text" placeholder="Mô tả" id="newDescription">
        <input type="text" placeholder="Số lượng" id="newQuantity">
        <input type="text" placeholder="Trạng thái" id="newStatus">
        <input type="text" placeholder="Link ảnh" id="newImg">
        <button onclick="addThietbi()">Thêm</button>
    </div>
</div>

<section class="thietbi-info-container">
</section>

<script>
var editModeEnabled = false;

function editMode() {
    editModeEnabled = !editModeEnabled;
    if (editModeEnabled) {
        renderThietbiList(thietbiData);
    } else {
        location.reload();
    }
}

function addThietbiForm() {
    $('#addThietbiForm').toggle();
}

function addThietbi() {
    var confirmAdd = confirm("Bạn có chắc chắn muốn thêm thiết bị này không?");
    if (confirmAdd) {
        location.reload();
        var newThietbi = {
            name: $('#newName').val(),
            description: $('#newDescription').val(),
            quantity: $('#newQuantity').val(),
            status: $('#newStatus').val(),
            img: $('#newImg').val()
        };
        $.ajax({
            url: '/demospringmvc/admin/thietbi/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(newThietbi),
            success: function(response) {
                alert(response);
                $('#addThietbiForm').hide();
                renderThietbiList(thietbiData);
            }
        });
    }
}

$(document).ready(function() {
    $.ajax({
        url: '/demospringmvc/admin/thietbi/data',
        type: 'GET',
        success: function(data) {
            thietbiData = data;
            renderThietbiList(thietbiData);
        }
    });

    $('#name').on('input', function() {
        searchThietbi(); 
    });

    $('.close-icon').on('click', function() {
        $('#name').val('');
        renderThietbiList(thietbiData);
    });
});

function searchThietbi() {
    var searchValue = $('#name').val().toLowerCase();
    var filteredData = thietbiData.filter(function(thietbi) {
        return thietbi.name.toLowerCase().includes(searchValue); 
    });
    renderThietbiList(filteredData); 
}

function renderThietbiList(data) {
    var thietbiList = $('.thietbi-info-container');
    thietbiList.empty();
    if (data.length === 0) {
        thietbiList.append('<p style="font-size: 3rem">Không tìm thấy thông tin thiết bị...</p>');
    } else {
        $.each(data, function(i, thietbi) {
            var thietbiCard = $('<div>').addClass('thietbi-card');
            if(editModeEnabled) {
                $('<input>').attr('type', 'hidden').val(thietbi.equipmentID).appendTo(thietbiCard);
                $('<input>').attr('type', 'text').val(thietbi.name).appendTo(thietbiCard);
                $('<input>').attr('type', 'text').val(thietbi.description).appendTo(thietbiCard);
                $('<input>').attr('type', 'text').val(thietbi.quantity).appendTo(thietbiCard);
                $('<input>').attr('type', 'text').val(thietbi.status).appendTo(thietbiCard);
                $('<input>').attr('type', 'text').val(thietbi.img).appendTo(thietbiCard); // Sửa đổi ở đây
                $('<button>').text('OK').on('click', function() {
                    updateThietbi(thietbiCard, thietbi);
                }).appendTo(thietbiCard);
                $('<button>').text('Xóa').css('background-color', 'red').on('click', function() {
                    deleteThietbi(thietbi.equipmentID);
                }).appendTo(thietbiCard);
            } else {
                $('<input>').attr('type', 'hidden').val(thietbi.equipmentID).appendTo(thietbiCard);
                $('<h2>').addClass('thietbi-name').text(thietbi.name).appendTo(thietbiCard);
                $('<p>').addClass('thietbi-info').text('Mô tả: ' + thietbi.description).appendTo(thietbiCard);
                $('<p>').addClass('thietbi-info').text('Số lượng: ' + thietbi.quantity).appendTo(thietbiCard);
                $('<p>').addClass('thietbi-info').text('Trạng thái: ' + thietbi.status).appendTo(thietbiCard);
                $('<img>').addClass('thietbi-image').attr('src', thietbi.img).appendTo(thietbiCard); // Sửa đổi ở đây
            }
            thietbiCard.appendTo(thietbiList);
        });
    }
}

function updateThietbi(thietbiCard, thietbi) {
    var updatedThietbi = {
        equipmentID: parseInt(thietbiCard.find('input').eq(0).val()),
        name: thietbiCard.find('input').eq(1).val(),
        description: thietbiCard.find('input').eq(2).val(),
        quantity: thietbiCard.find('input').eq(3).val(),
        status: thietbiCard.find('input').eq(4).val(),
        img: thietbiCard.find('input').eq(5).val()
    };

    $.ajax({
        url: '/demospringmvc/admin/thietbi/update',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(updatedThietbi),
        success: function(responseThietbi) {
            var index = thietbiData.findIndex(function(tb) {
                return tb.equipmentID === responseThietbi.equipmentID;
            });
            if(index !== -1) {
                thietbiData[index] = responseThietbi;
            }
            renderThietbiList(thietbiData);
        }
    });
}

function deleteThietbi(id) {
    var confirmDelete = confirm("Bạn có chắc chắn muốn xóa thiết bị này không?");
    if (confirmDelete) {
        $.ajax({
            url: '/demospringmvc/admin/thietbi/delete/' + id,
            type: 'DELETE',
            success: function(response) {
                alert(response);
                renderThietbiList(thietbiData);
            },
            
        });
    }
}
</script>

</body>
</html>
