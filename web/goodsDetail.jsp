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
<header id="header-3" class="header navik-header header-transparent header-shadow">
    <div class="container">


        <!-- NAVIGATION MENU -->
        <div class="navik-header-container">


            <!-- CALL BUTTON -->
            <div class="callusbtn"><a href="tel:123456789"><i class="fas fa-phone"></i></a></div>


            <!-- LOGO IMAGE -->
            <div class="logo" data-mobile-logo="static/picture/logo-01.png" data-sticky-logo="static/picture/logo-01.png">
                <a href="findAllGoodsServlet"><img src="static/picture/logo-01.png" alt="header-logo"></a>
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
                    <li><a href="#">About</a>
                        <ul>
                            <li><a href="about.html">About Testo</a></li>
                            <li><a href="team.html">Meet The Team</a></li>
                            <li><a href="gallery.html">Images Gallery</a></li>
                            <li><a href="gift-cards.html">Gift Cards</a></li>
                            <li><a href="faqs.html">F.A.Q.s</a></li>
                            <li><a href="terms.html">Terms & Privacy</a></li>
                        </ul>
                    </li>


                    <!-- DROPDOWN MENU -->
                    <li><a href="#">Shop</a>
                        <ul>
                            <li><a href="">Single Product</a></li>
                            <li><a href="cart.html">Shopping Cart</a></li>
                        </ul>
                    </li>



                    <!-- DROPDOWN MENU -->
                    <li><a href="#">Hours & Locations</a>
                        <ul>
                            <li><a href="booking.html">Book A Table</a></li>
                            <li><a href="locations.html">Our Locations</a></li>
                            <li><a href="contacts.html">Contact Us</a></li>
                        </ul>
                    </li>

                    <!-- HEADER BUTTON  -->
                    <li class="nav-btn yellow-color"><a href="tel:123456789">789-654-3210</a></li>

                    <!-- BASKET ICON -->
                    <li class="basket-ico ico-30">
                        <a href="cart.html">
                            <span class="ico-holder"><span class="flaticon-shopping-bag"></span> <em class="roundpoint">2</em></span>
                        </a>
                    </li>

                </ul>
            </nav>	<!-- END MAIN MENU -->


        </div>	<!-- END NAVIGATION MENU -->


    </div>     <!-- End container -->
</header>	<!-- END HEADER-3 -->

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

                            <input class="qty" type="number" min="1" max="20" value="1">

                            <!-- Add To Cart -->
                            <div class="add-to-cart-btn bg-yellow ico-20 text-center">
                                <a href="cart.html"><span class="flaticon-shopping-bag"></span> Add to Cart</a>
                            </div>



                        </div>	<!-- END TEXT-->

                    </div>
                </div>	<!-- END PRODUCT DISCRIPTION -->


            </div>	  <!-- End row -->
        </div>	   <!-- End container -->
    </section>	<!-- END SINGLE PRODUCT -->


<!-- END MENU-6 -->


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

                        <!-- Footer Copyright -->
                        <p>Copyright &copy; 2022.Company name All rights reserved.<a target="_blank" href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>

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
