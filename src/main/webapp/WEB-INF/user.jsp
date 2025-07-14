<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户信息显示 - User Information Display</title>
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
            max-width: 600px;
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

        .header {
            margin-bottom: 30px;
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
            font-weight: 600;
        }

        .subtitle {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .status-indicator {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 20px;
        }

        .status-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .status-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .error-message {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            color: #721c24;
            text-align: left;
        }

        .error-title {
            font-weight: 600;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .error-icon {
            margin-right: 8px;
            font-size: 18px;
        }

        .user-info {
            background-color: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            margin: 20px 0;
            text-align: left;
        }

        .info-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e9ecef;
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #4CAF50, #45a049);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
            margin-right: 15px;
        }

        .info-title {
            color: #333;
            font-size: 18px;
            font-weight: 600;
        }

        .info-item {
            background-color: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
            transition: all 0.3s ease;
        }

        .info-item:hover {
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transform: translateY(-1px);
        }

        .info-label {
            font-weight: 600;
            color: #495057;
            font-size: 14px;
            margin-bottom: 5px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            color: #333;
            font-size: 16px;
            word-break: break-word;
            padding: 8px 12px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border-left: 4px solid #4CAF50;
        }

        .password-value {
            font-family: 'Courier New', monospace;
            background-color: #fff3cd;
            border-left-color: #ffc107;
        }

        .no-info {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 8px;
            padding: 30px;
            color: #721c24;
            text-align: center;
        }

        .no-info-icon {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.7;
        }

        .action-buttons {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
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

        .timestamp {
            font-size: 12px;
            color: #6c757d;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #e9ecef;
        }

        @media (max-width: 600px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }
            
            h1 {
                font-size: 24px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
            
            .info-header {
                flex-direction: column;
                text-align: center;
            }
            
            .user-avatar {
                margin-right: 0;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>用户信息显示</h1>
            <p class="subtitle">User Information Display Result</p>
        </div>

        <c:choose>
            <c:when test="${not empty errorMessage}">
                <!-- 错误状态 -->
                <div class="status-indicator status-error">
                    处理失败
                </div>
                
                <div class="error-message">
                    <div class="error-title">
                        <span class="error-icon">⚠️</span>
                        处理用户数据时发生错误
                    </div>
                    <p><strong>错误信息:</strong> ${fn:escapeXml(errorMessage)}</p>
                    <p><strong>可能原因:</strong></p>
                    <ul>
                        <li>输入的数据不是有效的 Base64 格式</li>
                        <li>反序列化的对象不是 User 类型</li>
                        <li>用户数据包含无效字符或格式错误</li>
                        <li>数据大小超出限制 (1MB)</li>
                    </ul>
                </div>
            </c:when>
            
            <c:when test="${empty user}">
                <!-- 无用户信息 -->
                <div class="status-indicator status-error">
                    无数据
                </div>
                
                <div class="no-info">
                    <div class="no-info-icon">👤</div>
                    <h3>暂无用户信息</h3>
                    <p>未能获取到有效的用户数据，请检查输入格式并重试。</p>
                </div>
            </c:when>
            
            <c:otherwise>
                <!-- 成功状态 -->
                <div class="status-indicator status-success">
                    解析成功
                </div>
                
                <div class="user-info">
                    <div class="info-header">
                        <div class="user-avatar">
                            ${fn:substring(user.name, 0, 1)}
                        </div>
                        <div class="info-title">用户详细信息</div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">用户名 (Username)</div>
                        <div class="info-value">
                            <c:out value="${user.name}" />
                        </div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">密码 (Password)</div>
                        <div class="info-value password-value">
                            <c:out value="${user.password}" />
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/user.jsp" class="btn btn-primary">
                重新提交
            </a>
            <button onclick="window.history.back()" class="btn btn-secondary">
                返回上页
            </button>
        </div>

        <div class="timestamp">
            处理时间: <%= new java.util.Date() %>
        </div>
    </div>

    <script>
        // 页面加载完成后的处理
        document.addEventListener('DOMContentLoaded', function() {
            // 如果有错误信息，3秒后自动滚动到错误区域
            const errorMessage = document.querySelector('.error-message');
            if (errorMessage) {
                setTimeout(() => {
                    errorMessage.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }, 1000);
            }
            
            // 为用户信息项添加复制功能
            const infoValues = document.querySelectorAll('.info-value');
            infoValues.forEach(item => {
                item.style.cursor = 'pointer';
                item.title = '点击复制';
                item.addEventListener('click', function() {
                    const text = this.textContent.trim();
                    if (navigator.clipboard) {
                        navigator.clipboard.writeText(text).then(() => {
                            showToast('已复制到剪贴板');
                        });
                    }
                });
            });
        });
        
        // 简单的提示功能
        function showToast(message) {
            const toast = document.createElement('div');
            toast.textContent = message;
            toast.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border-radius: 6px;
                z-index: 1000;
                font-size: 14px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            `;
            document.body.appendChild(toast);
            
            setTimeout(() => {
                toast.remove();
            }, 2000);
        }
    </script>
</body>
</html>
