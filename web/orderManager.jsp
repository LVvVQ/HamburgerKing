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
                    <h6 class="mb-0">订单列表</h6>
                    <form class="d-none d-md-flex ms-4" method="post" action="searchGoodServlet">
                        <input class="form-control border-0" type="search" placeholder="输入订单号查询" name="keyword">
                        <input type="submit" class="btn btn-sm btn-primary" value="查询">
                    </form>
                </div>
                <div class="table-responsive">
                    <form method="post" action="">
                        <table class="table text-start table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark">
                                <th>
                                </th>
                                <th scope="col">订单号</th>
                                <th scope="col">客户名</th>
                                <th scope="col">商品数量</th>
                                <th scope="col">创建时间</th>
                                <th scope="col">订单状态</th>
                                <th scope="col">总金额</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>

                            <tbody>

                            <%--遍历page对象中的list属性来显示数据--%>
                            <c:forEach items="${page.list}" var="order">
                                <tr>
                                    <td style="text-align: center">
                                        <input class="form-check-input" type="checkbox"
                                               name="orderId" value=${order.oid}>
                                    </td>
                                    <td>${order.oid}</td>
                                    <td>${order.username}</td>
                                    <td>${order.nums}</td>
                                    <td>${order.date}</td>
                                    <c:choose>
                                        <c:when test="${order.status == 0}">
                                            <td>未完成</td>
                                        </c:when>
                                        <c:when test="${order.status == 1}">
                                            <td>已完成</td>
                                        </c:when>
                                    </c:choose>
                                    <td>${order.totalPrice}</td>
                                    <td>
                                        <a class="btn btn-sm btn-primary" href="orderDetail.jsp">详情</a>
                                    </td>
                                </tr>
                            </c:forEach>
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
            <br/>
            <div>
                <ul class="pagination">
                    <%-- 当前页大于第一页就显示上一页按钮--%>
                    <c:if test="${page.currentPage>1}">
                        <li class="page-item">
                            <a class="page-link" href="findOrderByPageServlet?currentPage=${page.currentPage-1}&rows=5"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:if>
                        <%-- 显示页码 当前页添加active的class属性来改变css样式--%>
                    <c:forEach begin="1" end="${page.totalPage}" var="i">
                        <c:choose>
                            <c:when test="${page.currentPage == i}">
                                <li class="page-item active"><a class="page-link"
                                                                href="findOrderByPageServlet?currentPage=${i}&rows=5">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link"
                                                         href="findOrderByPageServlet?currentPage=${i}&rows=5">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                        <%-- 当前页小于总页数就显示下一页按钮--%>
                    <c:if test="${page.currentPage<page.totalPage}">
                        <li class="page-item">
                            <a class="page-link" href="findOrderByPageServlet?currentPage=${page.currentPage+1}&rows=5"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
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
