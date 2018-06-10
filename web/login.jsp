<%--
  Created by IntelliJ IDEA.
  User: serfusE
  Date: 2018/6/6
  Time: 1:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login | Inker Club</title>
</head>
<body>
    <header>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="reset.css"/>
    </header>

    <div style="margin-top: 9%">
        <h1 class="siteTitle" style="margin-bottom: 0px">Inker Club</h1>
        <p class="siteQuote" style="margin-top: 20px">there is mystery in it, not to be explained but admired</p>
    </div>

    <br/> <br/> <br/> <br/> <br/>

    <form action="/LoginServlet" method="post">

        <div class="loginSheet" style="margin-bottom: 30px">
            <img src="pic/username.jpg" alt="username" style="width: 19px; height: 22px; margin-left: 18px;">
            <input name="l_name_txt" type="text"/>
        </div>
        <div class="loginSheet">
            <img src="pic/password.jpg" alt="password" style="width: 16.5px; height: 22px; margin-left: 18px;">
            <input name="l_password_txt" type="password"/>
        </div>

        <br/><br/>

        <div class="signButton" style="width: 450px;">
            <a href="home.jsp" id="guest">view as guest</a>
            <a href="register.jsp" id="register" style="float: left;margin-left: 15px;">register</a>
            <button name="loginButton" id="login" type="submit" style="border: none;">login</button>
        </div>
    </form>

</body>
</html>
