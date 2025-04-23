<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestao de clientes - IP</title>
</head>
<body>
    <h1> Eliminação de clientes</h1>
    <form method="post" action="eliminar2.jsp">
        <label> cliente: <select name="id">
    <% 
    try {
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd01", "root", "");
    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery("SELECT * FROM  t_cliente order by nome");
    while(rs.next()){
        %>
        <option value="<%= rs.getInt("Id")%>"><%= rs.getString("nome")%></option>
        <%
    }
    rs.close();
    stmt.close();
    conn.close();
    } catch (Exception e){
        out.println("ann error occurred: " + e.getMessage());
    }
    %>
    </select><label>
    <input type="submit" value="apagar">
    </form>
    
</body>
</html>