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

@WebServlet( name = "creaevento", value = "/creaevento")
public class creaevento extends HttpServlet {

    public creaevento() {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();
            HttpSession session = request.getSession();

            String nombre = request.getParameter("nombre");
            String desc = request.getParameter("desc");
            String fecha = request.getParameter("fecha");
            String lugar = request.getParameter("lugar");
            int id = (int) session.getAttribute("id");

            l.execute("INSERT INTO Evento(Nombre, Descripcion, Fecha, Lugar, Mapa, Organizador) VALUES('"+nombre+"', '"+desc+"', '"+fecha+"', '"+lugar+"', '"+request.getParameter("mapa")+"', "+id+")");
            l.close();
            conect.close();
            response.sendRedirect("evento.jsp");
        } catch (SQLException | ClassNotFoundException | IOException e) {
            throw new RuntimeException(e);
        }
    }


}
