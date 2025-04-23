<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- serve para incluir as funções de Java que utilizam SQL -->
<%@ page import ="java.sql.*" %>
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
<h1>Gestão de Pessoas</h1>
<h3>Listagem de Pessoas</h3>
<table border="1" class="table table-striped" width="80%">
<thead>
<tr>
                    <th>Número</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Data de Nascimento</th>
                    <th>Morada</th>
                    <th>Genero</th>
                    <th>Categoria</th>
                    <th>Senha</th>
                    
</tr>
</thead>
<tbody>
<%

int num=0;

    try{

        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection(""

            + "jdbc:mysql://localhost:3306/ti_02", "root", "");

        Statement stm = con.createStatement();

        ResultSet rs = stm.executeQuery("Select * from t_pessoa,"

            + " t_genero, t_categoria WHERE idGen=t_genero.idGen AND idCat="

            + " t_categoria.idCat");

        while (rs.next()){

%>
<tr>
<td><%= rs.getInt("numero") %></td>
<td><%= rs.getString("nome") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getDate("Data de Nascimento") %></td>
<td><%= rs.getString("morada") %></td>
<td><%= rs.getString("genero") %></td>
<td><%= rs.getString("categoria") %></td>
<td><%= rs.getString("senha") %></td>
</tr>
<%

        num++;

    }

%>
<tr>
<td colspan="8">Nº de registo na BD</td>
<td style="text-align: right;"><%= num %></td>
</tr>
<%

    rs.close();

    stm.close();

    con.close();

} catch (Exception e) {

    out.println("Ocorreu um erro"+e.getMessage());

}

%>
</tbody>
</table>
 
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"

    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyh0+bYtDcx0eVPeN8Uks5iBoQse8d8g7L0tvv"

    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"

    integrity="sha384-pzjw8+Fhw7KuIlTq0p4RSwl3m0lwZFVbH5z6bM7d4z4h5hXaSbZmrFc7h6ZWSR6iX"

    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"

    integrity="sha384-JjigtYQ5HIyfZJrT0j9HlD1YhTQF4WzMIEFYyKGfTIfsQ0ib7xUJ312eSVO1UZw"

    crossorigin="anonymous"></script>
</body>
</html>
 