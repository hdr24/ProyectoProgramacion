package com.asandwhen.proyectoprogramacion;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
@WebServlet(name = "formRespuestas", value = "/formRespuestas")
public class formRespuestas extends HttpServlet {

    public formRespuestas() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) {

        try {
            String desarrollo = request.getParameter("respuesta");
            String fuentes = request.getParameter("fuente");
            String id = request.getParameter("id");
            HttpSession session = request.getSession();
            int user = (int) session.getAttribute("id");

            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();
            l.execute("INSERT INTO respuesta(Desarrollo, Fuente, ID_Pregunta, ID_Usuario) VALUES('"+desarrollo+"', '"+fuentes+"', '"+id+"', '"+user+"')");
            l.execute("UPDATE Pregunta set Respondida = 1 WHERE ID = "+id);
            l.close();
            conect.close();

            response.sendRedirect("pregunta.jsp?id="+id);
        } catch (ClassNotFoundException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }

    }
}
