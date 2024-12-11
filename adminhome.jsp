<%@ page import="java.util.List" %>
<%@ page import="com.HibernateWebProject.Bean.Emp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    /* Body styling */
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

    /* Container for the main content */
    .container {
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 1200px;
        text-align: center;
    }

    /* Header styling */
    header {
        background: #2c3e50;
        padding: 30px;
        text-align: center;
        border-bottom: 5px solid #ecf0f1;
        color: white;
    }
    header h1 {
        margin: 0;
        font-size: 40px;
        font-weight: 600;
        letter-spacing: 2px;
    }

    /* Horizontal line */
    hr {
        width: 80%;
        margin: 20px auto;
        border: 1px solid #ecf0f1;
    }

    /* Buttons for actions */
    .buttons {
        display: flex;
        justify-content: center;
        margin-bottom: 30px;
    }

    .buttons button {
        background-color: #1abc9c;
        color: white;
        padding: 15px 30px;
        font-size: 18px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin: 0 10px;
    }

    .buttons button:hover {
        background-color: #16a085;
    }

    /* Table styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    table th, table td {
        padding: 12px;
        text-align: center;
    }

    table th {
        background-color: #9b59b6;
        color: white;
        font-size: 18px;
    }

    table td {
        background-color: #ecf0f1;
        font-size: 16px;
        color: #34495e;
    }

    table td a {
        color: #e74c3c;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    table td a:hover {
        color: #c0392b;
    }

    /* Success message */
    p {
        color: #2ecc71;
        font-size: 18px;
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>

<header>
    <h1>Admin Dashboard</h1>
</header>

<div class="container">
    <div class="buttons">
        <form action="emp.jsp">
            <button type="submit">Add Employee</button>
        </form>
        <%
            if (request.getAttribute("empinsert") != null) {
        %>
        <p><%= request.getAttribute("empinsert") %></p>
        <%
            }
        %>
        <form action="empdata" method="post">
            <button type="submit">Display Employees</button>
        </form>
         <form action="logout"method="post" >
            <button type="submit">Logout</button>
        </form>
    </div>

    <c:if test="${empdata != null}">
        <table>
            <thead>
                <tr>
                    <th>Emp_Id</th>
                    <th>Emp Name</th>
                    <th>Emp Salary</th>
                    <th>Action</th>
                </tr>
            </thead>
            <c:forEach items="${empdata}" var="e1">
                <tbody>
                    <tr>
                        <td>${e1.getId()}</td>
                        <td>${e1.getName()}</td>
                        <td>${e1.getSalary()}</td>
                        <td>
                            <a href="delemp?id=${e1.getId()}">Delete</a> / 
                            <a href="getempdata?id=${e1.getId()}">Edit</a>
                        </td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </c:if>
</div>

</body>
</html>
