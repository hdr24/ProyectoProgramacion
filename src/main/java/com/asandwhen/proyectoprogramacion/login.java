package com.asandwhen.proyectoprogramacion;

import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {

    public login() {}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Cogemos los datos del login
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        try {
            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();
            ResultSet a = l.executeQuery("select * from Usuario where Username = '" + username + "'");

            // Pasamos la contraseña de la base de datos
            // pasamos la contraseña introducida a md5
            String expectedPassword = a.getString(5);
            password = md5.toMD5(password);
            int id = a.getInt("ID");

            if (password.equals(expectedPassword)) {
                a.close();
                l.close();
                conect.close();
                session.setAttribute("user", username);
                session.setAttribute("id", id);
                response.sendRedirect("index.jsp");
                return;
            }
            a.close();
            l.close();
            conect.close();
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("login.jsp?error=error");

    }

    public void destroy() {}
}