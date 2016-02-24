<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cod_contato");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("DELETE FROM Contatos "
            + "WHERE cod_contato='"+vcod+"'");
    conexao.close();
    response.sendRedirect("contatos.jsp");
%>