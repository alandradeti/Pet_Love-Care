<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="compra" class="Compra.CompraDAO"/>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<%
    ResultSet rsClienteConsulta = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
%>
<!DOCTYPE html>
<html lang="PT-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./Vacina.css"> 
      
        
        <script src="../js/ajax.min.js"></script>
        <script src="../js/post.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        
        <script src="../js/padrao.js"></script>
        
        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
            $(function () {
                $("#header_vacina").load("./Cadastrar_Vacina.html");
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
                <div class="text-center mt-2">
                    <img src="../../img/Logo/Mao_sacola.png" class="cabeca_gato">
                    <h3 class="mb-4">Compras</h3>
                </div>
                <form id="formPesquisarNomeVacina" method="POST" action="Consultar_Compras.jsp" class="form-inline my-2 my-lg-0">
                    <div class="form-group col-6">
<%                  if(rsClienteConsulta.next()){
                        if (rsClienteConsulta.getBoolean("Tipo_Cliente") == true){
%>
                            <input type="text" name="id_compra" id="id_compra" class="form-control mr-sm-2 search" placeholder="Número do pedido"/>
<%                      }else{
%>
                            <input type="text" name="data_compra" id="data_compra" class="form-control mr-sm-2 search" placeholder="Data da compra"/>
<%                        
                        }
                    }
%>
                        <button type="submit" class="btn btn-outline-success my-2 my-sm-0 btn_search" id="pesquisarCompra" name="pesquisarCompra">
                            <i class="fas fa-search"></i>
                        </button> 
                    </div>
                </form>

                <table id="tbVacina" class="table table-hover table-dark mt-4 responsive">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">Número do Pedido</th>
                            <th scope="col">Data</th>
                            <th scope="col">Valor</th>
                            <th scope="col">Forma de Pagamento</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">CPF</th>
                            <th scope="col">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
<%                          if (rsClienteConsulta.getBoolean("Tipo_Cliente") == true){
                                if (request.getParameter("pesquisarCompra") != null) {
                                    if (!request.getParameter("id_compra").isEmpty()) {
                                        ResultSet rsCompra = compra.Consultar("SELECT * FROM TB_Compra WHERE Id_Compra = " + request.getParameter("id_compra"));
                                        if(rsCompra.isBeforeFirst()){
                                            while (rsCompra.next()) {
    %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsCompra.getString("id_compra")%></th>
                                                    <td><%=rsCompra.getString("data_compra")%></td>
                                                    <td><%=rsCompra.getString("valor_compra")%></td>
                                                    <td><%=rsCompra.getString("tipo_pagamento_compra")%></td>
    <%                          
                                                    ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsCompra.getString("cliente_id_cliente"));
                                                    if(rsCliente.isBeforeFirst()){
                                                        if(rsCliente.next()) {
    %> 
                                                            <td><%=rsCliente.getString("nome_cliente")%></td>
                                                            <td style="font-size: 18px;"><%=rsCliente.getString("cpf_cliente")%></td>
    <%                                                  }
                                                    }
    %>
                                                    <td>
                                                    <div class="row btn_tabela_acoes">
                                                        <form id="formExcluirPedido" method="POST" action="ExcluirCompra.jsp">  
                                                            <input type="hidden" id="id_compra" name="id_compra" value="<%=rsCompra.getString("id_compra")%>">
                                                            <button href="Editar_Vacina.jsp" id="excluirCompra" name="excluirCompra" class="btn btn-danger">
                                                                <i class="fa fa-trash icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                    </td>
                                                </tr>
    <%                                      }
                                        }else{
    %>
                                            <div>Não possui pedidos</div>
    <%
                                        }
                                    }if (request.getParameter("id_compra").isEmpty()) {
                                        ResultSet rsCompra = compra.Consultar("SELECT * FROM TB_Compra");
                                        if(rsCompra.isBeforeFirst()){
                                            while (rsCompra.next()) {
        %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsCompra.getString("id_compra")%></th>
                                                    <td><%=rsCompra.getString("data_compra")%></td>
                                                    <td><%=rsCompra.getString("valor_compra")%></td>
                                                    <td><%=rsCompra.getString("tipo_pagamento_compra")%></td>
        <%                          
                                                    ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsCompra.getString("cliente_id_cliente"));
                                                    if(rsCliente.isBeforeFirst()){
                                                        if(rsCliente.next()) {
        %> 
                                                            <td><%=rsCliente.getString("nome_cliente")%></td>
                                                            <td style="font-size: 18px;"><%=rsCliente.getString("cpf_cliente")%></td>
        <%                                                  }
                                                    }
        %>
                                                    <td>
                                                    <div class="row btn_tabela_acoes">
                                                        <form id="formExcluirPedido" method="POST" action="ExcluirCompra.jsp">  
                                                            <input type="hidden" id="id_compra" name="id_compra" value="<%=rsCompra.getString("id_compra")%>">
                                                            <button href="Editar_Vacina.jsp" id="excluirCompra" name="excluirCompra" class="btn btn-danger">
                                                                <i class="fa fa-trash icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                    </td>
                                                </tr>
    <%                                      }
                                        }else{
    %>
                                            <div>Não possui pedidos</div>
    <%
                                        }
                                    }
                                }else{
                                    ResultSet rsCompra = compra.Consultar("SELECT * FROM TB_Compra");
                                    if(rsCompra.isBeforeFirst()){
                                        while (rsCompra.next()) {
    %>
                                            <tr class="text-center">
                                                <th scope="row"><%=rsCompra.getString("id_compra")%></th>
                                                <td><%=rsCompra.getString("data_compra")%></td>
                                                <td><%=rsCompra.getString("valor_compra")%></td>
                                                <td><%=rsCompra.getString("tipo_pagamento_compra")%></td>
    <%                          
                                                ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsCompra.getString("cliente_id_cliente"));
                                                if(rsCliente.isBeforeFirst()){
                                                    if(rsCliente.next()) {
    %> 
                                                        <td><%=rsCliente.getString("nome_cliente")%></td>
                                                        <td style="font-size: 18px;"><%=rsCliente.getString("cpf_cliente")%></td>
    <%                                                  }
                                                }
    %>
                                                <td>
                                                <div class="row btn_tabela_acoes">
                                                    <form id="formExcluirPedido" method="POST" action="ExcluirCompra.jsp">  
                                                        <input type="hidden" id="id_compra" name="id_compra" value="<%=rsCompra.getString("id_compra")%>">
                                                        <button href="Editar_Vacina.jsp" id="excluirCompra" name="excluirCompra" class="btn btn-danger">
                                                            <i class="fa fa-trash icone_plus"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                                </td>
                                            </tr>
    <%                                  }
                                    }else{
    %>
                                        <div>Não possui pedidos</div>
<%
                                    }
                                }
                            }else{
                                if (request.getParameter("pesquisarCompra") != null) {
                                    if (!request.getParameter("data_compra").isEmpty()) {
                                        ResultSet rsCompra = compra.Consultar("SELECT * FROM TB_Compra WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente") + " AND Data_Compra = '" + request.getParameter("data_compra") + "'");
                                        if(rsCompra.isBeforeFirst()){
                                            while (rsCompra.next()) {
%>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsCompra.getString("id_compra")%></th>
                                                    <td><%=rsCompra.getString("data_compra")%></td>
                                                    <td><%=rsCompra.getString("valor_compra")%></td>
                                                    <td><%=rsCompra.getString("tipo_pagamento_compra")%></td>
    <%                          
                                                    ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsCompra.getString("cliente_id_cliente"));
                                                    if(rsCliente.isBeforeFirst()){
                                                        if(rsCliente.next()) {
    %> 
                                                            <td><%=rsCliente.getString("nome_cliente")%></td>
                                                            <td style="font-size: 18px;"><%=rsCliente.getString("cpf_cliente")%></td>
    <%                                                  }
                                                    }
    %>
                                                    <td>
                                                    <div class="row btn_tabela_acoes">
                                                        <form id="formExcluirPedido" method="POST" action="ExcluirCompra.jsp">  
                                                            <input type="hidden" id="id_compra" name="id_compra" value="<%=rsCompra.getString("id_compra")%>">
                                                            <button href="Editar_Vacina.jsp" id="excluirCompra" name="excluirCompra" class="btn btn-danger">
                                                                <i class="fa fa-trash icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                    </td>
                                                </tr>
    <%                                      }
                                        }else{
    %>
                                            <div>Não possui pedidos</div>
    <%
                                        }
                                    }if (request.getParameter("data_compra").isEmpty()) {
                                        ResultSet rsCompra = compra.Consultar("SELECT * FROM TB_Compra WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                        if(rsCompra.isBeforeFirst()){
                                            while (rsCompra.next()) {
        %>
                                                <tr class="text-center">
                                                    <th scope="row"><%=rsCompra.getString("id_compra")%></th>
                                                    <td><%=rsCompra.getString("data_compra")%></td>
                                                    <td><%=rsCompra.getString("valor_compra")%></td>
                                                    <td><%=rsCompra.getString("tipo_pagamento_compra")%></td>
        <%                          
                                                    ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsCompra.getString("cliente_id_cliente"));
                                                    if(rsCliente.isBeforeFirst()){
                                                        if(rsCliente.next()) {
        %> 
                                                            <td><%=rsCliente.getString("nome_cliente")%></td>
                                                            <td style="font-size: 18px;"><%=rsCliente.getString("cpf_cliente")%></td>
        <%                                                  }
                                                    }
        %>
                                                    <td>
                                                    <div class="row btn_tabela_acoes">
                                                        <form id="formExcluirPedido" method="POST" action="ExcluirCompra.jsp">  
                                                            <input type="hidden" id="id_compra" name="id_compra" value="<%=rsCompra.getString("id_compra")%>">
                                                            <button href="Editar_Vacina.jsp" id="excluirCompra" name="excluirCompra" class="btn btn-danger">
                                                                <i class="fa fa-trash icone_plus"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                    </td>
                                                </tr>
    <%                                      }
                                        }else{
    %>
                                            <div>Não possui pedidos</div>
    <%
                                        }
                                    }
                                }else{
                                    ResultSet rsCompra = compra.Consultar("SELECT * FROM TB_Compra WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                    if(rsCompra.isBeforeFirst()){
                                        while (rsCompra.next()) {
    %>
                                            <tr class="text-center">
                                                <th scope="row"><%=rsCompra.getString("id_compra")%></th>
                                                <td><%=rsCompra.getString("data_compra")%></td>
                                                <td><%=rsCompra.getString("valor_compra")%></td>
                                                <td><%=rsCompra.getString("tipo_pagamento_compra")%></td>
    <%                          
                                                ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + rsCompra.getString("cliente_id_cliente"));
                                                if(rsCliente.isBeforeFirst()){
                                                    if(rsCliente.next()) {
    %> 
                                                        <td><%=rsCliente.getString("nome_cliente")%></td>
                                                        <td style="font-size: 18px;"><%=rsCliente.getString("cpf_cliente")%></td>
    <%                                                  }
                                                }
    %>
                                                <td>
                                                <div class="row btn_tabela_acoes">
                                                    <form id="formExcluirPedido" method="POST" action="ExcluirCompra.jsp">  
                                                        <input type="hidden" id="id_compra" name="id_compra" value="<%=rsCompra.getString("id_compra")%>">
                                                        <button href="Editar_Vacina.jsp" id="excluirCompra" name="excluirCompra" class="btn btn-danger">
                                                            <i class="fa fa-trash icone_plus"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                                </td>
                                            </tr>
    <%                                  }
                                    }else{
    %>
                                        <div>Não possui pedidos</div>
    <%
                                    }
                                }
                            }
%>
                    </tbody>
                </table>
            </div>
        </div>
      <div id="header_vacina"></div>
    </body>
</html>