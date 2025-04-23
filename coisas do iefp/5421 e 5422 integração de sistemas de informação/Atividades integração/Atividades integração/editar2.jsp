<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>alteração</title>
</head>
<body>
<%
    String idParam = request.getParameter("id");
    int id= Interger.parseInt(idParam);
try {
        Class.forName("com.mysql.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd01", "root", "");
    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery("SELECT * FROM  t_cliente WHERE id=?");
   pstmt.setInt(1, id);
   ResultSet rs = pstmt.executeQuery();
   if (rs.next()){
    %>
    <h1> Alteração de utilizadores</h1>
        <form method="post" action="editar3.jsp">
            <label> Id:<input type="text" name="id" size="10"
                value="<%= rs.getInt("Id") %>"readonly="true"></label><br/><br/>
            <label> Nome:<input type="text" name="nome" size="60"
                value="<%= rs.getString("Nome") %>"></label><br/><br/>
            <label> Morada:<input type="text" name="morada" size="60"
               value="<%= rs.getString("Morada") %>"></label><br/><br/>
            <label> Zona:<input type="text" name="zona" size="50"
                value="<%= rs.getString("Zona") %>"></label><br/><br/>
            <label> NIF:<input type="text" name="nif" size="9"
               value="<%= rs.getString("Nif") %>"></label><br/><br/>
            <label> Volume de faturação:<input type="text" name="volFatur" size="9"
                value="<%= rs.getFloat("VolFatur") %>"></label><br/><br/>
            <input type="submit" value="Inserir">
        </form>
   

   <%
   }   
    rs.close();
    stmt.close();
    conn.close();
    } catch (Exception e){
        out.println("ann error occurred: " + e.getMessage());
    }
    %>
    <a href="index.html" target="_self"> Voltar ao menu</a>    
</body>
</html>