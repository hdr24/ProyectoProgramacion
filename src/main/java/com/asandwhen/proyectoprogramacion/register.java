package com.asandwhen.proyectoprogramacion;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet(name = "register", value = "/register")
public class register extends HttpServlet {

    public register() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Cogemos los datos del login
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean error = false;

        try {
            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();
            ResultSet a = l.executeQuery("SELECT * FROM Usuario WHERE Username = '" + username + "'");

            // Pasamos la contraseña de la base de datos
            // pasamos la contraseña introducida a md5
            password = md5.toMD5(password);

            if (a.getString("Username") != null) {
                error = true;
            } else {
                l.execute("INSERT INTO Usuario(Nombre, Apellidos, Username, Contraseña, Tipo) VALUES (" +
                        "'"+name+"', '"+surname+"', '"+username+"', '"+password+"', 0" +
                        ")");
            }

            a.close();
            l.close();
            conect.close();
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        if (error) {
            response.sendRedirect("register.jsp?error=error");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    public void destroy() {
    }
}