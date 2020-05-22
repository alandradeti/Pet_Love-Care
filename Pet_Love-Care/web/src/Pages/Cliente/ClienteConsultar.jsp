<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <!-- FormulÃ¡rio -->
            <div class="card container mt-5 card_consulta">
                <div class="text-center mt-4">
                    <img src="../../img/Logo/homem.png" class="cabeca_gato">
                    <h3 class="mt-2">Consultar Cliente</h3>
                </div>
                <form id="formPesquisarNomeCliente" method="POST" action="ClienteConsultar.jsp">
                    <div class="form-group col-6">
                        <input type="text" name="nome_cliente" id="nome_cliente" />
                        <button type="submit" class="btn btn-danger mt-2" id="pesquisarCliente" name="pesquisarCliente">
                            <i class="fas fa-search"></i>
                        </button> 
                    </div>
                </form>
                <table class="table responsive table-hover table-dark mt-4">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Telefone</th>
                            <th scope="col">Sexo</th>
                            <th scope="col">Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getParameter("pesquisarCliente") != null) {
                                ResultSet rsClientePesquisa = cliente.Consultar("SELECT * FROM TB_Cliente WHERE Nome_Cliente = '" + request.getParameter("nome_cliente") + "'");
                                if (rsClientePesquisa.isBeforeFirst() && !request.getParameter("nome_cliente").isEmpty()) {
                                    while (rsClientePesquisa.next()) {
                        %>
                                        <tr class="text-center">
                                            <th scope="row"><%=rsClientePesquisa.getString("id_cliente")%></th>
                                            <td id="nome_cliente"><%=rsClientePesquisa.getString("nome_cliente")%></td>
                                            <td id="telefone_cliente"><%=rsClientePesquisa.getString("telefone_fixo_cliente")%></td>
                                            <td id="sexo_cliente"><%=rsClientePesquisa.getString("sexo_cliente")%></td>
                                            <td id="email_cliente"><%=rsClientePesquisa.getString("email_cliente")%></td>
                                            <td>
                                                <form id="formAlterarCliente" method="POST" action="Editar_Cliente.jsp">  
                                                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsClientePesquisa.getString("id_cliente")%>">
                                                    <button href="Editar_Cliente.jsp" id="alterarCliente" name="alterarCliente" class="btn btn-warning mt-2">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                        <%          }
                                } else if (request.getParameter("nome_cliente").isEmpty()) {
                                    ResultSet rsCliente = cliente.Consultar("SELECT * FROM TB_Cliente");
                                    while (rsCliente.next()) {
                        %>
                                        <tr class="text-center">
                                            <th scope="row"><%=rsCliente.getString("id_cliente")%></th>
                                            <td id="nome_cliente"><%=rsCliente.getString("nome_cliente")%></td>
                                            <td id="telefone_cliente"><%=rsCliente.getString("telefone_fixo_cliente")%></td>
                                            <td id="sexo_cliente"><%=rsCliente.getString("sexo_cliente")%></td>
                                            <td id="email_cliente"><%=rsCliente.getString("email_cliente")%></td>
                                            <td>
                                                <form id="formAlterarCliente" method="POST" action="Editar_Cliente.jsp">  
                                                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsCliente.getString("id_cliente")%>">
                                                    <button href="Editar_Cliente.jsp" id="alterarCliente" name="alterarCliente" class="btn btn-warning mt-2">
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
                    <%          }
                        } else {
                            ResultSet rsCliente = cliente.Consultar("SELECT * FROM TB_Cliente");
                            while (rsCliente.next()) {
                    %>
                                <tr class="text-center">
                                            <th scope="row"><%=rsCliente.getString("id_cliente")%></th>
                                            <td id="nome_cliente"><%=rsCliente.getString("nome_cliente")%></td>
                                            <td id="telefone_cliente"><%=rsCliente.getString("telefone_fixo_cliente")%></td>
                                            <td id="sexo_cliente"><%=rsCliente.getString("sexo_cliente")%></td>
                                            <td id="email_cliente"><%=rsCliente.getString("email_cliente")%></td>
                                            <td>
                                                <form id="formAlterarCliente" method="POST" action="Editar_Cliente.jsp">  
                                                    <input type="hidden" id="id_cliente" name="id_cliente" value="<%=rsCliente.getString("id_cliente")%>">
                                                    <button href="Editar_Cliente.jsp" id="alterarCliente" name="alterarCliente" class="btn btn-warning mt-2">
                                                        <i class="fa fa-pen icone_plus"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="header_cliente"></div>
    </body>

</html>