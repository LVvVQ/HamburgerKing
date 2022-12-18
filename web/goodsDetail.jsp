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
                        <h5 class="h5-lg">4 Comments</h5>


                        <!-- COMMENT #1 -->
                        <div class="media">

                            <!-- Comment-1 Avatar -->
                            <img class="mr-3" src="static/picture/post-author-1.jpg" alt="comment-avatar">

                            <div class="media-body">

                                <!-- Comment-1 Meta -->
                                <div class="comment-meta">
                                    <h6 class="h6-md mt-0">Thomas</h6>
                                    <span class="comment-date">5 days ago&#8194;- </span>
                                    <span class="btn-reply"><a href="#leave-comment" class="internal-link"><i class="fas fa-reply"></i> Reply</a></span>
                                </div>

                                <!-- Comment-1 Text -->
                                <p class="mb-40">Etiam sapien sem magna at vitae pulvinar congue augue egestas pretium neque viverra
                                    suscipit egestas magna porta ratione, mollis risus lectus porta rutrum arcu aenean primis in augue
                                    luctus neque purus ipsum neque dolor primis purus efficitur ipsum primis in cubilia laoreet augue
                                </p>

                                <hr>

                                <!-- COMMENT #2 -->
                                <div class="media">

                                    <!-- Comment-2 Avatar -->
                                    <a href="#" class="pr-3">
                                        <img src="static/picture/post-author-2.jpg" alt="comment-avatar">
                                    </a>

                                    <div class="media-body">

                                        <!-- Comment-2 Meta -->
                                        <div class="comment-meta">
                                            <h6 class="h6-md mt-0">David Clark</h6>
                                            <span class="comment-date">6 days ago&#8194;- </span>
                                            <span class="btn-reply"><a href="#leave-comment" class="internal-link"><i class="fas fa-reply"></i> Reply</a></span>
                                        </div>

                                        <!-- Comment-2 Text -->
                                        <p>Etiam sapien sem magna at vitae pulvinar congue augue egestas pretium neque and viverra
                                            suscipit porta ratione, mollis risus lectus porta aliquet lorem purus mollis
                                        </p>

                                    </div>
                                </div>	<!-- END COMMENT #2 -->

                            </div>
                        </div>	<!-- END COMMENT #1 -->


                        <hr>


                        <!-- COMMENT #3 -->
                        <div class="media">

                            <!-- Comment-4 Avatar -->
                            <img class="mr-3" src="static/picture/post-author-3.jpg" alt="comment-avatar">

                            <div class="media-body">

                                <!-- Comment-4 Meta -->
                                <div class="comment-meta">
                                    <h6 class="h6-md mt-0">Jasmine</h6>
                                    <span class="comment-date">13 days ago&#8194;- </span>
                                    <span class="btn-reply"><a href="#leave-comment" class="internal-link"><i class="fas fa-reply"></i> Reply</a></span>
                                </div>

                                <!-- Comment-4 Text -->
                                <p>Porta ratione, mollis risus lectus porta rutrum arcu aenean primis in augue luctus neque purus
                                    ipsum neque dolor primis libero tempus, tempor posuere ligula varius impedit enim tempor vitae
                                    pulvinar at congue augue egestas. Praesent aliquet lorem purus, quis mollis nisi laoreet
                                </p>

                            </div>
                        </div>	<!-- END COMMENT #3 -->


                        <hr>


                        <!-- COMMENT #4 -->
                        <div class="media">

                            <!-- Comment-4 Avatar -->
                            <img class="mr-3" src="static/picture/post-author-4.jpg" alt="comment-avatar">

                            <div class="media-body">

                                <!-- Comment-4 Meta -->
                                <div class="comment-meta">
                                    <h6 class="h6-md mt-0">Rady Smith</h6>
                                    <span class="comment-date">42 days ago&#8194;- </span>
                                    <span class="btn-reply"><a href="#leave-comment" class="internal-link"><i class="fas fa-reply"></i> Reply</a></span>
                                </div>


                            </div>
                        </div>	<!-- END COMMENT #4 -->


                        <hr>


                        <!-- COMMENT FORM -->
                        <div id="leave-comment">

                            <!-- Title -->
                            <h5 class="h5-lg">填写评论</h5>
                            <%--h6 class="mb-4">添加评论</h6>
                            <form action="insertCommentsServlet" method="post">
                                <input type="hidden" name="gid" value="${gid}"><br>
                                &lt;%&ndash;<input type="hidden" name="mid" value="${manager.mid}">&ndash;%&gt;
                                <div class="form-floating">
                                <textarea class="form-control" placeholder="评论内容"
                                          id="description" name="content"
                                          style="height: 150px;width: 400px"></textarea>
                                    <label for="description">评论内容</label>
                                </div>
                                <br />
                                <input type="submit" class="btn btn-primary" value="添加评论"></input>
                            </form>--%>

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
