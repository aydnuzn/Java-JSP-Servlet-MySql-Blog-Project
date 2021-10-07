<%@ page import="props.BlogPost" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Blog Yazıları">
  <title>Document</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/music_icon.png"/>

  <!--Google Font-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Unlock&display=swap" rel="stylesheet">

  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/music_icon.png"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" />


</head>

<body>
<header>
  <div class="container">
    <nav>
      <h1 style="display:flex">
        <img src="${pageContext.request.contextPath}/img/music_logo.png" alt="music_logo" width="50" height="50">
        <span>Music<i>World</i></span>
      </h1>
      <ul>
        <li><a href="./index.jsp">AnaSayfa</a></li>
        <li><a href="./about.jsp">Hakkımızda</a></li>
        <li><a href="./contact.jsp">İletişim</a></li>
      </ul>
    </nav>
  </div>
</header>

<section style="padding-top:130px; min-height: 600px;" class="ftco-section">
  <div class="container">
    <%
      BlogPost blogPost = (BlogPost) request.getAttribute("blogPost");
    %>
    <h1 style="text-align:center"><%=blogPost.getTitle()%></h1>
    <div>
      <%=blogPost.getContent()%>
    </div>
  </div>
</section>


<footer>
  <div class="footer-top">
    <div class="footer-about">
      <h3>ABOUT US</h3>
      <p>Music strings of the highest quality – this is both the incentive and obligation of Thomastik-Infeld.
        Based in the heart of Vienna, we have been developing and producing strings with the vastest range
        of tone colors since 1919, for bowed, plucked and world music instruments.</p>
    </div>
    <div class="footer-contact">
      <h3>CONTACT</h3>
      <p>Lorem ipsum dolor sit <br>Lorem, ipsum <br>Lorem, ipsum <br>
        <br>
        Tel: <a href="tel:+6499284992">+6499284992</a>
      </p>
    </div>
  </div>
  <div class="copyright">
    &copy; Copyright 2021 Müziksell Müzik Market Tic. ve San Ltd. Şti
  </div>
</footer>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
