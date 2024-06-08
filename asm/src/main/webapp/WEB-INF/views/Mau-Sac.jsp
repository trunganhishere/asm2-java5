
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
    <h1>Màu sắc</h1>
    <form method="post" action="/mau-sac/<c:if test="${not empty ms.id}">update?id=${ms.id}</c:if><c:if test="${empty ms.id}">add</c:if>">

        <div class="mb-3">
            <label for="maSanPham" class="form-label">mã</label>
            <input type="text" class="form-control" id="maSanPham" name="maMau" value="${ms.maMau}">

        </div>
        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" name="tenMau" value="${ms.tenMau}">
            <%--        <span>${er['tenSanPham']}</span>--%>
        </div>

        <label class="form-label">Trang thai</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Active" ${ms.trangThai=="Active"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault1">
                Active
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2"  value="Inactive" ${ms.trangThai=="Inactive"?"checked":""}>
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
        <c:forEach items="${ds.content}" var="ms" varStatus="i">
            <tr>
                <th scope="row">${i.index+1}</th>
                <td>${ms.id}</td>
                <td>${ms.maMau}</td>
                <td>${ms.tenMau}</td>
                <td>${ms.trangThai}</td>
                <td>${ms.ngayTao}</td>
                <td>${ms.ngaySua}</td>
                <td>
                    <a class="btn btn-danger" href="/mau-sac/delete?id=${ms.id}">Xoa </a>
                    <a class="btn btn-info" href="/mau-sac/edit?id=${ms.id}">chi tiết </a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="mau-sac?page=${ds.number-1}">Previous</a>
            </li>
            <c:forEach begin="1" end="${ds.totalPages}" var="page">
                <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">
                    <li class="page-item">
                        <a class="page-link"
                           href="/mau-sac?page=${page-1}">
                                ${page}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="mau-sac?page=${ds.number+1}">Next</a></li>
        </ul>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>

<!-- Import Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>

