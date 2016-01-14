<%-- 
    Document   : backup
    Created on : Jan 12, 2016, 8:53:02 PM
    Author     : admsup
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Controle de sistemas departamentais</title>
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
                    <h1><small>Backup</small></h1>
                    <hr>
                    <div class="box-chart">
                        <canvas id="GraficoBarra" width="auto"></canvas>
                        <script type="text/javascript">

                            var options = {
                                responsive: true
                            };

                            var data = {
                                labels: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul"],
                                datasets: [
                                    {
                                        label: "My First dataset",
                                        fillColor: "rgba(220,220,220,0.5)",
                                        strokeColor: "rgba(220,220,220,0.8)",
                                        highlightFill: "rgba(220,220,220,0.75)",
                                        highlightStroke: "rgba(220,220,220,1)",
                                        data: [50, 59, 80, 81, 85, 90, 95]
                                    },
                                    {
                                        label: "My Second dataset",
                                        fillColor: "rgba(151,187,205,0.5)",
                                        strokeColor: "rgba(151,187,205,0.8)",
                                        highlightFill: "rgba(151,187,205,0.75)",
                                        highlightStroke: "rgba(151,187,205,1)",
                                        data: [28, 48, 40, 19, 86, 27, 90]
                                    }
                                ]
                            };

                            window.onload = function () {
                                var ctx = document.getElementById("GraficoBarra").getContext("2d");
                                var BarChart = new Chart(ctx).Bar(data, options);
                            }
                        </script>

                    </div>

                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>
