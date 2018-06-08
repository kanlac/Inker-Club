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
    <title>Login</title>
</head>
<body>
    <header>
        <link rel="stylesheet" type="text/css" href="style.css">
    </header>
    <div>
        <div style="padding-top: 4%">
            <h1 class="mainTitle" style="margin-bottom: 0px">Inker Club</h1>
            <p class="quotation" style="margin-top: 20px">there is mystery in it, not to be explained but admired</p>
        </div>

        <br/> <br/> <br/>

        <form action="/LoginServlet" method="post">

            <div class="inputDivFrame" style="margin-bottom: 30px">
                <img src="pic/username.jpg" alt="username" style="width: 19px; height: 22px; margin-left: 18px;">
                <input name="nameTxt" type="text" class="inputTextFrame"/>
            </div>
            <div class="inputDivFrame">
                <img src="pic/password.jpg" alt="password" style="width: 16.5px; height: 22px; margin-left: 18px;">
                <input name="passwordTxt" type="password" class="inputTextFrame"/>
            </div>

            <br/>

            <div style="width: 450px; margin: auto;">
                <a href="home.jsp" class="loginButton" style="text-decoration: none; color: #649FD3;">view as guest</a>
                <button name="loginButton" type="submit" class="loginButton" style="float: right; color: #28CA42; cursor: pointer;">login</button>
            </div>
        </form>
    </div>

</body>
</html>
