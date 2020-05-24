<%@page import="Compra.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carrinho" class="Compra.CarrinhoDAO"/>

<jsp:setProperty name="carrinho" property="preco_carrinho" value="${param.valor_produto * param.quantidade_carrinho}"/>
<jsp:setProperty name="carrinho" property="quantidade_carrinho" value="${param.quantidade_carrinho}"/>
<jsp:setProperty name="carrinho" property="status_carrinho" value="${param.status_carrinho}"/>
<jsp:setProperty name="carrinho" property="id_cliente" value="${param.id_cliente}"/>
<jsp:setProperty name="carrinho" property="id_produto" value="${param.id_produto}"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = carrinho.Incluir();
    if (resp == true) {
%>
        <script>
            window.location.href = "../Home/Home.jsp";
            alert("Produto Adicionado");
        </script>
<%
    } else {
        
    }
%>