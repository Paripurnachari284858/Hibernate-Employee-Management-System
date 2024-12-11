<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Register</title>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(to right, #ff7e5f, #feb47b);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #fff;
    }
    .form-container {
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        width: 380px;
        text-align: center;
    }
    h1 {
        font-size: 26px;
        color: #333;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    label {
        font-size: 14px;
        color: #333;
        text-align: left;
        display: block;
        margin: 10px 0 5px;
    }
    input[type="text"], input[type="email"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 16px;
        box-sizing: border-box;
        transition: all 0.3s ease;
        background: #f9f9f9;
    }
    input[type="submit"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        background: #1abc9c;
        color: #fff;
        border: none;
        cursor: pointer;
        font-weight: bold;
        font-size: 16px;
        border-radius: 6px;
        transition: background 0.3s ease;
    }
    input[type="submit"]:hover {
        background: #16a085;
    }
    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
        border-color: #1abc9c;
        outline: none;
    }
    .form-container a {
        color: #1abc9c;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s ease;
    }
    .form-container a:hover {
        color: #16a085;
    }
    p {
        font-size: 14px;
        color: #ff8080;
        margin-top: 15px;
    }
</style>
</head>
<body>

    <div class="form-container">
        <h1>Admin Register</h1>
        <form action="reg" method="post">
            <label for="aname">Admin Name:</label>
            <input type="text" id="aname" name="aname" placeholder="Enter your name" required/>

            <label for="aemail">Email:</label>
            <input type="email" id="aemail" name="aemail" placeholder="Enter your email" required/>

            <label for="apassword">Password:</label>
            <input type="password" id="apassword" name="apassword" placeholder="Enter your password" required/>

            <input type="submit" value="Register">
        </form>
        <% if (request.getAttribute("insert") != null) { %>
            <p><%= request.getAttribute("insert") %></p>
        <% } %>
    </div>

</body>
</html>
