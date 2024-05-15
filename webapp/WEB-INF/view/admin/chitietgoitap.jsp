<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông Tin Chi Tiết Gói Tập</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/chitietgoitap.css" />
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
    <a id="add" href="javascript:void(0);" onclick="addChitietgoitapForm()"><i class="fa-solid fa-square-plus"></i></a>
    <div class="search-container">
        <span class="search-icon"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: rgb(222, 17, 17);"></i></span>
        <input type="text" placeholder="Tìm kiếm..." id="name" name="name">
    </div> 
</header>
     
<div id="addChitietgoitapForm" style="display:none;">
    <h2>Thêm Chi Tiết Gói Tập</h2>
    <div class="chitietgoitap-card">
        <select id="newCustomerID">
        </select>
        <select id="newPackageID">
        </select>
        <input type="date" id="newStartDate">
        <input type="date" id="newEndDate">
        <button onclick="addChitietgoitap()">Thêm</button>
    </div>
</div>

<section class="chitietgoitap-info-container">
</section>

<div id="editChitietgoitapForm" style="display:none;">
    <h2>Chỉnh Sửa Chi Tiết Gói Tập</h2>
    <div class="chitietgoitap-card">
        <input type="hidden" id="editSubscriptionID">
        <select id="editCustomerID">
        </select>
        <select id="editPackageID">
        </select>
        <input type="date" id="editStartDate">
        <input type="date" id="editEndDate">
        <button onclick="updateChitietgoitap()">OK</button>
    </div>
</div>

<script>
var editModeEnabled = false;
var chitietgoitapData = [];
var khachhangData = [];
var goitapData = [];

function editMode() {
    editModeEnabled = !editModeEnabled;
    if (editModeEnabled) {
        renderChitietgoitapList(chitietgoitapData);
    } else {
        location.reload();
    }
}

function addChitietgoitapForm() {
    $('#addChitietgoitapForm').toggle();

    $('#newCustomerID').val('');
    $('#newPackageID').val('');
    $('#newStartDate').val('');
    $('#newEndDate').val('');

    var customerDropdown = $('#newCustomerID');
    var packageDropdown = $('#newPackageID');

    customerDropdown.empty();
    packageDropdown.empty();

    $('<option>').val('').text('Chọn khách hàng...').appendTo(customerDropdown);
    $('<option>').val('').text('Chọn gói tập...').appendTo(packageDropdown);

    $.each(khachhangData, function(index, khachhang) {
        $('<option>').val(khachhang.customerID).text(khachhang.name).appendTo(customerDropdown);
    });

    $.each(goitapData, function(index, goitap) {
        $('<option>').val(goitap.packageID).text(goitap.name).appendTo(packageDropdown);
    });
}

function addChitietgoitap() {
    var confirmAdd = confirm("Bạn có chắc chắn muốn thêm chi tiết gói tập này không?");
    if (confirmAdd) {
        location.reload();
        var newChitietgoitap = {
            customerID: $('#newCustomerID').val(),
            packageID: $('#newPackageID').val(),
            startDate: formatDate($('#newStartDate').val()),
            endDate: formatDate($('#newEndDate').val())
        };
        $.ajax({
            url: '/demospringmvc/admin/chitietgoitap/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(newChitietgoitap),
            success: function(response) {
                alert(response);
                $('#addChitietgoitapForm').hide();
                renderChitietgoitapList(chitietgoitapData);
            }
        });
    }
}

$(document).ready(function() {
    $.ajax({
        url: '/demospringmvc/admin/chitietgoitap/data',
        type: 'GET',
        success: function(data) {
            chitietgoitapData = data.chitietgoitap;
            khachhangData = data.khachhang;
            goitapData = data.goitap;
            renderChitietgoitapList(chitietgoitapData);
        }
    });

    $('#name').on('input', function() {
        searchChitietgoitap(); 
    });

    $('.close-icon').on('click', function() {
        $('#name').val('');
        renderChitietgoitapList(chitietgoitapData);
    });

    $.each(khachhangData, function(i, khachhang) {
        $('#editCustomerID').append($('<option>', {
            value: khachhang.customerID,
            text: khachhang.name
        }));
    });

    $.each(goitapData, function(i, goitap) {
        $('#editPackageID').append($('<option>', {
            value: goitap.packageID,
            text: goitap.name
        }));
    });

});

function searchChitietgoitap() {
    var searchValue = $('#name').val().toLowerCase();
    var filteredData = chitietgoitapData.filter(function(chitietgoitap) {
        return getCustomerNameByID(chitietgoitap.customerID).toLowerCase().includes(searchValue); 
    });
    renderChitietgoitapList(filteredData); 
}


function renderChitietgoitapList(data) {
    var chitietgoitapList = $('.chitietgoitap-info-container');
    chitietgoitapList.empty();
    if (data.length === 0) {
        chitietgoitapList.append('<p style="font-size: 3rem">Không tìm thấy thông tin chi tiết gói tập...</p>');
    } else {
        $.each(data, function(i, chitietgoitap) {
            var chitietgoitapCard = $('<div>').addClass('chitietgoitap-card');
            if (editModeEnabled) {
                $('<input>').attr('type', 'hidden').val(chitietgoitap.subscriptionID).appendTo(chitietgoitapCard);
                var customerDropdown = $('<select>').appendTo(chitietgoitapCard);
                $.each(khachhangData, function(index, khachhang) {
                    $('<option>').val(khachhang.customerID).text(khachhang.name).appendTo(customerDropdown);
                });
                customerDropdown.val(chitietgoitap.customerID);
                
                var packageDropdown = $('<select>').appendTo(chitietgoitapCard);
                $.each(goitapData, function(index, goitap) {
                    $('<option>').val(goitap.price).text(goitap.name).appendTo(packageDropdown);
                });
                packageDropdown.val(chitietgoitap.packageID);

                $('<input>').attr('type', 'date').val(formatDate(chitietgoitap.startDate)).appendTo(chitietgoitapCard);
                $('<input>').attr('type', 'date').val(formatDate(chitietgoitap.endDate)).appendTo(chitietgoitapCard);

                $('<button>').text('OK').on('click', function() {
                    var updatedChitietgoitap = {
                        subscriptionID: parseInt(chitietgoitapCard.find('input').eq(0).val()),
                        customerID: parseInt(customerDropdown.val()),
                        packageID: parseInt(packageDropdown.val()),
                        startDate: chitietgoitapCard.find('input').eq(1).val(),
                        endDate: chitietgoitapCard.find('input').eq(2).val()
                    };
                    updateChitietgoitap(updatedChitietgoitap);
                }).appendTo(chitietgoitapCard);
            
            } else {
                $('<input>').attr('type', 'hidden').val(chitietgoitap.subscriptionID).appendTo(chitietgoitapCard);
                $('<p>').addClass('chitietgoitap-info').text('Tên Khách Hàng: ' + getCustomerNameByID(chitietgoitap.customerID)).appendTo(chitietgoitapCard);
                $('<p>').addClass('chitietgoitap-info').text('Tên Gói Tập: ' + getnameByID(chitietgoitap.packageID)).appendTo(chitietgoitapCard);
                $('<p>').addClass('chitietgoitap-info').text('Ngày Bắt Đầu: ' + formatDate(chitietgoitap.startDate)).appendTo(chitietgoitapCard);
                $('<p>').addClass('chitietgoitap-info').text('Ngày Kết Thúc: ' + formatDate(chitietgoitap.endDate)).appendTo(chitietgoitapCard);
            }
            chitietgoitapCard.appendTo(chitietgoitapList);
        });
    }
}

function formatDate(date) {
    var d = new Date(date);
    var day = d.getDate().toString().padStart(2, '0');
    var month = (d.getMonth() + 1).toString().padStart(2, '0');
    var year = d.getFullYear();
    return day + '/' + month + '/' + year;
}


function getCustomerNameByID(customerID) {
    var customerName = '';
    $.each(khachhangData, function(i, khachhang) {
        if (khachhang.customerID == customerID) {
            customerName = khachhang.name;
            return false; 
        }
    });
    return customerName;
}

function getnameByID(packageID) {
    var name = '';
    $.each(goitapData, function(i, goitap) {
        if (goitap.price == packageID) {
            name = goitap.name;
            return false; 
        }
    });
    return name;
}


function updateChitietgoitap(chitietgoitap) {
    $.ajax({
        url: '/demospringmvc/admin/chitietgoitap/update',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(chitietgoitap),
        success: function(responseChitietgoitap) {
            var index = chitietgoitapData.findIndex(function(ctgt) {
                return ctgt.subscriptionID === responseChitietgoitap.subscriptionID;
            });
            if (index !== -1) {
                chitietgoitapData[index] = responseChitietgoitap;
                renderChitietgoitapList(chitietgoitapData);
            }
        },
        
    });
}



</script>

</body>
</html>
