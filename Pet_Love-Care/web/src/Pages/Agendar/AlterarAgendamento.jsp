<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agendamento" class="Agendamento.AgendamentoDAO"/>

<jsp:setProperty name="agendamento" property="*"/>
<%
    if (agendamento.Alterar(Integer.parseInt(request.getParameter("id_agendamento")))) {
        out.println("Dados alterados");
    } else {
        out.println("Erro ao alterar");
    }
%>
