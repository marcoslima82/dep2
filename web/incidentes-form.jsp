<%-- 
    Document   : incidentes-form
    Created on : Feb 24, 2016, 7:38:03 AM
    Author     : admsup
--%>


<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incidentes</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <scrstatust src="js/jquery-1.11.1.min.js"></scrstatust>
        <scrstatust src="js/bootstrap.min.js"></scrstatust>
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
                    <h1>
                        Incidentes
                        <a href="incidentes.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Cadastro de Incidentes
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%
                            
                              String vcod = request.getParameter("cod_inc");
                              String sAction = "incidentes-ins.jsp";
                              String vincidente = "";
                              String vstatus = "";
                              String vanalista = "";
                              
                              if(vcod != null) {
                                  sAction = "incidentes-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM Incidentes WHERE cod_inc='"+vcod+"'");
                                  if(conexao.next()) {
                                      vincidente = conexao.getString("inc");
                                      vstatus = conexao.getString("status");
                                      vanalista = conexao.getString("analista");
                                     
                                  }
                                  conexao.close();
                              }
                            %>
                            <form action="<%= sAction %>" method="GET">
                                <div class="form-group">
                                    <label>Incidente</label>
                                    <input type="text" value="<%= vincidente %>" class="form-control" name="cxaIncidente" placeholder="Digite número do Incidente">
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <input type="text" value="<%= vstatus %>" class="form-control" name="cxaStatus" placeholder="Descrever andamento">
                                </div>
                                <div class="form-group">
                                    <label>Analista</label>
                                    <input type="text" value="<%= vanalista %>" class="form-control" name="cxaAnalista" placeholder="Nome do Analista">
                                </div>
                               
                                    <input type="hidden" name="cxaCod" value="<%= vcod %>" class="form-control">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </form>                            
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>
    </body>
</html>


