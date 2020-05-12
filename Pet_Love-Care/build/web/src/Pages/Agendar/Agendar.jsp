<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
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
  
  <script>
    $(function () {
      $("#headerDiv").load("../Menu/Menu.html");
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
      <img src="../../img/Logo/Gato-cabeca.png" class="cabeca_gato">
      <h3>Agende uma consulta</h3>
    </div>
    <form>
      <div class="col">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label class="col-form-label login_label">Tipo de Agendamento:</label>
                <select name="tipo_agendamento" id="tipo_agendamento" class="form-control" required>
                    <option>Selecione</option>
                    <option value="Consulta">Consulta</option>
                    <option value="Vacina">Vacina</option>
                    <option value="Banho e Tosa">Banho e Tosa</option>
                </select>
            </div>
          <div class="form-group col-md-6">
            <label class="col-form-label mt-4 login_label">Horário:</label>
            <input type="time" class="form-control" 
                   id="Horario_Agendamento" placeholder="Insira um horÃ¡rio" required />
          </div>
        </div>
          
        <div class="form-group">
           <div class="form-row">
            <div class="form-group col-md-6">
                <label class="col-form-label login_label">Data:</label>
                <input type="date" class="form-control col-12" 
                     id="Data_Agendamento" placeholder="Data dpara consulta" required />
            </div>
            <div class="form-group col-md-6">
            <label class="col-form-label login_label">Vacina:</label>
            <input type="email" class="form-control col-12" 
                 id="Vacina_ID_Vacina" placeholder="Nome da vacÃ­na" required />
            </div>
        </div>
          
        <div class="form-row">
            <div class="form-group col-md-6">
             <label class="col-form-label login_label">Veterinário:</label>
              <select name="id_pet" id="id_pet" class="form-control" required>
                  <%
                        ResultSet rsPet = cliente.Consultar("SELECT Id_Pet,Nome_Pet FROM TB_Pet WHERE Cliente_Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                        while(rsPet.next()){
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
                        ResultSet rsVeterinario = cliente.Consultar("SELECT Id_Veterinario,Nome_Veterinario FROM TB_Veterinario");
                        while(rsVeterinario.next()){
                  %>
                            <option value="<%=rsVeterinario.getString("id_veterinario")%>"><%=rsVeterinario.getString("nome_veterinario")%></option>
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
  </div>
</div>
</body>

</html>


<!--    RemoÃ§Ãµes
<div class="form-group col-md-6">
              <label class="col-form-label mt-4 login_label">Data:</label>
              <input type="date" class="form-control" placeholder="Insira um nome de usuÃ¡rio" required />
            </div>
<label class="col-form-label login_label">Nome do Pet:</label>
          <input type="text" class="form-control col-12" placeholder="Insira o nome do animal..." required />

          <label class="col-form-label login_label">Categoria:</label>
          <select type="text" class="form-control col-12" placeholder="Insira um nome de usuÃ¡rio" required>
            <option>Selecione uma categoria</option>
            <option>Consulta de rotina</option>
            <option>Consulta emergencial!</option>
            <option>CastraÃ§Ã£o</option>
          </select>-->