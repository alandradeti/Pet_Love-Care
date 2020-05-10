<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="classesBanco.ClienteDAO"/>
<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IncluirCliente</title>
    </head>
    <body>
        <p>     
            <jsp:setProperty name="cliente" property="nome_cliente" value="${param.nome_cliente}"/>
            <jsp:setProperty name="cliente" property="cpf_cliente" value="${param.cpf_cliente}"/>
            <jsp:setProperty name="cliente" property="rg_cliente" value="${param.rg_cliente}"/>
            <jsp:setProperty name="cliente" property="sexo_cliente" value="${param.sexo_cliente}"/>
            <jsp:setProperty name="cliente" property="endereco_cliente" value="${param.endereco_cliente}"/>
            <jsp:setProperty name="cliente" property="email_cliente" value="${param.email_cliente}"/>
            <jsp:setProperty name="cliente" property="telefone_fixo_cliente" value="${param.telefone_fixo_cliente}"/>
            <jsp:setProperty name="cliente" property="telefone_celular_cliente" value="${param.telefone_celular_cliente}"/>
            <jsp:setProperty name="cliente" property="data_nascimento_cliente" value="${param.data_nascimento_cliente}"/>
            <jsp:setProperty name="cliente" property="senha_cliente" value="${param.senha_cliente}"/>
            
            <!-- Tratamento de redirecionamento da pagina -->
            <%
                Boolean resp = cliente.Incluir();
                if(resp == true){
                    //Código se verdadeiro
                }else{
                    //Código se falso
                }
            %>
        </p>
        <p><a href="../Home/Home.html">Menu</a></p>
    </body>
</html>
