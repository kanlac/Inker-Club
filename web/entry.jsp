<%--
  Created by IntelliJ IDEA.
  User: serfusE
  Date: 2018/6/10
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="presentation.model.Entry" %>
<%@ page import="service.EntryDAO" %>
<%
    Object user = session.getAttribute("user");
    System.out.println("Current account: " + (user == null ? "guest" : user));

    System.out.println("get param: " + request.getParameter("id"));
    int e_id = Integer.parseInt(request.getParameter("id"));
    Entry entry = EntryDAO.getEntry(e_id);
%>
<html>
<head>
    <title><%=entry.getTitle()%></title>
</head>
<body class="bodyPadding">
    <head>
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <link rel="stylesheet" type="text/css" href="reset.css"/>
    </head>

    <div class="navItem">
        <%
            if (user == null) {
        %>
        <a href="login.jsp">login</a>
        <a href="register.jsp">register</a>
        <div style="float: right;">
            <a href="home.jsp">Home</a>
        </div>
        <%
            } else {
        %>
        <p style="float: left; text-decoration: none;">
            login as <span style="color: #649FD3"> <%=user%></span>.
        </p>
        <a href="/LogoutServlet">log out</a>

        <div style="float: right;">
            <a href="home.jsp">Home</a>
            <%
                if (user.equals(entry.getAuthor())) {
            %>
            <a href="publish.jsp?id=<%=entry.getE_id()%>">Edit</a>
            <%
                }
            %>
            <a href="publish.jsp">publish</a>
        </div>
        <%
            }
        %>
    </div>

    <br/>

    <div class="container">

        <h1 id="title_detail"><%=entry.getTitle()%></h1>
        <p id="info"><%=entry.getDate()%> | <%=entry.getAuthor()%></p> <br/>
        <p id="content"><%=entry.getContent()%></p>

    </div>

    <hr style="width: 50%; opacity: 0.3; margin: 80px auto"/>

    <p style="opacity: 0.63;font-family: Futura-MediumItalic;font-size: 16px;text-align: center;">Share</p>
    <div class="shareLogo">
        <img src="pic/share/facebook.jpg" alt="facebook"/>
        <img src="pic/share/twitter.jpg" alt="twitter" />
        <img src="pic/share/whatsapp%20copy.jpg" alt="whatsapp" />
    </div>

</body>
</html>
