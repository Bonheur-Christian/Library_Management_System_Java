package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        if (UserDAO.validate(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            response.sendRedirect("/Library_Management/home-page");
        } else {
            // Set an error message in the request
            request.setAttribute("error", "Invalid username or password!");

            // Forward to the login page without the .jsp extension
            RequestDispatcher rd = request.getRequestDispatcher("/login-page");
            rd.forward(request, response);
        }
    }
}