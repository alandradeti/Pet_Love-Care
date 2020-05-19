<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:setProperty name="vacina" property="*"/>
<%
    if (vacina.Excluir(Integer.parseInt(request.getParameter("id_vacina")))) {
        out.println("Dados alterados");
    } else {
        out.println("Erro ao alterar");
    }
%>
