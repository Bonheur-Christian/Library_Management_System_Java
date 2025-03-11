<%@ page import="dao.BookDAO" %>
<%@ page import="model.Book" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get form data
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    double price = Double.parseDouble(request.getParameter("price"));

    // Update the book
    Book book = new Book(id, title, author, price);
    Connection connection = Database.getConnection();
    BookDAO bookDAO = new BookDAO(connection);
    bookDAO.updateBook(book);

    // Redirect back to home.jsp
    response.sendRedirect("/Library_Management/home-page");
%>