
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

                    <li>
                        <a href="#">${sessionScope.user.username}</a>
                        <ul>
                            <li><a href="#">账户余额: ${sessionScope.user.balance}</a></li>
                            <li><a href="userLogOutServlet">退出登录</a></li>
                        </ul>
                    </li>

                </ul>
            </nav>
            <!-- END MAIN MENU -->
        </div>
        <!-- END NAVIGATION MENU -->
    </div>
    <!-- End container -->
</header>