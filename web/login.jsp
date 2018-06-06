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
    <div>
        <h1>Inker Club</h1>
        <p>there is mystery in it, not to be explained but admired</p>
        <form action="/LoginServlet" method="post">
            <input name="nameTxt" type="text"/>
            <input name="passwordTxt" type="password"/>
            <div>
                <button name="loginButton" type="submit" value="login"/>
            </div>
        </form>
    </div>

</body>
</html>
