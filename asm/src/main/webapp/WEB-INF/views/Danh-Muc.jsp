

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
    <h1>Danh mục</h1>
    <hr>
    <form method="post" action="/danh-muc/<c:if test="${not empty dm.id}">update?id=${dm.id}</c:if><c:if test="${empty dm.id}">add</c:if>">

        <div class="mb-3">
            <label for="maSanPham" class="form-label">mã</label>
            <input type="text" class="form-control" id="maSanPham" name="maDanhMuc" value="${dm.maDanhMuc}">

            <%--        <span>${er['maSanPham']}</span>--%>

        </div>
        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" name="tenDanhMuc" value="${dm.tenDanhMuc}">
            <%--        <span>${er['tenSanPham']}</span>--%>
        </div>

        <label class="form-label">Trang thai</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault1" value="Hoat dong" ${dm.trangThai=="Hoat dong"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault1">
                Hoat dong
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="trangThai" id="flexRadioDefault2"  value="Ngung hoat dong" ${dm.trangThai=="Ngung hoat dong"?"checked":""}>
            <label class="form-check-label" for="flexRadioDefault2">
                Ngung hoat dong
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
        <c:forEach items="${ds.content}" var="dm" varStatus="i">
            <tr>
                <th scope="row">${i.index+1}</th>
                <td>${dm.id}</td>
                <td>${dm.maDanhMuc}</td>
                <td>${dm.tenDanhMuc}</td>
                <td>${dm.trangThai}</td>
                <td>${dm.ngayTao}</td>
                <td>${dm.ngaySua}</td>
                <td>
                    <a class="btn btn-danger" href="/danh-muc/delete?id=${dm.id}">Xoa </a>
                    <a class="btn btn-info" href="/danh-muc/edit?id=${dm.id}">chi tiết </a>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="danh-muc?page=${ds.number-1}">Previous</a>
            </li>
            <c:forEach begin="1" end="${ds.totalPages}" var="page">
                <c:if test="${ page == 1 || page == ds.totalPages || ( page >= ds.number - 1 && page <= ds.number + 1 ) }">
                    <li class="page-item">
                        <a class="page-link"
                           href="/danh-muc?page=${page-1}">
                                ${page}
                        </a>
                    </li>
                </c:if>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="danh-muc?page=${ds.number+1}">Next</a></li>
        </ul>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</div>

<!-- Import Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
