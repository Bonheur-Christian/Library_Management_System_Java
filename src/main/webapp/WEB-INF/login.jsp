<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            color: #3b2a1e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #d2b48c;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }
        h1 {
            color: #8b4513;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #8b4513;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #8b4513;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background-color: #5c3b1f;
        }
        .error {
            color: red; /* Style for the error message */
            margin-bottom: 20px;
        }
    </style>
    <script>
        const translations = {
            en: {
                title: "Login",
                usernamePlaceholder: "Username",
                passwordPlaceholder: "Password",
                loginButton: "Login"
            },
            fr: {
                title: "Connexion",
                usernamePlaceholder: "Nom d'utilisateur",
                passwordPlaceholder: "Mot de passe",
                loginButton: "Connexion"
            },
            rw: {
                title: "Injiza",
                usernamePlaceholder: "Izina ry'ukoresha",
                passwordPlaceholder: "Ijambo ry'ibanga",
                loginButton: "Injira"
            }
        };

        function changeLanguage(language) {
            document.getElementById('login-title').innerText = translations[language].title;
            document.getElementById('username').placeholder = translations[language].usernamePlaceholder;
            document.getElementById('password').placeholder = translations[language].passwordPlaceholder;
            document.getElementById('login-button').innerText = translations[language].loginButton;
        }
    </script>
</head>
<body>

<div class="login-container">
    <select onchange="changeLanguage(this.value)">
        <option value="en">English</option>
        <option value="fr">Français</option>
        <option value="rw">Kinyarwanda</option>
    </select>
    <h1 id="login-title">Login</h1>

    <%-- Display the error message if it exists --%>
    <%
        String errorMessage = (String) request.getAttribute("error");
        if (errorMessage != null) {
    %>
    <div class="error"><%= errorMessage %></div>
    <%
        }
    %>

    <form action="/Library_Management/login" method="post"> <!-- Ensure correct action URL -->
        <input type="text" id="username" name="username" placeholder="Username" required><br>
        <input type="password" id="password" name="password" placeholder="Password" required><br>
        <button type="submit" id="login-button">Login</button>
    </form>
</div>

</body>
</html>