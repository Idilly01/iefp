

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- serve para incluir as funções de java que utilizar sql -->
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
        <%
        if (request.getMethod().equals("POST")) {
            String valor = request.getParameter("valor");
            out.println("<h2>Pesquisa de Pessoas - " + valor + "</h2>");
        } else {
            out.println("<h2>Pesquisa de Pessoas </h2>");
        }
        %>
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
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
        <%
            int num = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ti_02", "root", "");
                Statement stm = con.createStatement();
                ResultSet rs;
                if (request.getMethod().equals("POST")) {
                    String valor = request.getParameter("valor");
                    rs = stm.executeQuery(
                        "SELECT * FROM t_Pessoa, t_genero, t_categoria WHERE idGen = t_genero.idGen AND idCat = t_categoria.idCat AND " +
                        "(nome LIKE '%" + valor + "%' OR genero LIKE '%" + valor + "%' OR categoria LIKE '%" + valor + 
                        "%' OR email LIKE '%" + valor + "%')"
                    );
                } else {
                    rs = stm.executeQuery("SELECT * FROM t_pessoa, t_genero, t_categoria WHERE idGen = t_genero.idGen AND idCat = t_categoria.idCat");
                }
                while (rs.next()) {
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

                        <td>
                        <form method="post" action="alterarPessoas.jsp">
                            <input type="hidden" name="id" value="<%= rs.getInt("numero") %>">
                            <input type="submit" value="Alterar" class="btn btn btn-warning">
                        </form>
                        <form method="post" action="apagarPessoas.jsp">
                            <input type="hidden" name="numero" value="<%= rs.getInt("numero") %>">
                            <input type="submit" value="Apagar" class="btn btn btn-danger">
                        </form>
                        </td>
                        </tr>
                        <%
                        num++;
                        }
                        %>
                        <tr><td colspan="9">Nº de registo na BD</td>
                        <td style="text-align: right;"><%= num %></td></tr>
                       
            <%
                rs.close();
                stm.close();
                con.close();
            } catch (Exception e) {
                out.println("Ocorreu um erro" + e.getMessage());
            }
            %>
            </tbody>
            </table>
            <h3>Pesquisar Pessoas</h3>
                    <form method="post" action="pesquisarPessoas.jsp">
                        <!-- para onde vou enviar os dados -->
                           Pesquisa: <input type="text" name="pesquisa" size="20"><br>
                            <input type="submit" value="Pesquisar" class="btn btn-success">
                            <input type="button" value="Voltar" class="btn btn-secondary" onclick="window.location.href='index.jsp'">
                        </form>
                        <!-- Bootstrap JS and dependencies -->
                        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq6FNfHIKf5K5G1h7rN2MTGA6p9Y9B2l+7/ANd/tlmK6i6K9xg" crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgSNjD6qy4p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5Q5p6b5">
                        </script>
    </body>
</html>

