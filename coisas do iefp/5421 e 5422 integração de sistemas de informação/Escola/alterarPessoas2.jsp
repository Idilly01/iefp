

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Serve para incluir as funções de Java que utilizam SQL -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Escola</title>
 
    <!-- Bootstrap CSS -->
<link rel="stylesheet"

        href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"

        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IHVwTNhO263XmFcJLSAwiGgFAW/dAiS6JXm"

        crossorigin="nymous">
 
    <!-- Optional Bootstrap JS for components like modals, dropdowns, etc. -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"

        integrity="sha384-KJ3o2DKtI3UENzmM7KCKRr/eS/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"

        crossorigin="nymous"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"

        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9F/SCQsA7PHUibX39j7fakFPskvXusfva0b4Q"

        crossorigin="nymous"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"

        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRSQ2SFfwPlMquVdAyjUar5+76PVCmY1"

        crossorigin="nymous"></script>
 
    <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"

        rel="stylesheet" crossorigin="nymous">
</head>


 
    <body>
        <!-- Navbar with buttons -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="">Gestão Escolar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="listarPessoas.jsp" class="nav-link botao">Listar Pessoas</a>
                </li>
                <li class="nav-item">
                    <a href="gerirCat.jsp" class="nav-link botao">Gerir Categorias</a>
                </li>
                <li class="nav-item">
                    <a href="gerirGen.jsp" class="nav-link botao">Gerir Generos</a>
                </li>
                <li class="nav-item">
                    <a href="InserirPessoas.jsp" class="nav-link botao">Inserir Pessoas</a>
                </li>
                <li class="nav-item">
                    <a href="pesquisarPessoas.jsp" class="nav-link active">Pesquisar Pessoas</a>
                </li>
            </ul>

        </div>
    </nav>

    <h3>Alteração de Pessoas</h3>
    <%
    String url = "jdbc:mysql://localhost:3306/ti_02";
    String username = "root";
    String senha = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, senha);
        String numeroPar = request.getParameter("numero");
        int numero = Integer.parseInt(numeroPar);
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String dataNascimentoPar = request.getParameter("dataNascimento");
        Date dataNascimento = Date.valueOf(dataNascimentoPar);
        String morada = request.getParameter("morada"); 
        String senha = request.getParameter("senha");
 
        String sql = "UPDATE t_pessoa set nome=?, =?, " +
             "dataNascimento=?, morada=?, GeneroId=?, CategoriaId=?, senha=?,  " +
             "WHERE numero=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, nome);
        pstm.setInt(2, email);
        pstm.setInt(3, dataNascimento);
        pstm.setInt(4, morada);
        pstm.setInt(5, genero);
        pstm.setInt(6, categoria);
        pstm.setString(7, senha);       
        pstm.setInt(8, numero);
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
    crossorigin="nymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" 
    integrity="sha384-pzjw8f+ua7Kw1ITq0pR9W1smol1WzFh5b6MTp24sh5hXab5mZFc7hZ5WR6Jik" 
    crossorigin="nymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
    integrity="sha384-JJifytQSHIjFyJtQr7OJ9H1DHyTqF4W+MFfEYqRF6fsQib7xU31zc5VGLw2r" 
    crossorigin="nymous"></script>
    </body>
</html>

