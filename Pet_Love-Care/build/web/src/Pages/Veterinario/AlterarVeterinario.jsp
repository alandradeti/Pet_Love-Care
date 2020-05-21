<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>

<jsp:setProperty name="veterinario" property="*"/>
<%
    if (veterinario.Alterar(Integer.parseInt(request.getParameter("id_veterinario")))) {
        out.println("Dados alterados");
    } else {
        out.println("Erro ao alterar");
    }
%>
