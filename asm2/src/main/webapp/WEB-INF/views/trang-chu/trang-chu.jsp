<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <!-- Import Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        .container {
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            margin-top: 20px;
        }
        .table-container, .info-container, .form-container {
            flex: 1;
            margin: 0 10px;
        }
        .table-container table, .info-container table, .form-container table {
            width: 100%;
        }
        .form-container {
            max-width: 300px;
        }
        table, th, td {
            border: 1px solid #000000;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container row">

    <div class="container-fluid col-8 bg-border bg-border-3 ">
        <div class="table-container">
            <h2>Hóa đơn</h2>
            <table class="table" style="height: 150px;">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">ID</th>
                    <th scope="col">Khách hàng</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${hd}" var="a" varStatus="i">
                    <tr>
                        <th scope="row">${i.index + 1}</th>
                        <td>${a.id}</td>
                        <td>${a.khachHang.hoTen}</td>
                        <td>${a.ngayTao}</td>
                        <td>${a.trangThai}</td>
                        <td>
                            <a href="/ban-hang/detail?idHoaDon=${a.id}" class="btn btn-primary btn-select">Chọn</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="table-container">
            <h2>Các sản phẩm đã chọn</h2>
            <table id="selectedProductsTable mt-4" class="table">
                <
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Sản phẩm</th>
                        <th>Số lượng mua</th>
                        <th>Giá bán</th>
                        <th>Tổng tiền</th>
                        <th>Ngày tạo</th>
                        <th>Ngày sửa</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listHDCT}" var="hdct" varStatus="i">
                        <tr>
                            <td>${i.index + 1}</td>
                            <td>${hdct.sanPhamChiTiet.sanPham.tenSanPham} - ${hdct.sanPhamChiTiet.mauSac.tenMau} - ${hdct.sanPhamChiTiet.size.tenSize}</td>
                            <td>${hdct.soLuongMua}</td>
                            <td>${hdct.sanPhamChiTiet.giaBan}</td>
                            <td>${hdct.tongTien}</td>
                            <td>${hdct.ngayTao}</td>
                            <td>${hdct.ngaySua}</td>
                            <td>
                                <a href="/hdchi-tiet/detail?id=${hdct.id}&idHoaDon=${hdct.hoaDon.id}" class="btn btn-secondary">Chi tiết</a>
                                <a href="/hdchi-tiet/delete?id=${hdct.id}&idHoaDon=${hdct.hoaDon.id}" class="btn btn-danger">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </div>

        <div class="table-container">
            <h2>Sản phẩm</h2>

            <table class="table" style="height: 250px;" >
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">ID</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Màu</th>
                    <th scope="col">Size</th>
                    <th scope="col">Gía</th>
                    <th scope="col">SL</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ds}" var="a" varStatus="i">
                    <tr>
                        <th scope="row">${i.index + 1}</th>
                        <td>${a.id}</td>
                        <td>${a.sanPham.tenSanPham}</td>
                        <td>${a.mauSac.tenMau}</td>
                        <td>${a.size.tenSize}</td>
                        <td>${a.giaBan}</td>
                        <td>${a.soLuong}</td>
                        <td>
                            <form method="POST" action="/ban-hang/add" style="display:inline;">
                                <input type="hidden" name="hoaDonId" value="${param.hoaDonId}">
                                <input type="hidden" name="sanPhamCTId" value="${a.id}">
                                <input type="number" name="soLuong" value="1" min="1" style="width: 50px;">
                                <button type="submit" class="btn btn-primary">Thêm</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="container-fluid col-4 bg-border bg-border-3">
        <div class="form-container">
            <h2>Thêm Hóa Đơn</h2>
            <form id="addProductForm" method="POST" action="/ban-hang/addhd">
                <div class="mb-3">
                    <label for="hoaDonId" class="form-label">Hóa đơn ID</label>
                    <input type="text" class="form-control" id="hoaDonId" readonly >
                </div>
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
            <a class="btn btn-primary m-3 p-3" href="khach-hang">Thêm Khách Hàng</a>
            <hr>
            <h2>Thông tin hóa đơn</h2>
            <hr>
            <div class="border boder-2 border-info p-3 m-3">
                <form method="post" action="/ban-hang/update">
                    <div class="mb-3">
                        <label class="form-label">ID HĐ:</label>
                        <!-- Input for Hóa đơn ID -->
                    </div>
                    <div class="mb-3">
                        <label class="form-label">SL</label>
                        <!-- Input for Số lượng -->
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tổng tiền</label>
                        <!-- Input for Tổng tiền -->
                    </div>
                    <button type="submit" class="btn btn-primary">Sửa số</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>


