<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AlterarCliente</title>
    </head>
    <body>
        <p>
            <jsp:setProperty name="cliente" property="*"/>
            <%
                if(cliente.Alterar(Integer.parseInt(request.getParameter("id_cliente"))))
                    out.println("Dados alterados");
                else
                    out.println("Erro ao alterar");
            %>
         </p>
    </body>
</html>
