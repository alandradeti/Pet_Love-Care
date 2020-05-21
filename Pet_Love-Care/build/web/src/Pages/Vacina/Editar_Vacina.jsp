<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./Vacina.css" />
        
        
        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/ajax.min.js"></script>
        <script src="../js/post.js"></script>
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
            <!-- FormulÃÂ¡rio -->
            <div class="card container card_consulta">
                    <a class="btn_voltar" href="./VacinaConsultar.jsp">
                        <i class="fas fa-arrow-left icone_plus"></i>
                    </a>
                    <form id="formExcluirDadosVacina">
                        <input type="hidden" id="id_vacina" name="id_vacina" value="<%=request.getParameter("id_vacina")%>">
                        <button type="submit" class="btn btn-danger" id="excluirVacina" name="excluirVacina">
                            <i class="fa fa-trash icone_plus"></i>
                        </button> 
                    </form>
                <div class="text-center mt-4">
                    <img src="../../img/Logo/cachorro_dodoi.png" class="cabeca_gato">
                    <h3>Editar Vacina</h3>
                </div>
                
                <%
                    if(request.getParameter("id_vacina")!=null){
                    ResultSet rsVacina = vacina.Consultar("SELECT * FROM tb_vacina WHERE Id_Vacina = " + request.getParameter("id_vacina"));
                    if(rsVacina.next()){
                %>
                        <form id="formAlterarDadosVacina">
                            <input type="hidden" name="id_vacina" id="id_vacina" value="<%=rsVacina.getString("id_vacina")%>" />
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label mt-3">Nome</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="nome_vacina"
                                        id="nome_vacina"
                                        placeholder="Insira o nome da vacina"
                                        required
                                        value="<%=rsVacina.getString("nome_vacina")%>"
                                        />
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label mt-3">Valor</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="valor_vacina"
                                        id="valor_vacina"
                                        placeholder="Preço R$ "
                                        required
                                        value="<%=rsVacina.getString("valor_vacina")%>"
                                        />
                                </div>
                            </div>

                            <label class="col-form-label login_label">Descrição</label>
                            <input
                                class="form-control"
                                input="text"
                                name="descricao_vacina"
                                id="descricao_vacina"
                                placeholder="Descrição"
                                required
                                value="<%=rsVacina.getString("descricao_vacina")%>"
                                >
                            <div class="centralizar_btn"> 
                                <button class="btn btn_login mt-4 centralizar_btn mb-3">
                                    Alterar
                                </button>
                            </div>
                        </form>
                                
                                
                       <%
                }
                else{
                    out.println("Nenhum registro");
                }
            }
            %>
            </div>
        </div>
    </body>
</html>
