<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息提交 - User Data Submission</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'Microsoft YaHei', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #4CAF50, #45a049, #2196F3);
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
            font-weight: 600;
        }

        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 16px;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
            color: #333;
            font-weight: 500;
        }

        .input-wrapper {
            position: relative;
        }

        input[type="text"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
            outline: none;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        .input-hint {
            font-size: 12px;
            color: #888;
            margin-top: 5px;
            font-style: italic;
        }

        .button-group {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }

        button {
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 120px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #4CAF50, #45a049);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #45a049, #3d8b40);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .example-section {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-top: 25px;
            text-align: left;
        }

        .example-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .example-code {
            background-color: #e9ecef;
            padding: 10px;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            font-size: 12px;
            color: #495057;
            word-break: break-all;
            border-left: 4px solid #4CAF50;
        }

        .warning {
            background-color: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 6px;
            padding: 12px;
            margin-top: 20px;
            color: #856404;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }
            
            h1 {
                font-size: 24px;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>用户信息提交</h1>
        <p class="subtitle">请输入 Base64 编码的用户数据进行提交和解析</p>

        <form action="user" method="post" id="userForm">
            <div class="form-group">
                <label for="user">用户数据 (Base64 格式):</label>
                <div class="input-wrapper">
                    <input type="text"
                           id="user"
                           name="user"
                           placeholder="请输入 Base64 编码的用户数据..."
                           required
                           maxlength="1048576">
                    <div class="input-hint">
                        数据将被解码并反序列化为 User 对象
                    </div>
                </div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn-primary">提交数据</button>
                <button type="reset" class="btn-secondary">清空重置</button>
            </div>
        </form>

        <div class="example-section">
            <div class="example-title">示例数据格式:</div>
            <div class="example-code">
                rO0ABXNyAAlVdGlsLlVzZXIAAAAAAAAAAQIAAkwACG5hbWVMAAhwYXNzd29yZHQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwdAAEam9obnQABjEyMzQ1Ng==
            </div>
        </div>

        <div class="warning">
            <strong>注意:</strong> 请确保输入的是有效的 Base64 编码数据，且数据大小不超过 1MB。
        </div>
    </div>

    <script>
        // 表单验证
        document.getElementById('userForm').addEventListener('submit', function(e) {
            const userInput = document.getElementById('user').value.trim();
            
            if (!userInput) {
                alert('请输入用户数据！');
                e.preventDefault();
                return;
            }
            
            // 简单的 Base64 格式验证
            const base64Regex = /^[A-Za-z0-9+/]*={0,2}$/;
            if (!base64Regex.test(userInput)) {
                if (!confirm('输入的数据可能不是有效的 Base64 格式，是否继续提交？')) {
                    e.preventDefault();
                    return;
                }
            }
            
            // 显示加载状态
            const submitBtn = this.querySelector('.btn-primary');
            submitBtn.textContent = '提交中...';
            submitBtn.disabled = true;
        });
        
        // 重置按钮功能
        document.querySelector('.btn-secondary').addEventListener('click', function() {
            document.getElementById('user').focus();
        });
    </script>
</body>
</html>
