<%@ page import="com.hamburgerking.bean.Good" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Hamburger King</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywoadmin/rds">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="admin/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="admin/css/style.css" rel="stylesheet">
</head>

<%
    Good good = (Good) request.getAttribute("good");
    request.setAttribute("good",good);
%>
<body>
<div class="container-fluid position-relative bg-white d-flex p-0">
    <jsp:include page="sidebar.jsp" />


    <!-- Content Start -->
    <div class="content">
        <jsp:include page="navbar.jsp" />
        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded p-4">
                <h6 class="mb-4">修改商品</h6>
                <form action="UpdateGoodsServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="gid" value="${good.gid}">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="gname" name="gname" value="${good.gname}"
                               placeholder="商品名称" style="width: 400px">
                        <label for="gname">商品名称</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="price" name="price" value="${good.price}"
                               placeholder="商品价格" step="0.01" style="width: 400px">
                        <label for="price">商品价格</label>
                    </div>
                    <img src="${good.image}" alt="商品图" width="80px" height="70px">
                    <div class="mb-3">
                        <input style="width: 400px" class="form-control" type="file" id="formFile" name="image" value="${good.image}">
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="stock" name="stock" value="${good.stock}"
                               placeholder="商品数量" style="width: 400px">
                        <label for="price">商品数量</label>
                    </div>
                    <div class="form-floating">
                                <textarea class="form-control" placeholder="商品描述"
                                          id="description" name="description"
                                          style="height: 150px;width: 400px">${good.description}</textarea>
                        <label for="description">商品描述</label>
                    </div>
                    <br />
                    <button type="submit" class="btn btn-primary">确认修改</button>
                </form>
            </div>
        </div>
        <!-- Recent Sales End -->
    </div>
    <!-- Content End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="admin/lib/chart/chart.min.js"></script>
<script src="admin/lib/easing/easing.min.js"></script>
<script src="admin/lib/waypoints/waypoints.min.js"></script>
<script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="admin/lib/tempusdominus/js/moment.min.js"></script>
<script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="admin/js/main.js"></script>
</body>

</html>