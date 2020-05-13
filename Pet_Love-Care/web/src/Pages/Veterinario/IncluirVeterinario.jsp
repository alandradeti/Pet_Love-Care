<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>

<jsp:setProperty name="veterinario" property="nome_veterinario" value="${param.nome_veterinario}"/>
<jsp:setProperty name="veterinario" property="cpf_veterinario" value="${param.cpf_veterinario}"/>
<jsp:setProperty name="veterinario" property="rg_veterinario" value="${param.rg_veterinario}"/>
<jsp:setProperty name="veterinario" property="sexo_veterinario" value="${param.sexo_veterinario}"/>
<jsp:setProperty name="veterinario" property="endereco_veterinario" value="${param.endereco_veterinario}"/>
<jsp:setProperty name="veterinario" property="email_veterinario" value="${param.email_veterinario}"/>
<jsp:setProperty name="veterinario" property="telefone_fixo_veterinario" value="${param.telefone_fixo_veterinario}"/>
<jsp:setProperty name="veterinario" property="telefone_celular_veterinario" value="${param.telefone_celular_veterinario}"/>
<jsp:setProperty name="veterinario" property="data_nascimento_veterinario" value="${param.data_nascimento_veterinario}"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = veterinario.Incluir();
    if (resp == true) {
        //Código se verdadeiro
    } else {
        //Código se falso
    }
%>

