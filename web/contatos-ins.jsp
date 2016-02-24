<%@page import="conexao.ConexaoSQLite"%>
<%

    String vnome = request.getParameter("cxaNome");
    String vtelefone = request.getParameter("cxaTelefone");
    String vemail = request.getParameter("cxaEmail");
    String vfk_contato = request.getParameter("cxaFk_contato");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Contatos "
            + "(contato,telefone,email,fk_contato) values ("
            + "'"+vnome+"',"
            + "'"+vtelefone+"',"
            + "'"+vemail+"',"
            + "'"+vfk_contato+"'"
            + ")");
    conexao.close();
    response.sendRedirect("contatos.jsp");
%>