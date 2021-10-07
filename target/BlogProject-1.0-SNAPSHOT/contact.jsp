<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Müzik Aletleri Satış">
  <title>Document</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" />
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/music_icon.png"/>

  <!--Google Font-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Unlock&display=swap" rel="stylesheet">

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

<section class="ftco-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 text-center mb-5">
        <h2 class="heading-section">Bizimle İletişime Geçin</h2>
      </div>

        <c:if test="${param.messageError != null}">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Hata!</strong> <c:out value="${param.messageError}"></c:out>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        </c:if>

    </div>
    <div class="row justify-content-center">
      <div class="col-md-12">
        <div class="wrapper">
          <div class="row no-gutters mb-5">
            <div class="col-md-12">
              <div class="contact-wrap w-100 p-md-5 p-4">
                <h3 class="mb-4">Contact Us</h3>
                <div id="form-message-warning" class="mb-4"></div>
                <div id="form-message-success" class="mb-4">
                  Your message was sent, thank you!
                </div>
                <form action="message-servlet" method="post" id="contactForm" class="contactForm">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="label" for="name">Full Name</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Name">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="label" for="email">Email Address</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="label" for="subject">Subject</label>
                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="label" for="message">Message</label>
                        <textarea name="content" class="form-control" id="message" cols="30" rows="4" placeholder="Message"></textarea>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input type="submit" value="Mesaj Gönder" class="btn btn-primary">
                        <div class="submitting"></div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>




<footer>
  <div class="footer-top">
    <div class="footer-about">
      <h3>ABOUT US</h3>
      <p>Music strings of the highest quality – this is both the incentive and obligation of Thomastik-Infeld. Based in the heart of Vienna, we have been developing and producing strings with the vastest range of tone colors since 1919, for bowed, plucked and world music instruments.</p>
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
</body>
</html>