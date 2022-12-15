<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Hamburger King</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
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
    <script type="text/javascript">
        function selectAll() {
            var goodIDs = document.getElementsByName("goodId");
            for (i = 0; i < goodIDs.length; i++) {
                var goodID = goodIDs[i];
                goodID.checked = true;

            }
        }

        function selectNone() {
            var goodIDs = document.getElementsByName("goodId");
            for (i = 0; i < goodIDs.length; i++) {
                var goodID = goodIDs[i];
                goodID.checked = false;

            }
        }

        function selectBack() {
            var goodIDs = document.getElementsByName("goodId");
            for (a = 0; a < goodIDs.length; a++) {
                var goodID = goodIDs[a];
                if (goodID.checked == false) {
                    goodID.checked = true;
                } else {
                    goodID.checked = false
                }

            }
        }
    </script>
</head>

<body>
<div class="container-fluid position-relative bg-white d-flex p-0">
    <jsp:include page="sidebar.jsp"/>

    <!-- Content Start -->
    <div class="content">
        <jsp:include page="navbar.jsp"/>
        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded p-4">
                <div class="d-flex align-items-center mb-4">
                    <h6 class="mb-0">订单详情</h6>
                </div>
                <div class="table-responsive">
                    <form method="post" action="">
                        <table class="table text-start table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark">
                                <th>
                                </th>
                                <th scope="col">商品编号</th>
                                <th scope="col">商品名称</th>
                                <th scope="col">商品图片</th>
                                <th scope="col">商品数量</th>
                                <th scope="col">商品单价</th>
                                <th scope="col">商品总价格</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>

                            <tbody>

                            <tr>
                                <td style="text-align: center"><input class="form-check-input" type="checkbox"
                                                                      name="goodId" value=1></td>
                                <td>1</td>
                                <td>CRISPY CHICKEN</td>
                                <td>
                                    <img width="80px" height="70px" src="static/picture/burger-11.jpg" alt="商品图片" />
                                </td>
                                <td>10</td>
                                <td>12</td>
                                <td>120</td>
                                <td>
                                    <input type="submit" class="btn btn-sm btn-primary" value="编辑">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center"><input class="form-check-input" type="checkbox"
                                                                      name="goodId" value=1></td>
                                <td>2</td>
                                <td>ULTIMATE BACON</td>
                                <td>
                                    <img width="80px" height="70px" src="static/picture/burger-12.jpg" alt="商品图片" />
                                </td>
                                <td>2</td>
                                <td>12</td>
                                <td>24</td>
                                <td>
                                    <input type="submit" class="btn btn-sm btn-primary" value="编辑">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                        <input type="button" name="all" value="全选" onclick="selectAll()"
                               class="btn btn-sm btn-primary"/>
                        <input type="button" name="none" value="全不选" onclick="selectNone()"
                               class="btn btn-sm btn-primary"/>
                        <input type="button" name="back" value="反选" onclick="selectBack()"
                               class="btn btn-sm btn-primary"/>
                        <input type="submit" class="btn btn-sm btn-danger" formaction="" value="删除">
                    </form>
                </div>
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
