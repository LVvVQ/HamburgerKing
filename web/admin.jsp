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
    <script type ="text/javascript">
        function selectAll()
        {
            var goodIDs = document.getElementsByName("goodId");
            for (i=0;i<goodIDs.length ;i++ )
            {
                var goodID =goodIDs[i];
                goodID.checked= true;

            }
        }
        function selectNone()
        {
            var goodIDs = document.getElementsByName("goodId");
            for (i=0;i<goodIDs.length ;i++ )
            {
                var goodID =goodIDs[i];
                goodID.checked= false;

            }
        }
        function selectBack()
        {
            var goodIDs = document.getElementsByName("goodId");
            for (a=0;a<goodIDs.length ;a++ )
            {
                var goodID =goodIDs[a];
                if(goodID.checked==false)
                {
                    goodID.checked= true;
                }else{
                    goodID.checked=false
                }

            }
        }
    </script>

    <script type="text/javascript">
        function deleteGood(gid){
            //??????????????????
            if(confirm("?????????????????????")){
                //????????????
                location.href="DeleteOneGoodsServlet?gid=" + gid;
            }
        }

        //??????????????????????????????
        window.onload = function (){
            //?????????????????????????????????
            document.getElementById("delSearch").onclick = function (){
                if(confirm("?????????????????????")){ //????????????????????????????????? ?????????????????????
                    //???????????????????????????????????? , ?????????????????????
                    var flag = false;
                    var cbs = document.getElementsByName("goodId");
                    for(var i = 0; i < cbs.length; i++){
                        if(cbs[i].checked){
                            flag = true;
                            break;
                        }
                    }

                    if(flag){
                        //????????????
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
            <div class="bg-light rounded p-4">
                <div class="d-flex align-items-center mb-4 justify-content-between">
                    <div class="d-flex align-items-center justify-content-between">
                    <h6 class="mb-0">????????????</h6>
                    <form class="d-none d-md-flex ms-4" method="post" action="searchGoodsByPageServlet">
                        <input class="form-control border-0" type="search" placeholder="?????????????????????" name="keyWord">
                        <input type="submit" class="btn btn-sm btn-primary" value="??????">
                    </form>
                    </div>
                    <c:if test="${resultInfo != null}">
                        <div class="alert alert-success alert-dismissible align-items-center fade show" role="alert"
                             style="width: 160px;height: 35px;padding: 5px 10px">
                            <i class="fa fa-exclamation-circle me-2"></i>${resultInfo.msg}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="padding:9px 10px"></button>
                        </div>
                    </c:if>
                </div>
                <div class="table-responsive">
                    <form method="post" action="deleteGoodsServlet" id="form">
                    <table class="table text-start table-bordered table-hover mb-0">
                        <thead>
                        <tr class="text-dark">
                            <th>
                            </th>
                            <th scope="col">??????</th>
                            <th scope="col">??????</th>
                            <th scope="col">??????</th>
                            <th scope="col">?????????</th>
                            <th scope="col">??????</th>
                            <th scope="col">??????</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach items="${page.list}" var="good">
                            <tr>
                                <td style="text-align: center"><input class="form-check-input" type="checkbox" name="goodId" value="${good.gid}"></td>
                                <td>${good.gname}</td>
                                <td>${good.price}</td>
                                <td>
                                    <img src="${good.image}" alt="?????????" width="80px" height="70px">
                                </td>
                                <td>${good.stock}</td>
                                <td>${good.description}</td>
                                <td>
                                    <a class="btn btn-sm btn-primary"  href="FindGoodsByIdServlet?gid=${good.gid}">??????</a>
                                    <!-- ???????????? ??????javascript??????????????? -->
                                    <a class="btn btn-sm btn-danger" href="javascript:deleteGood(${good.gid})">??????</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                        <br>
                        <input type="button" name = "all" value = "??????"    onclick="selectAll()" class="btn btn-sm btn-primary"/>
                        <input type="button" name = "none" value = "?????????" onclick="selectNone()" class="btn btn-sm btn-primary"/>
                        <input type="button" name = "back" value = "??????"   onclick="selectBack()" class="btn btn-sm btn-primary"/>
                        <a  class="btn btn-sm btn-danger"  href="javascript:void(0)" id="delSearch" >????????????</a>
                    </form>
                </div>
            </div>
            <!--??????keyWord?????? ??????????????????-->
            <c:if test="${keyWord == null}">
                <div>
                    <ul class="pagination">
                        <!--??????????????? ??????????????????-->
                        <c:if test="${page.currentPage != 1 && page.currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="searchGoodsByPageServlet?currentPage=1&rows=5"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                            <%-- ????????????????????????????????????????????????--%>
                        <c:if test="${page.currentPage>1}">
                            <li class="page-item">
                                <a class="page-link" href="searchGoodsByPageServlet?currentPage=${page.currentPage-1}&rows=5"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&lt;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                            <%-- ???????????? ???????????????active???class???????????????css??????--%>
                        <c:forEach begin="1" end="${page.totalPage}" var="i">
                            <c:if test="${page.currentPage == i}">
                                <li class="page-item active"><a class="page-link"
                                                                href="searchGoodsByPageServlet?currentPage=${i}&rows=5">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${page.currentPage != i}" >
                                <li class="page-item"><a class="page-link"
                                                         href="searchGoodsByPageServlet?currentPage=${i}&rows=5">${i}</a>
                                </li>
                            </c:if>

                        </c:forEach>
                            <%-- ????????????????????????????????????????????????--%>
                        <c:if test="${page.currentPage<page.totalPage}">
                            <li class="page-item">
                                <a class="page-link" href="searchGoodsByPageServlet?currentPage=${page.currentPage+1}&rows=5"
                                   aria-label="Next">
                                    <span aria-hidden="true">&gt;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:if>
                            <%-- ???????????????????????? ?????????????????????--%>
                        <c:if test="${page.currentPage != page.totalPage && page.currentPage<page.totalPage}">
                            <li class="page-item">
                                <a class="page-link" href="searchGoodsByPageServlet?currentPage=${page.totalPage}&rows=5"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
           <c:if test="${keyWord != null}">
               <div>
                   <ul class="pagination">
                       <!--??????????????? ??????????????????-->
                       <c:if test="${page.currentPage != 1 && page.currentPage > 1}">
                           <li class="page-item">
                               <a class="page-link" href="searchGoodsByPageServlet?currentPage=1&rows=5&keyWord=${keyWord}"
                                  aria-label="Previous">
                                   <span aria-hidden="true">&laquo;</span>
                                   <span class="sr-only">Previous</span>
                               </a>
                           </li>
                       </c:if>
                           <%-- ????????????????????????????????????????????????--%>
                       <c:if test="${page.currentPage>1}">
                           <li class="page-item">
                               <a class="page-link" href="searchGoodsByPageServlet?currentPage=${page.currentPage-1}&rows=5&keyWord=${keyWord}"
                                  aria-label="Previous">
                                   <span aria-hidden="true">&lt;</span>
                                   <span class="sr-only">Previous</span>
                               </a>
                           </li>
                       </c:if>
                           <%-- ???????????? ???????????????active???class???????????????css??????--%>
                       <c:forEach begin="1" end="${page.totalPage}" var="i">
                           <c:choose>
                               <c:when test="${page.currentPage == i}">
                                   <li class="page-item active"><a class="page-link"
                                                                   href="searchGoodsByPageServlet?currentPage=${i}&rows=5&keyWord=${keyWord}">${i}</a>
                                   </li>
                               </c:when>
                               <c:otherwise>
                                   <li class="page-item"><a class="page-link"
                                                            href="searchGoodsByPageServlet?currentPage=${i}&rows=5&keyWord=${keyWord}">${i}</a>
                                   </li>
                               </c:otherwise>
                           </c:choose>
                       </c:forEach>
                           <%-- ????????????????????????????????????????????????--%>
                       <c:if test="${page.currentPage<page.totalPage}">
                           <li class="page-item">
                               <a class="page-link" href="searchGoodsByPageServlet?currentPage=${page.currentPage+1}&rows=5&keyWord=${keyWord}"
                                  aria-label="Next">
                                   <span aria-hidden="true">&gt;</span>
                                   <span class="sr-only">Next</span>
                               </a>
                           </li>
                       </c:if>
                           <%-- ???????????????????????? ?????????????????????--%>
                       <c:if test="${page.currentPage != page.totalPage && page.currentPage<page.totalPage}">
                           <li class="page-item">
                               <a class="page-link" href="searchGoodsByPageServlet?currentPage=${page.totalPage}&rows=5&keyWord=${keyWord}"
                                  aria-label="Previous">
                                   <span aria-hidden="true">&raquo;</span>
                                   <span class="sr-only">Previous</span>
                               </a>
                           </li>
                       </c:if>
                   </ul>
               </div>
           </c:if>
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
<script src="lib/chart/chart.min.js"></script>
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
