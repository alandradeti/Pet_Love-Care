<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agendamento" class="Agendamento.AgendamentoDAO"/>

<jsp:setProperty name="agendamento" property="tipo_agendamento" value="${param.tipo_agendamento}"/>
<jsp:setProperty name="agendamento" property="data_agendamento" value="${param.data_agendamento}"/>
<jsp:setProperty name="agendamento" property="horario_agendamento" value="${param.horario_agendamento}"/>
<jsp:setProperty name="agendamento" property="id_vacina" value="${param.id_vacina}"/>
<jsp:setProperty name="agendamento" property="id_pet" value="${param.id_pet}"/>
<jsp:setProperty name="agendamento" property="id_cliente" value="<%= session.getAttribute("id_cliente")%>"/>
<jsp:setProperty name="agendamento" property="id_veterinario" value="${param.id_veterinario}"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = agendamento.Incluir();
    if (resp == true) {
        //Código se verdadeiro
    } else {
        out.println("Erro ao gravar " + resp);
    }
%>
