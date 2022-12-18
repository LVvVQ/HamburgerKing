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
<header
        id="header-3"
        class="header navik-header header-transparent header-shadow"
>
    <div class="container">
        <!-- NAVIGATION MENU -->
        <div class="navik-header-container">
            <!-- CALL BUTTON -->
            <div class="callusbtn">
                <a href="tel:123456789"><i class="fas fa-phone"></i></a>
            </div>

            <!-- LOGO IMAGE -->
            <div
                    class="logo"
                    data-mobile-logo="static/picture/logo-01.png"
                    data-sticky-logo="static/picture/logo-01.png"
            >
                <a href="findAllGoodsServlet"
                ><img src="static/picture/logo-01.png" alt="header-logo"
                /></a>
            </div>

            <!-- BURGER MENU -->
            <div class="burger-menu">
                <div class="line-menu line-half first-line"></div>
                <div class="line-menu"></div>
                <div class="line-menu line-half last-line"></div>
            </div>

            <!-- MAIN MENU -->
            <nav class="navik-menu menu-caret navik-yellow">
                <ul class="top-list">
                    <!-- DROPDOWN MENU -->
                    <li>
                        <a href="#">About</a>
                        <ul>
                            <li><a href="about.jsp">About Testo</a></li>
                            <li><a href="team.jsp">Meet The Team</a></li>
                        </ul>
                    </li>

                    <!-- DROPDOWN MENU -->
                    <li>
                        <a href="#">Shop</a>
                        <ul>
                            <li><a href="addToCartServlet">Shopping Cart</a></li>
                            <li><a href="checkMyOrderServlet">My Order</a></li>
                        </ul>
                    </li>

                    <!-- DROPDOWN MENU -->
                    <li>
                        <a href="#">Hours & Locations</a>
                        <ul>
                            <li><a href="locations.jsp">Our Locations</a></li>
                            <li><a href="contacts.jsp">Contact Us</a></li>
                        </ul>
                    </li>

                    <!-- HEADER BUTTON  -->
                    <li class="nav-btn yellow-color">
                        <a href="tel:123456789">789-654-3210</a>
                    </li>

                    <!-- BASKET ICON -->
                    <li class="basket-ico ico-30">
                        <a href="cart.html">
                  <span class="ico-holder"><span class="flaticon-shopping-bag"></span></span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- END MAIN MENU -->
        </div>
        <!-- END NAVIGATION MENU -->
    </div>
    <!-- End container -->
</header>
<!-- END HEADER-3 -->

<!-- PAGE CONTENT
    ============================================= -->
<div id="page" class="page">
    <!-- PAGE HERO
          ============================================= -->
    <div id="menu-page" class="page-hero-section division">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="hero-txt text-center white-color">
                        <!-- Title -->
                        <h2 class="h2-xl">Hamburger King</h2>
                    </div>
                </div>
            </div>
            <!-- End row -->
        </div>
        <!-- End container -->
    </div>
    <!-- END PAGE HERO -->

    <!-- MENU-6
          ============================================= -->
    <section id="menu-6" class="wide-70 menu-section division">
        <div class="container">
            <div class="row">
                <!-- MENU ITEM #1 -->
                <c:forEach items="${page.list}" var="good">

                    <div class="col-sm-6 col-lg-3">
                        <div class="menu-6-item bg-white">
                            <!-- IMAGE -->
                            <a href="displayGoodsDetailServlet?gid=${good.gid}">
                                <div class="menu-6-img rel">
                                    <div class="hover-overlay">
                                        <!-- Image -->
                                        <img style="width: 267px; height: 222.5px"
                                             class="img-fluid"
                                             src=${good.image}
                                                     alt="menu-image"
                                        />
                                    </div>
                                </div>
                            </a>


                            <!-- TEXT -->
                            <div class="menu-6-txt rel">
                                <!-- Title -->
                                <h5 class="h5-sm">${good.gname}</h5>

                                <!-- Description -->
                                <p class="grey-color">
                                        ${good.description}
                                </p>

                                <!-- Price -->
                                <div class="menu-6-price bg-coffee">
                                    <h5 class="h5-xs yellow-color">$${good.price}</h5>
                                </div>

                                <!-- Add To Cart -->
                                <div class="add-to-cart bg-yellow ico-10">
                                    <a href="addToCartServlet?gid=${good.gid}"
                                    ><span class="flaticon-shopping-bag"></span> Add to
                                        Cart</a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- END MENU ITEM #1 -->

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
                                                         href="findAllGoodsServlet?currentPage=${page.currentPage - 1}&rows=12">&laquo;</a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${page.totalPage}" var="i">
                                <c:if test="${page.currentPage == i}">
                                    <li class="page-item active"><a class="page-link"
                                                                    href="findAllGoodsServlet?currentPage=${i}&rows=12">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${page.currentPage != i}">
                                    <li class="page-item "><a class="page-link"
                                                              href="findAllGoodsServlet?currentPage=${i}&rows=12">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${page.currentPage < page.totalPage}">
                                <li class="page-item"><a class="page-link"
                                                         href="findAllGoodsServlet?currentPage=${page.currentPage + 1}&rows=12">&raquo;</a>
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

    <!-- BANNER-4
          ============================================= -->
    <section id="banner-4" class="bg-fixed wide-100 banner-section division">
        <div class="container">
            <div class="row">
                <!-- BANNER TEXT -->
                <div class="col-lg-10 col-xl-8 offset-lg-1 offset-xl-2">
                    <div class="banner-4-txt text-center">
                        <!-- Title  -->
                        <h4 class="h4-xl">We Guarantee</h4>

                        <!-- Title  -->
                        <h2>30 Minutes Delivery!</h2>

                        <!-- Text -->
                        <p class="p-lg">
                            Aliquam a augue suscipit, luctus neque purus ipsum neque undo
                            dolor primis libero tempus, blandit a cursus varius luctus
                            neque magna
                        </p>

                        <!-- Call Button -->
                        <a href="tel:123456789" class="btn btn-lg btn-red tra-red-hover"
                        >Call: 789-654-3210</a
                        >
                    </div>
                </div>
            </div>
            <!-- End row -->
        </div>
        <!-- End container -->
    </section>
    <!-- END BANNER-4 -->

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
                                Copyright &copy; 2022.Company name All rights reserved.<a
                                    target="_blank"
                                    href="https://sc.chinaz.com/moban/"
                            >&#x7F51;&#x9875;&#x6A21;&#x677F;</a
                            >
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
