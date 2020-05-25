<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agendamento" class="Agendamento.AgendamentoDAO"/>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<%
    ResultSet rs = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
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
                $("#headerDiv").load("../Menu/Menu.jsp");
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
                <%
                    if(rs.next()){
                        if (rs.getBoolean("Tipo_Cliente") == false){
                %>
                            <form id="formEnviaData" method="POST" action="Cadastrar_Agendamento.jsp"
                                  class="mt-1">
                                    <input type="text" class="form-control input_date col-3" name="data_inicial_agendamento"
                                            id="data_inicial_agendamento" placeholder="Data..." 
                                            style="position: absolute;" required />
                                    <button type="submit" id="data_agendamento" 
                                            name="data_agendamento" class="btn btn_cadastrar mt-2">
                                        <a class="btn_vacina">
                                            <i class="fa fa-plus icone_plus"></i>
                                        </a>
                                    </button>
                            </form>
                <%
                        }
                    }
                %>
                
                <div class="text-center mt-4">
                    <img src="../../img/Logo/dog_coleira.png" class="cabeca_gato">
                    <h3 class="mt-2">Consultar Agendamento</h3>
                </div>
                <form id="formPesquisarAgendamento" method="POST" 
                      action="Consultar_Agendamento.jsp" 
                      class="form-inline my-2 my-lg-0 form">
                    <div class="form-group col-6" style="margin-top: 30px">
                        <%                           
                                if (rs.getBoolean("Tipo_Cliente") == true){
                        %>
                                    <label class="label_agendamento" style="position: absolute;">Cliente:</label>
                                    <select class="form-control select_agendamento col-4" name="id_cliente" id="id_cliente">
                                        <option value="">Todos</option>
                        <%              ResultSet rsPetPesquisa = pet.Consultar("SELECT DISTINCT Cliente_Id_Cliente FROM TB_Pet");
                                        while(rsPetPesquisa.next()){
                                            ResultSet rsClientePet = pet.Consultar("SELECT Id_Cliente, Nome_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsPetPesquisa.getString("cliente_id_cliente"));
                                            while(rsClientePet.next()){
                        %>          
                                                <option value="<%=rsClientePet.getString("id_cliente")%>"><%=rsClientePet.getString("nome_cliente")%></option> 
                        <%
                                            }
                                        }
                        %>
                                    </select>
                        <%      }else{
                        %>
                                    <label class="label_agendamento" style="position: absolute;">Pet:</label>
                                    <select class="form-control select_agendamento  col-4" name="id_pet" id="id_pet">
                                        <option value="">Todos</option>
                        <%              ResultSet rsPetPesquisa = pet.Consultar("SELECT Nome_Pet, Id_pet FROM TB_Pet WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                        while(rsPetPesquisa.next()){
                        %>          
                                                <option value="<%=rsPetPesquisa.getString("id_pet")%>">ID (<%=rsPetPesquisa.getString("id_pet")%>) - <%=rsPetPesquisa.getString("nome_pet")%></option> 
                        <%
                                        }
                        %>
                                    </select>
                        <%
                                }
                        %>
                        <input type="text" name="data_inicial_agendamento" 
                               class="form-control input_agendamento"
                               id="data_inicial_agendamento"  placeholder="Data"/>
                        <button type="submit" 
                                class="btn btn-outline-success my-2 my-sm-0 btn_search" 
                                id="pesquisarAgendamento" name="pesquisarAgendamento">
                            <i class="fas fa-search"></i>
                        </button> 
                    </div>
                </form>
                <table class="table table-hover table-dark responsive mt-2">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">ID</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Horário</th>
                            <th scope="col">Data Inicial</th>
                            <th scope="col">Data Final</th>
                            <th scope="col">Pet</th>
                            <th scope="col">Veterinário</th>
                            <%
                                ResultSet rsClienteColuna = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                                if(rsClienteColuna.next()){
                                    if (rsClienteColuna.getBoolean("Tipo_Cliente") == true){
                            %>
                                        <th scope="col">Dono</th>
                            <%     }
                                }
                            %>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
            <%              ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                            if(rsCliente.next()){
                                if (rsCliente.getBoolean("Tipo_Cliente") == true){
                                    if (request.getParameter("pesquisarAgendamento") != null) {
                                        if (!request.getParameter("data_inicial_agendamento").isEmpty() && !request.getParameter("id_cliente").isEmpty()) {
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Cliente_Id_Cliente = " + request.getParameter("id_cliente"));
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>    
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          }
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>    
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%    
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>    
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%    
                                                        }
                                                        ResultSet rsPetCliente = agendamento.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPesquisaAgendamento.getString("cliente_id_cliente"));
                                                        if(rsPetCliente.next()){
            %>    
                                                            <td><%=rsPetCliente.getString("nome_cliente")%></td>
            <%    
                                                        }
            %>    
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%                                  }
                                            }else{
            %>    
                                               <div>Não possui registros</div>
            <%    
                                            }
                                        }else if (request.getParameter("data_inicial_agendamento").isEmpty() && !request.getParameter("id_cliente").isEmpty()) {
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Cliente_Id_Cliente = " + request.getParameter("id_cliente"));
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>    
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          }
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>    
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%    
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>    
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%    
                                                        }
                                                        ResultSet rsPetCliente = agendamento.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPesquisaAgendamento.getString("cliente_id_cliente"));
                                                        if(rsPetCliente.next()){
            %>    
                                                            <td><%=rsPetCliente.getString("nome_cliente")%></td>
            <%    
                                                        }
            %>    
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%                                  }
                                            }else{
            %>    
                                               <div>Não possui registros</div>
            <%    
                                            } 
                                        }else if (!request.getParameter("data_inicial_agendamento").isEmpty() && request.getParameter("id_cliente").isEmpty()) {
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "'");
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>    
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          }
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>    
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%    
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>    
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%    
                                                        }
                                                        ResultSet rsPetCliente = agendamento.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPesquisaAgendamento.getString("cliente_id_cliente"));
                                                        if(rsPetCliente.next()){
            %>    
                                                            <td><%=rsPetCliente.getString("nome_cliente")%></td>
            <%    
                                                        }
            %>    
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%                                  }
                                            }else{
            %>    
                                               <div>Não possui registros</div>
            <%    
                                            }
                                        }else if (request.getParameter("data_inicial_agendamento").isEmpty() && request.getParameter("id_cliente").isEmpty()) {
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento");
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>    
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          }
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>    
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%    
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>    
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%    
                                                        }
                                                        ResultSet rsPetCliente = agendamento.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPesquisaAgendamento.getString("cliente_id_cliente"));
                                                        if(rsPetCliente.next()){
            %>    
                                                            <td><%=rsPetCliente.getString("nome_cliente")%></td>
            <%    
                                                        }
            %>    
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%                                  }
                                            }else{
            %>    
                                               <div>Não possui registros</div>
            <%    
                                            }
                                        }else{
            %>    
                                            <div>Não possui registros</div>
            <%    
                                        }
                                    }else{
                                        ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento");
                                        if (rsPesquisaAgendamento.isBeforeFirst()){
                                            while (rsPesquisaAgendamento.next()) {
            %>    
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                    <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                    <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                    <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                      if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                        <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                      }else{
            %>
                                                        <td></td>
            <%                                      }
                                                    ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                    if(rsClientePet.next()){
            %>    
                                                        <td><%=rsClientePet.getString("nome_pet")%></td>
            <%    
                                                    }
                                                    ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                    if(rsVeterinario.next()){
            %>    
                                                        <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%    
                                                    }
                                                    ResultSet rsPetCliente = agendamento.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPesquisaAgendamento.getString("cliente_id_cliente"));
                                                    if(rsPetCliente.next()){
            %>    
                                                        <td><%=rsPetCliente.getString("nome_cliente")%></td>
            <%    
                                                    }
            %>    
                                                    <td>
                                                        <div class="row btn_tabela_acoes">
                                                            <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                    <i class="fa fa-pen icone_plus"></i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
            <%                              }
                                        }else{
            %>    
                                               <div>Não possui registros</div>
            <%    
                                            }
                                    }
                                }else{
                                    if (request.getParameter("pesquisarAgendamento") != null) {
                                        if(!request.getParameter("data_inicial_agendamento").isEmpty() && !request.getParameter("id_pet").isEmpty()){
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Cliente_Id_Cliente = " + session.getAttribute("id_cliente") + " AND Pet_Id_Pet = " + request.getParameter("id_pet"));
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                if (!request.getParameter("data_inicial_agendamento").isEmpty() && session.getAttribute("id_cliente") != null && !request.getParameter("id_pet").isEmpty()) {                             
                                                     while (rsPesquisaAgendamento.next()) {
            %>
                                                        <tr class="text-center">
                                                            <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                            <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                            <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                            <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                              if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                                <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                              }else{
            %>
                                                                <td></td>
            <%                                              }
                                                            ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                            if(rsClientePet.next()){
            %>        
                                                                <td><%=rsClientePet.getString("nome_pet")%></td>
            <%        
                                                            }
                                                            ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                            if(rsVeterinario.next()){
            %>        
                                                                <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%        
                                                            }
            %>        
                                                            <td>
                                                                <div class="row btn_tabela_acoes">
                                                                    <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                        <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                        <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                            <i class="fa fa-pen icone_plus"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>
                                                            </td>
                                                        </tr>
            <%                                      }
                                                }
                                            }else{
            %>                                
                                                <div>Não possui registros</div>
            <%                              }
                                        }else if(!request.getParameter("data_inicial_agendamento").isEmpty() && request.getParameter("id_pet").isEmpty() && session.getAttribute("id_cliente") != null){
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Data_Inicial_Agendamento = '" + request.getParameter("data_inicial_agendamento") + "' AND Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>    
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          }
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>        
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%        
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>        
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%       
                                                        }
            %>       
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%
                                                }
                                            }else{
            %>
                                               <div>Não possui registros</div> 
            <%                              }
                                        }else if(request.getParameter("data_inicial_agendamento").isEmpty() && !request.getParameter("id_pet").isEmpty() && session.getAttribute("id_cliente") != null){
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Pet_Id_Pet = '" + request.getParameter("id_pet") + "' AND Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>        
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          } 
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>        
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%        
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>        
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%       
                                                        }
            %>        
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%
                                                }
                                            }else{
            %>
                                                <div>Não possui registros</div> 
            <%
                                            }
                                        }else if(request.getParameter("data_inicial_agendamento").isEmpty() && request.getParameter("id_pet").isEmpty()){
                                            ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                            if (rsPesquisaAgendamento.isBeforeFirst()){
                                                while (rsPesquisaAgendamento.next()) {
            %>        
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                        <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                        <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                          if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                            <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                          }else{
            %>
                                                            <td></td>
            <%                                          } 
                                                        ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                        if(rsClientePet.next()){
            %>        
                                                            <td><%=rsClientePet.getString("nome_pet")%></td>
            <%        
                                                        }
                                                        ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                        if(rsVeterinario.next()){
            %>        
                                                            <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%       
                                                        }
            %>        
                                                        <td>
                                                            <div class="row btn_tabela_acoes">
                                                                <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                    <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                    <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                        <i class="fa fa-pen icone_plus"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
            <%                                  }
                                            }else{
            %>
                                                <div>Não possui registros</div>
            <%                              }
                                        }else{
            %>
                                            <div>Não possui registros</div>
            <%
                                        }
                                    }else{                           
                                        ResultSet rsPesquisaAgendamento = agendamento.Consultar("SELECT * FROM TB_Agendamento WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente") );
                                        if (rsPesquisaAgendamento.isBeforeFirst()){
                                            while (rsPesquisaAgendamento.next()) {
            %>        
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsPesquisaAgendamento.getString("id_agendamento")%></th>
                                                    <td><%=rsPesquisaAgendamento.getString("tipo_agendamento")%></td>
                                                    <td><%=rsPesquisaAgendamento.getString("horario_agendamento")%></td>
                                                    <td><%=rsPesquisaAgendamento.getString("data_inicial_agendamento")%></td>
            <%                                      if (!rsPesquisaAgendamento.getString("data_final_agendamento").isEmpty() && !rsPesquisaAgendamento.getString("data_final_agendamento").equalsIgnoreCase("null")){
            %>
                                                        <td><%=rsPesquisaAgendamento.getString("data_final_agendamento")%></td>
            <%                                      }else{
            %>
                                                        <td></td>
            <%                                      } 
                                                    ResultSet rsClientePet = agendamento.Consultar("SELECT * FROM TB_Pet WHERE Id_Pet = " + rsPesquisaAgendamento.getString("pet_id_pet"));
                                                    if(rsClientePet.next()){
            %>        
                                                        <td><%=rsClientePet.getString("nome_pet")%></td>
            <%        
                                                    }
                                                    ResultSet rsVeterinario = agendamento.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = " + rsPesquisaAgendamento.getString("veterinario_id_veterinario"));
                                                    if(rsVeterinario.next()){
            %>        
                                                        <td><%=rsVeterinario.getString("nome_veterinario")%></td>
            <%       
                                                    }
            %>        
                                                    <td>
                                                        <div class="row btn_tabela_acoes">
                                                            <form id="formAlterarAgendamento" method="POST" action="Editar_Agendamento.jsp">  
                                                                <input type="hidden" id="id_agendamento" name="id_agendamento" value="<%=rsPesquisaAgendamento.getString("id_agendamento")%>">
                                                                <button href="Editar_Agendamento.jsp" id="alterarAgendamento" name="alterarAgendamento" class="btn btn-warning">
                                                                    <i class="fa fa-pen icone_plus"></i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
            <%                              }
                                        }else{
            %>
                                            <div>Não possui registros</div>
            <%
                                        }
                                    }
                                }
                            }
            %>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="header_agendamento"></div>
    </body>
</html>
