package presentation.controller;

import service.EntryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteEntryServlet", urlPatterns = {"/DeleteEntryServlet"})
public class DeleteEntryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (EntryDAO.delete(id)) {
            PrintWriter out = response.getWriter();
            out.print("<p>Operation success.</p>");
            out.print("<a href='home.jsp'>OK</a>");
            out.close();
        }
    }
}
