<%@page import="java.util.ArrayList"%>
<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contatos</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
                        Contatos
                        <a href="contatos.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Cadastro de contatos
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%
                              String vcod = request.getParameter("cod_contato");
                              String sAction = "contatos-ins.jsp";
                              String vnome = "";
                              String vtelefone = "";
                              String vemail = "";
                              String vfk_contato = "";
                              String name_servidor = "";
                              int num = 0;
                              ArrayList servidores = new ArrayList();
                              
                              if(vcod != null) {
                                  sAction = "contatos-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM Contatos WHERE cod_contato='"+vcod+"'");
                                  if(conexao.next()) {
                                      vnome = conexao.getString("contato");
                                      vtelefone = conexao.getString("telefone");
                                      vemail = conexao.getString("email");
                                      vfk_contato = conexao.getString("fk_contato");
                                  }
                                  conexao.close();
                                  
                                  ConexaoSQLite conexao_serv2 = new ConexaoSQLite();
                                    conexao_serv2.query("SELECT hostname "
                                        + "FROM Servidores ");
                                    while (conexao_serv2.next()){
                                        name_servidor = conexao_serv2.getString("hostname");
                                        servidores.add(name_servidor);
                                        num = (num + 1);
                                    }
                                    conexao_serv2.close();
                              }
                            %>
                            <form action="<%= sAction %>" method="GET">
                                <div class="form-group">
                                    <label>Nome</label>
                                    <input type="text" value="<%= vnome %>" class="form-control" rows="3" name="cxaNome" placeholder="Digite nome do contato">
                                </div>
                                <div class="form-group">
                                    <label>Telefone</label>
                                    <input type="text" value="<%= vtelefone %>" class="form-control" name="cxaTelefone" placeholder="Digite telefone do contato">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="form-control input-lg" type="text" value="<%= vemail %>" class="form-control" name="cxaEmail" placeholder="Digite email do contato">
                                </div>
                                <div class="form-group">
                                    <label>Nome do Servidor</label>
                                    <select id="cxaFk_contato" class="form-control">
                                        <%
                                        int i = 0;
                                        for(i = 0; i < servidores.size(); i++){
                                            out.println("<option>"+ servidores.get(i) +"</option>");
                                        }
                                        %>
                                    </select>
                                </div>
                                <input type="hidden" name="cxaCod" value="<%= vcod %>">
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
