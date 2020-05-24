<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carteiraVacinacao" class="CarteiraVacinacao.CarteiraVacinacaoDAO"/>

<jsp:setProperty name="carteiraVacinacao" property="*"/>
<%
    if (carteiraVacinacao.Excluir(Integer.parseInt(request.getParameter("id_carteira_vacinacao")))) {
        out.println("Dados excluidos");
    } else {
        out.println("Erro ao excluir");
    }
%>
