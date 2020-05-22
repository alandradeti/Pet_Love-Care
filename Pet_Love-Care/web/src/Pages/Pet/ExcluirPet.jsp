<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pet" class="Pet.PetDAO"/>

<jsp:setProperty name="pet" property="*"/>
<%
    if (pet.Excluir(Integer.parseInt(request.getParameter("id_pet")))) {
        out.println("Dados excluidos");
    } else {
        out.println("Erro ao excluir");
    }
%>
