<%-- 
    Document   : obsolescencia
    Created on : Feb 12, 2016, 12:02:49 PM
    Author     : admsup
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Obsolescência do ambiente de sistemas departamentais</title>
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
                    <h1><small>Obsolescência<h6>*atualizando*</h6></small></h1>
                    <hr>Versões de Sistemas Operacionais<br>
                    <%                        ConexaoSQLite conexao = new ConexaoSQLite();
                        conexao.query("SELECT soperacional, count(*) as contador "
                                + "FROM Recursos "
                                + "group by soperacional");

                        while (conexao.next()) {
                            String vsoperacional = conexao.getString("soperacional");
                            String vcount = conexao.getString("contador");

                            out.println("<tr>");
                            out.println("<td>" + "[" + vsoperacional + " =" + "</td>");
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
                                    value: 39,
                                    color: "#F78181",
                                    highlight: "#FF0000",
                                    label: "Windows XP"
                                },
                                {
                                    value: 9,
                                    color: "#819FF7",
                                    highlight: "#4d4dff",
                                    label: "Windows 7"
                                },
                                {
                                    value: 10,
                                    color: "#FFD700",
                                    highlight: "#FFFF00",
                                    label: "Windows 2000"
                                },
                                {
                                    value: 50,
                                    color: "#990099",
                                    highlight: "#e600e5",
                                    label: "Windows 2003"
                                },
                                {
                                    value: 104,
                                    color: "#00FF7F",
                                    highlight: "#00FF00",
                                    label: "Windows 2008"
                                },
                                {
                                    value: 23,
                                    color: "#F7BE81",
                                    highlight: "#FF8000",
                                    label: "Unix"
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
                    <div class="col-md-8"> ######### </div>
                </div>

            </div>

    </body>
</html>
