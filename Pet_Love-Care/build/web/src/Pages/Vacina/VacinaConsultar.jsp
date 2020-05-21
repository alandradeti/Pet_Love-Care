<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<!DOCTYPE html>
<html lang="PT-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./Vacina.css"> 
        <link rel="stylesheet" href="../css/modal.css"> 
      
        <script src="../js/ajax.min.js"></script>
        <script src="../js/post.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/padrao.js"></script>
        
        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
            $(function () {
                $("#header_vacina").load("./Cadastrar_Vacina.html");
            });
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            });
        </script>
    </head>

    <body>
        <!-- Menu -->
        <div id="headerDiv"></div>
        
        <div class="background">
            <!-- FormulÃ¡rio -->
            <div class="card container mt-5 card_consulta">
                <button type="button" class="btn btn_cadastrar mt-2"
                        data-toggle="modal" data-target="#modal_vacina">
                    <a class="btn_vacina" data-toggle="modal">
                        <i class="fa fa-plus icone_plus"></i>
                    </a>
                </button>
                <div class="text-center mt-4">
                    <img src="../../img/Logo/Vacina_pata.png" class="cabeca_gato">
                    <h3 class="mt-2">Vacinas disponíveis</h3>
                </div>
                <form id="formPesquisarNomeVacina" method="POST" 
                      action="VacinaConsultar.jsp" class="form-inline my-2 my-lg-0">
                    <div class="form-group col-6">

                        <input type="text" name="nome_vacina" id="nome_vacina" 
                               class="form-control mr-sm-2 search"/>
                        <button type="submit" 
                                class="btn btn-outline-success my-2 my-sm-0 btn_search" id="pesquisarVacina" name="pesquisarVacina">
                            <i class="fas fa-search"></i>
                        </button> 
                    </div>
                </form>
				
                <table id="tbVacina" class="table table-hover table-dark mt-4 responsive">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Descrição</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getParameter("pesquisarVacina") != null) {
                                ResultSet rsVacinaPesquisa = vacina.Consultar("SELECT * FROM TB_Vacina WHERE Nome_Vacina = '" + request.getParameter("nome_vacina") + "'");
                                if (rsVacinaPesquisa.isBeforeFirst() && !request.getParameter("nome_vacina").isEmpty()) {
                                    while (rsVacinaPesquisa.next()) {
                        %>
                                        <tr class="text-center">
                                            <th scope="row"><%=rsVacinaPesquisa.getString("id_vacina")%></th>
                                            <td id="nome_vacina"><%=rsVacinaPesquisa.getString("nome_vacina")%></td>
                                            <td id="valor_vacina"><%=rsVacinaPesquisa.getString("valor_vacina")%></td>
                                            <td id="descricao_vacina"><%=rsVacinaPesquisa.getString("descricao_vacina")%></td>
                                            <td>
                                            <div class="row btn_tabela_acoes">
                                                <form id="formAlterarVacina" method="POST" action="Editar_Vacina.jsp">  
                                                    <input type="hidden" id="id_vacina" name="id_vacina" value="<%=rsVacinaPesquisa.getString("id_vacina")%>">
                                                    <button href="Editar_Vacina.jsp" id="alterarVacina" name="alterarVacina" class="btn btn-warning">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                                <form id="formExcluirDadosVacina">
                                                    <input type="hidden" id="id_vacina" name="id_vacina" value="<%=rsVacinaPesquisa.getString("id_vacina")%>">
                                                    <button class="btn btn-danger" id="excluirVacina" name="excluirVacina">
                                                        <i class="fa fa-trash icone_plus"></i>
                                                    </button> 
                                                </form>
                                            </div>
                                            </td>
                                        </tr>
                        <%          }
                                } else if (request.getParameter("nome_vacina").isEmpty()) {
                                    ResultSet rsVacina = vacina.Consultar("SELECT * FROM TB_Vacina");
                                    while (rsVacina.next()) {
                        %>
                                        <tr class="text-center">
                                            <th scope="row"><%=rsVacina.getString("id_vacina")%></th>
                                            <td id="nome_vacina"><%=rsVacina.getString("nome_vacina")%></td>
                                            <td id="valor_vacina"><%=rsVacina.getString("valor_vacina")%></td>
                                            <td id="descricao_vacina"><%=rsVacina.getString("descricao_vacina")%></td>
                                            <td>
                                            <div class="row btn_tabela_acoes">
                                                <form id="formAlterarVacina" method="POST" action="Editar_Vacina.jsp">  
                                                    <input type="hidden" id="id_vacina" name="id_vacina" value="<%=rsVacina.getString("id_vacina")%>">
                                                    <button href="Editar_Vacina.jsp" id="alteraVacina" name="alteraVacina" class="btn btn-warning">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                                    <form id="formExcluirDadosVacina">
                                                    <input type="hidden" id="id_vacina" name="id_vacina" value="<%=rsVacina.getString("id_vacina")%>">
                                                    <button class="btn btn-danger" id="excluirVacina" name="excluirVacina">
                                                        <i class="fa fa-trash icone_plus"></i>
                                                    </button> 
                                                </form>
                                            </div>
                                            </td>
                                        </tr>
                    <%
                                    }
                                } else {
                    %>
                                    <code>Não Possui Registros</code>
                    <%          }
                        } else {
                            ResultSet rsVacina = vacina.Consultar("SELECT * FROM TB_Vacina");
                            while (rsVacina.next()) {
                    %>
                                <tr class="text-center">
                                    <th scope="row"><%=rsVacina.getString("id_vacina")%></th>
                                    <td id="nome_vacina"><%=rsVacina.getString("nome_vacina")%></td>
                                    <td id="valor_vacina"><%=rsVacina.getString("valor_vacina")%></td>
                                    <td id="descricao_vacina"><%=rsVacina.getString("descricao_vacina")%></td>
                                    <td>
                                      <div class="row btn_tabela_acoes">
                                        <form id="formAlterarVacina" method="POST" action="Editar_Vacina.jsp">  
                                            <input type="hidden" id="id_vacina" name="id_vacina" value="<%=rsVacina.getString("id_vacina")%>">
                                            <button href="Editar_Vacina.jsp" id="alteraVacina" name="alteraVacina" class="btn btn-warning">
                                                <i class="fa fa-pen icone_plus"></i>
                                            </button>
                                        </form>
                                        <form id="formExcluirDadosVacina">
                                            <input type="hidden" id="id_vacina" name="id_vacina" value="<%=rsVacina.getString("id_vacina")%>">
                                            <button class="btn btn-danger ml-2" id="excluirVacina" name="excluirVacina">
                                                <i class="fa fa-trash icone_plus"></i>
                                            </button> 
                                        </form>
                                      </div>
                                    </td>
                                </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
      <div id="header_vacina"></div>
    </body>
</html>