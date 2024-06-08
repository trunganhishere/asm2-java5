
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

<%@ include file="header.jsp" %>

<div class="container">
    <h1>Hóa đơn</h1>
    <hr>
    <form method="post" action="/hoa-don/<c:if test="${not empty hd.id}">update?id=${hd.id}</c:if><c:if test="${empty hd.id}">add</c:if>">
        <div class="mb-3">
            <label class="form-label mt-3">Khách hàng</label>
            <select class="form-select" aria-label="Default select example" name="khachHang.id">
                <c:forEach items="${kh}" var="a">
                    <option value="${a.id}" ${a.id == hd.khachHang.id ? "selected" : ""}>${a.hoTen} - ${a.diaChi} - ${a.sdt}</option>
                </c:forEach>
            </select>
        </div>
        <label class="form-label">Trạng thái</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Pending" ${hd.trangThai == "Pending" ? "checked" : ""}>
            <label class="form-check-label" for="flexRadioDefault1">
                Pending
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2" value="Completed" ${hd.trangThai == "Completed" ? "checked" : ""}>
            <label class="form-check-label" for="flexRadioDefault2">
                Completed
            </label>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID</th>
            <th scope="col">Khach hàng </th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Ngày tạo</th>
            <th scope="col">Ngày sửa</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ds.content}" var="a" varStatus="i">
            <tr>
                <th scope="row">${i.index + 1}</th>
                <td>${a.id}</td>
                <td>${a.khachHang.hoTen}</td>
                <td>${a.khachHang.diaChi}</td>
                <td>${a.khachHang.sdt}</td>
                <td>${a.ngayTao}</td>
                <td>${a.ngaySua}</td>
                <td>${a.trangThai}</td>
                <td>
                    <a class="btn btn-danger" href="/hoa-don/delete?id=${a.id}">Xóa</a>
                    <a class="btn btn-info" href="/hoa-don/edit?id=${a.id}">sửa</a>
                    <a class="btn btn-info" href="/hdchi-tiet?idHoaDon=${a.id}">detail</a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="hoa-don?page=${ds.number-1}">Previous</a>
            </li>
            <c:forEach begin="1" end="${ds.totalPages}" var="page">
                <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">
                    <li class="page-item">
                        <a class="page-link"
                           href="/hoa-don?page=${page-1}">
                                ${page}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="hoa-don?page=${ds.number+1}">Next</a></li>
        </ul>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>

<!-- Import Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>

