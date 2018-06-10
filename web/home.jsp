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

    <div style="padding-top: 10%">
        <h1 class="mainTitle">Inker Club</h1>
        <p class="quotation" style="padding-top: 10px">poetry is just the evidence of life</p>
    </div>

    <%
        List<Entry> entryList = EntryDAO.getLatestEntries(6);

        for (Entry entry: entryList) {
    %>
    <div style="margin: auto; width: 600px; padding-top: 100px;">
        <div>
            <a href="./entry.jsp?id=<%=entry.getE_id()%>" style="text-decoration: none"><h2 class="homeTitle"><%=entry.getTitle()%></h2></a>
        </div>
        <div>
            <p class="entryInfo"><%=entry.getDate()%> | <%=entry.getAuthor()%></p>
        </div>
        <div class="homeContent">
            <%=entry.getContent()%>
        </div>
    </div>
    <%
        }
    %>

</body>
</html>
