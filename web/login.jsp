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
        <div>
            <h1>Inker Club</h1>
        </div>
        <div>
            <p>there is mystery in it, not to be explained but admired</p>
        </div>
        <form action="/LoginServlet" method="post">
            <div>
                <input name="nameTxt" type="text"/>
            </div>
            <div>
                <input name="passwordTxt" type="password"/>
            </div>
            <div>
                <button name="loginButton" type="submit">login</button>
            </div>
        </form>
    </div>

</body>
</html>
