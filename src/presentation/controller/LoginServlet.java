package presentation.controller;

import service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("loginButton") != null) {

            String nameField = request.getParameter("nameTxt");
            String passwordField = request.getParameter("passwordTxt");

            if (UserDAO.find(nameField, passwordField)) {

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
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
