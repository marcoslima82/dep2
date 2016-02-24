<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cxaCod");
    String vnome = request.getParameter("cxaNome");
    String vtelefone = request.getParameter("cxaTelefone");
    String vemail = request.getParameter("cxaEmail");
    String vfk_contato = request.getParameter("cxaFk_contato");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Contatos "
            + "SET "
            + "contato='"+vnome+"',"
            + "telefone='"+vtelefone+"',"
            + "email='"+vemail+"',"
            + "fk_contato='"+vfk_contato+"'"
            + " WHERE cod_contato='"+vcod+"'");
    conexao.close();
    response.sendRedirect("contatos.jsp");
%>