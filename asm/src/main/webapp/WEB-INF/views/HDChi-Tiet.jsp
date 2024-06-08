<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<html>
<head>
    <title>Quản lý hóa đơn chi tiết</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <h1>Hóa đơn chi tiết</h1>
    <form action="/hdchi-tiet/add" method="post">
        <input type="hidden" name="idHoaDon" value="${idHoaDon}">
        <div class="mb-3">
            <label class="form-label">Sản phẩm:</label>
            <select name="sanPhamChiTiet.id" class="form-select" onchange="updatePrice()">
                <c:forEach items="${listCTSP}" var="ctsp">
                    <option value="${ctsp.id}" data-gia-ban="${ctsp.giaBan}">
                            ${ctsp.sanPham.tenSanPham} - ${ctsp.mauSac.tenMau} - ${ctsp.size.tenSize}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Số lượng mua:</label>
            <input type="number" class="form-control" name="soLuongMua" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giá bán:</label>
            <input type="text" class="form-control" id="gia_ban_display" disabled>
            <input type="hidden" id="gia_ban_hidden" name="giaBan">
        </div>
        <button type="submit" class="btn btn-outline-success">Thêm HDCT</button>
    </form>

    <table class="table table-hover mt-4">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Màu</th>
            <th>Kích cỡ</th>
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
                <td>${hdct.sanPhamChiTiet.sanPham.tenSanPham}</td>
                <td>${hdct.sanPhamChiTiet.mauSac.tenMau}</td>
                    <td>${hdct.sanPhamChiTiet.size.tenSize}</td>
                <td>${hdct.soLuongMua}</td>
                <td>${hdct.sanPhamChiTiet.giaBan}</td>
                <td>${hdct.tongTien}</td>
                <td>${hdct.ngayTao}</td>
                <td>${hdct.ngaySua}</td>
                <td>
                    <a href="/hdchi-tiet/delete?id=${hdct.id}&idHoaDon=${hdct.hoaDon.id}" class="btn btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
