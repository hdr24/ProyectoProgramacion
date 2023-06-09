package com.asandwhen.proyectoprogramacion;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Objects;

@WebServlet(name = "crud", value = "/crud")
public class crud extends HttpServlet {

    public crud() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Cogemos los datos que ha introducido el admin

        String username = request.getParameter("Usuario");
        String name = request.getParameter("Nombre");
        String surname = request.getParameter("Apellidos");
        String tipo = request.getParameter("Tipo");
        String user = request.getParameter("user");

        try {
            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();


            if (Objects.equals(request.getParameter("eliminar"), "true")) {
                l.execute("DELETE FROM Usuario WHERE Username='"+username+"'");
            } else if (Objects.equals(request.getParameter("password"), null)){
                l.execute("UPDATE Usuario SET Nombre = '"+name+"', Apellidos = '"+surname+"', Username = '"+username+"', Tipo = '"+tipo+"' WHERE username = '"+user+"'");
            } else {
                String password = md5.toMD5(request.getParameter("password"));
                l.execute("UPDATE Usuario SET Nombre = '"+name+"', Apellidos = '"+surname+"', Username = '"+username+"', Contraseña = '"+password+"' WHERE username = '"+user+"'");
            }

            l.close();
            conect.close();
            response.sendRedirect("admin.jsp");
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }

    public void destroy() {
    }
}
