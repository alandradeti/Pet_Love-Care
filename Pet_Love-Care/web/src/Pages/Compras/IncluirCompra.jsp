<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="compra" class="Compra.CompraDAO"/>
<jsp:useBean id="carrinho" class="Compra.CarrinhoDAO"/>

<jsp:setProperty name="carrinho" property="*"/>
<jsp:setProperty name="compra" property="id_cliente" value="${param.id_cliente}"/>
<jsp:setProperty name="compra" property="data_compra" value="${param.data_compra}"/>
<jsp:setProperty name="compra" property="valor_compra" value="${param.valor_compra}"/>
<jsp:setProperty name="compra" property="tipo_pagamento_compra" value="${param.tipo_pagamento_compra}"/>
<jsp:setProperty name="compra" property="numero_cartao" value="${param.numero_cartao}"/>
<jsp:setProperty name="compra" property="numero_seguranca_cartao" value="${param.numero_seguranca_cartao}"/>
<jsp:setProperty name="compra" property="numero_parcela" value="${param.numero_parcela}"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = compra.Incluir();
    if (resp == true) {
        Boolean respCarrinho = carrinho.LimparCarrinho(Integer.parseInt(request.getParameter("id_cliente")));
        if (resp == true) {
        }else{
        }
    } else {
        //Código se falso
    }
%>

