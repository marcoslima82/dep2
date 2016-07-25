<%-- 
    Document   : sistemas
    Created on : 23/12/2015, 16:32:39
    Author     : Marcos Lima da Silva
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Sistemas</title>
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
                <div class="col-md-10">
                    <hr>
                    <h1><small>Lista de Sistemas</small></h1>
                    
                    <div class="panel panel-primary">
                        <div class="panel-heading">Lista de sistemas</div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover text-lowercase">
                                <thead>
                                    <tr class="info text-nowrap">
                                        <!-- codigo sistema, saida out comentada
                                        <td>COD</td>
                                        --> 
                                        <td>SISTEMA</td>
                                        <td>SERVIDOR</td>
                                        <td>IP</td>
                                        <td>AREA RECEPTORA</td>
                                        <td>BLINDAGEM</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        conexao.query("SELECT cod_sis,sistema,Servidores.hostname,Servidores.ip,area,blindagem "
                                                + "FROM Sistemas,Servidores "
                                                //+ "ORDER BY sistema ASC ");
                                                + "WHERE Sistemas.cod_sistema = Servidores.cod "
                                                + "ORDER BY area ASC");

                                        while (conexao.next()) {
                                            int vcod = conexao.getInt("cod_sis");
                                            String vsistema = conexao.getString("sistema");
                                            String vhost = conexao.getString("hostname");
                                            String vip = conexao.getString("ip");
                                            String varea = conexao.getString("area");
                                            String vblindagem = conexao.getString("blindagem");

                                            out.println("<tr>");
                                            //out.println("<td>" + vcod + "</td>");
                                            out.println("<td>" + vsistema + "</td>");
                                            out.println("<td>" + vhost + "</td>");
                                            out.println("<td>" + vip + "</td>");
                                            out.println("<td>" + varea + "</td>");
                                            out.println("<td>" + vblindagem + "</td>");
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"sistemas-form.jsp?cod_sis=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            
                                            /*Coluna com Botão EXCLUIR
                                            out.println("<td>");
                                            out.println("<a href=\"sistemas-rem.jsp?cod=" + vcod + "\" class=\"btn btn-danger btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("excluir");
                                            out.println("</a>");
                                            out.println("</td>");
                                                    */
                                        }
                                        conexao.close();
                                    %>
                                </tbody>
                            </table>
                            <hr>
                            <a href="sistemas-form.jsp" class="btn btn-primary">Novo Sistema</a>
                            <hr>
                            Verificado até 1ª semana de julho/2016
                            <hr>

                            <div class="box-char">

                                <canvas id="barsChart" width="860" height="500"></canvas>
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
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>

