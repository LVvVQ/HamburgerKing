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
            var dids = document.getElementsByName("did");
            for (i = 0; i < dids.length; i++) {
                var did = dids[i];
                did.checked = true;

            }
        }

        function selectNone() {
            var dids = document.getElementsByName("did");
            for (i = 0; i < dids.length; i++) {
                var did = dids[i];
                did.checked = false;

            }
        }

        function selectBack() {
            var dids = document.getElementsByName("did");
            for (a = 0; a < dids.length; a++) {
                var did = dids[a];
                if (did.checked == false) {
                    did.checked = true;
                } else {
                    did.checked = false
                }

            }
        }

        function deleteGood(did) {
            if (confirm("您确认删除吗？")) {
                location.href = "delOneOrderDetailByIdServlet?did=" + did + "&oid=" + ${oid};
            }
        }

        function deleteSelected() {
            if (confirm("您确认删除吗？")) { //如果没有选中就提交表单 会报空指针异常
                //如果没有选中就不提交表单 , 判断是否有选中
                var flag = false;
                var cbs = document.getElementsByName("did");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        flag = true;
                        break;
                    }
                }

                if (flag) {
                    //提交表单
                    document.getElementById("form").submit();
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
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="d-flex align-items-center justify-content-between">
                        <h6 class="mb-0">订单详情</h6>
                        <form class="d-none d-md-flex ms-4" method="post"
                              action="searchOrderDetailByPageServlet?oid=${oid}">
                            <input class="form-control border-0" type="search" placeholder="输入商品名查询" name="keyword">
                            <input type="submit" class="btn btn-sm btn-primary" value="查询">
                        </form>
                    </div>
                    <c:if test="${resultInfo != null}">
                        <c:if test="${resultInfo.flag == true}">
                            <div class="alert alert-success alert-dismissible align-items-center fade show"
                                 role="alert"
                                 style="width: 160px;height: 35px;padding: 5px 10px">
                                <i class="fa fa-exclamation-circle me-2"></i>${resultInfo.msg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                                        style="padding:9px 10px"></button>
                            </div>
                        </c:if>
                        <c:if test="${resultInfo.flag == false}">
                            <div class="alert alert-danger alert-dismissible align-items-center fade show"
                                 role="alert"
                                 style="width: 160px;height: 35px;padding: 5px 10px">
                                <i class="fa fa-exclamation-circle me-2"></i>${resultInfo.msg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"
                                        style="padding:9px 10px"></button>
                            </div>
                        </c:if>
                    </c:if>
                </div>
                <div class="table-responsive">
                    <form method="post" action="delOrderDetailsServlet?oid=${oid}" id="form">
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
                            <c:forEach items="${page.list}" var="orderDetail">
                                <tr>
                                    <td style="text-align: center"><input class="form-check-input" type="checkbox"
                                                                          name="did" value=${orderDetail.did}></td>
                                    <td>${orderDetail.gid}</td>
                                    <td>${orderDetail.name}</td>
                                    <td>
                                        <img width="80px" height="70px" src="${orderDetail.image}" alt="商品图片"/>
                                    </td>
                                    <td>${orderDetail.nums}</td>
                                    <td>${orderDetail.price}</td>
                                    <td>${orderDetail.totalPrice}</td>
                                    <td>
                                        <a class="btn btn-sm btn-primary"  href="findOneOrderDetailServlet?did=${orderDetail.did}">编辑</a>
                                        <a class="btn btn-sm btn-danger" onclick="deleteGood(${orderDetail.did})">删除</a>
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
                        <a class="btn btn-sm btn-danger" onclick="deleteSelected()">删除选中</a>
                    </form>
                </div>
            </div>
            <br>
            <div>
                <ul class="pagination">
                    <%-- 当前页大于第一页就显示上一页按钮--%>
                    <c:if test="${page.currentPage>1}">
                        <li class="page-item">
                            <a class="page-link"
                               href="searchOrderDetailByPageServlet?keyword=${keyword}&currentPage=${page.currentPage-1}&rows=5&oid=${oid}"
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
                                                                href="searchOrderDetailByPageServlet?keyword=${keyword}&currentPage=${i}&rows=5&oid=${oid}">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link"
                                                         href="searchOrderDetailByPageServlet?keyword=${keyword}&currentPage=${i}&rows=5&oid=${oid}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <%-- 当前页小于总页数就显示下一页按钮--%>
                    <c:if test="${page.currentPage<page.totalPage}">
                        <li class="page-item">
                            <a class="page-link"
                               href="searchOrderDetailByPageServlet?keyword=${keyword}&currentPage=${page.currentPage+1}&rows=5&oid=${oid}"
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
