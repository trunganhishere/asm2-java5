



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
    <h1>Chào mừng đến trang Khach Hang</h1>
    <hr>
    <form method="post" action="/khach-hang/<c:if test="${not empty kh.id}">update?id=${kh.id}</c:if><c:if test="${empty kh.id}">add</c:if>">

        <div class="mb-3">
            <label for="ten" class="form-label">Tên khách hàng</label>
            <input type="text" class="form-control" id="ten" name="hoTen" value="${kh.hoTen}">
        </div>

        <div class="mb-3">
            <label for="dc" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="dc" name="diaChi" value="${kh.diaChi}">
        </div>

        <div class="mb-3">
            <label for="sdt" class="form-label">Số điện thoại</label>
            <input type="text" class="form-control" id="sdt" name="sdt" value="${kh.sdt}">
        </div>

        <label class="form-label">Trang thai</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Active" ${kh.trangThai=="Active"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault1">
                Active
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2" value="Inactive" ${kh.trangThai=="Inactive"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault2">
                Inactive
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="khach-hang?page=${ds.number-1}">Previous</a>
            </li>
            <c:forEach begin="1" end="${ds.totalPages}" var="page">
                <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">
                    <li class="page-item">
                        <a class="page-link"
                           href="/khach-hang?page=${page-1}">
                                ${page}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="khach-hang?page=${ds.number+1}">Next</a></li>
        </ul>
    </nav>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID</th>
            <th scope="col">Họ tên</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Ngày tạo</th>
            <th scope="col">Ngày sửa</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ds.content}" var="a" varStatus="i">
            <tr>
                <th scope="row">${i.index+1}</th>
                <td>${a.id}</td>
                <td>${a.hoTen}</td>
                <td>${a.diaChi}</td>
                <td>${a.sdt}</td>
                <td>${a.trangThai}</td>
                <td>${a.ngayTao}</td>
                <td>${a.ngaySua}</td>
                <td>
                    <a class="btn btn-danger" href="/khach-hang/delete?id=${a.id}">Delete</a>
                    <a class="btn btn-info" href="/khach-hang/detail?id=${a.id}">Detail</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>

<!-- Import Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
