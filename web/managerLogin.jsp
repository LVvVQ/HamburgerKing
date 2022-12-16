<%--
  Created by IntelliJ IDEA.
  User: 22864
  Date: 2022/12/15
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>login</title>
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
    <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="admin/css/style.css" rel="stylesheet">
</head>

<script type="text/javascript">
    window.onload = function (){
        //获取图片对象
        var img = document.getElementById("imgCheckCode")
        //绑定单机事件

        img.onclick = function (){
            //加时间戳
            var date = new Date().getTime();
            img.src = "checkCode?" + date;
        }

        var change = document.getElementById("change")
        change.onclick = function (){
            //加时间戳
            var date = new Date().getTime();
            img.src = "checkCode?" + date;
        }
    }

</script>

<script type="text/javascript">
        function checkLogin(){
            //获取用户名
            var name = document.getElementById("floatingInput").value;
            //获取密码
            var password = document.getElementById("floatingPassword").value;
            if((name == null || name == "") || (password == null || password == "")){
                document.getElementById("out").innerHTML = "账号或者密码不能为空";
            }else{
                document.getElementById("form").submit();
            }
        }



</script>

<body>
<div class="container-fluid position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sign In Start -->

    <div class="container-fluid">
        <form method="post" action="mangerLoginServlet" id="form">
        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <a href="" class="">
                            <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>登录</h3>
                        </a>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" name="managername" placeholder="管理员名" >
                        <label for="floatingInput">管理员名</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="密码" name="password">
                        <label for="floatingPassword">密码</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="checkCode" name="checkCode" placeholder="验证码">
                        <label for="floatingInput">验证码</label>
                    </div>
                    <img src="checkCode" id="imgCheckCode"> &nbsp;&nbsp;&nbsp;&nbsp;<a id="change" class="text-center mb-0" style="color: rgb(0,180,253)">看不清楚，换一张</a>
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <a href="">Forgot Password</a>
                    </div>
                    <a  class="btn btn-primary py-3 w-100 mb-4" href="javascript:checkLogin()">Sign In</a>
                    <p class="text-center mb-0">Don't have an Account? <a href="">Sign Up</a></p>
                    <p id="out" class="text-center mb-0" style="color: red">${msg}</p>
                </div>
            </div>
        </div>
        </form>
    </div>
    <!-- Sign In End -->
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
