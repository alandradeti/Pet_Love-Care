<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>

<jsp:setProperty name="cliente" property="*"/>
<%
    if (cliente.Excluir(Integer.parseInt(request.getParameter("id_cliente")))) {
        out.println("Dados excluidos");
    } else {
        out.println("Erro ao excluir");
    }
%>
