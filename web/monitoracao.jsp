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
                    <h1><small>Monitoração<h6>*dados fictícios*</h6></small></h1>
                    <hr>
                    <div class="box-chart">
                        <canvas id="GraficoDonut" width="auto"></canvas>
                        <script type="text/javascript">

                            var options = {
                                responsive: true
                            };

                            var data = [
                                {
                                    value: 9,
                                    color: "#FF6347",
                                    highlight: "#FF0000",
                                    label: "Sem monitoração",
                                },
                                {
                                    value: 265,
                                    color: "#00FF7F",
                                    highlight: "#00FF00",
                                    label: "Monitorando"
                                },
                                {
                                    value: 1,
                                    color: "#FFD700",
                                    highlight: "#FFFF00",
                                    label: "Em Andamento"
                                }
                            ]

                            window.onload = function () {
                                var ctx = document.getElementById("GraficoDonut").getContext("2d");
                                var myDoughnutChart = new Chart(ctx).Doughnut(data, options);
                                
                            }

                        </script>

                    </div>

                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>
