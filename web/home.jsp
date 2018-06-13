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
%>
<html>
<head>
    <title>Inker Club</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" type="text/css" href="reset.css"/>
</head>
<body class="bodyPadding">

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

        <h1 class="siteTitle">Inker Club</h1>
        <div class="socialLogo">
            <img src="pic/social/google-plus-logo-button.jpg" alt="google plus"/>
            <img src="pic/social/linkedin-logo-button.jpg" alt="linkedin"/>
            <img src="pic/social/facebook-logo-button.jpg" alt="facebook"/>
        </div>
        <p class="siteQuote" style="padding-top: 10px">poetry is just the evidence of life</p>

    </div>

    <%
        List<Entry> entryList = EntryDAO.getLatestEntries(6);
        if (entryList == null) {
    %>
    <p>Entries load error. <a href="home.jsp">Reload</a> </p>
    <%
        } else {
            for (Entry entry: entryList) {
    %>
    <div class="container">

        <a href="./entry.jsp?id=<%=entry.getE_id()%>" style="text-decoration: none">
            <h2 id="title_home" style="color: rgba(0, 0, 0, 0.8);"><%=entry.getTitle()%></h2>
        </a>
        <p id="info"><%=entry.getDate()%> | <%=entry.getAuthor()%></p>
        <p id="content"><%=entry.getContent()%></p>

    </div>
    <%
            }
        }
    %>


</body>
</html>
