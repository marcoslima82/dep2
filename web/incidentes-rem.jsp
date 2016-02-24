<%-- 
    Document   : incidentes-rem
    Created on : Feb 24, 2016, 8:59:29 AM
    Author     : admsup
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cod_inc");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("DELETE FROM Incidentes "
            + "WHERE cod_inc='"+vcod+"'");
    conexao.close();
    response.sendRedirect("incidentes.jsp");
%>
