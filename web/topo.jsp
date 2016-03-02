
<%
    String vnomeUser = "";
    if(request.getSession().getAttribute("sessaoNome") != null) {
        vnomeUser = request.getSession().getAttribute("sessaoNome").toString();
    }
    if(vnomeUser.equals("")) {
        response.sendRedirect("index.jsp?erro=2");
    }
%>
<!-- TOPO --> 
<hr>
<div class="row">
    <div class="col-md-1">
        <img src="imagens/logout.png" height="100px" width="100px" class="img-circle">
    </div>
    <div class="col-md-10 col-md-offset-1" >
        <h1>Controle de Sistemas Departamentais
            <a href="logout.jsp" class="btn btn-danger btn-sm pull-right">Sair</a> 
            <span class="badge pull-right" style="margin-right: 15px;">
                <%= vnomeUser %>
            </span> 
        </h1>
    </div>
</div>

