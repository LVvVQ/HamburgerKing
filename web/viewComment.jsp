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
    <%--批量选择功能--%>
    <script type ="text/javascript">
        // 全选功能
        function selectAll()
        {
            var coomentIDs = document.getElementsByName("commentId");
            for (i=0;i<coomentIDs.length ;i++ )
            {
                var coomentID =coomentIDs[i];
                coomentID.checked= true;

            }
        }
        /*全不选功能*/
        function selectNone()
        {
            var coomentIDs = document.getElementsByName("commentId");
            for (i=0;i<coomentIDs.length ;i++ )
            {
                var coomentID =coomentIDs[i];
                coomentID.checked= false;

            }
        }
        // 反选功能
        function selectBack()
        {
            var coomentsIDs = document.getElementsByName("commentId");
            for (a=0;a<coomentsIDs.length ;a++ )
            {
                var coomentsID =coomentsIDs[a];
                if(coomentsID.checked==false)
                {
                    coomentsID.checked= true;
                }else{
                    coomentsID.checked=false
                }

            }
        }
    </script>
    <%--删除功能--%>
    <script type="text/javascript">
        function deleteComment(cid){
            //用户安全提示
            if(confirm("您确认删除吗？")){
                //访问路径
                location.href="DeleteOneCommentServlet?cid=" + cid;
            }
        }

        //页面加载完在获取按钮
        window.onload = function (){
            //给删除选中添加单机事件
            document.getElementById("delSearch").onclick = function (){
                if(confirm("您确认删除吗？")){ //如果没有选中就提交表单 会报空指针异常
                    //如果没有选中就不提交表单 , 判断是否有选中
                    var flag = false;
                    var cbs = document.getElementsByName("goodId");
                    for(var i = 0; i < cbs.length; i++){
                        if(cbs[i].checked){
                            flag = true;
                            break;
                        }
                    }

                    if(flag){
                        //提交表单
                        document.getElementById("form").submit();
                    }

                }
            }
        }
    </script>
</head>

<body>
<div class="container-fluid position-relative bg-white d-flex p-0">
    <jsp:include page="sidebar.jsp" />

    <!-- Content Start -->
    <div class="content">
        <jsp:include page="navbar.jsp" />
        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light text-center rounded p-4">
                <div class="d-flex align-items-center mb-4">
                    <h6 class="mb-0">商品名</h6>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <img class="rounded-circle" src="static/picture/burger-11.jpg" style="width: 50px; height: 50px;">
                </div>
                <div class="table-responsive"><%--新增表单--%>
                    <form method="post" action="">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                            <tr class="text-dark">
                                <th scope="col"></th>
                                <th scope="col">客户名</th>
                                <th scope="col">评论时间</th>
                                <th scope="col">评论内容</th>
                                <th scope="col">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${comments}" var="comment">
                            <tr>
                                <%--全选--%>
                                <td style="text-align: center"><input class="form-check-input" type="checkbox" name="commentId" value="${comment.cid}"></td>
                                <td>${comment.username}${comment.managername}</td>
                                <td>${comment.date}</td>
                                <td>${comment.content}</td>
                                <td>
                                    <a class="btn btn-sm btn-danger" href="javascript:deleteComment(${comment.cid})">删除</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <input type="button" name = "all" value = "全选"    onclick="selectAll()" class="btn btn-sm btn-primary"/>
                        <input type="button" name = "none" value = "全不选" onclick="selectNone()" class="btn btn-sm btn-primary"/>
                        <input type="button" name = "back" value = "反选"   onclick="selectBack()" class="btn btn-sm btn-primary"/>
                        <a  class="btn btn-sm btn-danger"  href="javascript:void(0)" id="delSearch" >删除选中</a>
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
