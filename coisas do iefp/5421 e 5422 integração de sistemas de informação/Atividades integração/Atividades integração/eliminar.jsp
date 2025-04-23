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
    <h1> remocao de clientes</h1>
    <% if(request.getMethod().equals("POST")){
        String idPar = request.getParameter("id");
   int id = Interger.parseInt(idPar);

    String url ="jdbx:mysql://localhost:3306/bd01";
    String username= "root";
    String password= "";

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


    }else{
    %>
    <form method="post" action="eliminar.jsp">
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
    }
    %>
    </select></label>
    <input type="submit" value="apagar">
    </form>

    <% 
    }
    %>
    <a href="index.html" target="_self"> voltar ao menu </a>
</body>
</html>