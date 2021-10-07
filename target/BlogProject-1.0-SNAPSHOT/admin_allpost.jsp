<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title - MyBlog </title>

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
    $(document).ready( function () {
      $('#myTable').DataTable(
              {
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Turkish.json"
                }
              }
      );
    } );
  </script>

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
    <div class="col-lg-1"></div>
    <div class="col-lg-10">
      <h2>Blog Yazı Listesi</h2>
      <a class="btn btn-default" href="./blogpost_insert.jsp">Yeni Blog Ekle</a>
      <table id="myTable" class="table table-striped">
        <thead>
        <tr>
          <th scope="col">Bid</th>
          <th scope="col">Başlık</th>
          <th scope="col">Başlık Detay</th>
          <th scope="col">İçerik</th>
          <th scope="col">Düzenle</th>
          <th scope="col">Sil</th>
        </tr>
        </thead>
        <tbody>

        <%
          int aid = adm.getAid();
        %>
        <c:if test="${ dbUtil.adminAllBlogPost(aid).size() == 0 }">
          <tr>Blog Yazısı Yok</tr>
        </c:if>

        <c:if test="${dbUtil.adminAllBlogPost(aid).size()>0}">
          <c:forEach items="${dbUtil.adminAllBlogPost(aid)}" var="item">
            <tr>
              <th scope="row"><c:out value="${item.bid}"></c:out></th>
              <td><c:out value="${item.title}"></c:out></td>
              <td><c:out value="${item.title_detail}"></c:out></td>
              <c:set var = "newContent" scope = "session" target="item" value = "${util.blogPostShort(item.content,100)}"/>
              <td><c:out value="${newContent}"></c:out></td>
              <td>
                <a href="blog-update?bid=${item.bid}" class="btn btn-warning btn-sm">Düzenle</a>
              </td>
              <td>
                <a onclick="return show_alert()" href="blog-insert?bid=${item.bid}" class="btn btn-danger btn-sm">Sil</a>
              </td>
            </tr>
          </c:forEach>
        </c:if>
        </tbody>
      </table>
    </div>
    <div class="col-lg-1"></div>
  </section>
</section>


<script>
  function show_alert() {
    return confirm("Silmek istediğinizden emin misniz?")
  }

</script>

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