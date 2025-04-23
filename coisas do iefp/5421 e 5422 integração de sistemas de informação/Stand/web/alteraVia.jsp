
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
        <h3>Alteração de Viaturas</h3>
        <%
        String numero = request.getParameter("id") + "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bd_stand", "root", "");
        Statement stm = con.createStatement();
        try {
            String sql = "SELECT * FROM tViatura, tMarca, tTipo WHERE numero='" + numero + "' AND " +
                         "idMarca = tMarca.idM AND idT = tTipo.idT";
            ResultSet rs = stm.executeQuery(sql);
            rs.next();
        %>
        <form method="post" action="alterarVia2.jsp">
            Número: <input type="text" name="numero" size="8" readonly 
                value="<%= rs.getInt("numero") %>"><br>
            Matrícula: <input type="text" name="matricula" size="9" 
                value="<%= rs.getString("matricula") %>"><br>
            Ano: <input type="text" name="ano" size="4" 
                value="<%= rs.getInt("ano") %>"><br>
            Cilindrada: <input type="text" name="cilindrada" size="7" 
               value="<%= rs.getInt("cilindrada") %>"><br>
            Kms: <input type="text" name="kms" size="9" 
                value="<%= rs.getInt("kms") %>"><br>
            Tipo: <select name="tipo">
        <%
        try {
            Statement stm2 = con.createStatement();
            ResultSet rs2 = stm2.executeQuery("SELECT * FROM tTipo");
            while (rs2.next()) {
                String tmp = rs2.getInt("idT") + "";
                if (rs2.getInt("idTipo") == rs.getInt("idT")) {
                    out.println("<option selected value='" + tmp + "'>");
                } else {
                    out.println("<option value='" + tmp + "'>");
                }
                String tmp2 = rs2.getString("tipo");
                out.println(tmp2 + "</option>");
            }
            rs2.close();
            stm2.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro: " + e.getMessage());
        }
        %>
        </select><br>
        Marca: <select name="marca">
        <%
        try {
            Statement stm3 = con.createStatement();
            ResultSet rs3 = stm3.executeQuery("Select * from tMarca");
            while (rs3.next()) {
                String tmp = rs3.getInt("idM") + "";
                if (rs3.getInt("idMarca") == rs.getInt("idM"))
                    out.println("<option selected value=\"" + tmp + "\">");
                else
                    out.println("<option value=\"" + tmp + "\">");
                String tmp2 = rs3.getString("marca");
                out.println(tmp2 + "</option>");
            }
            rs3.close();
            stm3.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro" + e.getMessage());
        }
        %>
        </select><br>
        Modelo: <input type="text" name="modelo" size="40"
            value="<%= rs.getString("modelo") %>"><br>
        Preço: <input type="text" name="preco" size="15"
            value="<%= rs.getFloat("preco") %>"><br>
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
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" 
            integrity="sha384-pzjw8f+ua7Kw1lT0p4R9W1sm0l0W2rFV5t6bM7P4e4hSkXa5bZmF7c76v6t7" 
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
            integrity="sha384-B4gtYgtOS9llyFjt9t7g9H1DhYtTgf4W+MFIeYfRgfFq5ojb7xU3l2s5Vid" 
            crossorigin="anonymous"></script>
    </body>
</html>

