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

@WebServlet(name = "formPreguntas", value = "/formPreguntas")
public class formPreguntas extends HttpServlet {

    public formPreguntas() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conect = DriverManager.getConnection("jdbc:sqlite:/home/hector/Documents/Projects/ProyectoProgramacion/ProyectoProgramacion.db");
            Statement l = conect.createStatement();

            HttpSession session = request.getSession();
            String pregunta = request.getParameter("pregunta");
            String desc = request.getParameter("descripcion");
            String tema = request.getParameter("tema");
            int id = (int) session.getAttribute("id");

            l.execute("insert into Pregunta(Pregunta, Descripcion, Tema, Respondida, ID_Usuario) VALUES ('"+pregunta+"', '"+desc+"', '"+tema+"', 0, "+id+")");
            conect.close();
            l.close();

            response.sendRedirect("pregunta.jsp");
        } catch (SQLException | ClassNotFoundException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
