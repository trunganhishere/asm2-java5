
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <h1>Khích cỡ</h1>
    <hr>
    <form method="post" action="/size/<c:if test="${not empty s.id}">update?id=${s.id}</c:if><c:if test="${empty s.id}">add</c:if>">

        <div class="mb-3">
            <label for="maSanPham" class="form-label">mã</label>
            <input type="text" class="form-control" id="maSanPham" name="maSize" value="${s.maSize}">
        </div>
        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" name="tenSize" value="${s.tenSize}">
        </div>

        <label class="form-label">Trang thai</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Active" ${s.trangThai=="Active"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault1">
                Active
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2"  value="Inactive" ${s.trangThai=="Inactive"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault2">
                Inactive
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
            <th scope="col">Họ tên</th>
            <th scope="col">Trang thai</th>
            <th scope="col">Ngày tạo</th>
            <th scope="col">Ngày sửa</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ds.content}" var="s" varStatus="i">
            <tr>
                <th scope="row">${i.index+1}</th>
                <td>${s.id}</td>
                <td>${s.maSize}</td>
                <td>${s.tenSize}</td>
                <td>${s.trangThai}</td>
                <td>${s.ngayTao}</td>
                <td>${s.ngaySua}</td>
                <td>
                    <a class="btn btn-danger" href="/size/delete?id=${s.id}">Xoa </a>
                    <a class="btn btn-info" href="/size/edit?id=${s.id}">chi tiết </a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="size?page=${ds.number-1}">Previous</a>
            </li>
            <c:forEach begin="1" end="${ds.totalPages}" var="page">
                <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">
                    <li class="page-item">
                        <a class="page-link"
                           href="/size?page=${page-1}">
                                ${page}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="size?page=${ds.number+1}">Next</a></li>
        </ul>
    </nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
