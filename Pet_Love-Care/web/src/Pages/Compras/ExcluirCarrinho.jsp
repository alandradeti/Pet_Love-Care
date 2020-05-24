<%@page import="Compra.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carrinho" class="Compra.CarrinhoDAO"/>
<jsp:setProperty name="carrinho" property="*"/>
<%
    if (carrinho.Excluir(Integer.parseInt(request.getParameter("id_carrinho")))) {
        out.println("Dados alterados");
    } else {
        out.println("Erro ao alterar");
    }
%>

