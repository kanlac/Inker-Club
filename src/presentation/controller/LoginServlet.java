package presentation.controller;

import presentation.model.User;
import service.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("loginButton") != null) {

            String nameField = request.getParameter("nameTxt");
            String passwordField = request.getParameter("passwordTxt");

            if (UserDAO.login(nameField, passwordField)) {
                System.out.println("Login success!");
                //response.sendRedirect("home.jsp");
            } else {
                System.out.println("Login denied.");
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
