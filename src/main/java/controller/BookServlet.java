package controller;

import dao.BookDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;

import java.io.IOException;
import java.util.List;

public class BookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = BookDAO.getAllBooks();
        request.setAttribute("books", books);
        RequestDispatcher rd = request.getRequestDispatcher("book-page");
        rd.forward(request, response);
    }
}
