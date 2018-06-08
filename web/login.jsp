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
            <p class="quotation" style="margin-top: 20px;">there is mystery in it, not to be explained but admired</p>
        </div>
        <form action="/LoginServlet" method="post">

            <div class="inputDivFrame" style="margin-bottom: 30px">
                <input name="nameTxt" type="text" class="inputTextFrame" placeholder="Username"/>
            </div>
            <div class="inputDivFrame">
                <input name="passwordTxt" type="password" class="inputTextFrame" placeholder="Password"/>
            </div>

            <div>
                <button name="loginButton" type="submit">login</button>
            </div>
        </form>
    </div>

</body>
</html>
