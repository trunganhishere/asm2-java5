<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<%@ include file="header.jsp" %>

<div  style="display: flex; justify-content: center">
<div class="container row">
    <div class="container-fluid col-9 bg-border bg-border-3 ">
        <div class="table-container">
            <h2>Hóa đơn</h2>
            <table class="table" style="height: 150px;">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Khách hàng</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${hd}" var="a" varStatus="i">
                    <tr>
                        <th scope="row">${i.index + 1}</th>
                        <td>${a.khachHang.hoTen}</td>
                        <td>
                                 <a href="/ban-hang/detail?idHoaDon=${a.id}" class="btn btn-primary">Chọn</a>
                                 <a href="/ban-hang/hoa-don/delete?id=${a.id}" class="btn btn-danger">xóa</a>
                        </td>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="table-container">
            <h2>Giỏ hàng</h2>
            <table id="selectedProductsTable mt-4" class="table">

                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Sản phẩm</th>
                            <th>Màu sắc</th>
                            <th>Kích cỡ</th>
                            <th>Số lượng mua</th>
                            <th>Giá bán</th>
                            <th>Tổng tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listHDCT}" var="hdct" varStatus="i">
                            <form id="form-${hdct.id}" method="POST" action="/ban-hang/update-quantity">

                            <tr>
                                <td>${i.index + 1}</td>
                                <td>${hdct.sanPhamChiTiet.sanPham.tenSanPham}</td>
                                <td>${hdct.sanPhamChiTiet.mauSac.tenMau}</td>
                                <td>${hdct.sanPhamChiTiet.size.tenSize}</td>
                                <td>
                                        <input type="hidden" name="id" value="${hdct.id}">
                                        <input type="hidden" name="idHoaDon" value="${hdct.hoaDon.id}">
                                        <input type="number" name="soLuong" value="${hdct.soLuongMua}" min="1">
                                </td>
                                <td>${hdct.sanPhamChiTiet.giaBan}</td>
                                <td>${hdct.tongTien}</td>
                                <td>
                                    <a href="/ban-hang/delete?id=${hdct.id}&idHoaDon=${hdct.hoaDon.id}" class="btn btn-danger">Xóa</a>
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </td>
                            </tr>
                            </form>

                        </c:forEach>
                    </tbody>
            </table>
        </div>
        <div >
            <h2>Sản phẩm</h2>

            <table class="table" style="height: 250px;">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Màu</th>
                    <th scope="col">Size</th>
                    <th scope="col">Giá</th>
                    <th scope="col">SL</th>
                    <th scope="col">Số lượng thêm</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ds}" var="a" varStatus="i">
                    <tr>
                        <th scope="row">${i.index + 1}</th>
                        <td>${a.sanPham.tenSanPham}</td>
                        <td>${a.mauSac.tenMau}</td>
                        <td>${a.size.tenSize}</td>
                        <td>${a.giaBan}</td>
                        <td id="so-luong-sp" value="${a.soLuong}">${a.soLuong}</td>

                            <form method="POST" action="/ban-hang/addsp" style="display:inline;">
                        <td><input type="hidden" name="idHoaDon" value="${param.idHoaDon}">
                                <input type="hidden" name="idSanPhamCT" value="${a.id}">
                                <input type="number" name="soLuong" value="1" min="1" style="width: 50px;" id="input-so-luong"></td>
                                <td>
                                <button class="btn btn-success" onclick="return check2()">Thêm</button>
                                </td>
                            </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="col-3" style="border-left: black 1px solid">
        <a class="btn btn-primary mt-2" style="margin-left: 30%" href="/khach-hang">Thêm Khách Hàng</a>
        <div class="form-container">
            <h2>Tạo hóa đơn</h2>
            <form id="addProductForm" method="POST" action="/ban-hang/addhd">
                <div class="mb-3">
                    <label class="form-label mt-3">Khách hàng</label>
                    <select class="form-select" aria-label="Default select example" name="khachHang.id">
                        <c:forEach items="${kh}" var="a">
                            <option value="${a.id}">${a.hoTen}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Thêm Hóa đơn</button>
            </form>
            <hr>
                        <h2>Thông tin hóa đơn</h2>
                        <div>
                            <form method="post" action="/ban-hang/update?idHoaDon=${hoaDon.id}&khachHangId=${hoaDon.khachHang.id}">
                                <div class="mb-3">
                                    <label class="form-label">Hóa đơn ID</label>
                                    <input type="text" class="form-control" value="${hoaDon.id}" id="hoaDonId" readonly>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label mt-3">Khách hàng</label>
                                    <input type="text" class="form-control" value="${hoaDon.khachHang.hoTen}" readonly>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Tổng tiền</label>
                                    <input type="text" class="form-control" value="${totalAmount}" id="tongTien" readonly>
                                </div>
                                <button class="btn btn-primary" onclick="return checkThanhToan()">Thanh toán</button>
                            </form>
                        <label style="color: red">${error}</label>
                        </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    function checkThanhToan(){
        let idHoaDonThanhToan = document.getElementById("hoaDonId").value
        let tongTienThanhToan = document.getElementById("tongTien").value
        if(idHoaDonThanhToan === ""){
            alert("Vui lòng chọn hóa đơn")
            return false;
        }else if(tongTienThanhToan == 0){
            alert("Giỏ hàng rỗng")
            return false;
        }
        else {
            return true;
        }
    }
    function check2(){
        let soLuong = document.getElementById("so-luong-sp").value
        let iputSoLuong = document.getElementById("input-so-luong").value
        if(iputSoLuong > soLuong){
            alert("so luong khong du")
            return false;
        }else {
            return true;
        }
    }
</script>
</body>
</html>


