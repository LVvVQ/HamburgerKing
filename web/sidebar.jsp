<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->


<!-- Sidebar Start -->
<div class="sidebar pe-4 pb-3">
    <nav class="navbar bg-light navbar-light">
        <a href="admin.jsp" class="navbar-brand mx-4 mb-3">
            <h3 class="text-primary">Hamburger King</h3>
        </a>
        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="admin/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">${sessionScope.manager.managername}</h6>
                <span>Admin</span>
            </div>
        </div>
        <div class="navbar-nav w-100">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>商品管理</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="searchGoodsByPageServlet" class="dropdown-item">商品列表</a>
                    <a href="addGoods.jsp" class="dropdown-item">添加商品</a>
                </div>
            </div>
            <a href="findOrderByPageServlet?currentPage=1&rows=5" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>订单管理</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>评论管理</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="searchCommentServlet" class="dropdown-item">评论列表</a>
                    <a href="addComment.jsp" class="dropdown-item">添加评论</a>
                </div>
            </div>
        </div>
    </nav>
</div>
<!-- Sidebar End -->
