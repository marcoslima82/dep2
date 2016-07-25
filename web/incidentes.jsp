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
        <script src="js/Chart.js"></script>
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
                            <table class="table table-striped table-bordered table-condensed table-hover">
                                <thead>
                                    <tr class="info text-nowrap text-uppercase">
                                        <td>INCIDENTE</td>
                                        <td>STATUS </td>
                                        <td>ANALISTA</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        ConexaoSQLite conexao = new ConexaoSQLite();
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
                            <a href="incidentes-form.jsp" class="btn btn-primary">Novo Incidente</a>
                            <hr>
                            Incidentes até 1ª semana de julho/2016
                            <hr>

                            <div class="box-char">

                                <canvas id="barsChart" width="700" height="400"></canvas>
                                <div id="js-legend"></div>
                                <script type="text/javascript">

                                            var data = {
                                            labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho"],
                                                    datasets: [
                                                    {
                                                    label: "Ambiente",
                                                            fillColor: "rgba(255, 44, 203, 0.4)",
                                                            highlightFill : "rgba(255, 44, 203, 0.8)",
                                                            strokeColor: "rgba(255, 44, 203, 0.6)",
                                                            pointColor: "rgba(255, 112, 0, 0.5)",
                                                            pointStrokeColor: "#E5E5E5",
                                                            data: [68, 114, 172, 112, 134, 155, 21],
                                                    },
                                                    {
                                                    label: "Funcional",
                                                            fillColor: "rgba(151,187,205,0.4)",
                                                            highlightFill : "rgba(151,187,205,0.9)",
                                                            strokeColor: "rgba(0, 44, 44, 0.9)",
                                                            pointColor: "rgba(151,187,205,1)",
                                                            pointStrokeColor: "#E5E5E5",
                                                            data: [1, 1, 3, 0, 0, 4, 0],
                                                    }
                                                    ]
                                                   

                                                    };
                                                            window.onload = function () {
                                                            var ctx = document.getElementById('barsChart').getContext('2d');
                                                                    var barsChart = new Chart(ctx).Bar(data);
                                                                    document.getElementById('js-legend').innerHTML = barsChart.generateLegend();
                                                            }
                                </script>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>

