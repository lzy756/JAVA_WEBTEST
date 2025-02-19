package com.example.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import Util.User;
import java.util.*;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String User = request.getParameter("user");
//        日志输出收到的User
//        System.out.println(User);
        ByteArrayInputStream bais = new ByteArrayInputStream(Base64.getDecoder().decode(User));
        ObjectInputStream in = new ObjectInputStream(bais);
        try {
            User user = (User) in.readObject();
            in.close();
            request.setAttribute("user", user);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/user.jsp").forward(request, response);
    }
}
