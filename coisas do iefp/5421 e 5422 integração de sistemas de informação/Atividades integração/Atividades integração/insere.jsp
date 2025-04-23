<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3; url=index.html" />
    <title> Inserir Clientes</title>

</head>
<body>

<%
    String nome = request.getParameter("nome");
    String morada = request.getParameter("morada");
    String zona = request.getParameter("zona");
    String nif = request.getParameter("nif");
    Float VolFatur = request.getParameter("volFatur");

    String url ="jdbx:mysql://localhost:3306/bd01";
    String username= "root";
    String password= "";

    try{
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(url, username, password);

        String sql = "INSERT INTO t_cliente (Nome, Morada, Zona, Nif, VolFatur) VALUES ( ?, ?, ?, ?, ?)";
        PreparedStatement statement= conn.PreparedStatement(sql);

        statement.setString(1, nome);
        statement.setString(2, morada);
        statement.setString(3, zona);
        statement.setString(4, nif);
        statement.setFloat(5, VolFatur);

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            out.println("Registro inserido com sucesso.");
        } else {
            out.println("erro na inserção");
        }
        
        statement.close();
        conn.close();               
    } catch (Exception e){
        out.println("ocorreu um erro: " + e.getMessage());
    }
%>
    <a href="index.html" target="_self">Voltar ao menu</a>
</body>
</html>