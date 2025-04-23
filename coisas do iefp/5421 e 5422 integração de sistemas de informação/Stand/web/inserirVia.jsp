

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <h3>Inserção de Viaturas</h3>

    
    <form method="post" action="inserirVia2.jsp">
        Matricula: <input type="text" name="matricula" size="8"><br>
        Ano: <input type="text" name="ano" size="4"><br>
        Cilindrada: <input type="text" name="cilindrada" size="4"><br>
        Kms: <input type="text" name="kms" size="6"><br>
        Tipo: <select name="tipo">
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_stand", "root", "");
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("Select * from tTipo");
            while (rs.next()) {
            %>
                <option value="<%= rs.getInt("idT") %>">
                <%= rs.getString("tipo") %></option>
                <%
            }
            rs.close();
            stm.close();
            con.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro" + e.getMessage());
        }
        %>
    </select><br>
    Marca: <select name="marca">
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bd_stand", "root", ""
        );
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery("Select * from tMarca");
        while (rs.next()) {
    %>
        <option value="<%= rs.getInt("idM") %>">
            <%= rs.getString("marca") %>
        </option>
    <%
        }
        rs.close();
        stm.close();
        con.close();
    } catch (Exception e) {
        out.println("Ocorreu um erro" + e.getMessage());
    }
    %>
    </select><br>
    Modelo: <input type="text" name="modelo" size="40"><br>
    Preço: <input type="text" name="preco" size="15"><br>
    <input type="submit" value="Inserir">
    </form>
    <input type="button" value="Voltar" class="btn btn-secondary" onclick="window.location.href='index.jsp'">
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
        integrity="sha384-DFXa2r2bPHOl3S85snCTpuJ/zyh0j6b4y0cDxeQPeVn8UksiBa0Qse8d8g7otwv" 
        crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" 
        integrity="sha384-LPL6Sm0jVZFi5c2bM7oZfHh3k5xbZmE7c7h6V3R6SKIV" 
        crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
        integrity="sha384-JjSmVgyd0SHy1Jgt7O9jDHIbTTqf4wMFFfFYqRfR5q01b7xU312j5cVL0Jwz" 
        crossorigin="anonymous">
    </script>
    </body>
</html>

            