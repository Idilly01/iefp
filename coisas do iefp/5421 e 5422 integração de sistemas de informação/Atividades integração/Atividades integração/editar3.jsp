<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    String idParam = request.getParameter("id");
    int id = Interger.parseInt(idParam);
    String nome = request.getParameter("nome");
    String morada = request.getParameter("morada");
    String zona = request.getParameter("zona");
    String nif = request.getParameter("nif");
    Float volFatur = request.getParameter("volFatur");

    String url ="jdbx:mysql://localhost:3306/bd01";
    String username= "root";
    String password= "";

    try{
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection(url, username, password);

        String sql = "UPDATE t_cliente SET Nome=?, Morada=?, Zona=?, Nif=?, VolFatur=? WHERE id=?";
        PreparedStatement statement= conn.PreparedStatement(sql);

        statement.setString(1, nome);
        statement.setString(2, morada);
        statement.setString(3, zona);
        statement.setString(4, nif);
        statement.setFloat(5, VolFatur);
        statement.setInt(6, id);

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            out.println("Registro alterado com sucesso com sucesso.");
        } else {
            out.println("erro na atualização");
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