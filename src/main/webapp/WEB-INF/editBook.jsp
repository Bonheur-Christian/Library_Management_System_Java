<%@ page import="dao.BookDAO" %>
<%@ page import="model.Book" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get the book ID from the request
    int id = Integer.parseInt(request.getParameter("id"));

    // Fetch the book from the database
    Connection connection = Database.getConnection();
    BookDAO bookDAO = new BookDAO(connection);
    Book book = bookDAO.getAllBooks().stream()
            .filter(b -> b.getId() == id)
            .findFirst()
            .orElse(null);

    if (book == null) {
        response.sendRedirect("/Library_Management/home-page");
        return;
    }
%>
<html>
<head>
    <title>Edit Book</title>
    <style>
        /* General Styles */
        body {
            background-color: #f5f5f5; /* Light gray background */
            font-family: 'Arial', sans-serif;
            color: #3b2a1e; /* Dark brown text color */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }

        .container {
            max-width: 400px; /* Fixed width for the form */
            width: 100%; /* Full width for responsiveness */
            padding: 20px;
            background-color: #d2b48c; /* Tan background for the container */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center text in the container */
        }

        h1 {
            color: #8b4513; /* SaddleBrown for headings */
            margin-bottom: 20px;
        }

        form {
            width: 100%; /* Full width of the form */
        }

        input[type="text"], input[type="number"] {
            width: calc(100% - 24px); /* Full width minus padding */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #8b4513; /* Brown border */
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #8b4513; /* Brown button */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%; /* Full width of the button */
        }

        input[type="submit"]:hover {
            background-color: #5c3b1f; /* Darker brown on hover */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Book</h1>
    <form action="/Library_Management/update-page" method="post">
        <input type="hidden" name="id" value="<%= book.getId() %>">
        Title: <input type="text" name="title" value="<%= book.getTitle() %>" required><br>
        Author: <input type="text" name="author" value="<%= book.getAuthor() %>" required><br>
        Price: <input type="number" name="price" value="<%= book.getPrice() %>" required><br>
        <input type="submit" value="Update Book">
    </form>
</div>
</body>
</html>