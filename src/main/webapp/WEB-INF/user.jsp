<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Information</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }

        p {
            color: #555555;
            font-size: 16px;
            margin: 10px 0;
        }

        .no-info {
            color: #ff0000;
            font-weight: bold;
        }

        .info-item {
            background-color: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }

        .info-item span {
            font-weight: bold;
            color: #333333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>User Information</h1>
    <c:choose>
        <c:when test="${empty user.name}">
            <p class="no-info">No user information available.</p>
        </c:when>
        <c:otherwise>
            <div class="info-item">
                <span>Username:</span> ${user.name}
            </div>
            <div class="info-item">
                <span>Password:</span> ${user.password}
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
