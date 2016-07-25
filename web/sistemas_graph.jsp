<%-- 
    Document   : sistemas_graph
    Created on : Jul 11, 2016, 10:51:00 AM
    Author     : admsup
--%>
<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TOMADA DE CONTROLE sistemas departamentais</title>
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
                    <h1><small>Tomada de controle<h6>*últimos dados coletados 31/03/2016*</h6></small></h1>
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
                    <hr>
                            Verificado até 1ª semana de julho/2016
                            <hr>

                            <div class="box-char">

                                <canvas id="barsChart" width="700" height="400"></canvas>
                                <div id="js-legend"></div>
                                <script type="text/javascript">

                                            var data = {
                                            labels: ["NULL","Adilson Paes (Redes)","Ag. Arquitetura","Alexander Gomes De Freitas","Apoio","BI","CRM Sustentação","Em Desativação","Erico Panaro","Faturamento","Fora de Escopo","MobilePeople","Sem informação","Sem tomada de controle","THCS","Tramitação"],
                                                    datasets: [
                                                    {
                                                    label: "Área",
                                                            fillColor: "rgba(30, 131, 124, 0.4)",
                                                            highlightFill : "rgba(30, 131, 124, 0.8)",
                                                            strokeColor: "rgba(30, 131, 0, 0.8)",
                                                            pointColor: "rgba(255, 112, 0, 0.5)",
                                                            pointStrokeColor: "#E5E5E5",
                                                            data: [32,9,5,1,49,42,73,1,2,16,15,1,2,82,4,35],
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
                                        conexao_lista.query("SELECT sistema "
                                                + "FROM Sistemas "
                                                + "WHERE area is null");

                                        while (conexao_lista.next()) {
                                            String lhost = conexao_lista.getString("sistema");
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