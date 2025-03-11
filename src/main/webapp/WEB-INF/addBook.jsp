<%@ page import="dao.BookDAO" %>
<%@ page import="model.Book" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get form data
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    int price = Integer.parseInt(request.getParameter("price"));

    // Create a new book
    Book book = new Book();
    book.setTitle(title);
    book.setAuthor(author);
   book.setPrice(price);

    // Add the book to the database
    Connection connection = Database.getConnection();
    BookDAO bookDAO = new BookDAO(connection);
    bookDAO.addBook(book);

    // Redirect back to home.jsp
    response.sendRedirect("/Library_Management/home-page");
%>