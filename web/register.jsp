<%--
  Created by IntelliJ IDEA.
  User: serfusE
  Date: 2018/6/9
  Time: 6:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register | Inker Club</title>
</head>
<body>
    <header>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="reset.css"/>
    </header>

    <div style="margin-top: 9%">
        <h1 class="mainTitle" style="margin-bottom: 0px">Inker Club</h1>
        <p class="quotation" style="margin-top: 20px">there is mystery in it, not to be explained but admired</p>
    </div>

    <br/> <br/> <br/>

    <form action="/RegisterServlet" method="post">

        <div class="register_form_div">
            <input name="r_name_txt" type="text" placeholder="USERNAME">
        </div>
        <br/>
        <div class="register_form_div">
            <input name="r_password_txt" type="password" placeholder="PASSWORD">
        </div>
        <br/>
        <div class="register_form_div">
            <input name="r_confirm_txt" type="password" placeholder="CONFIRM">
        </div>

        <br/>


        <%--<div style="width: 450px; margin: auto" class="loginButton">--%>
            <%--<a href="home.jsp" id="guest">view as guest</a>--%>
            <%--<a href="register.jsp" id="register" style="float: left;margin-left: 15px;">register</a>--%>
            <%--<button name="loginButton" id="login" type="submit" style="border: none;">login</button>--%>
        <%--</div>--%>
    </form>

</body>
</html>
