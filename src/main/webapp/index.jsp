
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

    <!-- font icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/music_icon.png"/>

    <!--Google Font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Unlock&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" />
    <style>
        .date-time{
            color: #8992b7;
            font-size: 12px;
            font-weight: 500;
            background-color: #f0f3ff;
        }
    </style>
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
<article class="pdd-top-100">
    <div class="container">
        <div class="txt-center">
            <img src="https://doga-karadag.webnode.com.tr/_files/200000002-ef3ccf036e/50000000.png?ph=77b0e5aca0"
                 alt="music-world" class="txt-center">
        </div>
        <hr>
        <hr>
            <div class="heading">
                <h1>YAZILAR</h1>
            </div>
            <div class="row">
                <c:if test="${dbUtil.allBlogPost().size()>0}">
                    <c:forEach items="${dbUtil.allBlogPost()}" var="item">
                        <div class="card" style="position: relative">
                            <div class="card-header">
                                <h1><c:out value="${item.title}"></c:out></h1>
                            </div>
                            <div class="card-body">
                                <c:set var = "newContent2" scope = "session" target="item" value = "${util.blogPostShort(item.title_detail,40)}"/>
                                <p><c:out value="${newContent2}"></c:out></p>
                                <a href="blog-content?bid=${item.bid}" class="btn">Read more</a>
                            </div>
                            <div style="position:absolute; bottom:0px; text-align: center; width:100%">
                                <div class="date-time">
                                    <i class="fa fa-clock-o"></i> <c:out value="${item.date_time}"></c:out>
                                     / <c:out value="${item.name}"></c:out>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
    </div>
</article>

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