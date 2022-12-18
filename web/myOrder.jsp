<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="author" content="Jthemes"/>
    <meta
            name="description"
            content="Testo - Pizza and Fast Food Landing Page Template"
    />
    <meta
            name="keywords"
            content="Jthemes, Food, Fast Food, Restaurant, Pizzeria, Restaurant Menu, Pizza, Burger, Sushi, Steak, Grill, Snack"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- SITE TITLE -->
    <title>Testo - Pizza and Fast Food Landing Page Template</title>

    <!-- GOOGLE FONTS -->
    <link href="static/css/css.css" rel="stylesheet"/>
    <link href="static/css/css2.css" rel="stylesheet"/>
    <link href="static/css/css21.css" rel="stylesheet"/>

    <!-- BOOTSTRAP CSS -->
    <link href="static/css/bootstrap.min1.css" rel="stylesheet"/>

    <!-- FONT ICONS -->
    <link href="static/css/all1.css" rel="stylesheet" crossorigin="anonymous"/>
    <link href="static/css/flaticon.css" rel="stylesheet"/>

    <!-- PLUGINS STYLESHEET -->
    <link href="static/css/menu.css" rel="stylesheet"/>
    <link href="static/css/magnific-popup.css" rel="stylesheet"/>
    <link href="static/css/flexslider.css" rel="stylesheet"/>
    <link href="static/css/owl.carousel.min.css" rel="stylesheet"/>
    <link href="static/css/owl.theme.default.min.css" rel="stylesheet"/>
    <link href="static/css/jquery.datetimepicker.min.css" rel="stylesheet"/>

    <!-- TEMPLATE CSS -->
    <link href="static/css/style1.css" rel="stylesheet"/>

    <script type="text/javascript">
        function payForOrder(oid) {
            if (confirm("确认支付")) {
                location.href = "payForOrderServlet?oid=" + oid;
            }
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
    <div id="cart-page" class="page-hero-section division">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="hero-txt text-center white-color">
                        <!-- Title -->
                        <h2 class="h2-xl">My Order</h2>
                    </div>
                </div>
            </div>
            <!-- End row -->
        </div>
        <!-- End container -->
    </div>
    <!-- END PAGE HERO -->

    <!-- CART PAGE
          ============================================= -->
    <section id="cart-1" class="wide-100 cart-page division">
        <div class="container">
            <!-- CART TABLE -->
            <div class="row">
                <c:if test="${resultInfo != null}">
                    <c:if test="${resultInfo.flag == true}">
                        <div class="alert alert-success alert-dismissible align-items-center fade show" role="alert"
                             style="width: 240px;height: 35px;padding: 5px 10px">
                            <i class="fa fa-exclamation-circle me-2"></i>&ensp;${resultInfo.msg}
                        </div>
                    </c:if>
                    <c:if test="${resultInfo.flag == false}">
                        <div class="alert alert-danger alert-dismissible align-items-center fade show" role="alert"
                             style="width: 240px;height: 35px;padding: 5px 10px">
                            <i class="fa fa-exclamation-circle me-2"></i>&ensp;${resultInfo.msg}
                        </div>
                    </c:if>
                </c:if>
                <div class="col-md-12">
                    <div class="cart-table mb-70">
                        <table id="myTable">
                            <thead>
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Total Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Date</th>
                                <th scope="col">Status</th>
                                <th scope="col">Operation</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${page.list}" var="order">
                                <!-- CART ITEM #1 -->
                                <tr>
                                    <td data-label="Product" class="product-name">
                                        <!-- Description -->
                                        <div class="cart-product-desc">
                                            <h5 class="h5-sm">${order.oid}</h5>
                                        </div>
                                    </td>

                                    <td data-label="Price" class="product-price">
                                        <h5 class="h5-md">$${order.totalPrice}</h5>
                                    </td>
                                    <td data-label="Quantity" class="product-qty">
                                        <h5 class="h5-md">${order.nums}</h5>
                                    </td>
                                    <td data-label="Quantity" class="product-qty">
                                        <h5 class="h5-md">${order.date}</h5>
                                    </td>
                                    <c:choose>
                                        <c:when test="${order.status == 0}">
                                            <td data-label="Total" class="product-price-total">
                                                <h5>未完成</h5>
                                            </td>
                                            <td data-label="Delete" class="td-trash">
                                                <a href="javascript:void(0)" onclick="payForOrder(${order.oid})"
                                                   class="btn btn-md btn-salmon tra-salmon-hover"
                                                >去支付</a
                                                >
                                            </td>
                                        </c:when>
                                        <c:when test="${order.status == 1}">
                                            <td data-label="Total" class="product-price-total">
                                                <h5>已完成</h5>
                                            </td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- END CART TABLE -->
        </div>
    </section><!-- END CART CHECKOUT -->
</div>
<!-- End container -->
</section>
<!-- END CART PAGE -->

<!-- PAGE PAGINATION
      ============================================= -->
<div class="bg-color-01 page-pagination division row">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">

                        <c:if test="${page.currentPage > 1}">
                            <li class="page-item"><a class="page-link"
                                                     href="checkMyOrderServlet?currentPage=${page.currentPage - 1}&rows=5">&laquo;</a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${page.totalPage}" var="i">
                            <c:if test="${page.currentPage == i}">
                                <li class="page-item active"><a class="page-link"
                                                                href="checkMyOrderServlet?currentPage=${i}&rows=5">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${page.currentPage != i}">
                                <li class="page-item "><a class="page-link"
                                                          href="checkMyOrderServlet?currentPage=${i}&rows=5">${i}</a>
                                </li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${page.currentPage < page.totalPage}">
                            <li class="page-item"><a class="page-link"
                                                     href="checkMyOrderServlet?currentPage=${page.currentPage + 1}&rows=5">&raquo;</a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
            </div>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->
</div>
<!-- END PAGE PAGINATION -->

<!-- BANNER-3
      ============================================= -->
<section id="banner-3" class="bg-yellow banner-section division">
    <div class="container">
        <div class="row d-flex align-items-center">
            <!-- BANNER TEXT -->
            <div class="col-md-7 col-lg-6">
                <div class="banner-3-txt coffee-color">
                    <!-- Title  -->
                    <h4 class="h4-xl">Download mobile App and</h4>
                    <h2>save up to 20%</h2>

                    <!-- Text -->
                    <p class="p-md">
                        Aliquam a augue suscipit, luctus neque purus ipsum and neque
                        dolor primis libero tempus, blandit varius
                    </p>

                    <!-- Store Badges -->
                    <div class="stores-badge">
                        <!-- AppStore -->
                        <a href="#" class="store">
                            <img
                                    class="appstore-original"
                                    src="static/picture/appstore.png"
                                    alt="appstore-logo"
                            />
                        </a>

                        <!-- Google Play -->
                        <a href="#" class="store">
                            <img
                                    class="googleplay-original"
                                    src="static/picture/googleplay.png"
                                    alt="googleplay-logo"
                            />
                        </a>
                    </div>
                </div>
            </div>

            <!-- BANNER IMAGE -->
            <div class="col-md-5 col-lg-6">
                <div class="banner-3-img">
                    <img
                            class="img-fluid"
                            src="static/picture/e-shop.png"
                            alt="banner-image"
                    />
                </div>
            </div>
        </div>
        <!-- End row -->
    </div>
    <!-- End container -->
</section>
<!-- END BANNER-3 -->

<!-- FOOTER-4
      ============================================= -->
<footer id="footer-4" class="footer division">
    <div class="container grey-color">
        <!-- FOOTER CONTENT -->
        <div class="row">
            <!-- FOOTER INFO -->
            <div class="col-xl-3">
                <div class="footer-info mb-40">
                    <!-- Footer Logo -->
                    <div class="footer-logo">
                        <img src="static/picture/logo-01.png" alt="footer-logo"/>
                    </div>

                    <!-- Text -->
                    <p>
                        An orci nullam tempor a sapien eget gravida and integer donec
                        ipsum porta justo integer
                    </p>
                </div>
            </div>

            <!-- FOOTER CONTACTS -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="footer-contacts mb-40">
                    <!-- Title -->
                    <h5 class="h5-sm">Order Now</h5>

                    <!-- Address -->
                    <p>8721 M Central Avenue,</p>
                    <p>Los Angeles, CA 90036</p>

                    <!-- Contacts -->
                    <p class="foo-email txt-500 mt-15">
                        <a href="mailto:yourdomain@mail.com">hello@yourdomain.com</a>
                    </p>
                    <p>
                  <span class="yellow-color"
                  ><a href="tel:123456789">789-654-3210</a></span
                  >
                    </p>
                </div>
            </div>

            <!-- FOOTER INFO -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="footer-info mb-30">
                    <!-- Title -->
                    <h5 class="h5-sm">Working Hours</h5>

                    <!-- Text -->
                    <p>Quaerat neque purus ipsum at neque dolor primis tempus</p>

                    <!-- Text -->
                    <p class="mt-15">Mon-Fri: <span>9:00AM - 10:00PM</span></p>
                    <p>Saturday: <span>10:00AM - 8:30PM</span></p>
                    <p>Sunday: <span>12:00PM - 5:00PM</span></p>
                </div>
            </div>

            <!-- FOOTER IMAGES -->
            <div class="col-md-12 col-lg-4 col-xl-3">
                <div class="footer-img mb-40">
                    <!-- Title -->
                    <h5 class="h5-sm">Instagram Feed</h5>

                    <!-- Instagram Images -->
                    <ul class="text-center clearfix">
                        <li>
                            <a href="#" target="_blank"
                            ><img
                                    class="insta-img"
                                    src="static/picture/img-013.jpg"
                                    alt="insta-img"
                            /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank"
                            ><img
                                    class="insta-img"
                                    src="static/picture/img-023.jpg"
                                    alt="insta-img"
                            /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank"
                            ><img
                                    class="insta-img"
                                    src="static/picture/img-033.jpg"
                                    alt="insta-img"
                            /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank"
                            ><img
                                    class="insta-img"
                                    src="static/picture/img-041.jpg"
                                    alt="insta-img"
                            /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank"
                            ><img
                                    class="insta-img"
                                    src="static/picture/img-052.jpg"
                                    alt="insta-img"
                            /></a>
                        </li>
                        <li>
                            <a href="#" target="_blank"
                            ><img
                                    class="insta-img"
                                    src="static/picture/img-061.jpg"
                                    alt="insta-img"
                            /></a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- END FOOTER IMAGES -->
        </div>
        <!-- END FOOTER CONTENT -->

        <!-- BOTTOM FOOTER -->
        <div class="bottom-footer">
            <div class="row d-flex align-items-center">
                <!-- FOOTER COPYRIGHT -->
                <div class="col-md-5 col-lg-6">
                    <div class="footer-copyright">
                        <p>
                            Copyright &copy; 2022.Company name All rights reserved.
                        </p>
                    </div>
                </div>

                <!-- BOTTOM FOOTER LINKS -->
                <div class="col-md-7 col-lg-6">
                    <ul class="bottom-footer-list text-right clearfix">
                        <li>
                            <p class="first-list-link">
                                <a href="#"><i class="fab fa-facebook-f"></i> Facebook</a>
                            </p>
                        </li>
                        <li>
                            <p>
                                <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
                            </p>
                        </li>
                        <li>
                            <p>
                                <a href="#"><i class="fab fa-youtube"></i> YouTube</a>
                            </p>
                        </li>
                        <li>
                            <p class="last-li">
                                <a href="#"><i class="fab fa-yelp"></i> Yelp</a>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End row -->
        </div>
        <!-- END BOTTOM FOOTER -->
    </div>
    <!-- End container -->
</footer>
<!-- END FOOTER-4 -->
</div>
<!-- END PAGE CONTENT -->

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
