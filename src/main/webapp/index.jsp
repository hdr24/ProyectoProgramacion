<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%
  Class.forName("org.sqlite.JDBC");
  Connection connection = DriverManager.getConnection("jdbc:sqlite:");
%></h1>
<br/>
<a href="login.jsp">Hello Servlet</a>
</body>
</html>