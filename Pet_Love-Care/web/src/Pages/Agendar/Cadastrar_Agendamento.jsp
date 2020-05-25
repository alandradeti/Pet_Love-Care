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
        <script src="../js/petUtils.js"></script>

        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
            
            function enable(){
                if(document.getElementById("tipo_agendamento").value === 'Vacina'){
                   document.getElementById("id_vacina").disabled = false;
                }else{ 
                   document.getElementById("id_vacina").disabled = true;
                }
                if(document.getElementById("tipo_agendamento").value === 'Hospedagem'){
                    document.getElementById("data_final_agendamento").disabled = false;
                }else{
                   document.getElementById("data_final_agendamento").disabled = true;
                } 
            }
        </script>
    </head>

    <body>
        <!-- Menu -->
        <div id="headerDiv"></div>
        <div class="background">
            <!-- FormulÃ¡rio -->
            <div class="card container mt-5 card_consulta">
                <a class="btn_voltar" href="./Consultar_Agendamento.jsp">
                    <i class="fa fa-arrow-left icone_plus"></i>
                </a>
                <div class="text-center mt-4">
                    <img src="../../img/Logo/Gato-cabeca.png" class="cabeca_gato">
                    <h3>Agende uma consulta</h3>
                </div>
                <form id="formCadastrarAgendamento">
                    <div class="col">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="col-form-label login_label">Tipo de Agendamento:</label>
                                <select onclick="enable()" name="tipo_agendamento" id="tipo_agendamento" class="form-control" required>
                                    <option>Selecione</option>
                                    <option value="Consulta">Consulta</option>
                                    <option value="Vacina">Vacina</option>
                                    <option value="Banho e Tosa">Banho e Tosa</option>
                                    <option value="Hospedagem">Hospedagem</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                 <label class="col-form-label login_label">Horários Disponíveis:</label>
                                <select name="horario_agendamento" id="horario_agendamento" class="form-control" required>
                                        <%   
                                            ResultSet rsHorarioAgendamento1 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '09:00'");
                                            if(!rsHorarioAgendamento1.next()){
                                        %>
                                                <option  value="09:00">9:00h</option>
                                        <%  }
                                        %>  
                                        <%   
                                            ResultSet rsHorarioAgendamento2 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '10:00'");
                                            if(!rsHorarioAgendamento2.next()){
                                        %>
                                                <option  value="10:00">10:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento3 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '11:00'");
                                            if(!rsHorarioAgendamento3.next()){
                                        %>
                                                <option  value="11:00">11:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento4 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '12:00'");
                                            if(!rsHorarioAgendamento4.next()){
                                        %>
                                                <option  value="12:00">12:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento5 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '14:00'");
                                            if(!rsHorarioAgendamento5.next()){
                                        %>
                                                <option  value="14:00">14:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento6 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '15:00'");
                                            if(!rsHorarioAgendamento6.next()){
                                        %>
                                                <option  value="15:00">15:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento7 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '16:00'");
                                            if(!rsHorarioAgendamento7.next()){
                                        %>
                                                <option  value="16:00">16:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento8 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '17:00'");
                                            if(!rsHorarioAgendamento8.next()){
                                        %>
                                                <option  value="17:00">17:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento9 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '18:00'");
                                            if(!rsHorarioAgendamento9.next()){
                                        %>
                                                <option  value="18:00">18:00h</option>
                                        <%  }
                                        %>
                                        <%   
                                            ResultSet rsHorarioAgendamento10 = agendamento.Consultar("SELECT Data_Inicial_Agendamento,Horario_Agendamento FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Horario_Agendamento = '19:00'");
                                            if(!rsHorarioAgendamento10.next()){
                                        %>
                                                <option  value="19:00">19:00h</option>
                                        <%  }
                                        %>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                <label class="col-form-label login_label">Data:</label>
                                 <input type="text" class="form-control col-12 date-mask" onkeypress="customDateMask(this)" maxlength="10" name="data_inicial_agendamento"
                                           id="data_inicial_agendamento" placeholder="Data" value="<%=request.getParameter("data_inicial_agendamento")%>" required />
                                </div>
                                 <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Data Final:</label>
                                    <input type="text" class="form-control col-12" name="data_final_agendamento" onkeypress="customDateMask(this)" maxlength="10"
                                           id="data_final_agendamento" placeholder="Data Final" disabled/>
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
                                    <select name="id_vacina" id="id_vacina" class="form-control" disabled>
                                            <option value=""></option>
                                        <%
                                            ResultSet rsVacina = agendamento.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina");
                                            if(rsVacina.next()){
                                                do{
                                        %>      
                                                    <option value="<%=rsVacina.getString("id_vacina")%>"><%=rsVacina.getString("nome_vacina")%></option>
                                        <%      }while (rsVacina.next());
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
            </div>
        </div>
    </body>

</html>

