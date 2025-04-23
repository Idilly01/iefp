

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Serve para incluir as funções de Java que utilizam SQL -->
<%@ page import="java.sql.*" %>
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
                    <a href="gerirTipo.jsp" class="btn btn-outline-light btn-lg m-2">Gerir Tipos</a>
                </li>
                <li class="nav-item">
                    <a href="gerirMarca.jsp" class="btn btn-outline-light btn-lg m-2">Gerir Marcas</a>
                </li>
                <li class="nav-item">
                    <a href="listarVia.jsp" class="btn btn-outline-light btn-lg m-2">Listar Viaturas</a>
                </li>
                <li class="nav-item">
                    <a href="inserirVia.jsp" class="btn btn-outline-light btn-lg m-2">Inserir Viaturas</a>
                </li>
                <li class="nav-item">
                    <a href="pesquisarVia.jsp" class="btn btn-outline-light btn-lg m-2">Pesquisar Viaturas</a>
                </li>
            </ul>
        </div>
    </nav>
    <h3>Alteração de Viaturas</h3>
    <%
    String url = "jdbc:mysql://localhost:3306/bd_stand";
    String username = "root";
    String senha = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, senha);
        String numeroPar = request.getParameter("numero");
        int numero = Integer.parseInt(numeroPar);
        String matricula = request.getParameter("matricula");
        String anoPar = request.getParameter("ano");
        int ano = Integer.parseInt(anoPar);
        String cilindradaPar = request.getParameter("cilindrada");
        int cilindrada = Integer.parseInt(cilindradaPar);
        String kmsPar = request.getParameter("kms");
        int kms = Integer.parseInt(kmsPar);
        String tipoPar = request.getParameter("tipo");
        int tipo = Integer.parseInt(tipoPar);
        String marcaPar = request.getParameter("marca");
        int marca = Integer.parseInt(marcaPar);
        String modelo = request.getParameter("modelo");
        String precoPar = request.getParameter("preco");
        float preco = Float.parseFloat(precoPar);
        
        String sql = "UPDATE tViatura set matricula=?, ano=?, " +
             "cilindrada=?, kms=?, idTipo=?, idMarca=?, modelo=?, preco=? " +
             "WHERE numero=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, matricula);
        pstm.setInt(2, ano);
        pstm.setInt(3, cilindrada);
        pstm.setInt(4, kms);
        pstm.setInt(5, tipo);
        pstm.setInt(6, marca);
        pstm.setString(7, modelo);
        pstm.setFloat(8, preco);
        pstm.setInt(9, numero);
        int rowupdate = pstm.executeUpdate();
        if (rowupdate > 0) {
            out.println("<h2>Registo alterado com sucesso!</h2>");
        } else {
            out.println("<h2>Ocorreu um erro na alteração!</h2>");
        }
        pstm.close();
        con.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro:" + e.getMessage());
        }
        %>
        <!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuJ/zyh0/g6by+otDcxxPeVn8Uks1jBoQSe8dBq7L0vTw" 
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" 
    integrity="sha384-pzjw8f+ua7Kw1ITq0pR9W1smol1WzFh5b6MTp24sh5hXab5mZFc7hZ5WR6Jik" 
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
    integrity="sha384-JJifytQSHIjFyJtQr7OJ9H1DHyTqF4W+MFfEYqRF6fsQib7xU31zc5VGLw2r" 
    crossorigin="anonymous"></script>
    </body>
</html>

