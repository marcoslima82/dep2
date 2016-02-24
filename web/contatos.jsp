<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Contatos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">

            <!-- TOPO --> 
            <%@ include file="topo.jsp" %>

            <!-- MIOLO --> 
            <div class="row">
                <div class="col-md-2"> 
                    <%@ include file="menu.jsp" %>
                </div>
                <div class="col-md-10">
                    <h1>Contatos</h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Lista de contatos</div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover text-uppercase">
                                <thead>
                                    <tr class="info text-nowrap">
                                        <td>NOME</td>
                                        <td>TELEFONE</td>
                                        <td>E-M@IL</td>
                                        <td>SERVIDOR</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        
                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        conexao.query("SELECT Contatos.cod_contato,Contatos.contato,Contatos.telefone,Contatos.email,Servidores.hostname "
                                                + "FROM Contatos "
                                                + "JOIN Servidores ON Servidores.cod = Contatos.fk_contato");
                                        
                                        while(conexao.next()) {
                                            int vcod = conexao.getInt("cod_contato");
                                            String vnome = conexao.getString("contato");
                                            String vtelefone = conexao.getString("telefone");
                                            String vemail = conexao.getString("email");
                                            String vhostname = conexao.getString("hostname");
                                            
                                            out.println("<tr>");
                                            //out.println("<td>"+vcod+"</td>");
                                            out.println("<td>"+vnome+"</td>");
                                            out.println("<td>"+vtelefone+"</td>");
                                            out.println("<td>"+vemail+"</td>");
                                            out.println("<td>"+vhostname+"</td>");
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"contatos-form.jsp?cod_contato="+vcod+"\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            //Coluna com Botão EXCLUIR
                                            /*out.println("<td>");
                                            out.println("<a href=\"contatos-rem.jsp?cod_contato="+vcod+"\" class=\"btn btn-danger btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("excluir");
                                            out.println("</a>");
                                            out.println("</td>");*/
                                        }
                                        conexao.close();
                                    %>
                                </tbody>
                            </table>
                            <hr>
                            <a href="contatos-form.jsp" class="btn btn-primary">Novo Contato</a>
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>
