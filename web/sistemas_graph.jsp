<%-- 
    Document   : sistemas_graph
    Created on : Jul 11, 2016, 10:51:00 AM
    Author     : admsup
--%>
<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Controle de monitoração sistemas departamentais</title>
        <meta charset="UTF-8">
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
                <div class="col-md-8">
                    <hr>
                    <h1><small>Backup<h6>*últimos dados coletados 31/03/2016*</h6></small></h1>
                    <hr>

                    <%                        
                    ConexaoSQLite conexao2 = new ConexaoSQLite();
                        conexao2.query("SELECT area, count(*) as contador "
                                + "FROM Sistemas "
                                + "group by area");

                        while (conexao2.next()) {
                            String varea = conexao2.getString("area");
                            String vcount = conexao2.getString("contador");

                            out.println("<tr>");
                            out.println("<td>" + "[" + varea + "</td>");
                            out.println("<td>" + vcount + "]" + "</td>");
                            out.println("</tr>");
                        }
                        conexao2.close();
                    %>
                    <div class="box-char">

                        <canvas id="GraficoDonut" width="auto"></canvas>
                        <div id="js-legend"></div>
                        <script type="text/javascript">
                            var data = {
                                labels:[
                                    "apoio","crm","tramitaçao"
                                ],
                                datasets: [
                                    {
                                        data: [300, 50, 100],
            backgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56"
            ],
            hoverBackgroundColor: [
                "#FF6384",
                "#36A2EB",
                "#FFCE56"
            ]
                                    }
                                ]
                            }

                            var options = {
                                responsive: true,
                                segmentShowStroke: false,
                                animateRotate: true,
                                animateScale: false,
                                percentageInnerCutout: 50

                            }

                            window.onload = function () {
                                var ctx = document.getElementById("GraficoDonut").getContext("2d");
                                var GraficoDonut = new Chart(ctx).Doughnut(data, options);
                                document.getElementById('js-legend').innerHTML = GraficoDonut.generateLegend();
                            }

                        </script>
                    </div>
                    <div class="col-md-8"> 
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover text-lowercase">
                                <thead>
                                    <tr class="info text-nowrap">
                                        <!-- codigo sistema, saida out comentada
                                        <td>COD</td>
                                        --> 
                                        <td>Verificar politica</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ConexaoSQLite conexao_lista = new ConexaoSQLite();
                                        conexao_lista.query("SELECT hostname "
                                                + "FROM Servidores "
                                                + "WHERE backup like 'ok'");

                                        while (conexao_lista.next()) {
                                            String lhost = conexao_lista.getString("hostname");
                                            //String lcount = conexao.getString("contador");
                                            out.println("<tr>");
                                            out.println("<td>" + lhost + "</td>");
                                            //out.println("<td>" + vcount + "]" + "</td>");
                                            out.println("</tr>");
                                        }
                                        conexao_lista.close();
                                    %>
                                </tbody>
                        </div>
                    </div>
                </div>

            </div>

    </body>
</html>