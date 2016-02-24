<%-- 
    Document   : incidentes-ins
    Created on : Feb 24, 2016, 7:48:54 AM
    Author     : admsup
--%>
<%@page import="conexao.ConexaoSQLite"%>
<%

    String vincidente = request.getParameter("cxaIncidente");
    String vstatus = request.getParameter("cxaStatus");
    String vanalista = request.getParameter("cxaAnalista");
        
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Incidentes "
            + "(inc,status,analista) values ("
            + "'"+vincidente+"',"
            + "'"+vstatus+"',"
            + "'"+vanalista+"'"
            + ")");
    conexao.close();
    response.sendRedirect("incidentes.jsp");
%>