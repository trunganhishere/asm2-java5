<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!doctype html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <title>Bootstrap demo</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body class="container">--%>

<%--<form method="post" action="/san-pham/<c:if test="${not empty sp.id}">update?id=${sp.id}</c:if><c:if test="${empty sp.id}">add</c:if>">--%>
<%--    <div class="mb-3">--%>
<%--        <label for="maSanPham" class="form-label">Mã</label>--%>
<%--        <input type="text" class="form-control" id="maSanPham" name="maSanPham" value="${sp.maSanPham}">--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="tenSanPham" class="form-label">Tên sản phẩm</label>--%>
<%--        <input type="text" class="form-control" id="tenSanPham" name="tenSanPham" value="${sp.tenSanPham}">--%>
<%--    </div>--%>

<%--    <label class="form-label">Trạng thái</label>--%>
<%--    <div class="form-check">--%>
<%--        <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Available" ${sp.trangThai == "Available" ? "checked" : ""}>--%>
<%--        <label class="form-check-label" for="flexRadioDefault1">--%>
<%--            Available--%>
<%--        </label>--%>
<%--    </div>--%>
<%--    <div class="form-check">--%>
<%--        <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2" value="Inavailable" ${sp.trangThai == "Inavailable" ? "checked" : ""}>--%>
<%--        <label class="form-check-label" for="flexRadioDefault2">--%>
<%--            Inavailable--%>
<%--        </label>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label  class="form-label mt-3">Danh mục</label>--%>
<%--        <select class="form-select" aria-label="Default select example" name="danhMuc">--%>
<%--            <c:forEach items="${dm}" var="a">--%>
<%--                <option value="${a.id}" ${a.id == sp.danhMuc.id ? "selected" : ""}>${a.tenDanhMuc}</option>--%>
<%--            </c:forEach>--%>
<%--        </select>--%>
<%--    </div>--%>

<%--    <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--</form>--%>

<%--<table class="table">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th scope="col">STT</th>--%>
<%--        <th scope="col">ID</th>--%>
<%--        <th scope="col">Mã</th>--%>
<%--        <th scope="col">Họ tên</th>--%>
<%--        <th scope="col">Trạng thái</th>--%>
<%--        <th scope="col">Ngày tạo</th>--%>
<%--        <th scope="col">Ngày sửa</th>--%>
<%--        <th scope="col">Danh mục</th>--%>
<%--        <th scope="col">Action</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${ds.content}" var="a" varStatus="i">--%>
<%--        <tr>--%>
<%--            <th scope="row">${i.index + 1}</th>--%>
<%--            <td>${a.id}</td>--%>
<%--            <td>${a.maSanPham}</td>--%>
<%--            <td>${a.tenSanPham}</td>--%>
<%--            <td>${a.trangThai}</td>--%>
<%--            <td>${a.ngayTao}</td>--%>
<%--            <td>${a.ngaySua}</td>--%>
<%--            <td>${a.danhMuc.tenDanhMuc}</td>--%>
<%--            <td>--%>
<%--                <a class="btn btn-danger" href="/san-pham/delete?id=${a.id}">Xóa</a>--%>
<%--                <a class="btn btn-info" href="/san-pham/edit?id=${a.id}">Chi tiết</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--    <nav aria-label="Page navigation example">--%>
<%--    <ul class="pagination">--%>
<%--    <li class="page-item">--%>
<%--        <a class="page-link" href="san-pham?page=${ds.number-1}">Previous</a>--%>
<%--    </li>--%>
<%--    <c:forEach begin="1" end="${ds.totalPages}" var="page">--%>
<%--        <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">--%>
<%--            <li class="page-item">--%>
<%--            <a class="page-link"--%>
<%--            href="/san-pham?page=${page-1}">--%>
<%--            ${page}--%>
<%--            </a>--%>
<%--            </li>--%>
<%--        </c:if>--%>
<%--    </c:forEach>--%>
<%--        <li class="page-item"><a class="page-link" href="san-pham?page=${ds.number+1}">Next</a></li>--%>
<%--    </ul>--%>
<%--    </nav>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm</title>
    <!-- Import Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<%@ include file="../trang-chu/header.jsp" %>

<!-- Nội dung của trang Sản phẩm -->
<div class="container">
    <h1>Chào mừng đến trang Sản phẩm</h1>
    <hr>
    <form method="post" action="/spchi-tiet/<c:if test="${not empty spct.id}">update?id=${spct.id}</c:if><c:if test="${empty spct.id}">add</c:if>">
        <div class="mb-3">
            <label  class="form-label mt-3">Sản phẩm</label>
            <select class="form-select" aria-label="Default select example" name="danhMuc">
                <c:forEach items="${sp}" var="a">
                    <option value="${a.id}" ${a.id == spct.sanPham.id ? "selected" : ""}>${a.tenSanPham}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label  class="form-label mt-3">Màu</label>
            <select class="form-select" aria-label="Default select example" name="danhMuc">
                <c:forEach items="${ms}" var="a">
                    <option value="${a.id}" ${a.id == spct.mauSac.id ? "selected" : ""}>${a.tenMau}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label  class="form-label mt-3">Size</label>
            <select class="form-select" aria-label="Default select example" name="danhMuc">
                <c:forEach items="${s}" var="a">
                    <option value="${a.id}" ${a.id == spct.khachHang.id ? "selected" : ""}>${a.tenSize}</option>
                </c:forEach>
            </select>
        </div>


        <label class="form-label">Trạng thái</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Available" ${spct.trangThai == "Available" ? "checked" : ""}>
            <label class="form-check-label" for="flexRadioDefault1">
                Available
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2" value="Unavailable" ${spct.trangThai == "Unavailable" ? "checked" : ""}>
            <label class="form-check-label" for="flexRadioDefault2">
                Unavailable
            </label>
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="spchi-tiet?page=${ds.number-1}">Previous</a>
            </li>
            <c:forEach begin="1" end="${ds.totalPages}" var="page">
                <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">
                    <li class="page-item">
                        <a class="page-link"
                           href="/spchi-tiet?page=${page-1}">
                                ${page}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="spchi-tiet?page=${ds.number+1}">Next</a></li>
        </ul>
    </nav>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID</th>
            <th scope="col">Sản phẩm</th>
            <th scope="col">Màu</th>
            <th scope="col">Size</th>
            <th scope="col">Gía</th>
            <th scope="col">SL</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Ngày tạo</th>
            <th scope="col">Ngày sửa</th>

            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ds.content}" var="a" varStatus="i">
            <tr>
                <th scope="row">${i.index + 1}</th>
                <td>${a.id}</td>
                <td>${a.sanPham.tenSanPham}</td>
                <td>${a.mauSac.tenMau}</td>
                <td>${a.size.tenSize}</td>
                <td>${a.giaBan}</td>
                <td>${a.soLuong}</td>
                <td>${a.trangThai}</td>
                <td>${a.ngayTao}</td>
                <td>${a.ngaySua}</td>

                <td>
                    <a class="btn btn-danger" href="/spchi-tiet/delete?id=${a.id}">Xóa</a>
                    <a class="btn btn-info" href="/spchi-tiet/edit?id=${a.id}">Chi tiết</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>

<!-- Import Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>

