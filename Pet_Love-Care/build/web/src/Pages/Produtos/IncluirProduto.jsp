<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="produto" class="Produto.ProdutoDAO"/>

<jsp:setProperty name="produto" property="nome_produto" value="${param.nome_produto}"/>
<jsp:setProperty name="produto" property="valor_produto" value="${param.valor_produto}"/>
<jsp:setProperty name="produto" property="descricao_produto" value="${param.descricao_produto}"/>
<jsp:setProperty name="produto" property="numero_imagem_produto" value="${param.numero_imagem_produto}"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = produto.Incluir();
    if (resp == true) {
        out.println("Funcionou");
    } else {
        out.println("Deu ruim");
    }
%>

