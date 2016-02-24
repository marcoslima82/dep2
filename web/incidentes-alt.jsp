<%-- 
    Document   : incidentes-alt
    Created on : Feb 24, 2016, 7:51:31 AM
    Author     : admsup
--%>


<%@page import="conexao.ConexaoSQLite"%>
<%
    String vcod = request.getParameter("cxaCod");
    String vincidente = request.getParameter("cxaIncidente");
    String vstatus = request.getParameter("cxaStatus");
    String vanalista = request.getParameter("cxaAnalista");
        
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Incidentes "
            + "SET "
            + "inc='"+vincidente+"',"
            + "status='"+vstatus+"',"
            + "analista='"+vanalista+"'"
            + " WHERE cod_inc='"+vcod+"'");
    conexao.close();
    response.sendRedirect("incidentes.jsp");
%>
