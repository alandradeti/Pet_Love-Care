<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./Veterinario.css" > 

        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/padrao.js"></script>

        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
        </script>
    </head>

    <body>
        <!-- Menu -->
        <div id="headerDiv"></div>
        <div class="background">
            <!-- FormulÃ¡rio -->
            <div class="card container mt-5 card_consulta">
                <div class="text-center mt-4">
                    <img src="../../img/Logo/veterinario_oculos.png" class="cabeca_gato">
                    <h3 class="mt-2">Consultar veterinário</h3>
                </div>
                <form id="formPesquisarNomeVeterinario" method="POST" action="VeterinarioConsultar.jsp">
                    <div class="form-group col-6">
                        <input type="text" name="nome_veterinario" id="nome_veterinario" />
                        <button type="submit" class="btn btn-danger mt-2" id="pesquisarVeterinario" name="pesquisarVeterinario">
                            <i class="fas fa-search"></i>
                        </button> 
                    </div>
                </form>
                <table class="table table-hover table-dark mt-4 responsive">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Telefone</th>
                            <th scope="col">CPF</th>
                            <th scope="col">Data de Nascimento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getParameter("pesquisarVeterinario") != null) {
                                ResultSet rsVeterinarioPesquisa = veterinario.Consultar("SELECT * FROM TB_Veterinario WHERE Nome_Veterinario = '" + request.getParameter("nome_veterinario") + "'");
                                if (rsVeterinarioPesquisa.isBeforeFirst() && !request.getParameter("nome_veterinario").isEmpty()) {
                                    while (rsVeterinarioPesquisa.next()) {
                        %>
                                        <tr class="text-center">
                                            <th scope="row"><%=rsVeterinarioPesquisa.getString("id_veterinario")%></th>
                                            <td id="nome_veterinario"><%=rsVeterinarioPesquisa.getString("nome_veterinario")%></td>
                                            <td id="telefone_veterinario"><%=rsVeterinarioPesquisa.getString("telefone_fixo_veterinario")%></td>
                                            <td id="cpf_veterinario"><%=rsVeterinarioPesquisa.getString("cpf_veterinario")%></td>
                                            <td id="data_nascimento_veterinario"><%=rsVeterinarioPesquisa.getString("data_nascimento_veterinario")%></td>
                                            <td>
                                                <form id="formAlterarVeterinario" method="POST" action="Editar_Veterinario.jsp">  
                                                    <input type="hidden" id="id_veterinario" name="id_veterinario" value="<%=rsVeterinarioPesquisa.getString("id_veterinario")%>">
                                                    <button href="Editar_Veterinario.jsp" id="alterarVeterinario" name="alterarVeterinario" class="btn btn-warning mt-2">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                        <%          }
                                } else if (request.getParameter("nome_veterinario").isEmpty()) {
                                    ResultSet rsVeterinario = veterinario.Consultar("SELECT * FROM TB_Veterinario");
                                    while (rsVeterinario.next()) {
                        %>
                                        <tr class="text-center">
                                            <th scope="row"><%=rsVeterinario.getString("id_veterinario")%></th>
                                            <td id="nome_veterinario"><%=rsVeterinario.getString("nome_veterinario")%></td>
                                            <td id="telefone_veterinario"><%=rsVeterinario.getString("telefone_fixo_veterinario")%></td>
                                            <td id="cpf_veterinario"><%=rsVeterinario.getString("cpf_veterinario")%></td>
                                            <td id="data_nascimento_veterinario"><%=rsVeterinario.getString("data_nascimento_veterinario")%></td>
                                            <td>
                                                <form id="formAlterarVeterinario" method="POST" action="Editar_Veterinario.jsp">  
                                                    <input type="hidden" id="id_veterinario" name="id_veterinario" value="<%=rsVeterinario.getString("id_veterinario")%>">
                                                    <button href="Editar_Veterinario.jsp" id="alteraVeterinario" name="alteraVeterinario" class="btn btn-warning mt-2">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                    <%
                                    }
                                } else {
                    %>
                                    <h1>Não Possui Registros</h1>
                    <%          }
                        } else {
                            ResultSet rsVeterinario = veterinario.Consultar("SELECT * FROM TB_Veterinario");
                            while (rsVeterinario.next()) {
                    %>
                                <tr class="text-center">
                                    <th scope="row"><%=rsVeterinario.getString("id_veterinario")%></th>
                                        <td id="nome_veterinario"><%=rsVeterinario.getString("nome_veterinario")%></td>
                                        <td id="telefone_veterinario"><%=rsVeterinario.getString("telefone_fixo_veterinario")%></td>
                                        <td id="cpf_veterinario"><%=rsVeterinario.getString("cpf_veterinario")%></td>
                                        <td id="data_nascimento_veterinario"><%=rsVeterinario.getString("data_nascimento_veterinario")%></td>
                                    <td>
                                        <form id="formAlterarVeterinario" method="POST" action="Editar_Veterinario.jsp">  
                                            <input type="hidden" id="id_veterinario" name="id_veterinario" value="<%=rsVeterinario.getString("id_veterinario")%>">
                                            <button href="Editar_Veterinario.jsp" id="alteraVeterinario" name="alteraVeterinario" class="btn btn-warning mt-2">
                                                <i class="fa fa-pen icone_plus"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                </form>
            </div>
        </div>

        <div id="header_veterinario"></div>

    </body>

</html>
