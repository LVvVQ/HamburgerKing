<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="Jthemes">
    <meta name="description" content="Testo - Pizza and Fast Food Landing Page Template">
    <meta name="keywords" content="Jthemes, Food, Fast Food, Restaurant, Pizzeria, Restaurant Menu, Pizza, Burger, Sushi, Steak, Grill, Snack">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- SITE TITLE -->
    <title>Testo - Pizza and Fast Food Landing Page Template</title>

    <!-- GOOGLE FONTS -->
    <link href="static/css/css.css" rel="stylesheet">
    <link href="static/css/css2.css" rel="stylesheet">
    <link href="static/css/css21.css" rel="stylesheet">

    <!-- BOOTSTRAP CSS -->
    <link href="static/css/bootstrap.min1.css" rel="stylesheet">

    <!-- FONT ICONS -->
    <link href="static/css/all1.css" rel="stylesheet" crossorigin="anonymous">
    <link href="static/css/flaticon.css" rel="stylesheet">

    <!-- PLUGINS STYLESHEET -->
    <link href="static/css/menu.css" rel="stylesheet">
    <link href="static/css/magnific-popup.css" rel="stylesheet">
    <link href="static/css/flexslider.css" rel="stylesheet">
    <link href="static/css/owl.carousel.min.css" rel="stylesheet">
    <link href="static/css/owl.theme.default.min.css" rel="stylesheet">
    <link href="static/css/jquery.datetimepicker.min.css" rel="stylesheet">

    <!-- TEMPLATE CSS -->
    <link href="static/css/style1.css" rel="stylesheet">

    <script type="text/javascript">
        function addToCart() {
            let goodNums = $('#goodNums').val();
            location.href = "addToCartServlet?gid=${good.gid}&goodNums=" + goodNums;
        }
    </script>

</head>
<body>




<!-- PRELOADER SPINNER
============================================= -->
<div id="loader-wrapper">
    <div id="loader">
        <div class="cssload-spinner">
            <div class="cssload-ball cssload-ball-1"></div>
            <div class="cssload-ball cssload-ball-2"></div>
            <div class="cssload-ball cssload-ball-3"></div>
            <div class="cssload-ball cssload-ball-4"></div>
        </div>
    </div>
</div>


<!-- HEADER-3
============================================= -->
<jsp:include page="head.jsp"/>
<!-- END HEADER-3 -->

<!-- PAGE CONTENT
============================================= -->
<div id="page" class="page">

    <!-- PAGE HERO
    ============================================= -->
    <div id="product-page" class="page-hero-section division">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="hero-txt text-center white-color">


                    </div>
                </div>
            </div>	  <!-- End row -->
        </div>	   <!-- End container -->
    </div>	<!-- END PAGE HERO -->


    <!-- SINGLE PRODUCT
    ============================================= -->
    <section id="product-1" class="pt-100 single-product division">
        <div class="container">
            <div class="row">


                <!-- PRODUCT IMAGE -->
                <div class="col-lg-7">
                    <div class="product-preview">


                        <!-- TABS CONTENT -->
                        <div class="tabs-content">

                            <!-- TAB-1 CONTENT -->
                            <div id="tab-1-img" class="tab-content text-center displayed">
                                <img class="img-fluid" src="${good.image}" alt="menu-image" style="width: 600px;height: 500px">
                            </div>

                        </div>	<!-- END TABS CONTENT -->


                        <!-- TABS NAVIGATION -->


                    </div>
                </div>	<!-- END PRODUCT IMAGE -->


                <!-- PRODUCT DISCRIPTION -->
                <div class="col-lg-5">
                    <div class="product-description">

                        <!-- TITLE -->
                        <div class="project-title">

                            <!-- Title -->
                            <h2 class="h2-lg">${good.gname}</h2>

                            <!-- Rating -->
                            <div class="stars-rating">
                                <span>4.38</span>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(3 Customer Reviews)</span>
                            </div>

                            <!-- Price -->
                            <div class="project-price">
                                <h4 class="h4-xl yellow-color">$${good.price}</h4>
                            </div>

                        </div>

                        <!-- TEXT -->
                        <div class="product-txt">

                            <!-- Text -->
                            <p class="p-md grey-color">${good.description}
                            </p>

                            <!-- Product Data -->
                            <div class="product-info">
                                <p>Portion Size: <span>390g</span></p>
                                <p>Calories: <span>680Kj</span></p>
                                <p>Allergies: <span>Lactose, Gluten, Mustard</span></p>
                                <p>Tags: <span>Burgers, Fast Food, Testo</span></p>
                            </div>

                            <input id="goodNums" class="qty" type="number" min="1" max="20" value="1">

                            <!-- Add To Cart -->
                            <div class="add-to-cart-btn bg-yellow ico-20 text-center">
                                <a href="javascript:void(0)" onclick="addToCart()"><span class="flaticon-shopping-bag"></span> Add to Cart</a>
                            </div>
                        </div>	<!-- END TEXT-->

                    </div>
                </div>	<!-- END PRODUCT DISCRIPTION -->


            </div>	  <!-- End row -->
        </div>	   <!-- End container -->
    </section>	<!-- END SINGLE PRODUCT -->


<!-- END MENU-6 -->
<%--查看评论--%>
    <section id="post-comments" class="wide-80 post-comments division">
        <div class="container">
            <div class="row">


                <!-- COMMENTS WRAPPER -->
                <div class="col-lg-10 offset-lg-1">
                    <div class="comments-wrapper">

                        <!-- Title -->
                        <h5 class="h5-lg">Comments</h5>
                        <!-- COMMENT #3 -->
                        <div class="media">
                            <table>
                            <c:forEach items="${page.list}" var="comment">
                            <!-- Comment-4 Avatar -->
                                <tr>
                                    <td>
                                <c:if test="${comment.avatar2!=null}">
                            <img class="mr-3" src="${comment.avatar2}"width="50" height="50" <%--人物头像--%> <%--alt="comment-avatar"--%>>
                            </c:if>
                                <c:if test="${comment.avatar!=null}">
                                <img class="mr-3" src="${comment.avatar}" width="50" height="50" <%--alt="comment-avatar"--%>>
                                </c:if>
                                    </td>
                                </tr>
                                <%--<div class="media-body">--%>

                                <%--<c:forEach items="${page.list}" var="comment">
                                    <tr>
                                            &lt;%&ndash;全选&ndash;%&gt;
                                        <td style="text-align: center"><input class="form-check-input" type="checkbox" name="commentId" value="${comment.cid}"></td>
                                        <td>${comment.username}${comment.managername}</td>
                                        <td>${comment.date}</td>
                                        <td>${comment.content}</td>
                                        <td>
                                            <a class="btn btn-sm btn-danger" href="javascript:deleteComment(${comment.cid})">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>--%>
                                <!-- Comment-4 Meta -->
                                <tr>
                                    <td>
                                <div class="comment-meta">
                                    <h6 class="h6-md mt-0">${comment.username}${comment.managername}<%--用户名--%></h6>
                                    <span class="comment-date">${comment.date}<%--评论时间--%> </span>
                                   <%-- <span class="btn-reply"><a href="#leave-comment" class="internal-link"><i class="fas fa-reply"></i> Reply</a></span>--%>
                                </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                <!-- Comment-4 Text -->
                                <p><%--评论内容--%>${comment.content}
                                </p>

                            </div>
                        </td>
                        </tr>
                        </div>	<!-- END COMMENT #3 -->
                    </table>
                        <hr>
                        </c:forEach>
                        <div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <ul class="pagination">
                                <%-- 当前页大于第一页就显示上一页按钮--%>
                                <c:if test="${page.currentPage>1}">
                                    <li class="page-item">
                                        <a class="page-link" href="displayGoodsDetailServlet?gid=${gid}&currentPage=${page.currentPage-1}&rows=5"
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
                                                                            href="displayGoodsDetailServlet?gid=${gid}&currentPage=${i}&rows=5">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link"
                                                                     href="displayGoodsDetailServlet?gid=${gid}&currentPage=${i}&rows=5">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <%-- 当前页小于总页数就显示下一页按钮--%>
                                <c:if test="${page.currentPage<page.totalPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="displayGoodsDetailServlet?gid=${gid}&currentPage=${page.currentPage+1}&rows=5"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <!-- COMMENT FORM -->
                        <div id="leave-comment">

                            <!-- Title -->
                            <h5 class="h5-lg">填写评论</h5>

                            <form action="insertUserCommentsServlet" method="post" <%--class="row comment-form"--%> >
                                <input type="hidden" name="gid" value="${good.gid}"><br>
                                <div class="col-md-12 input-message">
                                    <p>Add Comment *</p>
                                    <textarea class="form-control message" name="content" rows="6" placeholder="Enter Your Comment Here* ..." required=""></textarea>
                                </div>

                                <!-- Contact Form Button -->
                                <div class="col-lg-12 form-btn">
                                    <input type="submit" class="btn btn-red tra-red-hover submit" value="添加评论"></input>
                                </div>

                                <!-- Contact Form Message -->
                                <%--<div class="col-md-12 comment-form-msg text-center">
                                    <div class="sending-msg"><span class="loading"></span></div>
                                </div>--%>

                            </form>

                        </div>	<!-- END COMMENT FORM -->

                    </div>
                </div>	<!-- END COMMENTS WRAPPER -->



            </div>     <!-- End row -->
        </div>     <!-- End container -->
    </section>	<!-- END POST COMMENTS -->
    <!-- END COMMENT FORM -->
    <!-- FOOTER-1
    ============================================= -->
    <footer id="footer-1" class="footer division">
        <div class="container">
            <div class="row">


                <!-- FOOTER INFO -->
                <div class="col-md-5 col-lg-4 col-xl-4">
                    <div class="footer-info mb-40">
                        <!-- Footer Logo -->
                        <div class="footer-logo"><img src="static/picture/logo-01.png" alt="footer-logo"></div>
                    </div>
                </div>


                <!-- FOOTER CONTACTS -->
                <div class="col-md-7 col-lg-4 col-xl-5">
                    <div class="footer-contacts mb-40">

                        <!-- Address -->
                        <p class="p-xl mt-10">Los Angeles,</p>
                        <p class="p-xl">8721 M Central Avenue, CA 90036</p>

                        <!-- Contacts -->
                        <p class="p-lg foo-email">Email: <a href="mailto:yourdomain@mail.com">hello@yourdomain.com</a></p>
                        <p class="p-lg">Call Now: <span class="yellow-color"><a href="tel:123456789">789-654-3210</a></span></p>

                    </div>
                </div>


                <!-- FOOTER INSTAGRAM -->
                <div class="col-md-12 col-lg-4 col-xl-3">
                    <div class="footer-img mb-40">

                        <!-- Images -->
                        <ul class="text-center clearfix">
                            <li><a href="#" target="_blank"><img class="insta-img" src="static/picture/img-013.jpg" alt="insta-img"></a></li>
                            <li><a href="#" target="_blank"><img class="insta-img" src="static/picture/img-023.jpg" alt="insta-img"></a></li>
                            <li><a href="#" target="_blank"><img class="insta-img" src="static/picture/img-033.jpg" alt="insta-img"></a></li>
                            <li><a href="#" target="_blank"><img class="insta-img" src="static/picture/img-041.jpg" alt="insta-img"></a></li>
                            <li><a href="#" target="_blank"><img class="insta-img" src="static/picture/img-052.jpg" alt="insta-img"></a></li>
                            <li><a href="#" target="_blank"><img class="insta-img" src="static/picture/img-061.jpg" alt="insta-img"></a></li>
                        </ul>

                    </div>
                </div>	<!-- END FOOTER IMAGES -->


            </div>	  <!-- End row -->
        </div>	   <!-- End container -->
    </footer>	<!-- END FOOTER-1 -->


</div>	<!-- END PAGE CONTENT -->

                                <!-- Comment-4 Text -->
                                <p>Etiam sapien sem magna at vitae pulvinar congue augue egestas pretium neque viverra suscipit
                                    egestas magna porta ratione, mollis risus lectus porta rutrum arcu an aenean primis auctor
                                </p>

<!-- EXTERNAL SCRIPTS
============================================= -->
<script src="static/js/jquery-3.5.1.min.js"></script>
<script src="static/js/bootstrap.min1.js"></script>
<script src="static/js/modernizr.custom.js"></script>
<script src="static/js/jquery.easing.js"></script>
<script src="static/js/jquery.appear.js"></script>
<script src="static/js/jquery.scrollto.js"></script>
<script src="static/js/menu.js"></script>
<script src="static/js/materialize.js"></script>
<script src="static/js/jquery.flexslider.js"></script>
<script src="static/js/owl.carousel.min.js"></script>
<script src="static/js/jquery.magnific-popup.min.js"></script>
<script src="static/js/contact-form.js"></script>
<script src="static/js/comment-form.js"></script>
<script src="static/js/booking-form.js"></script>
<script src="static/js/jquery.datetimepicker.full.js"></script>
<script src="static/js/jquery.validate.min.js"></script>
<script src="static/js/jquery.ajaxchimp.min.js"></script>

<!-- Custom Script -->
<script src="static/js/custom1.js"></script>

<script defer="" src="static/js/changer.js"></script>

</body>

</html>
