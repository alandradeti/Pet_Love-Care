<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pet" class="Pet.PetDAO"/>

<jsp:setProperty name="pet" property="especie_pet" value="${param.especie_pet}"/>
<jsp:setProperty name="pet" property="nome_pet" value="${param.nome_pet}"/>
<jsp:setProperty name="pet" property="raca_pet" value="${param.raca_pet}"/>
<jsp:setProperty name="pet" property="idade_pet" value="${param.idade_pet}"/>
<jsp:setProperty name="pet" property="porte_pet" value="${param.porte_pet}"/>
<jsp:setProperty name="pet" property="peso_pet" value="${param.peso_pet}"/>
<jsp:setProperty name="pet" property="altura_pet" value="${param.altura_pet}"/>
<jsp:setProperty name="pet" property="sexo_pet" value="${param.sexo_pet}"/>
<jsp:setProperty name="pet" property="castracao_pet" value="${param.castracao_pet}"/>
<jsp:setProperty name="pet" property="cor_pelagem_pet" value="${param.cor_pelagem_pet}"/>
<jsp:setProperty name="pet" property="cliente_id_cliente" value="<%= session.getAttribute("id_cliente")%>"/>

<!-- Tratamento de redirecionamento da pagina -->
<%
    Boolean resp = pet.Incluir();
    if (resp == true) {
        //Código se verdadeiro
    } else {
        //Código se falso
    }
%>