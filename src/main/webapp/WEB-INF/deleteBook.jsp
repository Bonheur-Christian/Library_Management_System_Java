<%@ page import="dao.BookDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get the book ID from the request
    int id = Integer.parseInt(request.getParameter("id"));

    // Delete the book
    Connection connection = Database.getConnection();
    BookDAO bookDAO = new BookDAO(connection);
    bookDAO.deleteBook(id);

    // Redirect back to home.jsp
    response.sendRedirect("/Library_Management/home-page");
%>