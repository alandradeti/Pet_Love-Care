<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agendamento" class="Agendamento.AgendamentoDAO"/>

<jsp:setProperty name="agendamento" property="*"/>
<%
    if (agendamento.Excluir(Integer.parseInt(request.getParameter("id_agendamento")))) {
        out.println("Dados excluidos");
    } else {
        out.println("Erro ao excluir");
    }
%>
