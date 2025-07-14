package com.example.util;

import Util.User;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.util.Base64;

/**
 * 用户数据生成器 - 用于生成测试用的 Base64 编码用户数据
 */
public class UserDataGenerator {
    
    public static void main(String[] args) {
        try {
            // 创建测试用户
            User testUser1 = new User("john", "123456");
            User testUser2 = new User("alice", "password123");
            User testUser3 = new User("张三", "中文密码123");
            
            System.out.println("=== 用户数据生成器 ===");
            System.out.println();
            
            // 生成并输出 Base64 编码数据
            generateAndPrint("测试用户1", testUser1);
            generateAndPrint("测试用户2", testUser2);
            generateAndPrint("测试用户3", testUser3);
            
            System.out.println("=== 使用说明 ===");
            System.out.println("1. 复制上面任意一个 Base64 字符串");
            System.out.println("2. 在浏览器中访问 http://localhost:8080/Web_Test/user.jsp");
            System.out.println("3. 将 Base64 字符串粘贴到输入框中");
            System.out.println("4. 点击提交按钮查看结果");
            
        } catch (Exception e) {
            System.err.println("生成用户数据时发生错误: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * 生成用户的 Base64 编码数据并打印
     */
    private static void generateAndPrint(String description, User user) {
        try {
            String base64Data = serializeToBase64(user);
            
            System.out.println(description + ":");
            System.out.println("  用户名: " + user.getName());
            System.out.println("  密码: " + user.getPassword());
            System.out.println("  Base64: " + base64Data);
            System.out.println("  长度: " + base64Data.length() + " 字符");
            System.out.println();
            
        } catch (Exception e) {
            System.err.println("生成 " + description + " 数据时发生错误: " + e.getMessage());
        }
    }
    
    /**
     * 将用户对象序列化为 Base64 字符串
     */
    public static String serializeToBase64(User user) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        
        try {
            oos.writeObject(user);
            oos.flush();
            
            byte[] serializedData = baos.toByteArray();
            return Base64.getEncoder().encodeToString(serializedData);
            
        } finally {
            oos.close();
            baos.close();
        }
    }
    
    /**
     * 验证 Base64 数据是否可以正确反序列化
     */
    public static boolean validateBase64Data(String base64Data) {
        try {
            byte[] decodedData = Base64.getDecoder().decode(base64Data);
            java.io.ByteArrayInputStream bais = new java.io.ByteArrayInputStream(decodedData);
            java.io.ObjectInputStream ois = new java.io.ObjectInputStream(bais);
            
            Object obj = ois.readObject();
            ois.close();
            bais.close();
            
            return obj instanceof User;
            
        } catch (Exception e) {
            return false;
        }
    }
}