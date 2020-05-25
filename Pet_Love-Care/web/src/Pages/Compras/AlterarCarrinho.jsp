<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carrinho" class="Compra.CarrinhoDAO"/>

<jsp:setProperty name="carrinho" property="*"/>
<%
    if (carrinho.Alterar(Integer.parseInt(request.getParameter("id_produto")), Integer.parseInt(request.getParameter("quantidade_carrinho")), Float.parseFloat(request.getParameter("valor_produto")))) {
%>
        <script>
            window.location.href = "../Home/Home.jsp";
            alert("Quantidade do Produto Aumentada");
        </script>
<%
    } else {
        out.println("Erro ao alterar");
    }
%>

