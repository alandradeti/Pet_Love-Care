<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agendamento" class="Agendamento.AgendamentoDAO"/>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css//bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./agendar.css" >

        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/padrao.js"></script>
        <script src="../js/ajax.min.js"></script>
        <script src="../js/post.js"></script>
    </head>

    <body>
        <div class="modal fade modal_vacina" id="modal_agendamento">
            <div class="space_vacina">
                <button type="button" class="close close_modal_vacina mr-2 mt-1" 
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="tela_vacina">  
                    <div class="centralizar">
                        <img src="../../img/Logo/dog_sorrindo.png" 
                             alt="icone" class="tamanho_icone"/>
                        <h4 class="mt-3">Agende uma consulta</h4>
                    </div>
                    <form id="formCadastrarAgendamento">
                    <div class="col">
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
                                        <%
                                            ResultSet rsPet = pet.Consultar("SELECT Id_Pet,Nome_Pet FROM TB_Pet WHERE Cliente_Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                                            while (rsPet.next()) {
                                        %>
                                                <option value="<%=rsPet.getString("id_pet")%>"><%=rsPet.getString("nome_pet")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Veterinário:</label>
                                    <select name="id_veterinario" id="id_veterinario" class="form-control" required>
                                        <%
                                            ResultSet rsVeterinario = veterinario.Consultar("SELECT Id_Veterinario,Nome_Veterinario FROM TB_Veterinario");
                                            while (rsVeterinario.next()) {
                                        %>
                                                <option value="<%=rsVeterinario.getString("id_veterinario")%>"><%=rsVeterinario.getString("nome_veterinario")%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                                        
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Vacina:</label>
                                    <select name="id_vacina" id="id_vacina" class="form-control">   
                                        <%
                                            ResultSet rsVacina = vacina.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina");
                                            if(rsVacina.next()){
                                                do{
                                        %>      
                                                    <option value="<%=rsVacina.getString("id_vacina")%>"><%=rsVacina.getString("nome_vacina")%></option>
                                        <%      }while (rsVacina.next());
                                            }else{
                                        %> 
                                                <option value=""></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                                    
                            <div class="pst_btn_agendar">
                                <button class="btn btn_agendar mt-4 ">Agendar</button>
                            </div>
                        </div>
                    </form>
                    <div class="modal-dialog">

                    </div>
                </div>
            </div>
        </div>
    </body>

</html>

