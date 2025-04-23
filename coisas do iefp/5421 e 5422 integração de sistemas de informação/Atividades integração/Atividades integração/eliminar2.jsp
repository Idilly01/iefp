<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> remocao de clientes</title>

</head>
<body>
        <h1> remoção de clientes<h1>
<%
   String idPar = request.getParameter("id");
   int id = Interger.parseInt(idPar);

    try{
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd01", "root", "");
        Statement stmt = conn.createStatement();

        String sql = "DELETE FROM t_cliente WHERE Id=?";
        PreparedStatement statement= conn.PreparedStatement(sql);

        pstm.setInt(1, id);

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<h2> Registro apagado com sucesso.</h2>");
        } else {
            out.println("<h2> ocorreu um erro ao conectar. </h2>");
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