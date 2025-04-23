

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
        <h3>Eliminação de dados Pessoais</h3>
        <%
        String url = "jdbc:mysql://localhost:3306/ti_02";
        String username = "root";
        String senha = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, senha);
            String numeroPar = request.getParameter("numero");
            int numero = Integer.parseInt(numeroPar);
            String sql = "DELETE FROM t_pessoa WHERE numero=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, numero);
            int rowdelete = pstm.executeUpdate();
            if (rowdelete > 0)
                out.println("<h2>Registo apagado com sucesso!</h2>");
            else
                out.println("<h2>Ocorreu um erro na remoção!</h2>");
            pstm.close();
            con.close();
            } catch (Exception e) {
                out.println("Ocorreu um erro: " + e.getMessage());
            }
        %>
        <!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyh0j6b+y0tDcxQeVn8U5siBoq5e8d0g7L0tw" 
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" 
    integrity="sha384-pzjw8f+ua7Kw1TigQ0r4wsml0lw2rfsE6bM7424h5hXa5bZmzFc7h6w5r6i" 
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyjt2g7J9DhHTqf4wMEEYTfQqIbYxU3l26SVwlgw2" 
    crossorigin="anonymous"></script>

    </body>
</html>
