<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>
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
    input[type="text"], input[type="number"], input[type="submit"], button {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 16px;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }
    input[type="text"], input[type="number"] {
        background: #f9f9f9;
    }
    input[type="submit"], button {
        background: #1abc9c;
        color: #fff;
        border: none;
        cursor: pointer;
        font-weight: bold;
    }
    input[type="submit"]:hover, button:hover {
        background: #16a085;
    }
    input[type="text"]:focus, input[type="number"]:focus {
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
    .home-button {
        width: auto;
        background: #e74c3c;
        font-size: 16px;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s ease;
        border: none;
    }
    .home-button:hover {
        background: #c0392b;
    }
</style>
</head>
<body>
    <div class="form-container">
        <c:if test="${userdata == null}">
            <form action="empreg" method="post">
        </c:if>

        <c:if test="${userdata != null}">
            <form action="updateemp" method="post">
        </c:if>

            <h1>Employee Registration</h1>
            <input type="hidden" name="id" value="${userdata.getId()}">
            <label>Employee Name</label>
            <input type="text" name="ename" value="${userdata.getName()}">
            
            <label>Employee Salary</label>
            <input type="number" name="esalary" value="${userdata.getSalary()}">
            
            <input type="submit" value="Submit"/>
        </form>
        
        <form action="adminhome.jsp">
            <button type="submit" class="home-button">Home</button>
        </form>
    </div>
</body>
</html>
