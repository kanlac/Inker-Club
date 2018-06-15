<%--
  Created by IntelliJ IDEA.
  User: serfusE
  Date: 2018/6/10
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object user = session.getAttribute("user");
%>
<html>
<head>
    <title>Publish | Edit</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" type="text/css" href="reset.css"/>
</head>
<body class="bodyPadding">

    <div class="navItem">
        <p style="float: left; text-decoration: none">
            login as <span style="color: #649FD3"> <%=user%></span>.
        </p>
        <a href="/LogoutServlet">log out</a>
        <div style="float: right;">
            <a>Delete</a>
            <a>Cancel</a>
            <label for="submitBtn" style="cursor: pointer;">
                <a>Save</a>
            </label>
        </div>
    </div>

    <script type="text/javascript">
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
                my_form.action = "/PublishServlet";
            }
        }
    </script>

    <form class="editor" id="my_form" method="post" onsubmit="return getContent()">

        <input id="titleArea" name="title" type="text" placeholder="Input your title here.."/>
        <div id="articleArea" contenteditable="true"></div>
        <textarea id="textBox" name="content" style="display: none;"></textarea>
        <button id="submitBtn" type="submit" onclick="filter()" style="display: none;">publish</button>

    </form>

</body>
</html>
