<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agendamento" class="Agendamento.AgendamentoDAO"/>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:useBean id="carteiraVacinacao" class="CarteiraVacinacao.CarteiraVacinacaoDAO"/>
<%
    ResultSet rs = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
%>
<!DOCTYPE html>

<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Love Care</title>

  <link rel="stylesheet" href="../../../css//bootstrap.min.css">
  <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
  <link rel="stylesheet" href="../css/padrao.css">
  <link rel="stylesheet" href="./carteira.css" >

  <script src="../../../js/jquery.slim.min.js"></script>
  <script src="../../../js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="../../../js/jquery.min.js"></script>
  <script src="../js/padrao.js"></script>
  <script src="../js/petUtils.js"></script>

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
  <!-- FormulÃ¡rio -->
    <div class="card container mb-4 card_consulta">
        <form id="formEnviaCliente" method="POST" action="Cadastrar_CarteiraVacinacao.jsp"
              class="form-inline my-2 my-lg-0">
                <div class="form-group col-6">
<%                  if(rs.next()){
                        if (rs.getBoolean("Tipo_Cliente") == true){
%>                          <select class="form-control col-6" name="id_cliente" id="id_cliente" class="form-control mr-sm-2" style="left: 33rem; margin-top: 14px;">
                            <%  ResultSet rsPetPesquisa = pet.Consultar("SELECT DISTINCT Cliente_Id_Cliente FROM TB_Pet");
                                while(rsPetPesquisa.next()){
                                    ResultSet rsClientePet = cliente.Consultar("SELECT Id_Cliente, Nome_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsPetPesquisa.getString("cliente_id_cliente"));
                                    while(rsClientePet.next()){
                            %>          
                                        <option value="<%=rsClientePet.getString("id_cliente")%>">ID (<%=rsClientePet.getString("id_cliente")%>) - <%=rsClientePet.getString("nome_cliente")%></option> 
                            <%
                                    }
                                }
                            %>
                            </select>
                            <button type="submit" class="btn btn-outline-success btn_cadastrar my-2 
                                    my-sm-0 btn_search" style="margin-top: 6px !important;"
                                    style="margin-top: 10px">
                                <a class="btn_vacina">
                                    <i class="fa fa-plus icone_plus"></i>
                                </a>
                            </button>
<%                      }
                 }
%>                     
                </div>
        </form>

        <div class="text-center mb-4" style="margin-top: 10px">
            <img src="../../img/Logo/Pata_verde.png" class="cabeca_gato">
            <h3 class="mb-3">Carteira de vacinação</h3>
        </div>
        <form id="formPesquisarNomeCarteira" method="POST" 
              action="" class="form-inline my-2 my-lg-0">
            <div class="form-group col-6" style="margin-top: 20px">
<%                  ResultSet rsClienteOption = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                    if(rsClienteOption.next()){
                        if (rsClienteOption.getBoolean("Tipo_Cliente") == true){
%>                          
                            <label class="label_carteira_pet" style="margin-left: 17rem;">Pet:</label>
                            <select class="form-control col-12" name="id_pet" id="id_pet" 
                                    style="position: absolute; margin-left: 17rem;">
                                <option value="">Todos</option>
<%                                  ResultSet rsPet = pet.Consultar("SELECT Nome_Pet, Id_pet FROM TB_Pet");
                                    while(rsPet.next()){
%>                                          
                                        <option value="<%=rsPet.getString("id_pet")%>">ID (<%=rsPet.getString("id_pet")%>) - <%=rsPet.getString("nome_pet")%></option> 
<%                                
                                    }
%>                                
                            </select>
<%                      }else{
%>
                        <label class="label_carteira_pet" style="margin-left: 16rem;">Pet:</label>
                            <select class="form-control col-12" name="id_pet" id="id_pet"
                                    style="position: absolute; margin-left: 16rem;">
                                <option value="">Todos</option>
<%                                  ResultSet rsPet = pet.Consultar("SELECT Nome_Pet, Id_pet FROM TB_Pet WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                    while(rsPet.next()){
%>          
                                        <option value="<%=rsPet.getString("id_pet")%>">ID (<%=rsPet.getString("id_pet")%>) - <%=rsPet.getString("nome_pet")%></option> 
<%                                
                                    }
%>                                
                            </select>
<%                
                        }
                    }
%>                 
                <label class="label_carteira_vacina" style="margin-left: 29rem;">Vacina:</label>
                    <select name="id_vacina" id="id_vacina" 
                            class="form-control select_carteira" 
                            style="position: absolute;margin-left: 6rem;">
                        <option value="">Todas</option>
<%                        
                            ResultSet rsVacina = vacina.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina");
                            while (rsVacina.next()) {
%>                        
                                <option value="<%=rsVacina.getString("id_vacina")%>"><%=rsVacina.getString("nome_vacina")%></option>
<%                        
                            }
%>                      
                    </select>
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0 btn_search" id="pesquisarCarteiraVacinacao" name="pesquisarCarteiraVacinacao">
                    <i class="fas fa-search"></i>
                </button> 
            </div>
        </form>
        <table class="table responsive table-hover table-dark mt-4">
        <thead>
          <tr class="text-center">
            <th scope="col">Data</th>
            <th scope="col">Pet</th>
            <th scope="col">Vacina</th>
<%            
                ResultSet rsClienteColuna = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                if(rsClienteColuna.next()){
                    if (rsClienteColuna.getBoolean("Tipo_Cliente") == true){
%>            
                        <th scope="col">Ações</th>
<%          
                    }
                }
%>            
          </tr>
        </thead>
        <tbody>
<%              if (request.getParameter("pesquisarCarteiraVacinacao") != null) {
                    if (!request.getParameter("id_pet").isEmpty() && !request.getParameter("id_vacina").isEmpty()) {
                        ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE Pet_Id_Pet = '" + request.getParameter("id_pet") + "' AND Vacina_Id_Vacina = " + request.getParameter("id_vacina"));
                        if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                            while (rsPesquisaCarteiraVacinacao.next()) {
%>                            
                                <tr class="text-center">
                                    <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

<%                                  ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet,Cliente_Id_Cliente FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                    if (rsNomePet.isBeforeFirst()){
                                        if(rsNomePet.next()){
%>                 
                                            <td><%=rsNomePet.getString("nome_pet")%></td>
<%                                      }else{
%>            
                                        <div>Pet não encontrado</div>
<%       
                                        }  
                                    }else{
%>            
                                        <div>Pet não encontrado</div>
<%       
                                    }
                                    
                                    ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                    if (rsNomeVacina.isBeforeFirst()){
                                        if(rsNomeVacina.next()){
%>    
                                            <td><%=rsNomeVacina.getString("nome_vacina")%></td>
<%                                      }else{
%>    
                                            <div>Vacina não encontrado</div>
<%
                                        }
                                    }else{
%>   
                                        <div>Vacina não encontrada</div>
<%   
                                    }
%>  
                                    <td>
<%   
                                        ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                                        if(rsCliente.next()){
                                            if (rsCliente.getBoolean("Tipo_Cliente") == true){
%>    
                                                <form id="formAlterarCarteiraVacinacao" method="POST" action="Editar_CarteiraVacinacao.jsp"> 
                                                    <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=rsPesquisaCarteiraVacinacao.getString("id_carteira_vacinacao")%>">
                                                    <input type="text" id="id_cliente" name="id_cliente" value="<%=rsNomePet.getString("id_cliente")%>">
                                                    <button type="submit" class="btn btn-warning">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
<%    
                                            }
                                        }
%>                                                
                                    </td>
                                </tr>
<%    
                            }
                        }else{
%>           
                            <div>Não possui registro</div>
<%       
                        }
                    }else if (!request.getParameter("id_pet").isEmpty() && request.getParameter("id_vacina").isEmpty()) {
                        ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                        if(rsCliente.next()){
                            if (rsCliente.getBoolean("Tipo_Cliente") == true){
                                ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE Pet_Id_Pet = " + request.getParameter("id_pet"));
                                if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                    while (rsPesquisaCarteiraVacinacao.next()) {
        %>                                 
                                        <tr class="text-center">
                                            <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

        <%                                  ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet,Cliente_Id_Cliente FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                            if (rsNomePet.isBeforeFirst()){
                                                if(rsNomePet.next()){
        %>                  
                                                    <td><%=rsNomePet.getString("nome_pet")%></td>
        <%                                      }else{
        %>            
                                                <div>Pet não encontrado</div>
        <%       
                                                }  
                                            }else{
        %>            
                                                <div>Pet não encontrado</div>
        <%       
                                            }

                                            ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                            if (rsNomeVacina.isBeforeFirst()){
                                                if(rsNomeVacina.next()){
        %>    
                                                    <td><%=rsNomeVacina.getString("nome_vacina")%></td>
        <%                                      }else{
        %>    
                                                    <div>Vacina não encontrado</div>
        <%
                                                }
                                            }else{
        %>   
                                                <div>Vacina não encontrada</div>
        <%    
                                            }
        %>    
                                            <td>
                                                <form id="formAlterarCarteiraVacinacao" method="POST" action="Editar_CarteiraVacinacao.jsp"> 
                                                    <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=rsPesquisaCarteiraVacinacao.getString("id_carteira_vacinacao")%>">
                                                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsNomePet.getString("cliente_id_cliente")%>">
                                                    <button class="btn btn-warning">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>                                            
                                            </td>
                                        </tr>
<%            
                                    }
                                }else{
%>                   
                                    <div>Não possui registro</div>
<%               
                                }
                            }else{
                                ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE  Pet_Id_Pet in (SELECT Id_Pet FROM TB_Pet WHERE Cliente_Id_Cliente =" + session.getAttribute("id_cliente") +") AND Pet_Id_Pet = " + request.getParameter("id_pet"));
                                if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                    while (rsPesquisaCarteiraVacinacao.next()) {
%>                                             
                                        <tr class="text-center">
                                            <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

<%                                          ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                            if (rsNomePet.isBeforeFirst()){
                                                if(rsNomePet.next()){
%>                                     
                                                    <td><%=rsNomePet.getString("nome_pet")%></td>
<%                                              }else{
%>                                
                                                    <div>Pet não encontrado</div>
<%                         
                                                }  
                                            }else{
%>                                
                                                <div>Pet não encontrado</div>
<%                          
                                            }

                                            ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                            if (rsNomeVacina.isBeforeFirst()){
                                                if(rsNomeVacina.next()){
%>                        
                                                    <td><%=rsNomeVacina.getString("nome_vacina")%></td>
<%                                              }else{
%>                        
                                                    <div>Vacina não encontrado</div>
<%                        
                                                }
                                            }else{
%>                      
                                                <div>Vacina não encontrada</div>
<%                        
                                            }
%>                                           
                                        </tr>
<%                
                                        }
                                }else{
%>                        
                                    <div>Não possui registro</div>
<%                   
                                }
                            }
                        }else{
%>        
                            <div>Não possui registro</div>
<%       
                        }
                    }else if (request.getParameter("id_pet").isEmpty() && !request.getParameter("id_vacina").isEmpty()) {
                        ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                        if(rsCliente.next()){
                            if (rsCliente.getBoolean("Tipo_Cliente") == true){
                                ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE Vacina_Id_Vacina = " + request.getParameter("id_vacina"));
                                if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                    while (rsPesquisaCarteiraVacinacao.next()) {
        %>                                 
                                        <tr class="text-center">
                                            <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

        <%                                  ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet,Cliente_Id_Cliente FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                            if (rsNomePet.isBeforeFirst()){
                                                if(rsNomePet.next()){
        %>                  
                                                    <td><%=rsNomePet.getString("nome_pet")%></td>
        <%                                      }else{
        %>        
                                                <div>Pet não encontrado</div>
        <%       
                                                }  
                                            }else{
        %>            
                                                <div>Pet não encontrado</div>
        <%      
                                            }

                                            ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                            if (rsNomeVacina.isBeforeFirst()){
                                                if(rsNomeVacina.next()){
        %>   
                                                    <td><%=rsNomeVacina.getString("nome_vacina")%></td>
        <%                                      }else{
        %>    
                                                    <div>Vacina não encontrado</div>
        <%    
                                                }
                                            }else{
        %>    
                                                <div>Vacina não encontrada</div>
        <%    
                                            }
        %>    
                                            <td>
                                                <form id="formAlterarCarteiraVacinacao" method="POST" action="Editar_CarteiraVacinacao.jsp"> 
                                                    <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=rsPesquisaCarteiraVacinacao.getString("id_carteira_vacinacao")%>">
                                                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsNomePet.getString("cliente_id_cliente")%>">
                                                    <button class="btn btn-warning">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>                                          
                                            </td>
                                        </tr>
<%            
                                    }
                                }else{
%>                    
                                    <div>Não possui registro</div>
<%              
                                }
                            }else{
                                ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE  Pet_Id_Pet in (SELECT Id_Pet FROM TB_Pet WHERE Cliente_Id_Cliente =" + session.getAttribute("id_cliente") +") AND Vacina_Id_Vacina = " + request.getParameter("id_vacina"));
                                if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                    while (rsPesquisaCarteiraVacinacao.next()) {
    %>                                         
                                        <tr class="text-center">
                                            <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

    <%                                      ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                            if (rsNomePet.isBeforeFirst()){
                                                if(rsNomePet.next()){
    %>                                  
                                                    <td><%=rsNomePet.getString("nome_pet")%></td>
    <%                                          }else{
    %>                            
                                                    <div>Pet não encontrado</div>
    <%                      
                                                }  
                                            }else{
    %>                            
                                                <div>Pet não encontrado</div>
    <%                       
                                            }

                                            ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                            if (rsNomeVacina.isBeforeFirst()){
                                                if(rsNomeVacina.next()){
    %>                    
                                                    <td><%=rsNomeVacina.getString("nome_vacina")%></td>
    <%                                          }else{
    %>                    
                                                    <div>Vacina não encontrado</div>
    <%                    
                                                }
                                            }else{
    %>                   
                                                <div>Vacina não encontrada</div>
    <%                    
                                            }
    %>                                       
                                        </tr>
    <%            
                                        }
                                }else{
    %>                    
                                    <div>Não possui registro</div>
    <%               
                                }             
                            }
                        }else{
%>        
                            <div>Não possui registro</div>
<%       
                        }
                    }else if (request.getParameter("id_pet").isEmpty() && request.getParameter("id_vacina").isEmpty()) {
                        ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                        if(rsCliente.next()){
                            if (rsCliente.getBoolean("Tipo_Cliente") == true){
                                ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao ");
                                if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                    while (rsPesquisaCarteiraVacinacao.next()) {
%>                                             
                                        <tr class="text-center">
                                            <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

<%                                          ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet,Cliente_Id_Cliente FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                            if (rsNomePet.isBeforeFirst()){
                                                if(rsNomePet.next()){
%>                                      
                                                    <td><%=rsNomePet.getString("nome_pet")%></td>
<%                                              }else{
%>                                
                                                    <div>Pet não encontrado</div>
<%                           
                                                }  
                                            }else{
%>                                
                                                <div>Pet não encontrado</div>
<%                          
                                            }

                                            ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                            if (rsNomeVacina.isBeforeFirst()){
                                                if(rsNomeVacina.next()){
%>                        
                                                    <td><%=rsNomeVacina.getString("nome_vacina")%></td>
<%                                              }else{
%>                        
                                                    <div>Vacina não encontrado</div>
<%                        
                                                }
                                            }else{
%>                        
                                                <div>Vacina não encontrada</div>
<%                        
                                            }
%>                        
                                            <td>
                                                <form id="formAlterarCarteiraVacinacao" method="POST" action="Editar_CarteiraVacinacao.jsp"> 
                                                    <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=rsPesquisaCarteiraVacinacao.getString("id_carteira_vacinacao")%>">
                                                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsNomePet.getString("cliente_id_cliente")%>">
                                                    <button class="btn btn-warning">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                            </td>                      
                                        </tr>
<%                
                                        }
                                }else{
%>                        
                                    <div>Não possui registro</div>
<%                   
                                }       
                            }else{
								ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE  Pet_Id_Pet in (SELECT Id_Pet FROM TB_Pet WHERE Cliente_Id_Cliente =" + session.getAttribute("id_cliente") +")");
                                if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                    while (rsPesquisaCarteiraVacinacao.next()) {
%>                                             
                                        <tr class="text-center">
                                            <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

<%                                          ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                            if (rsNomePet.isBeforeFirst()){
                                                if(rsNomePet.next()){
%>                                      
                                                    <td><%=rsNomePet.getString("nome_pet")%></td>
<%                                              }else{
%>                                
                                                    <div>Pet não encontrado</div>
<%                          
                                                }  
                                            }else{
%>                                
                                                <div>Pet não encontrado</div>
<%                           
                                            }

                                            ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                            if (rsNomeVacina.isBeforeFirst()){
                                                if(rsNomeVacina.next()){
%>                       
                                                    <td><%=rsNomeVacina.getString("nome_vacina")%></td>
<%                                              }else{
%>                        
                                                    <div>Vacina não encontrado</div>
<%                        
                                                }
                                            }else{
%>                       
                                                <div>Vacina não encontrada</div>
<%                        
                                            }
%>                                              
                                        </tr>
<%               
                                        }
                                }else{
%>                        
                                    <div>Não possui registro</div>
<%                   
                                } 
                            }
                        }else{
%>            
                            <div>Não possui registro</div>
<%       
                        }   
                    }else{
%>            
                            <div>Não possui registro</div>
<%       
                    }   
                }else{
                    ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                    if(rsCliente.next()){
                        if (rsCliente.getBoolean("Tipo_Cliente") == true){
                            ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao ");
                            if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                while (rsPesquisaCarteiraVacinacao.next()) {
%>                                         
                                    <tr class="text-center">
                                        <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

<%                                      ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet,Cliente_Id_Cliente FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                        if (rsNomePet.isBeforeFirst()){
                                            if(rsNomePet.next()){
%>                                  
                                                <td><%=rsNomePet.getString("nome_pet")%></td>
<%                                          }else{
%>                            
                                                <div>Pet não encontrado</div>
<%                       
                                            }  
                                        }else{
%>                           
                                            <div>Pet não encontrado</div>
<%                       
                                        }

                                        ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                        if (rsNomeVacina.isBeforeFirst()){
                                            if(rsNomeVacina.next()){
%>                    
                                                <td><%=rsNomeVacina.getString("nome_vacina")%></td>
<%                                          }else{
%>                    
                                                <div>Vacina não encontrado</div>
<%                   
                                            }
                                        }else{
%>                    
                                            <div>Vacina não encontrada</div>
<%                    
                                        }
%>                    
                                        <td>
                                            <form id="formAlterarCarteiraVacinacao" method="POST" action="Editar_CarteiraVacinacao.jsp"> 
                                                <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=rsPesquisaCarteiraVacinacao.getString("id_carteira_vacinacao")%>">
                                                <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsNomePet.getString("cliente_id_cliente")%>">
                                                <button class="btn btn-warning">
                                                    <i class="fa fa-pen icone_plus"></i>
                                                </button>
                                            </form>
                                        </td>                      
                                    </tr>
<%            
                                    }
                            }else{
%>                   
                                <div>Não possui registro</div>
<%               
                            }           
                        }else{
                            ResultSet rsPesquisaCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE  Pet_Id_Pet in (SELECT Id_Pet FROM TB_Pet WHERE Cliente_Id_Cliente =" + session.getAttribute("id_cliente") +")");
                            if (rsPesquisaCarteiraVacinacao.isBeforeFirst()){            
                                while (rsPesquisaCarteiraVacinacao.next()) {
%>                                         
                                    <tr class="text-center">
                                        <th scope="row"><%=rsPesquisaCarteiraVacinacao.getString("data_pet_vacina")%></th>

<%                                      ResultSet rsNomePet = pet.Consultar("SELECT Nome_Pet FROM TB_Pet WHERE Id_Pet = " + rsPesquisaCarteiraVacinacao.getInt("pet_id_pet"));
                                        if (rsNomePet.isBeforeFirst()){
                                            if(rsNomePet.next()){
%>                                  
                                                <td><%=rsNomePet.getString("nome_pet")%></td>
<%                                          }else{
%>                            
                                                <div>Pet não encontrado</div>
<%                      
                                            }  
                                        }else{
%>                            
                                            <div>Pet não encontrado</div>
<%                       
                                        }

                                        ResultSet rsNomeVacina = vacina.Consultar("SELECT Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsPesquisaCarteiraVacinacao.getInt("vacina_id_vacina"));
                                        if (rsNomeVacina.isBeforeFirst()){
                                            if(rsNomeVacina.next()){
%>                    
                                                <td><%=rsNomeVacina.getString("nome_vacina")%></td>
<%                                          }else{
%>                    
                                                <div>Vacina não encontrado</div>
<%                    
                                            }
                                        }else{
%>                   
                                            <div>Vacina não encontrada</div>
<%                    
                                        }
%>                                       
                                    </tr>
<%            
                                    }
                            }else{
%>                    
                                <div>Não possui registro</div>
<%               
                            }                             
                        }
                    }
                }
%>
        </tbody>
      </table>
      <br />
    </div>
  </div>
  <div id="header_carteira"></div>
</body>
</html>