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
        <p style="float: left; text-decoration: none;">
            login as <span style="color: #649FD3"> <%=user%></span>.
        </p>
        <a href="/LogoutServlet">log out</a>
            <%
                if (user.equals(entry.getAuthor())) {
            %>
        <div style="float: right;">
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

        <h1 id="title"><%=entry.getTitle()%></h1>
        <p id="info"><%=entry.getDate()%> | <%=entry.getAuthor()%></p>
        <p id="content"><%=entry.getContent()%></p>

    </div>

</body>
</html>
