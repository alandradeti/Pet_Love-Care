<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>

<jsp:setProperty name="veterinario" property="*"/>
<%
    if (veterinario.Excluir(Integer.parseInt(request.getParameter("id_veterinario")))) {
        out.println("Dados excluidos");
    } else {
        out.println("Erro ao excluir");
    }
%>
