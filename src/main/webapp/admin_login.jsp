<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-login.css" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/music_icon.png"/>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-2"></div>
        <div class="col-lg-6 col-md-8 login-box">
            <div class="col-lg-12 login-key">
                <i class="fa fa-key" aria-hidden="true"></i>
            </div>
            <div class="col-lg-12 login-title">
                ADMIN PANEL
            </div>

            <div class="col-lg-12 login-form">
                <div class="col-lg-12 login-form">
                    <form action="login-servlet" method="post">
                        <div class="form-group">
                            <label class="form-control-label">USERNAME</label>
                            <input type="text" name="email" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">PASSWORD</label>
                            <input type="password" name="password" class="form-control" i>
                        </div>


                        <div class="col-lg-12 loginbttm" style="color: red; text-align: center; margin-bottom: 13px; ">
                            <%
                                String loginError = "";
                                if(request.getAttribute("error") != null){
                                    loginError = "" + request.getAttribute("error");
                                }
                            %>
                            <span> <%=loginError%> </span>
                        </div>



                        <div class="col-lg-12 loginbttm">
                            <div class="col-lg-6 login-btm login-text">
                                <input name="remember" type="checkbox" id="exampleCheck1">
                                <label style="color:#0DB8DE;" for="exampleCheck1">Remember</label>
                            </div>
                            <div class="col-lg-6 login-btm login-button">
                                <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 col-md-2"></div>
        </div>
    </div>
</div>
</body>
</html>