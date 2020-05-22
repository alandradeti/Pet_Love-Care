<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./pet.css" />

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
            <!-- FormulÃÂÃÂ¡rio -->
            <div class="card container mt-5 card_consulta">
                <a class="btn_voltar" href="./Consultar_Pet.html">
                        <i class="fas fa-arrow-left icone_plus"></i>
                 </a>
                <form id="formExcluirDadosPet">
                    <input type="hidden" id="id_pet" name="id_pet" value="<%=request.getParameter("id_pet")%>">
                    <button type="submit" class="btn btn-danger" id="excluirVacina" name="excluirPet">
                        <i class="fa fa-trash icone_plus"></i>
                    </button> 
                </form>
                <div class="centralizar">
                    <img src="../../img/Logo/dog_cinza.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Pet</h4>
                </div>
                <%
                    if(request.getParameter("id_pet")!=null){   
                        ResultSet rsPet = pet.Consultar("SELECT * FROM tb_pet WHERE Id_Pet = " + request.getParameter("id_pet"));
                        if(rsPet.next()){
                %>
                            <form id="formAlterarDadosPet">
                                <input type="hidden" class="form-control" name="id_pet" id="id_pet" value="<%=rsPet.getString("id_pet")%>" required />
                                <input type="hidden" class="form-control" name="id_cliente" id="id_cliente" value="<%=rsPet.getString("cliente_id_cliente")%>" required />
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Especie:</label>
                                            <select class="form-control col-12" name="especie_pet" id="especie_pet" readonly>
                                                <option value="<%=rsPet.getString("especie_pet")%>"><%=rsPet.getString("especie_pet")%></option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Nome do Pet:</label>
                                            <input type="text" class="form-control col-12" 
                                                   name="nome_pet" id="nome_pet" placeholder="Insira um nome" value="<%=rsPet.getString("nome_pet")%>" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Raça do Pet:</label>
                                            <input type="text" class="form-control col-12" 
                                                   name="raca_pet" id="raca_pet" value="<%=rsPet.getString("raca_pet")%>" placeholder="Raça do Pet" required />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Idade:</label>
                                            <input type="text" class="form-control col-12" 
                                                   name="idade_pet" id="idade_pet" placeholder="Idade do Pet" value="<%=rsPet.getString("idade_pet")%>" required />
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Porte:</label>
                                            <select class="form-control col-12" name="porte_pet" id="porte_pet" readonly>
                                                <option value="<%=rsPet.getString("porte_pet")%>"><%=rsPet.getString("porte_pet")%></option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Peso:</label>
                                            <input type="text" class="form-control" 
                                                   name="peso_pet" id="peso_pet" placeholder="Peso do Pet KG." value="<%=rsPet.getString("peso_pet")%>" required />
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Altura:</label>
                                            <input type="text" class="form-control" 
                                                   name="altura_pet" id="altura_pet" placeholder="Altura Pet..." value="<%=rsPet.getString("altura_pet")%>" required />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Sexo:</label>
                                            <select class="form-control" name="sexo_pet" id="sexo_pet" required>
                                                <% if (rsPet.getString("sexo_pet").equals("M")){ %>
                                                    <option value="<%=rsPet.getString("sexo_pet")%>">Masculino</option>
                                                <% }else{ %>
                                                    <option value="<%=rsPet.getString("sexo_pet")%>">Feminino</option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Cor:</label>
                                            <input type="text" class="form-control" 
                                                   name="cor_pelagem_pet" id="cor_pelagem_pet" placeholder="Cor do Pet..."  value="<%=rsPet.getString("cor_pelagem_pet")%>" required />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label login_label">Castrado:</label>
                                            <select class="form-control" name="castracao_pet" id="castracao_pet" required>
                                                <% if (rsPet.getInt("castracao_pet") == 1){ %>
                                                    <option value="<%=rsPet.getInt("castracao_pet")%>">Sim</option>
                                                <% }else{ %>
                                                    <option value="<%=rsPet.getInt("castracao_pet")%>">Não</option>
                                                <% } %>
                                                <option value="1">Sim</option>
                                                <option value="0">Não</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="pst_btn_agendar">
                                        <button class="btn btn_agendar mt-4 ">Alterar</button>
                                    </div>
                                </div>
                            </form>
            <%
                        }else{
                            out.println("Nenhum registro");
                        }
                    }
            %>
            </div>
        </div>
    </body>
</html>

