<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông Tin Đăng Ký Lớp Tập</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/37c51843b5.js" crossorigin="anonymous"></script>
    <link rel="icon" href="https://th.bing.com/th?id=OIP.ntoUQ-9d68t03f5RRESP-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssfile/dangkiloptap.css" />
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
    <a id="add" href="javascript:void(0);" onclick="addDangkiloptapForm()"><i class="fa-solid fa-square-plus"></i></a>
    <div class="search-container">
        <span class="search-icon"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: rgb(222, 17, 17);"></i></span>
        <input type="text" placeholder="Tìm kiếm..." id="name" name="name">
    </div> 
</header>
     
<div id="addDangkiloptapForm" style="display:none;">
    <h2>Thêm Đăng Ký Lớp Tập</h2>
    <div class="dangkiloptap-card">
        <select id="newCustomerID">
        </select>
        <select id="newScheduleID">
        </select>
        <button onclick="addDangkiloptap()">Thêm</button>
    </div>
</div>

<section class="dangkiloptap-info-container">
</section>

<div id="editDangkiloptapForm" style="display:none;">
    <h2>Chỉnh Sửa Đăng Ký Lớp Tập</h2>
    <div class="dangkiloptap-card">
        <input type="hidden" id="editRegistrationID">
        <select id="editCustomerID">
        </select>
        <select id="editScheduleID">
        </select>
        <button onclick="updateDangkiloptap()">OK</button>
    </div>
</div>

<script>
var editModeEnabled = false;
var dangkiloptapData = [];
var khachhangData = [];
var lichtapData = [];

function editMode() {
    editModeEnabled = !editModeEnabled;
    if (editModeEnabled) {
        renderDangkiloptapList(dangkiloptapData);
    } else {
        location.reload();
    }
}

function addDangkiloptapForm() {
    $('#addDangkiloptapForm').toggle();

    $('#newCustomerID').val('');
    $('#newScheduleID').val('');

    var customerDropdown = $('#newCustomerID');
    var scheduleDropdown = $('#newScheduleID');

    customerDropdown.empty();
    scheduleDropdown.empty();

    $('<option>').val('').text('Chọn khách hàng...').appendTo(customerDropdown);
    $('<option>').val('').text('Chọn lịch tập...').appendTo(scheduleDropdown);

    $.each(khachhangData, function(index, khachhang) {
        $('<option>').val(khachhang.customerID).text(khachhang.name).appendTo(customerDropdown);
    });

    $.each(lichtapData, function(index, lichtap) {
        $('<option>').val(lichtap.scheduleID).text(lichtap.className).appendTo(scheduleDropdown);
    });
}


function addDangkiloptap() {
    var confirmAdd = confirm("Bạn có chắc chắn muốn thêm đăng ký lớp tập này không?");
    if (confirmAdd) {
        location.reload();
        var newDangkiloptap = {
            customerID: $('#newCustomerID').val(),
            scheduleID: $('#newScheduleID').val()
        };
        $.ajax({
            url: '/demospringmvc/admin/dangkiloptap/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(newDangkiloptap),
            success: function(response) {
                alert(response);
                $('#addDangkiloptapForm').hide();
                renderDangkiloptapList(dangkiloptapData);
            }
        });
    }
}


$(document).ready(function() {
    $.ajax({
        url: '/demospringmvc/admin/dangkiloptap/data',
        type: 'GET',
        success: function(data) {
            dangkiloptapData = data.dangkiloptap;
            khachhangData = data.khachhang;
            lichtapData = data.lichtap;
            renderDangkiloptapList(dangkiloptapData);
        }
    });

    $('#name').on('input', function() {
        searchDangkiloptap(); 
    });

    $('.close-icon').on('click', function() {
        $('#name').val('');
        renderDangkiloptapList(dangkiloptapData);
    });

    $.each(khachhangData, function(i, khachhang) {
        $('#editCustomerID').append($('<option>', {
            value: khachhang.customerID,
            text: khachhang.name
        }));
    });

    $.each(lichtapData, function(i, lichtap) {
        $('#editScheduleID').append($('<option>', {
            value: lichtap.scheduleID,
            text: lichtap.className 
        }));
    });

});

function searchDangkiloptap() {
    var searchValue = $('#name').val().toLowerCase();
    var filteredData = dangkiloptapData.filter(function(dangkiloptap) {
        return getCustomerNameByID(dangkiloptap.customerID).toLowerCase().includes(searchValue); 
    });
    renderDangkiloptapList(filteredData); 
}

function renderDangkiloptapList(data) {
    var dangkiloptapList = $('.dangkiloptap-info-container');
    dangkiloptapList.empty();
    if (data.length === 0) {
        dangkiloptapList.append('<p style="font-size: 3rem">Không tìm thấy thông tin đăng ký lớp tập...</p>');
    } else {
        $.each(data, function(i, dangkiloptap) {
            var dangkiloptapCard = $('<div>').addClass('dangkiloptap-card');
            if (editModeEnabled) {
                $('<input>').attr('type', 'hidden').val(dangkiloptap.registrationID).appendTo(dangkiloptapCard);
                var customerDropdown = $('<select>').appendTo(dangkiloptapCard);
                $.each(khachhangData, function(index, khachhang) {
                    $('<option>').val(khachhang.customerID).text(khachhang.name).appendTo(customerDropdown);
                });
                customerDropdown.val(dangkiloptap.customerID);
                
                var scheduleDropdown = $('<select>').appendTo(dangkiloptapCard); // Khai báo và gán giá trị cho scheduleDropdown
                $.each(lichtapData, function(index, lichtap) {
                    $('<option>').val(lichtap.scheduleID).text(lichtap.className).appendTo(scheduleDropdown);
                });
                scheduleDropdown.val(dangkiloptap.scheduleID);

                $('<button>').text('OK').on('click', function() {
                    var updatedDangkiloptap = {
                        registrationID: parseInt(dangkiloptapCard.find('input').eq(0).val()),
                        customerID: parseInt(customerDropdown.val()),
                        scheduleID: parseInt(scheduleDropdown.val())
                    };
                    updateDangkiloptap(updatedDangkiloptap);
                }).appendTo(dangkiloptapCard);
                $('<button>').text('Xóa').css('background-color', 'red').on('click', function() {
                    deleteDangkiloptap(dangkiloptap.registrationID);
                }).appendTo(dangkiloptapCard);
            } else {
                $('<input>').attr('type', 'hidden').val(dangkiloptap.registrationID).appendTo(dangkiloptapCard);
                $('<p>').addClass('dangkiloptap-info').text('Tên Khách Hàng: ' + getCustomerNameByID(dangkiloptap.customerID)).appendTo(dangkiloptapCard);
                $('<p>').addClass('dangkiloptap-info').text('Tên Lớp Tập: ' + getScheduleNameByID(dangkiloptap.scheduleID)).appendTo(dangkiloptapCard);
            }
            dangkiloptapCard.appendTo(dangkiloptapList);
        });
    }
}


function getCustomerNameByID(customerID) {
    var customerName = '';
    $.each(khachhangData, function(i, khachhang) {
        if (khachhang.customerID == customerID) {
            customerName = khachhang.name;
            return false; // Break the loop
        }
    });
    return customerName;
}
function getScheduleNameByID(scheduleID) {
    var scheduleName = '';
    $.each(lichtapData, function(i, lichtap) {
        if (lichtap.scheduleID == scheduleID) {
            scheduleName = lichtap.className;
            return false; // Break the loop
        }
    });
    return scheduleName;
}

function updateDangkiloptap(dangkiloptap) {
    $.ajax({
        url: '/demospringmvc/admin/dangkiloptap/update',
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(dangkiloptap), // Send updatedDangkiloptap to the server
        success: function(responseDangkiloptap) {
            var index = dangkiloptapData.findIndex(function(dklt) {
                return dklt.registrationID === responseDangkiloptap.registrationID;
            });
            if (index !== -1) {
                // Update the local data with the response
                dangkiloptapData[index] = responseDangkiloptap;
                renderDangkiloptapList(dangkiloptapData);
            }
        },
        
    });
}



function deleteDangkiloptap(id) {
    var confirmDelete = confirm("Bạn có chắc chắn muốn xóa đăng ký lớp tập này không?");
    if (confirmDelete) {
        $.ajax({
            url: '/demospringmvc/admin/dangkiloptap/delete/' + id,
            type: 'DELETE',
            success: function(response) {
                alert(response);
                // Remove the deleted item from the array
                dangkiloptapData = dangkiloptapData.filter(function(item) {
                    return item.registrationID !== id;
                });
                renderDangkiloptapList(dangkiloptapData);
            }
        });
    }
}

</script>

</body>
</html>
