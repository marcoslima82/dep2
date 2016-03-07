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
                    <h1><small>Backup<h6>*últimos dados coletados 29/02/2016*</h6></small></h1>
                    <hr>
                    
                    <%

                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        conexao.query("SELECT backup, count(*) as contador "
                                                + "FROM Servidores "
                                                + "group by backup");

                                        while (conexao.next()) {
                                            String vbackup = conexao.getString("backup");
                                            String vcount = conexao.getString("contador");

                                            out.println("<tr>");
                                            out.println("<td>" + "[" + vbackup + "</td>");
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
                                    value: 26,
                                    color: "#F78181",
                                    highlight: "#FF0000",
                                    label: "?"
                                },
                                {
                                    value: 244,
                                    color: "#00FF7F",
                                    highlight: "#00FF00",
                                    label: "OK"
                                },
                                {
                                    value: 12,
                                    color: "#819FF7",
                                    highlight: "#4d4dff",
                                    label: "Control-M"
                                },
                                {
                                    value: 24,
                                    color: "#990099",
                                    highlight: "#e600e5",
                                    label: "N/A"
                                },
                                {
                                    value: 3,
                                    color: "#FFD700",
                                    highlight: "#FFFF00",
                                    label: "Null"
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
                    <div class="col-md-8"> 
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover text-lowercase">
                                <thead>
                                    <tr class="info text-nowrap">
                                        <!-- codigo sistema, saida out comentada
                                        <td>COD</td>
                                        --> 
                                        <td>Hostnames a corrigir</td>
                                        </tr>
                                </thead>
                        <tbody>
                    <%
                        
                        ConexaoSQLite conexao_lista = new ConexaoSQLite();
                        conexao_lista.query("SELECT hostname "
                                + "FROM Servidores "
                                + "WHERE backup like '?' OR monitoracao is null");

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