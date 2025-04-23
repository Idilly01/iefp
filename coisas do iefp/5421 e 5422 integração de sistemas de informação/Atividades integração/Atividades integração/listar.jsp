<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">   
    <title>Listagem - IP</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="1">
    <h1> Gestão de clientes</h1>
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Morada</th>
        <th>Zona</th>
        <th>NIF</th>
        <th>Volume de Faturação</th>

    </tr>
<%
    int num=0;
    float media=0;
try {
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd01", "root", "");
    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery("SELECT * FROM  t_cliente");
        while (rs.next()){
        %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("Nome") %></td>
                <td><%= rs.getString("Morada") %></td>
                <td><%= rs.getString("Zona") %></td>
                <td><%= rs.getString("NIF") %></td>
                <td><%= rs.getFloat("VolFatur") %></td>
                <% num ++;
                media = media + rs.getFloat("VolFatur");%>
            </tr>

            <%
                
            
        }

            %>
            <th><th colspan="5"> Número de registro na BD</th>
            <th><% = num %></th></th>
            <th><th colspan="5"> Media das faturações</th>
            <th><% = media/num%>
<% 
        rs.close();
        stmt.close();
        conn.close();
} catch (Exception e){
    out.println("an error occurred: " + e.getMessage());
}
%>

</table>
</body>
</html>

