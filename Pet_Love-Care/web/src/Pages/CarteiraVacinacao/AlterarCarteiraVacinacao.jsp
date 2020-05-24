<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carteiraVacinacao" class="CarteiraVacinacao.CarteiraVacinacaoDAO"/>

<jsp:setProperty name="carteiraVacinacao" property="*"/>
<%
    if (carteiraVacinacao.Alterar(Integer.parseInt(request.getParameter("id_carteira_vacinacao")))) {
        out.println("Dados alterados");
    } else {
        out.println("Erro ao alterar");
    }
%>

