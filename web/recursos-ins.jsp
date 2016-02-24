<%-- 
    Document   : recursos-ins
    Created on : 29/12/2015, 17:37:17
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%
    String vcod_recursos = request.getParameter("cxaCod_recursos");
    String vsoperacional = request.getParameter("cxaSoperacional");
    String vmemoria = request.getParameter("cxaMemoria");
    String vprocessador = request.getParameter("cxaProcessador");
    String vvolumetria = request.getParameter("cxaVolumetria");
    String vbanco = request.getParameter ("cxaBanco");
    String vversaop = request.getParameter("cxaVersao");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Recursos"
            + "(soperacional,versaop,memoria,processador,volumetria,banco,cod_recursos) values ("
            + "'"+vcod_recursos+"',"
            + "'"+vsoperacional+"',"
             + "'"+vversaop+"',"
            + "'"+vmemoria+"',"
            + "'"+vprocessador+"',"
            + "'"+vvolumetria+"',"
            + "'"+vbanco+"'"
            + ")");
    conexao.close();
    response.sendRedirect("recursos.jsp");
%>
