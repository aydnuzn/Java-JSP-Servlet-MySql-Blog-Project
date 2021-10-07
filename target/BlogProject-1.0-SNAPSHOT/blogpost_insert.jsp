<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<%Admin adm = util.isLogin(request,response);%>

<!DOCTYPE html>
<html>
<head>f
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title - MyBlog </title>

    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/music_icon.png"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/bootstrap.min.css" />
    <!-- bootstrap theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/bootstrap-theme.css" />

    <!-- font icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- owl carousel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/owl.carousel.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/jquery-jvectormap-1.2.2.css" />
    <!-- Custom styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/fullcalendar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/widgets.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/xcharts.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/css/jquery-ui-1.10.4.min.css" />

    <script src="${pageContext.request.contextPath}/adminPanelContent/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/ckeditor/contents.css" />

    <script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery-1.8.3.min.js"></script>

    <script src="${pageContext.request.contextPath}/adminPanelContent/scripts/DataTables/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/DataTables/css/jquery.dataTables.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminPanelContent/DataTables/css/dataTables.bootstrap4.css" />
    <script src="${pageContext.request.contextPath}/adminPanelContent/scripts/DataTables/dataTables.bootstrap4.js"></script>
</head>

<body>
<!-- container section start -->
<section id="container" class="">
    <header class="header dark-bg">
        <div style="margin:18px 15px 3px 2px; padding:0px 0px 0px 0px;" class="toggle-nav">
            <div class="icon-reorder tooltips" data-original-title="" data-placement="bottom"><i style="color:azure;" class="fa fa-align-justify"></i></div>
        </div>
        <!--logo başlangıç-->
        <a href="./admin_dashboard.jsp" class="logo" style="color:gray">ADMİN <span style="color:white">PANEL</span></a>
        <!--logo bitiş-->
        <div class="nav search-row" id="top_menu">

        </div>
        <div class="top-nav notification-row">
            <!-- notificatoin dropdown start-->
            <ul class="nav pull-right top-menu">
                <!-- alert notification end-->
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="username">
                            <%=request.getSession().getAttribute("name")%>
                        </span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" style="margin: 0px; padding: 0px;">
                        <li style="border-bottom: 1px solid #1b28ac">
                            <a href="./admin_changepassword.jsp" style="color:darkred;"><i class="fa fa-lock"></i> Şifre Değiştir</a>
                        </li>
                        <li>
                            <a href="logout" style="color:darkred;"><i class="fa fa-close"></i> Çıkış Yap</a>
                        </li>
                    </ul>
                </li>
                <!-- user login dropdown end -->
            </ul>
            <!-- notificatoin dropdown end-->
        </div>
    </header>

    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="">
                    <a class="" href="./admin_dashboard.jsp">
                        <i class="fa fa-home"></i>
                        <span>Anasayfa</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="">
                        <i class="fa fa-file-text"></i>
                        <span>Blog İşlemleri</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="./blogpost_insert.jsp"> <i class="fa fa-hdd-o"></i>Blog Yazısı Ekle</a></li>
                        <li><a class="" href="./admin_allpost.jsp"> <i class="fa fa-comments"></i>Blog Yazıları</a></li>
                    </ul>
                </li>


            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!--main content start-->
</section>


<section id="main-content">
    <section class="wrapper">
        <div class="col-sm-6">
            <h2>Blog Yazısı Ekle</h2>
            <c:if test="${param.insertError != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Hata!</strong> <c:out value="${param.insertError}"></c:out>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form action="blog-insert" method="post" >
                <div class="mb-3">
                    <input type="text" name="title" placeholder="Başlık" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input type="text" name="title_detail" placeholder="Başlık Detay" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input type="text" name="content" placeholder="İçerik" class="form-control" required />
                </div>
                <button class="btn btn-success">Kaydet</button>
            </form>
        </div>
    </section>
</section>

<!-- container section start -->
<!-- javascripts -->

<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery-ui-1.10.4.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery.nicescroll.js" type="text/javascript"></script>

<!--custome script for all page-->
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/scripts.js"></script>
<!-- custom script for this page-->
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/sparkline-chart.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/easy-pie-chart.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/xcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery.autosize.min.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery.placeholder.min.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/gdp-data.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/sparklines.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/charts.js"></script>
<script src="${pageContext.request.contextPath}/adminPanelContent/AdminLayout/js/jquery.slimscroll.min.js"></script>
</body>
</html>