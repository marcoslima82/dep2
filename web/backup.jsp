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
        <script src="Chart.js">
            require(['E:/Proj_departametal/ExemploProjeto'], function (Chart) {
                var Chartjs = Chart.noConflict();
            });
        </script>
        
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

                        <canvas id="GraficoBarra" style="width:100%;">

                        </canvas>

                    </div> 
                    <script type="text/javascript">
    window.onload = function(){
        var ctx = document.getElementById("GraficoBarra").getContext("2d");
        var LineChart = new Chart(ctx).Line(data, options);
    }  
</script>
                    <script type="text/javascript">                                        

    var options = {
        responsive:true
    };

    var data = {
        labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
        datasets: [
            {
                label: "Dados primários",
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "rgba(220,220,220,0.75)",
                highlightStroke: "rgba(220,220,220,1)",
                data: [randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb(), randomnb()]
            },
            {
                label: "Dados secundários",
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,0.8)",
                highlightFill: "rgba(151,187,205,0.75)",
                highlightStroke: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19, 86, 27, 90, randomnb(), randomnb(), randomnb(), randomnb(), randomnb()]
            }
        ]
    };                

    window.onload = function(){
        var ctx = document.getElementById("GraficoBarra").getContext("2d");
        var BarChart = new Chart(ctx).Bar(data, options);
    }           
</script>
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>
