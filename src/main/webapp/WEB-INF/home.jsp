<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page import="dao.BookDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.Database" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if the user is logged in
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("/Library_Management/login-page");
        return;
    }

    // Get all books from the database
    Connection connection = Database.getConnection();
    BookDAO bookDAO = new BookDAO(connection);
    List<Book> books = bookDAO.getAllBooks();
%>
<html>
<head>
    <title>Library Management System</title>
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
            max-width: 800px;
            width: 100%; /* Full width for responsiveness */
            padding: 20px;
            background-color: #d2b48c; /* Tan background for the container */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #8b4513; /* SaddleBrown for headings */
            margin-bottom: 20px;
            text-align: center; /* Center align headings */
        }

        a {
            color: #8b4513; /* Brown links */
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #8b4513; /* Darker brown background on hover */
            color: white;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white; /* White background for table */
            border-radius: 8px;
            overflow: hidden;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
        }

        table th {
            background-color: #8b4513; /* Brown header background */
            color: white;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray for even rows */
        }

        table tr:hover {
            background-color: #e0d0c1; /* Light brown hover effect */
        }

        /* Form Styles */
        form {
            background-color: white; /* White background for form */
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        form input[type="text"], form input[type="number"] {
            width: calc(100% - 24px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #8b4513; /* Brown border */
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        form input[type="submit"] {
            background-color: #8b4513; /* Brown button */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #5c3b1f; /* Darker brown on hover */
        }

        /* Logout Button */
        .logout-button {
            float: right;
            background-color: #e74c3c; /* Red logout button */
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .logout-button:hover {
            background-color: #c0392b; /* Darker red on hover */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to the Library Management System</h1>
    <a href="/Library_Management/logout" class="logout-button">Logout</a>

    <h2>Books</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <% for (Book book : books) { %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPrice() %></td>
            <td>
                <a href="/Library_Management/edit-book?id=<%= book.getId() %>">Edit</a>
                <a href="/Library_Management/delete-book?id=<%= book.getId() %>">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>

    <h2>Add New Book</h2>
    <form action="/Library_Management/add-book" method="post">
        Title: <input type="text" name="title" required><br>
        Author: <input type="text" name="author" required><br>
        Price: <input type="number" name="price" required><br>
        <input type="submit" value="Add Book">
    </form>
</div>
</body>
</html>