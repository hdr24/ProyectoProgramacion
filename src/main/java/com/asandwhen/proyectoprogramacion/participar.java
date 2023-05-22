package com.asandwhen.proyectoprogramacion;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet( name = "participar", value = "/participar")
public class participar extends HttpServlet {

    public participar() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();
            HttpSession session = request.getSession();

            int user = (int) session.getAttribute("id");
            int id = Integer.parseInt(request.getParameter("id"));
            l.execute("INSERT INTO Participa VALUES ("+id+", "+user+")");

            conect.close();
            l.close();

            response.sendRedirect("evento.jsp?id="+id);
        } catch (SQLException | ClassNotFoundException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {}
}
