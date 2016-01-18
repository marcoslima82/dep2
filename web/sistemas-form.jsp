<%-- 
    Document   : sistemas-form
    Created on : 23/12/2015, 17:15:32
    Author     : USERTQI
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistemas</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
<c:forEach var="lista" items="${lista}"><c:out value="${lista}"/><br></c:forEach>
        <div class="container">

            <!-- TOPO --> 
            <%@ include file="topo.jsp" %>

            <!-- MIOLO --> 
            <div class="row">
                <div class="col-md-2"> 
                    <%@ include file="menu.jsp" %>                
                </div>
                <div class="col-md-8">
                    <h1><small>
                            Sistemas</small>
                        <a href="sistemas.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading"><small>
                                Cadastro de Sistemas</small>
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <!-- TESTE -->
                            <!-- TESTE -->
                           <%  
                                
                                String vcod = request.getParameter("cod_sis");
                                String vhost = "asd";
                                String sAction = "sistemas-ins.jsp";
                                String vsistema = "";
                                String varea = "";
                                String vcod_servidor = "";
                                String vhost_name_servidor = "N/A";
                                String name_servidor;
                                String comp = "";
                                ArrayList servidores = new ArrayList();
                                int num = 0;
                               
                                if (vcod != null){
                                    sAction = "sistemas-alt.jsp";
                                    ConexaoSQLite conexao_sis = new ConexaoSQLite();
                                    conexao_sis.query("SELECT cod_sis,sistema, cod_sistema, area "
                                            + "FROM Sistemas "
                                            + " WHERE cod_sis='" + vcod + "'");
                                    if (conexao_sis.next()){  
                                        vcod_servidor = conexao_sis.getString("cod_sistema");
                                        vsistema = conexao_sis.getString("sistema");
                                        //vcod = conexao.getString("cod_sis");
                                        vhost = conexao_sis.getString("cod_sistema");
                                        varea = conexao_sis.getString("area");
                                        comp = vhost;
                                        
                                    }
                                    conexao_sis.close();
                                    ConexaoSQLite conexao_serv = new ConexaoSQLite();
                                    conexao_serv.query("SELECT hostname,cod "
                                        + "FROM Servidores "
                                        + " WHERE cod='" + comp + "'");
                                    if (conexao_serv.next()){
                                        vhost_name_servidor = conexao_serv.getString("hostname");
                                    }
                                    conexao_serv.close();
                                    
                                    ConexaoSQLite conexao_serv2 = new ConexaoSQLite();
                                    conexao_serv2.query("SELECT hostname,cod "
                                        + "FROM Servidores ");
                                    while (conexao_serv2.next()){
                                        name_servidor = conexao_serv2.getString("hostname");
                                        servidores.add(name_servidor);
                                        num = (num + 1);
                                    }
                                    conexao_serv2.close();
                                        
                                    //testes de variaveis
                                    System.out.println("vhost > "+vhost+ " cod_sis > "+vcod );
                                }
                            %>
                            <form action="<%= sAction%>" method="GET">

                                <div class="form-group">
                                    <label>Nome do Servidor</label>
                                    <select id="cxa" class="form-control">
                                        <%
                                        int i = 0;
                                        for(i = 0; i < servidores.size(); i++){
                                            out.println("<option>"+ servidores.get(i) +"</option>");
                                        }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Sistema</label>
                                    <input type="text" value="<%= vsistema%>" class="form-control" name="cxaSistema" placeholder="Digite nome do sistema">
                                </div>
                                <div class="form-group">
                                    <label>Servidor</label>
                                    <input class="form-control" name="cxaServidor" value="<%= vhost %>" disabled="">
                                   </div>

                                <div class="form-group">
                                    <label>Area Receptora</label>
                                    <input type="text" value="<%= varea%>" class="form-control" name="cxaArea" placeholder="Digite Area Receptora">
                                </div>
                                <input type="hidden" name="cxaCod" value="<%= vcod%>" class="form-control">
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