<%--
  Created by IntelliJ IDEA.
  User: serfusE
  Date: 2018/6/17
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="presentation.model.Entry" %>
<%@ page import="service.EntryDAO" %>
<%
    Object user = session.getAttribute("user");
    int e_id = Integer.parseInt(request.getParameter("id"));
    Entry entry = EntryDAO.getEntry(e_id);
%>
<html>
<head>
    <title>Edit</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" type="text/css" href="reset.css"/>
</head>
<body class="bodyPadding">

    <div class="navItem">
        <p style="float: left;text-decoration: none;">
            login as <span style="color: #649FD3"> <%=user%></span>.
        </p>
        <a href="/LogoutServlet">log out</a>
        <div style="float: right;">
            <script type="text/javascript">
                function confirmCancel() {
                    var message = confirm("You modification won't be saved.");
                    if (message)
                        window.location.href="entry.jsp?id=<%=e_id%>";
                }
                function confirmDelete() {
                    var message = confirm("Are you sure you want delete this forever? this operation can't be retrieved.")
                    if (message)
                        window.location.href="/DeleteEntryServlet?id=<%=entry.getE_id()%>"
                }
            </script>

            <a onclick="confirmDelete()">Delete</a>
            <a onclick="confirmCancel()">Cancel</a>
            <label for="submitBtn" style="cursor: pointer;">
                <a>Save</a>
            </label>
        </div>
    </div>

    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("articleArea").innerText = "<%=entry.getContent()%>";
        }

        function getContent() {
            var div_val = document.getElementById("articleArea").innerHTML;
            document.getElementById("textBox").value = div_val;
        }

        function filter() {
            var title = document.getElementById("titleArea");
            var content = document.getElementById("articleArea");
            var my_form = document.getElementById("my_form");

            if (title.value === "" || content.innerHTML === "") {
                alert("Either title or content is null.")
            } else {
                getContent();
                my_form.action = "/EditServlet";
            }
        }
    </script>

    <form class="editor" id="my_form" method="post" onsubmit="return getContent()">

        <input id="titleArea" name="title" type="text" placeholder="Input your title here.." value="<%=entry.getTitle()%>" style="width: 100%;"/>
        <div id="articleArea" contenteditable="true"></div>
        <textarea id="textBox" name="content" style="display: none;"></textarea>
        <button id="submitBtn" type="submit" onclick="filter()" style="display: none;">Edit</button>

        <input style="display: none;" name="e_id" value="<%=e_id%>">

    </form>

</body>
</html>
