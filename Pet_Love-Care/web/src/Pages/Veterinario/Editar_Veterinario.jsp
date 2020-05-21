<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./Veterinario.css" />

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
            <!-- FormulÃÂ¡rio -->
            <div class="card container mt-5 card_consulta">
                <button type="button" class="btn btn-danger btn_excluir mt-2">
                    <a>
                        <i class="fa fa-trash"></i>
                    </a>
                </button>
                <div class="centralizar">
                    <img src="../../img/Logo/mulher_veterinaria.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Veterinario(a)</h4>
                </div>
                    
                    <%
                        if(request.getParameter("id_veterinario")!=null){
                        ResultSet rsVeterinario = veterinario.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + request.getParameter("id_veterinario"));
                        if(rsVeterinario.next()){
                    %>
                    <form id="formAlterarDadosVeterinario">
                        <input type="hidden" name="id_veterinario" id="id_veterinario" value="<%=rsVeterinario.getString("id_veterinario")%>" />
                        <div class="col">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label mt-4 login_label">Nome Completo:</label>
                                    <input type="text" class="form-control" 
                                           name="nome_veterinario" id="nome_veterinario" placeholder="Nome do veterinÃ¡rio" value="<%=rsVeterinario.getString("nome_veterinario")%>" required />
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label mt-4 login_label">CPF:</label>
                                    <input type="text" class="form-control" 
                                           name="cpf_veterinario" id="cpf_veterinario" placeholder="CPF do veterinÃ¡rio" value="<%=rsVeterinario.getString("cpf_veterinario")%>" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label login_label">EndereÃ§o:</label>
                                        <input type="text" class="form-control" name="endereco_veterinario"
                                               id="endereco_veterinario" placeholder="Nome da rua"  value="<%=rsVeterinario.getString("endereco_veterinario")%>" required />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label login_label">Data de nascimento:</label>
                                        <input type="date" class="form-control" name="data_nascimento_veterinario"
                                               id="data_nascimento_veterinario" value="<%=rsVeterinario.getString("data_nascimento_veterinario")%>" required />
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label login_label">RG:</label>
                                        <input type="text" class="form-control col-12" 
                                               name="rg_veterinario" id="rg_veterinario" placeholder="RG do veterinÃ¡rio" value="<%=rsVeterinario.getString("rg_veterinario")%>" required />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label login_label">Sexo:</label>
                                        <select class="form-control col-12" name="sexo_veterinario"  id="sexo_veterinario" readonly>
                                            <option value="<%=rsVeterinario.getString("sexo_veterinario")%>"><%=rsVeterinario.getString("sexo_veterinario")%></option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Email:</label>
                                    <input type="text" class="form-control" 
                                           name="email_veterinario" id="email_veterinario"  value="<%=rsVeterinario.getString("email_veterinario")%>" required />
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Telefone Fixo:</label>
                                    <input type="text" class="form-control" 
                                           name="telefone_fixo_veterinario" id="telefone_fixo_veterinario"  value="<%=rsVeterinario.getString("telefone_fixo_veterinario")%>"  required />
                                </div>
                            </div>

                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Telefone Celular:</label>
                                    <input type="text" class="form-control" 
                                           name="telefone_celular_veterinario" id="telefone_celular_veterinario" value="<%=rsVeterinario.getString("telefone_celular_veterinario")%>"  required />
                                </div>
                            </div>

                            <div class="centralizar_btn"> 
                                <button class="btn btn_login mt-4 centralizar_btn mb-3">
                                    Alterar
                                </button>
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
