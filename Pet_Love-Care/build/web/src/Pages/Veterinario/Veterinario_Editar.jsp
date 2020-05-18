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
    </head>

    <body>
        <!-- FormulÃ¡rio de login -->
        <div class="modal fade modal_veterinario" id="modal_veterinario">
            <div class="space_veterinario">
                
                <button type="button" 
                        class="close close_modal_veterinario mr-2 mt-1" 
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
                <div class="tela_veterinario">  
                    <div class="centralizar">
                        <img src="../../img/Logo/mulher_veterinaria.png" 
                             alt="icone" class="tamanho_icone"/>
                        <h4 class="mt-3">Editar VeterinÃ¡rio</h4>
                    </div>
                    <input type="text" class="form-control" name="id_veterinario" id="id_veterinario" required />
                    
                    <%
                        if(request.getParameter("alterarVeterinario")!=null){
                            ResultSet rsVeterinario = veterinario.Consultar("SELECT * FROM tb_veterinario WHERE id_veterinario = " + request.getParameter("id_veterinario"));
                            if(rsVeterinario.next()){

                    %>
                                <form id="formAlterarVeterinario">
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
                                                    <select class="form-control col-12" name="sexo_veterinario"  id="sexo_veterinario" disabled>
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

                                        <div class="pst_btn_agendar">
                                            <button class="btn btn_agendar mt-3 mb-3">Editar</button>
                                        </div>
                                    </div>
                                </form>
                    <%
                            }else{
                                out.println("Nenhum registro");
                            }
                        }
                    %>
                    <div class="modal-dialog">

                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
