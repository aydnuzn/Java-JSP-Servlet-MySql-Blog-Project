<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<%@ page import="props.BlogPost" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>

<!DOCTYPE html>
<html>
<head>
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

    <script type="text/javascript">
        CKEDITOR.replace('content');
    </script>

</head>

<body>
<!-- container section start -->
<section id="container" class="">
    <header class="header dark-bg">
        <div style="margin:18px 15px 3px 2px; padding:0px 0px 0px 0px;" class="toggle-nav">
            <div class="icon-reorder tooltips" data-original-title="" data-placement="bottom"><i style="color:azure;" class="fa fa-align-justify"></i></div>
        </div>
        <!--logo ba??lang????-->
        <a href="./admin_dashboard.jsp" class="logo" style="color:gray">ADM??N <span style="color:white">PANEL</span></a>
        <!--logo biti??-->
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
                            <a href="./admin_changepassword.jsp" style="color:darkred;"><i class="fa fa-lock"></i> ??ifre De??i??tir</a>
                        </li>
                        <li>
                            <a href="logout" style="color:darkred;"><i class="fa fa-close"></i> ????k???? Yap</a>
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
                        <span>Blog ????lemleri</span>
                        <span class="menu-arrow arrow_carrot-right"></span>
                    </a>
                    <ul class="sub">
                        <li><a class="" href="./blogpost_insert.jsp"> <i class="fa fa-hdd-o"></i>Blog Yaz??s?? Ekle</a></li>
                        <li><a class="" href="./admin_allpost.jsp"> <i class="fa fa-comments"></i>Blog Yaz??lar??</a></li>
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
            <h2>Blog Yaz??s?? D??zenle</h2>
            <%
                BlogPost blogPost = new BlogPost();
                if(request.getAttribute("blogPost") != null ){
                    blogPost = (BlogPost) request.getAttribute("blogPost");
                }
            %>
            <form action="blog-update" method="post" >
                <div class="mb-3">
                    <input value="<%=blogPost.getTitle()%>" type="text" name="title" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input value="<%=blogPost.getTitle_detail()%>" type="text" name="title_detail" class="form-control" required />
                </div>
                <div class="mb-3">
                    <textarea name="content" class="ckeditor form-control"><%=blogPost.getContent()%></textarea>
                </div>

                <button class="btn btn-success"> D??zenle </button>
            </form>
        </div>
    </section>
</section>

<!-- container section start -->
<!-- javascripts -->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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