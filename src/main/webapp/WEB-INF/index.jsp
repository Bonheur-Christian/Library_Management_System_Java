<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
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
            text-align: center; /* Center text in the container */
            background-color: #d2b48c; /* Tan background for the container */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Fixed width for the container */
        }

        h1 {
            color: #8b4513; /* SaddleBrown for headings */
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            background-color: #8b4513; /* Brown button */
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #5c3b1f; /* Darker brown on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome to Library Management System</h1>
        <a href="/Library_Management/login-page">Login</a>
</div>

</body>
</html>