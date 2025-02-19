<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 30px;
        }
        .link-container {
            margin-bottom: 10px; /* 增加间距 */
            text-align: center; /* 内容居中 */
        }
        a {
            display: inline-block; /* 使链接可以设置宽高 */
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 15px 20px;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            transition: background-color 0.3s ease;
            width: 200px; /* 设置固定宽度 */
        }
        a:hover {
            background-color: #45a049; /* 鼠标悬停时的背景色 */
        }
    </style>
</head>
<body>
    <h1>欢迎来到我的 Web 项目！</h1>
    <div class="link-container">
        <a href="hello">访问 Servlet</a>
    </div>
    <div class="link-container">
        <a href="user.jsp">访问 JSP</a>
    </div>
</body>
</html>
