<%--
  Created by IntelliJ IDEA.
  User: Lzy
  Date: 2025/2/19
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>POST USERINFO</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }
        p {
            color: #555;
            margin-bottom: 20px;
            font-size: 16px;
            text-align: center;
        }
        form {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
            color: #333;
            text-align: left;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>POST USERINFO</h1>
    <p>Enter the user data in Base64 format:</p>

    <form action="user" method="post">
        <label for="user">User Data (Base64):</label>
        <input type="text" id="user" name="user" placeholder="e.g., SGVsbG8gV29ybGQ=" required>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
