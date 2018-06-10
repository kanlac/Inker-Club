<%--
  Created by IntelliJ IDEA.
  User: serfusE
  Date: 2018/6/6
  Time: 1:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="presentation.model.Entry" %>
<%@ page import="java.util.List" %>
<%@ page import="service.EntryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object user = session.getAttribute("user");
    System.out.println("Current account: " + (user == null ? "guest" : user));
%>
<html>
<head>
    <title>Inker Club</title>
</head>
<body>
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
        <%
            } else {
        %>
            <p style="float: left; text-decoration: none">
                login as <span style="color: #649FD3"> <%=user%></span>.
            </p>
            <a href="/LogoutServlet">log out</a>
            <div style="float: right;">
                <a href="publish.jsp">publish</a>
            </div>
        <%
            }
        %>
    </div>

    <div style="margin-top: 10%">

        <h1 class="mainTitle">Inker Club</h1>
        <div class="socialLogo">
            <img src="pic/social/google-plus-logo-button.jpg" alt="google plus"/>
            <img src="pic/social/linkedin-logo-button.jpg" alt="linkedin"/>
            <img src="pic/social/facebook-logo-button.jpg" alt="facebook"/>
        </div>
        <p class="quotation" style="padding-top: 10px">poetry is just the evidence of life</p>

    </div>

    <%
        List<Entry> entryList = EntryDAO.getLatestEntries(6);

        for (Entry entry: entryList) {
    %>
    <div class="container">

        <a href="./entry.jsp?id=<%=entry.getE_id()%>" style="text-decoration: none">
            <h2 id="title" class="homeTitle" style="color: rgba(0, 0, 0, 0.7);"><%=entry.getTitle()%></h2>
        </a>
        <p id="info"><%=entry.getDate()%> | <%=entry.getAuthor()%></p>
        <p id="content"><%=entry.getContent()%></p>

    </div>
    <%
        }
    %>

</body>
</html>
