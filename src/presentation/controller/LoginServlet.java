package presentation.controller;

import service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf8");

        String nameField = request.getParameter("l_name_txt");
        String passwordField = request.getParameter("l_password_txt");

        if (UserDAO.login(nameField, passwordField)) {

            System.out.println("Login success!");

            HttpSession session = request.getSession();
            session.setAttribute("user", nameField);
            session.setMaxInactiveInterval(30 * 60);

            Cookie cookie = new Cookie("user", nameField);
            cookie.setMaxAge(30 * 60);

            response.addCookie(cookie);
            response.sendRedirect("home.jsp");

        } else {

            System.out.println("Login denied.");

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
            rd.include(request, response);

            PrintWriter out = response.getWriter();
            out.print("<br/><br/><br/><p style='text-align: center; color: #D0021B; font-family: Menlo-Regular;'>Error: Please check your input information.</p>");
            out.close();
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
