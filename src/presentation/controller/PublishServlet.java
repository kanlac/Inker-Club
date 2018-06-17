package presentation.controller;

import presentation.model.Entry;
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

            int e_id = EntryDAO.getEntry(title).getE_id();

            PrintWriter out = response.getWriter();
            out.print("<p>Post success!</p>");
            out.print("<a href='entry.jsp?id=" + e_id + "'>OK</a>");
        } else {
            System.out.println("Post failed.");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
