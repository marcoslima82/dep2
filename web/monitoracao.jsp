<%-- 
    Document   : backup
    Created on : Jan 12, 2016, 8:53:02 PM
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
                    <h1><small>Monitoração<h6>*últimos dados coletados 10/02/2016 total ativo 301*</h6></small></h1>
                    <hr>
                    <%                        ConexaoSQLite conexao = new ConexaoSQLite();
                        conexao.query("SELECT monitoracao, count(*) as contador "
                                + "FROM Servidores "
                                + "group by monitoracao");

                        while (conexao.next()) {
                            String vmonitoracao = conexao.getString("monitoracao");
                            String vcount = conexao.getString("contador");

                            out.println("<tr>");
                            out.println("<td>" + "[" + vmonitoracao + "</td>");
                            out.println("<td>" + vcount + "]" + "</td>");
                            out.println("</tr>");
                        }
                        conexao.close();
                    %>
                    <div class="box-char">

                        <canvas id="GraficoDonut" width="auto"></canvas>
                        <div id="js-legend"></div>
                        <script type="text/javascript">
                            var data = [
                                {
                                    value: 9,
                                    color: "#F78181",
                                    highlight: "#FF0000",
                                    label: "Sem monitoração"
                                },
                                {
                                    value: 244,
                                    color: "#00FF7F",
                                    highlight: "#00FF00",
                                    label: "Monitorando"
                                },
                                {
                                    value: 28,
                                    color: "#819FF7",
                                    highlight: "#4d4dff",
                                    label: "Fora do Ametista"
                                },
                                {
                                    value: 11,
                                    color: "#990099",
                                    highlight: "#e600e5",
                                    label: "N/A"
                                },
                                {
                                    value: 0,
                                    color: "#FFD700",
                                    highlight: "#FFFF00",
                                    label: "Solicitado regularização"
                                },
                                {
                                    value: 13,
                                    color: "#F7BE81",
                                    highlight: "#FF8000",
                                    label: "Desativado"
                                }
                            ]

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
                    <div class="col-md-8"> TOTAL ATIVO 301 - *Nem todas são monitoradas pelo ametista</div>
                </div>

            </div>

    </body>
</html>
