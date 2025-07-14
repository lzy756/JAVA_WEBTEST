package com.example.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import Util.User;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(UserServlet.class.getName());
    private static final int MAX_DATA_SIZE = 1024 * 1024; // 1MB 限制
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 重定向到用户输入页面
        response.sendRedirect(request.getContextPath() + "/user.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
        // 设置响应编码
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String userDataParam = request.getParameter("user");
        String errorMessage = null;
        User user = null;
        
        try {
            // 输入验证
            if (userDataParam == null || userDataParam.trim().isEmpty()) {
                errorMessage = "用户数据不能为空";
                logger.warning("收到空的用户数据参数");
            } else {
                logger.info("收到用户数据请求，数据长度: " + userDataParam.length());
                
                // 验证 Base64 格式和大小
                if (userDataParam.length() > MAX_DATA_SIZE) {
                    errorMessage = "数据大小超出限制";
                    logger.warning("数据大小超出限制: " + userDataParam.length());
                } else {
                    user = deserializeUser(userDataParam);
                    if (user != null) {
                        // 验证用户数据
                        if (!isValidUser(user)) {
                            errorMessage = "用户数据格式无效";
                            user = null;
                        } else {
                            logger.info("成功反序列化用户: " + user.getName());
                        }
                    } else {
                        errorMessage = "无法解析用户数据";
                    }
                }
            }
        } catch (Exception e) {
            errorMessage = "处理用户数据时发生错误: " + e.getMessage();
            logger.log(Level.SEVERE, "处理用户数据时发生异常", e);
        }
        
        // 设置请求属性
        request.setAttribute("user", user);
        request.setAttribute("errorMessage", errorMessage);
        
        // 转发到 JSP 页面
        request.getRequestDispatcher("/WEB-INF/user.jsp").forward(request, response);
    }
    
    /**
     * 反序列化用户数据
     */
    private User deserializeUser(String base64Data) {
        ByteArrayInputStream bais = null;
        ObjectInputStream ois = null;
        
        try {
            // 解码 Base64
            byte[] decodedData = Base64.getDecoder().decode(base64Data);
            
            // 检查解码后的数据大小
            if (decodedData.length > MAX_DATA_SIZE) {
                logger.warning("解码后数据大小超出限制: " + decodedData.length);
                return null;
            }
            
            bais = new ByteArrayInputStream(decodedData);
            ois = new ObjectInputStream(bais);
            
            Object obj = ois.readObject();
            if (obj instanceof User) {
                return (User) obj;
            } else {
                logger.warning("反序列化的对象不是 User 类型: " + obj.getClass().getName());
                return null;
            }
            
        } catch (IllegalArgumentException e) {
            logger.warning("Base64 解码失败: " + e.getMessage());
            return null;
        } catch (ClassNotFoundException e) {
            logger.warning("找不到 User 类: " + e.getMessage());
            return null;
        } catch (IOException e) {
            logger.warning("反序列化失败: " + e.getMessage());
            return null;
        } catch (Exception e) {
            logger.log(Level.SEVERE, "反序列化过程中发生未知错误", e);
            return null;
        } finally {
            // 确保资源被正确关闭
            try {
                if (ois != null) {
                    ois.close();
                }
                if (bais != null) {
                    bais.close();
                }
            } catch (IOException e) {
                logger.warning("关闭流时发生错误: " + e.getMessage());
            }
        }
    }
    
    /**
     * 验证用户数据的有效性
     */
    private boolean isValidUser(User user) {
        if (user == null) {
            return false;
        }
        
        String name = user.getName();
        String password = user.getPassword();
        
        // 基本验证
        if (name == null || name.trim().isEmpty()) {
            logger.warning("用户名为空或无效");
            return false;
        }
        
        if (password == null || password.trim().isEmpty()) {
            logger.warning("密码为空或无效");
            return false;
        }
        
        // 长度验证
        if (name.length() > 50) {
            logger.warning("用户名长度超出限制: " + name.length());
            return false;
        }
        
        if (password.length() > 100) {
            logger.warning("密码长度超出限制: " + password.length());
            return false;
        }
        
        // 字符验证 - 防止恶意字符
        if (containsMaliciousCharacters(name) || containsMaliciousCharacters(password)) {
            logger.warning("用户数据包含恶意字符");
            return false;
        }
        
        return true;
    }
    
    /**
     * 检查是否包含恶意字符
     */
    private boolean containsMaliciousCharacters(String input) {
        if (input == null) {
            return false;
        }
        
        // 检查常见的恶意字符和模式
        String[] maliciousPatterns = {
            "<script", "</script>", "javascript:", "vbscript:",
            "onload=", "onerror=", "onclick=", "onmouseover=",
            "eval(", "exec(", "system(", "cmd.exe",
            "../", "..\\", "/etc/", "c:\\windows"
        };
        
        String lowerInput = input.toLowerCase();
        for (String pattern : maliciousPatterns) {
            if (lowerInput.contains(pattern)) {
                return true;
            }
        }
        
        return false;
    }
}
