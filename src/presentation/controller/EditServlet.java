package presentation.controller;

import service.EntryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int e_id = Integer.parseInt(request.getParameter("e_id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (EntryDAO.update(e_id, title, content)) {
            System.out.println("Post success!");

            PrintWriter out = response.getWriter();
            out.print("<p>Post success!</p>");
            out.print("<a href='entry.jsp?id=" + e_id + "'>OK</a>");
            out.close();
        } else {
            System.out.println("Post failed.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
