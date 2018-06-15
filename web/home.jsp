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
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object user = session.getAttribute("user");
    Object pagiObj = request.getParameter("pagi");

    List<Entry> entries = EntryDAO.getAllEntries();
    int piece = 4;
    int totalPages = (int) Math.ceil((double)(entries.size()) / (double)(piece));
    System.out.println("size: " + entries.size() + " piece: " + piece + " total: " + totalPages);
    if (totalPages == 0) totalPages = 1;

    int pagi;
    if (pagiObj == null)
        pagi = 1;
    else
        pagi = Integer.parseInt(pagiObj.toString());
    int start = (pagi - 1) * piece;
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

    <%--<p style="text-align: center">sum: <%=entries.size()%> pages: <%=pages%> pagi: <%=pagi%></p>--%>
    <%
        if (entries.size() == 0) {
    %>
    <p>Entries load error. <a href="home.jsp">Reload</a> </p>
    <%
        } else {
            for (int i = start; i < entries.size() && i < start + piece; i++) {
                System.out.println("current i: " + i);
                Entry entry = entries.get(i);
    %>
    <div class="container">

        <a href="entry.jsp?id=<%=entry.getE_id()%>" style="text-decoration: none">
            <h2 id="title_home" style="color: rgba(0, 0, 0, 0.8);"><%=entry.getTitle()%></h2>
        </a>
        <p id="info"><%=entry.getDate().toString().substring(0, 10)%> | <%=entry.getAuthor()%></p>
        <p id="content"><%=entry.getContent()%></p>

    </div>
    <%
            }
        }
    %>

    <%-- Pagination --%>
    <%
        for (int i = 1; i <= totalPages; i++) {
    %>
    <a href="home.jsp?pagi=<%=i%>"><%=i%></a>
    <%
        }
    %>


</body>
</html>
