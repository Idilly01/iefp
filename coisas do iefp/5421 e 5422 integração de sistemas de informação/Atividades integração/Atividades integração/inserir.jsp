<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="ContentType" content="text/html; charset=UTF-8">
    <title> inserção de utilizadores</title>

</head>
<body>
        <h1> inserir registros</h1>
<%
        if(request.getMethod().equals("POST")){
        String nome = request.getParameter("nome");
        String morada = request.getParameter("morada");
        String zona = request.getParameter("zona");
        String nif = request.getParameter("nif");
        Float VolFatur = request.getParameter("VolFatur");

        String url ="jdbc:mysql://localhost:3306/bd01";
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
        if  (rowsInserted > 0) {
            out.println("Registro inserido com sucesso.");
        } else {
            out.println("erro na inserção");
        }
        
        statement.close();
        conn.close();               
    } catch (Exception e){
        out.println("ocorreu um erro: " + e.getMessage());
    }
}
   
    %>
    <form method="post" action="inserir.jsp">
            <label> Nome:<input type="text" name="nome" size="60"
                placeholder="coloque o seu nome"></label><br/><br/>
            <label> Morada:<input type="text" name="morada" size="60"
                placeholder="coloque sua morada"></label><br/><br/>
            <label> Zona:<input type="text" name="zona" size="50"
                placeholder="coloque a sua zona"></label><br/><br/>
            <label> NIF:<input type="text" name="nif" size="9"
                placeholder="NIF"></label><br/><br/>
            <label> Volume de faturação:<input type="text" name="volFatur" size="9"
                placeholder="Volume"></label><br/><br/>
            <input type="submit" value="Inserir">
        </form>
    
    <a href="index.html" target="_self">Voltar ao menu</a>
</body>
</html>
         