<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="produto" class="Produto.ProdutoDAO"/>
<jsp:setProperty name="produto" property="*"/>
<%
    if (produto.Excluir(Integer.parseInt(request.getParameter("id_produto")))) {
        out.println("Dados alterados");
    } else {
        out.println("Erro ao alterar");
    }
%>
