<%-- 
    Document   : incidentes
    Created on : Feb 24, 2016, 7:27:45 AM
    Author     : admsup
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.*"%>
<html>
    <head>
        <title>INCIDENTES</title>
         <meta charset=UTF-8"> 
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
                    <hr>
                    <h1><small>Acompanhamento de Incidentes Departamentais</small></h1>
                    <div class="panel panel-primary">
                        
                        <div class="panel-heading">Passagem de turno - Por ordem de notificação </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover text-lowercase">
                                <thead>
                                    <tr class="info text-nowrap text-uppercase">
                                        <td>INCIDENTE</td>
                                        <td>STATUS </td>
                                        <td>ANALISTA</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    
                                    
                                    ConexaoSQLite conexao = new ConexaoSQLite();
                                        //conexao.query("SELECT * FROM Recursos");
                                        conexao.query("SELECT * "
                                                + "from Incidentes "
                                                + "ORDER BY cod_inc ASC");
                                                
                                        while (conexao.next()) {
                                            int vcod = conexao.getInt("cod_inc");
                                            String vincidente = conexao.getString("inc");
                                            String vstatus = conexao.getString("status");
                                            String vanalista = conexao.getString("analista");
                                            
                                            out.println("<tr>");
                                            //out.println("<td>" + vcod + "</td>");
                                            out.println("<td>" + vincidente + "</td>");
                                            out.println("<td>" + vstatus + "</td>");
                                            out.println("<td>" + vanalista + "</td>");
                                            
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"incidentes-form.jsp?cod_inc=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            //Coluna com Botão EXCLUIR
                                             out.println("<td>");
                                             out.println("<a href=\"incidentes-rem.jsp?cod_inc=" + vcod + "\" class=\"btn btn-danger btn-xs\">");
                                             out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                             out.println("encerrar");
                                             out.println("</a>");
                                             out.println("</td>");
                                             
                                        }
                                        conexao.close();
                                    %>
                                </tbody>
                            </table>
                            <hr>
                            <hr>
                            <a href="incidentes-form.jsp" class="btn btn-primary">Novo Incidente</a>
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>

