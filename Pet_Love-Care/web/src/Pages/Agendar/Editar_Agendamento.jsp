<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>--%>
<!DOCTYPE html>
<html lang="PT-BR">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./agendar.css" />

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
                <form id="formExcluirDadosVeterinario">
                    <input type="hidden" id="id_veterinario" name="id_veterinario" value="<%=request.getParameter("id_veterinario")%>">
                    <button class="btn btn-danger mt-2 btn_excluir" id="excluirVeterinario" name="excluirVeterinario">
                        <i class="fa fa-trash"></i>
                    </button> 
                </form>
                <a class="btn_voltar" href="./Consultar_Agendamento.html">
                    <i class="fa fa-arrow-left icone_plus"></i>
                </a>
                <div class="centralizar">
                    <img src="../../img/Logo/Gato_2cor.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Agendamento</h4>
                </div>

                <div class="col">
                    <form id="formCadastrarAgendamento">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="col-form-label login_label">Tipo de Agendamento:</label>
                                <select name="tipo_agendamento" id="tipo_agendamento" class="form-control" required>
                                    <option>Selecione</option>
                                    <option value="Consulta">Consulta</option>
                                    <option value="Vacina">Vacina</option>
                                    <option value="Banho e Tosa">Banho e Tosa</option>
                                    <option value="Hospedagem">Hospedagem</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-form-label login_label">Horário:</label>
                                <input type="time" class="form-control" name="horario_agendamento" 
                                       id="horario_agendamento" placeholder="Insira um horário" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Data:</label>
                                    <input type="date" class="form-control col-12" name="data_inicial_agendamento"
                                           id="data_inicial_agendamento" placeholder="Data" required />
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Data Final:</label>
                                    <input type="date" class="form-control col-12" name="data_final_agendamento"
                                           id="data_final_agendamento" placeholder="Data Final"/>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Pet:</label>
                                    <select name="id_pet" id="id_pet" class="form-control" required>

                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Veterinário:</label>
                                    <select name="id_veterinario" id="id_veterinario" class="form-control" required>

                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Vacina:</label>
                                    <select name="id_vacina" id="id_vacina" class="form-control">   

                                    </select>
                                </div>
                            </div>

                            <div class="pst_btn_agendar">
                                <button class="btn btn_agendar mt-4 ">Agendar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
    </body>
</html>
