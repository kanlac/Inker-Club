package presentation.controller;

import service.EntryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PublishServlet", urlPatterns = {"/PublishServlet"})
public class PublishServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in the servlet");

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        String author = (String) request.getSession().getAttribute("user");

        if (EntryDAO.insert(title, author, content)) {
            System.out.println("Post success!");

            PrintWriter out = response.getWriter();
            out.print("<h1>Post success!</h1>");
            out.print("<a href='entry.jsp?title=" + title + "'>OK</a>");
        } else {
            System.out.println("Post failed.");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
