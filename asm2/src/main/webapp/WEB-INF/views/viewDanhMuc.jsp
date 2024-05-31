<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: duong
  Date: 11/05/2024
  Time: 2:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/home">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/san-pham?page=0">Sản phẩm</a>
                </li>
            </ul>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/danh-muc">Danh mục</a>
                </li>
            </ul>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/khach-hang">Khách hàng</a>
                </li>
            </ul>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/size">Kích cỡ</a>
                </li>
            </ul>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/mau-sac">Màu sắc</a>
                </li>
            </ul>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/hoa-don">Hóa đơn</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">

<form method="post" action="/danh-muc/<c:if test="${not empty go.id}">update?id=${go.id}</c:if><c:if test="${empty go.id}">add</c:if>">

    <div class="mb-3">
        <label for="maSanPham" class="form-label">mã</label>
        <input type="text" class="form-control" id="maSanPham" name="maDanhMuc" value="${go.maDanhMuc}">
    </div>
    <div class="mb-3">
        <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
        <input type="text" class="form-control" id="tenSanPham" name="tenDanhMuc" value="${go.tenDanhMuc}">
    </div>

    <label class="form-label">Trang thai</label>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Hoạt động" ${go.trangThai=="Hoạt động"?"checked":""}>
        <label class="form-check-label" for="flexRadioDefault1">
            Hoạt động
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2" value="Tạm ngưng" ${go.trangThai=="Tạm ngưng"?"checked":""}>
        <label class="form-check-label" for="flexRadioDefault2">
            Tạm ngưng
        </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">ID</th>
        <th scope="col">Mã </th>
        <th scope="col">Tên danh </th>
        <th scope="col">Trang thai</th>
        <th scope="col">Ngày tạo</th>
        <th scope="col">Ngày sửa</th>mục
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${dm}" var="a" varStatus="i">
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${a.id}</td>
            <td>${a.maDanhMuc}</td>
            <td>${a.tenDanhMuc}</td>
            <td>${a.trangThai}</td>
            <td>${a.ngayTao}</td>
            <td>${a.ngaySua}</td>
            <td>
                <a class="btn btn-danger" href="/danh-muc/delete?id=${a.id}">Delete</a>
                <a class="btn btn-info" href="/danh-muc/detail?id=${a.id}">Detail</a>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>