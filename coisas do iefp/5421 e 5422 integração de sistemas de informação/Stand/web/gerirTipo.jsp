

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- serve para incluir as funções de java que utilizar sql -->
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stand Tudo Barato</title>
 
    <!-- Bootstrap CSS -->
<link rel="stylesheet"

        href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"

        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IHVwTNhO263XmFcJLSAwiGgFAW/dAiS6JXm"

        crossorigin="anonymous">
 
    <!-- Optional Bootstrap JS for components like modals, dropdowns, etc. -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"

        integrity="sha384-KJ3o2DKtI3UENzmM7KCKRr/eS/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"

        crossorigin="anonymous"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"

        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9F/SCQsA7PHUibX39j7fakFPskvXusfva0b4Q"

        crossorigin="anonymous"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"

        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRSQ2SFfwPlMquVdAyjUar5+76PVCmY1"

        crossorigin="anonymous"></script>
 
    <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"

        rel="stylesheet" crossorigin="anonymous">
</head>
    <body>
       <!-- Navbar with buttons -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="http://expomat.pt">Gestão de Automóveis</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="gerirTipo.jsp" class="nav-link botao">Gerir Tipos</a>
                </li>
                <li class="nav-item">
                    <a href="gerirMarca.jsp" class="nav-link botao">Gerir Marcas</a>
                </li>
                <li class="nav-item">
                    <a href="listarVia.jsp" class="nav-link botao">Listar Viaturas</a>
                </li>
                <li class="nav-item">
                    <a href="inserirVia.jsp" class="nav-link botao">Inserir Viaturas</a>
                </li>
                <li class="nav-item">
                    <a href="pesquisarVia.jsp" class="nav-link active">Pesquisar Viaturas</a>
                </li>
            </ul>

        </div>
    </nav>
        <h1>Gestão de Tipos</h1>
        <%
            if (request.getMethod().equals("POST")){
                String acao = request.getParameter("acao");
                String url="jdbc:mysql://localhost:3306/bd_stand";
                String username="root";
                String senha="";
            
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, username, senha);
                    if (acao.equals("inserir")) {
                    String tipo = request.getParameter("tipo");
                    String sql = "INSERT INTO tTipo (tipo) VALUES (?)";
                    PreparedStatement pstm = con.prepareStatement(sql);
                    pstm.setString(1, tipo);
                    int rowinsert = pstm.executeUpdate();
                    if (rowinsert > 0)
                        out.println("<h2>Registo inserido com sucesso!</h2>");
                    else
                        out.println("<h2>Ocorreu um erro na inserção!</h2>");
                    pstm.close();
                } else {
                    String idPar = request.getParameter("id");
                    int id = Integer.parseInt(idPar);
                    String sql = "DELETE FROM tTipo WHERE idT=?";
                    PreparedStatement pstm = con.prepareStatement(sql);
                    pstm.setInt(1, id);
                    int rowdelete = pstm.executeUpdate();
                    if (rowdelete > 0)
                        out.println("<h2>Registo apagado com sucesso!</h2>");
                    else
                        out.println("<h2>Ocorreu um erro ao eliminar!</h2>");
                    pstm.close();
                }
                con.close();
            } catch(Exception e) {
                out.println("Ocorreu um erro: " + e.getMessage());
            }
            }
        %>
        <h3>Listagem de Tipos</h3>
        <table border="1" class="table table-striped" width="80%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Tipo</th>
                <th>Ação</th>
            </tr>
            </thead>
            <tbody>
            <%
            int num=0;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bd_stand", "root", "");
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("Select * from tTipo");
        while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("idT") %></td>
            <td><%= rs.getString("tipo") %></td>
            <td>
                <form action="gerirTipo.jsp" method="post">
                    <input type="hidden" name="acao" value="apagar">
                    <input type="hidden" name="id" value="<%= rs.getInt("idT") %>">
                    <input type="submit" value="Apagar">
                </form>
            </td>
        </tr>
        <%
        }
        num++;
        %>
        <tr>
            <td colspan="2">Nº de registo na BD</td>
            <td style="text-align: right;"><%= num %></td>
        </tr>
        <%
        rs.close();
        stm.close();
        con.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro: " + e.getMessage());
        }
        %>
        </table>
        <h3>Inserir Tipos</h3>
        <form method="post" action="gerirTipo.jsp">
            <input type="hidden" value="inserir" name="acao">
            Tipo: <input type="text" name="tipo" size="20"><br>
            <input type="submit" value="Inserir" class="btn btn-success">
            <input type="button" value="Voltar" class="btn btn-secondary"
                onclick="window.open('index.jsp')">
        </form>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyhD+0yQb0C0evP8yU5k5iBoQ5e8d8g7iovtw"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"
            integrity="sha384-pzjw8f+ua7Kw1Tq0p4WR5mI0lvzFv5b6T8mP74e4h5bZmF7c6hz6SW5R6J1"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgEP7vfj0J91DhYtTgf4WzMEFYfRff5qOub7xU3j2e5YvolzW"
            crossorigin="anonymous"></script>


    </body>
</html>
