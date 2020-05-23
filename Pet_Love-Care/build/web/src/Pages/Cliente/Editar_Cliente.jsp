<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./cliente.css" > 

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
                <form id="formExcluirDadosCliente">
                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=request.getParameter("id_cliente")%>">
                    <button class="btn btn-danger mt-2 btn_excluir" id="excluirCliente" name="excluirCliente">
                            <i class="fa fa-trash icone_plus"></i>
                    </button> 
                </form>
                <a class="btn_voltar" href="./ClienteConsultar.jsp">
                    <i class="fas fa-arrow-left icone_plus"></i>
                </a>
                <div class="centralizar">
                    <img src="../../img/Logo/mulher.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Cliente</h4>
                </div>
                    <%
                        if(request.getParameter("id_cliente")!=null){
                        ResultSet rsCliente = cliente.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + request.getParameter("id_cliente"));
                        if(rsCliente.next()){
                    %>
                <form id="formAlterarDadosCliente">
                    <input type="hidden" name="id_cliente" id="id_cliente" value="<%=rsCliente.getString("id_cliente")%>" />
                    <div class="col">
                        <div class="form-row">
                            <div class="form-row col-12">
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label"
                                           >Nome Completo</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="nome_cliente"
                                        id="nome_cliente"
                                        placeholder="Insira o seu Nome"
                                        value="<%=rsCliente.getString("nome_cliente")%>"
                                        required
                                        />
                                </div>

                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">CPF</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="cpf_cliente"
                                        id="cpf_cliente"
                                        placeholder="Insira o seu CPF..."
                                        value="<%=rsCliente.getString("cpf_cliente")%>"
                                        required
                                        />
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">RG</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="rg_cliente"
                                        id="rg_cliente"
                                        placeholder="Insira o seu RG..."
                                        value="<%=rsCliente.getString("rg_cliente")%>"
                                        required
                                        />
                                </div>
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Email</label>
                                    <input
                                        type="email"
                                        class="form-control"
                                        name="email_cliente"
                                        id="email_cliente"
                                        placeholder="Email vÃ¡lido..."
                                        value="<%=rsCliente.getString("email_cliente")%>"
                                        required
                                        />
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Telefone</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="telefone_fixo_cliente"
                                        id="telefone_fixo_cliente"
                                        placeholder="(11) 1111-1111"
                                        value="<%=rsCliente.getString("telefone_fixo_cliente")%>"
                                        required
                                        />
                                </div>
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Celular</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="telefone_celular_cliente"
                                        id="telefone_celular_cliente"
                                        placeholder="(11) 99999-9999"
                                        value="<%=rsCliente.getString("telefone_celular_cliente")%>"
                                        required
                                        />
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Senha</label>
                                    <input
                                        type="password"
                                        class="form-control"
                                        name="senha_cliente"
                                        id="senha_cliente"
                                        placeholder="Insira uma senha"
                                        value="<%=rsCliente.getString("senha_cliente")%>"
                                        required
                                        />
                                </div>
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Sexo</label>
                                    <select class="form-control" name="sexo_cliente" id="sexo_cliente">
                                        <% if (rsCliente.getString("sexo_cliente").equals("M")){ %>
                                                    <option value="<%=rsCliente.getString("sexo_cliente")%>">Masculino</option>
                                        <% }else{ %>
                                                    <option value="<%=rsCliente.getString("sexo_cliente")%>">Feminino</option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">EndereÃ§o</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="endereco_cliente"
                                        id="endereco_cliente"
                                        placeholder="Nome da rua"
                                        value="<%=rsCliente.getString("endereco_cliente")%>"
                                        required
                                        />
                                </div>
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Data Nascimento</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        name="data_nascimento_cliente"
                                        id="data_nascimento_cliente"
                                        placeholder="Nome da rua"
                                        value="<%=rsCliente.getString("data_nascimento_cliente")%>"
                                        required
                                        />
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Tipo de Conta</label>
                                    <select class="form-control" name="tipo_cliente" id="tipo_cliente" readonly required>
                                        <option value="<%=rsCliente.getString("tipo_cliente")%>"><%=rsCliente.getString("tipo_cliente")%></option>
                                    </select>
                                </div>
                                <div class="form-group col-6">
                                    <label class="col-form-label login_label">Código funcionário</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="codigo_funcionario"
                                        id="codigo_funcionario"
                                        placeholder="Código do funcionário"
                                        value="<%=rsCliente.getString("codigo_funcionario")%>"
                                        />
                                </div>
                            </div>
                        </div>
                        <div class="centralizar">
                            <button class="btn btn_login mt-4">Editar</button>
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