<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carteiraVacinacao" class="CarteiraVacinacao.CarteiraVacinacaoDAO"/>

<jsp:setProperty name="carteiraVacinacao" property="id_pet" value="${param.id_pet}"/>
<jsp:setProperty name="carteiraVacinacao" property="id_vacina" value="${param.id_vacina}"/>
<jsp:setProperty name="carteiraVacinacao" property="data_pet_vacina" value="${param.data_pet_vacina}"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = carteiraVacinacao.Incluir();
    if (resp == true) {
        //Código se verdadeiro
    } else {
        out.println("Erro ao gravar " + resp);
    }
%>