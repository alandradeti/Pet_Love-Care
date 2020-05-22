<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="./pet.css" > 

        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/padrao.js"></script>

        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
            $(function () {
                $("#header_pet").load("./Cadastrar_pet.html");
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
            <!-- Formulário -->
            <div class="card container card_consulta">
                <button type="button" class="btn btn_cadastrar mt-2"
                        data-toggle="modal" data-target="#modal_pet">
                    <a class="btn_vacina" data-toggle="modal">
                        <i class="fa fa-plus icone_plus"></i>
                    </a>
                </button>
                <div class="text-center mb-4">
                    <img src="../../img/Logo/Dog_2Cor.png" class="cabeca_gato">
                    <h3 class="mt-2">Consultar Pet</h3>
                </div>
                <form id="formPesquisarNomePet" method="POST" 
                      action="PetConsultar.jsp" class="form-inline my-2 my-lg-0" >
                    <div class="form-group col-6">
                        <input type="text" name="nome_pet" id="nome_pet" 
                               class="form-control mr-sm-2 search" placeholder="Pesquisar..." />
                        
                        <%  if(rs.next()){
                                if (rs.getBoolean("Tipo_Cliente") == true){
                        %>
                                    <select class="form-control col-12" name="id_cliente" id="id_cliente">
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
                        <%      }
                            }
                        %>
                                
                        <button type="submit" class="btn btn-outline-success my-2 my-sm-0 btn_search" id="pesquisarPet" name="pesquisarPet">
                            <i class="fas fa-search"></i>
                        </button> 
                    </div>
                </form>
                <table id="tbPet" class="table responsive table-hover table-dark mt-2">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">ID</th>
                            <th scope="col">Espécie</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Idade</th>
                            <th scope="col">Porte</th>
                            <th scope="col">Sexo</th>
                            <th scope="col">Dono</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                <%          ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                            if(rsCliente.next()){
                                if (rsCliente.getBoolean("Tipo_Cliente") == true){
                                    if (request.getParameter("pesquisarPet") != null) {
                                        if (!request.getParameter("nome_pet").isEmpty() && !request.getParameter("id_cliente").isEmpty()) {
                                            ResultSet rsPetPesquisa = pet.Consultar("SELECT * FROM TB_Pet WHERE Nome_Pet = '" + request.getParameter("nome_pet") + "' AND Cliente_Id_Cliente = " + request.getParameter("id_cliente"));
                                            if(rsPetPesquisa.isBeforeFirst()){
                                                while (rsPetPesquisa.next()) {
                %>
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPetPesquisa.getString("id_pet")%></th>
                                                        <td id="especie_pet"><%=rsPetPesquisa.getString("especie_pet")%></td>
                                                        <td id="nome_pet"><%=rsPetPesquisa.getString("nome_pet")%></td>
                                                        <td id="idade_pet"><%=rsPetPesquisa.getString("idade_pet")%></td>
                                                        <td id="porte_pet"><%=rsPetPesquisa.getString("porte_pet")%></td>
                                                        <td id="sexo_pet"><%=rsPetPesquisa.getString("sexo_pet")%></td>

                <%                                      ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPetPesquisa.getString("cliente_id_cliente"));
                                                        if(rsClientePet.next()){
                %>
                                                            <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                        }
                %>
                                                        <td>
                                                            <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                                <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPetPesquisa.getString("id_pet")%>">
                                                                <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                                    <i class="fa fa-pen icone_plus"></i>
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                <%                              }
                                            }else{
                %>
                                                <h1>Não Possui Registros</h1>      
                <%                          }
                                        } else if (request.getParameter("nome_pet").isEmpty() && request.getParameter("id_cliente").isEmpty()) {
                                            ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet");
                                            while (rsPet.next()) {
                %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsPet.getString("id_pet")%></th>
                                                    <td id="especie_pet"><%=rsPet.getString("especie_pet")%></td>
                                                    <td id="nome_pet"><%=rsPet.getString("nome_pet")%></td>
                                                    <td id="idade_pet"><%=rsPet.getString("idade_pet")%></td>
                                                    <td id="porte_pet"><%=rsPet.getString("porte_pet")%></td>
                                                    <td id="sexo_pet"><%=rsPet.getString("sexo_pet")%></td>
                                                    
                <%                                  ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPet.getString("cliente_id_cliente"));
                                                    if(rsClientePet.next()){
                %>
                                                            <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                        }
                %>
                                                    <td>
                                                        <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                            <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPet.getString("id_pet")%>">
                                                            <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                                <i class="fa fa-pen icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                <%
                                            }
                                        }else if(request.getParameter("nome_pet").isEmpty() && !request.getParameter("id_cliente").isEmpty()){
                                            ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet WHERE Cliente_Id_Cliente = " + request.getParameter("id_cliente"));
                                            while (rsPet.next()) {
                %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsPet.getString("id_pet")%></th>
                                                    <td id="especie_pet"><%=rsPet.getString("especie_pet")%></td>
                                                    <td id="nome_pet"><%=rsPet.getString("nome_pet")%></td>
                                                    <td id="idade_pet"><%=rsPet.getString("idade_pet")%></td>
                                                    <td id="porte_pet"><%=rsPet.getString("porte_pet")%></td>
                                                    <td id="sexo_pet"><%=rsPet.getString("sexo_pet")%></td>
                                                    
                <%                                  ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPet.getString("cliente_id_cliente"));
                                                    if(rsClientePet.next()){
                %>
                                                        <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                    }
                %>
                                                    <td>
                                                        <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                            <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPet.getString("id_pet")%>">
                                                            <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                                <i class="fa fa-pen icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            
                <%
                                            }
					}else if(!request.getParameter("nome_pet").isEmpty() && request.getParameter("id_cliente").isEmpty()){
                                            ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet WHERE Nome_Pet = '" + request.getParameter("nome_pet") + "'");
					    if(rsPet.isBeforeFirst()){
                                                while (rsPet.next()) {
                %>
                                                    <tr class="text-center">
                                                        <th scope="row"><%=rsPet.getString("id_pet")%></th>
                                                        <td id="especie_pet"><%=rsPet.getString("especie_pet")%></td>
                                                        <td id="nome_pet"><%=rsPet.getString("nome_pet")%></td>
                                                        <td id="idade_pet"><%=rsPet.getString("idade_pet")%></td>
                                                        <td id="porte_pet"><%=rsPet.getString("porte_pet")%></td>
                                                        <td id="sexo_pet"><%=rsPet.getString("sexo_pet")%></td>

                <%                                      ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPet.getString("cliente_id_cliente"));
                                                        if(rsClientePet.next()){
                %>
                                                            <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                        }
                %>
                                                        <td>
                                                            <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                                <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPet.getString("id_pet")%>">
                                                                <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                                    <i class="fa fa-pen icone_plus"></i>
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                <%
                                                }
                                            }else{
                %>
                                                <h1>Não Possui Registros</h1>
                <%                          }
					}else {
                %>
                                            <h1>Não Possui Registros</h1>
                <%                      }
                                    } else {
                                        ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet");
                                        while (rsPet.next()) {
                %>
                                            <tr class="text-center">
                                                <th scope="row"><%=rsPet.getString("id_pet")%></th>
                                                <td id="especie_pet"><%=rsPet.getString("especie_pet")%></td>
                                                <td id="nome_pet"><%=rsPet.getString("nome_pet")%></td>
                                                <td id="idade_pet"><%=rsPet.getString("idade_pet")%></td>
                                                <td id="porte_pet"><%=rsPet.getString("porte_pet")%></td>
                                                <td id="sexo_pet"><%=rsPet.getString("sexo_pet")%></td>
                                                
                <%                              ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPet.getString("cliente_id_cliente"));
                                                if(rsClientePet.next()){
                %>
                                                    <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                }
                %>
                                                <td>
                                                    <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                        <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPet.getString("id_pet")%>">
                                                        <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                            <i class="fa fa-pen icone_plus"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                <%
                                        }
                                    }
                                }else{
                                    if (request.getParameter("pesquisarPet") != null) {
                                        ResultSet rsPetPesquisa = pet.Consultar("SELECT * FROM TB_Pet WHERE Nome_Pet = '" + request.getParameter("nome_pet") + "' AND Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                        if (rsPetPesquisa.isBeforeFirst() && !request.getParameter("nome_pet").isEmpty()) {
                                            while (rsPetPesquisa.next()) {
                %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsPetPesquisa.getString("id_pet")%></th>
                                                    <td id="especie_pet"><%=rsPetPesquisa.getString("especie_pet")%></td>
                                                    <td id="nome_pet"><%=rsPetPesquisa.getString("nome_pet")%></td>
                                                    <td id="idade_pet"><%=rsPetPesquisa.getString("idade_pet")%></td>
                                                    <td id="porte_pet"><%=rsPetPesquisa.getString("porte_pet")%></td>
                                                    <td id="sexo_pet"><%=rsPetPesquisa.getString("sexo_pet")%></td>
                                                    
                <%                                  ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPetPesquisa.getString("cliente_id_cliente"));
                                                    if(rsClientePet.next()){
                %>
                                                            <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                    }
                %>
                                                    
                                                    
                                                    <td>
                                                        <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                            <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPetPesquisa.getString("id_pet")%>">
                                                            <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                                <i class="fa fa-pen icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                <%                          }
                                        } else if (request.getParameter("nome_pet").isEmpty()) {
                                            ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet WHERE Cliente_id_Cliente = " + session.getAttribute("id_cliente"));
                                            while (rsPet.next()) {
                %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsPet.getString("id_pet")%></th>
                                                    <td id="especie_pet"><%=rsPet.getString("especie_pet")%></td>
                                                    <td id="nome_pet"><%=rsPet.getString("nome_pet")%></td>
                                                    <td id="idade_pet"><%=rsPet.getString("idade_pet")%></td>
                                                    <td id="porte_pet"><%=rsPet.getString("porte_pet")%></td>
                                                    <td id="sexo_pet"><%=rsPet.getString("sexo_pet")%></td>
                                                    
                <%                                  ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPet.getString("cliente_id_cliente"));
                                                    if(rsClientePet.next()){
                %>
                                                            <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                    }
                %>
                                                    
                                                    <td>
                                                        <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                            <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPet.getString("id_pet")%>">
                                                            <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                                <i class="fa fa-pen icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                <%
                                            }
                                        } else {
                %>
                                            <h1>Não Possui Registros</h1>
                <%                      }
                                    } else {
                                        ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet WHERE Cliente_id_Cliente = " + session.getAttribute("id_cliente"));
                                        while (rsPet.next()) {
                %>
                                            <tr class="text-center">
                                                <th scope="row"><%=rsPet.getString("id_pet")%></th>
                                                <td id="especie_pet"><%=rsPet.getString("especie_pet")%></td>
                                                <td id="nome_pet"><%=rsPet.getString("nome_pet")%></td>
                                                <td id="idade_pet"><%=rsPet.getString("idade_pet")%></td>
                                                <td id="porte_pet"><%=rsPet.getString("porte_pet")%></td>
                                                <td id="sexo_pet"><%=rsPet.getString("sexo_pet")%></td>
                                                
                <%                              ResultSet rsClientePet = pet.Consultar("SELECT * FROM TB_Cliente WHERE Id_Cliente = " + rsPet.getString("cliente_id_cliente"));
                                                if(rsClientePet.next()){
                %>
                                                    <td id="id_cliente"><%=rsClientePet.getString("nome_cliente")%></td>
                <%
                                                }
                %>
                                                
                                                <td>
                                                    <form id="formAlterarPet" method="POST" action="Editar_Pet.jsp">  
                                                        <input type="hidden" id="id_pet" name="id_pet" value="<%=rsPet.getString("id_pet")%>">
                                                        <button href="Editar_Pet.jsp" id="alterarPet" name="alterarPet" class="btn btn-warning mt-2">
                                                            <i class="fa fa-pen icone_plus"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
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
        <div id="header_pet"></div>
    </body>
</html>
