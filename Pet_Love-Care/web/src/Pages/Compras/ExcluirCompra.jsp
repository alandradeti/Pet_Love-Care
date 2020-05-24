<%@page import="Compra.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="compra" class="Compra.CompraDAO"/>
<jsp:setProperty name="compra" property="*"/>
<%
    if (compra.Excluir(Integer.parseInt(request.getParameter("id_compra")))) {
%>
        <script>
            window.location.href = "../Compras/Consultar_Compras.jsp";
            alert("Pedido Cancelado");
        </script>
<%
    } else {

    }
%>