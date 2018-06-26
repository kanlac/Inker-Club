package presentation.controller;

import service.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf8");

        String nameField = request.getParameter("r_name_txt");
        String passwordField = request.getParameter("r_password_txt");
        String confirmField = request.getParameter("r_confirm_txt");

        if (nameField.equals(""))
            displayError(request, response, "Username can't be null.");
        else if (UserDAO.find(nameField))
            displayError(request, response, "Username existed.");
        else if (!passwordField.equals(confirmField))
            displayError(request, response, "Password didn't match.");
        else {
            if (UserDAO.register(nameField, passwordField)) {
                System.out.println("Registered.");

                HttpSession session = request.getSession();
                session.setAttribute("user", nameField);
                session.setMaxInactiveInterval(30 * 60);

                Cookie cookie = new Cookie("user", nameField);
                cookie.setMaxAge(30 * 60);

                response.addCookie(cookie);
                response.sendRedirect("home.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void displayError(HttpServletRequest request, HttpServletResponse response, String message) {

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");

        try {
            rd.include(request, response);

            PrintWriter out = response.getWriter();
            out.print("<br/><br/><br/><p style='text-align: center; color: #D0021B; font-family: Menlo-Regular;'>Error: " + message + "</p>");
            out.close();
            out.close();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
