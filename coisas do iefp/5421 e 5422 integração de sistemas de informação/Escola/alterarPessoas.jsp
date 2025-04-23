
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

        crossorigin="emailnymous">
 
    <!-- Optional Bootstrap JS for components like modals, dropdowns, etc. -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"

        integrity="sha384-KJ3o2DKtI3UENzmM7KCKRr/eS/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"

        crossorigin="emailnymous"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"

        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9F/SCQsA7PHUibX39j7fakFPskvXusfva0b4Q"

        crossorigin="emailnymous"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"

        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRSQ2SFfwPlMquVdAyjUar5+76PVCmY1"

        crossorigin="emailnymous"></script>
 
    <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"

        rel="stylesheet" crossorigin="emailnymous">
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
        String numero = request.getParameter("id") + "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ti_02", "root", "");
        Statement stm = con.createStatement();
        try {
            String sql = "SELECT * FROM t_pessoa, t_genero, t_categoria WHERE numero='" + numero + "' AND " +
                         "idGen = t_genero.idGen AND idCat = t_categoria.idCat";
            ResultSet rs = stm.executeQuery(sql);
            rs.next();
        %>
        <form method="post" action="alterarPessoas2.jsp">
            Número: <input type="text" name="numero" size="11" readonly 
                value="<%= rs.getInt("numero") %>"><br>
            Nome: <input type="text" name="nome" size="100" 
                value="<%= rs.getString("nome") %>"><br>
            Email: <input type="text" name="email" size="100" 
                value="<%= rs.getString("email") %>"><br>
            Data de Nascimento: <input type="date" name="dataNascimento"
               value="<%= rs.getDate("dataNascimento") %>"><br>
            Morada: <input type="text" name="morada" size="100" 
                value="<%= rs.getString("morada") %>"><br>
        <%
        try {
            Statement stm2 = con.createStatement();
            ResultSet rs2 = stm2.executeQuery("SELECT * FROM t_genero");
            while (rs2.next()) {
                String tmp = rs2.getInt("idGen") + "";
                if (rs2.getInt("idGenero") == rs.getInt("idGen")) {
                    out.println("<option selected value='" + tmp + "'>");
                } else {
                    out.println("<option value='" + tmp + "'>");
                }
                String tmp2 = rs2.getString("genero");
                out.println(tmp2 + "</option>");
            }
            rs2.close();
            stm2.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro: " + e.getMessage());
        }
        %>
        </select><br>
        Marca: <select name="categoria">
        <%
        try {
            Statement stm3 = con.createStatement();
            ResultSet rs3 = stm3.executeQuery("Select * from t_categoria");
            while (rs3.next()) {
                String tmp = rs3.getInt("idCat") + "";
                if (rs3.getInt("idCategoria") == rs.getInt("idCat"))
                    out.println("<option selected value=\"" + tmp + "\">");
                else
                    out.println("<option value=\"" + tmp + "\">");
                String tmp2 = rs3.getString("categoria");
                out.println(tmp2 + "</option>");
            }
            rs3.close();
            stm3.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro" + e.getMessage());
        }
        %>
        </select><br>
        Preço: <input type="password" name="senha" size="20"
            value="<%= rs.getString("senha") %>"><br>
        <input type="submit" value="Alterar">
        </form>
        <%
            rs.close();
            stm.close();
            con.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro" + e.getMessage());
        }
        %>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4j6bY+otDcXpeYBnu8UssiBoQ5e8d8g7T1PJ" 
            crossorigin="emailnymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" 
            integrity="sha384-pzjw8f+ua7Kw1lT0p4R9W1sm0l0W2rFV5t6bM7P4e4hSkXa5bZmF7c76v6t7" 
            crossorigin="emailnymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
            integrity="sha384-B4gtYgtOS9llyFjt9t7g9H1DhYtTgf4W+MFIeYfRgfFq5ojb7xU3l2s5Vid" 
            crossorigin="emailnymous"></script>
    </body>
</html>

