<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>

<jsp:setProperty name="vacina" property="nome_vacina" value="${param.nome_vacina}"/>
<jsp:setProperty name="vacina" property="valor_vacina" value="${param.valor_vacina}"/>
<jsp:setProperty name="vacina" property="descricao_vacina" value="${param.descricao_vacina}"/>


<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = vacina.Incluir();
    if (resp == true) {
        //Código se verdadeiro
    } else {
        //Código se falso
    }
%>

