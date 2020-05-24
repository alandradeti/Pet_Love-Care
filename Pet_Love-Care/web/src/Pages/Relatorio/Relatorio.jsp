<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="compras" class="Compra.CompraDAO"/>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<!DOCTYPE html>
<html lang="PT-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./relatorio.css">
        <link rel="stylesheet" href="../css/imprimir.css">

        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/padrao.js"></script>
        <script src="../js/ajax.min.js"></script>
        <script src="../js/post.js"></script>
        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
        </script>
    </head>

    <body>
<%
    ResultSet rsCompra = compras.Consultar("SELECT * FROM TB_Compra WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente") + " AND Data_Compra = '" + session.getAttribute("data_compra") + "'");
    if(rsCompra.isBeforeFirst()){
        while (rsCompra.next()) {
            if(rsCompra.getString("tipo_pagamento_compra").equals("Boleto")){
%>
                <!-- Menu -->
                <div id="headerDiv"></div>
                <div class="background">
                    <div class="card container mt-5 card_consulta" style="padding: 40px">
                        <div class="text-center mt-2">
                            <img src="../../img/Logo/nota_amarela.png" class="cabeca_gato">
                            <h3 class="mb-4 titulo_page">Relatório</h3>
                        </div>
                        <div class="relatorio_box col">
                            <div class="relatorio_centralizar">
                            <div class="text-center logo_imprimi">
                                <img src="../../img/Logo/Logo-remove.png" />
                            </div>
                                <h2 class="relatorio_titulo_hidden">Nota Fiscal</h2>
                                <span class="estilo_span">Número do Pedido: <%=rsCompra.getString("id_compra")%></span>
    <%                          
                                ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + session.getAttribute("id_cliente"));
                                if(rsCliente.isBeforeFirst()){
                                    if(rsCliente.next()) {
    %> 
                                        <span class="estilo_span">Nome Cliente: <%=rsCliente.getString("nome_cliente")%></span>
                                        <span class="estilo_span">CPF Cliente: <%=rsCliente.getString("cpf_cliente")%></span>
    <%                              }
                                }
    %>                            
                                <span class="estilo_span">Forma de pagamento: <%=rsCompra.getString("tipo_pagamento_compra")%></span>
                                <span class="estilo_span">Data Compra: <%=session.getAttribute("data_compra")%></span>
                                <span class="estilo_span">Valor Total: <%=rsCompra.getString("valor_compra")%></span>
                                <br/>
                            </div>
                        </div>
                        <div class="pst_btn_agendar mt-3">
                            <button onclick="window.print()" class="btn btn_agendar">Imprimir</button>
                        </div>
                    </div>
                </div>
<%          }else{
%>
                  <!-- Menu -->
                <div id="headerDiv"></div>
                <div class="background">
                    <div class="card container mt-5 card_consulta" style="padding: 40px">
                        <div class="text-center mt-2">
                            <img src="../../img/Logo/nota_amarela.png" class="cabeca_gato">
                            <h3 class="mb-4 titulo_page">Relatório</h3>
                        </div>
                        <div class="relatorio_box col">
                            <div class="relatorio_centralizar">
                            <div class="text-center logo_imprimi">
                                <img src="../../img/Logo/Logo-remove.png" />
                            </div>
                                <h2 class="relatorio_titulo_hidden">Nota Fiscal</h2>
                                <span class="estilo_span">Número do Pedido: <%=rsCompra.getString("id_compra")%></span>
    <%                          
                                ResultSet rsCliente = cliente.Consultar("SELECT Nome_Cliente,CPF_Cliente FROM TB_Cliente WHERE Id_Cliente = " + session.getAttribute("id_cliente"));
                                if(rsCliente.isBeforeFirst()){
                                    if(rsCliente.next()) {
    %> 
                                        <span class="estilo_span">Nome Cliente: <%=rsCliente.getString("nome_cliente")%></span>
                                        <span class="estilo_span">CPF Cliente: <%=rsCliente.getString("cpf_cliente")%></span>
    <%                              }
                                }
    %>                            
                                <span class="estilo_span">Forma de pagamento: <%=rsCompra.getString("tipo_pagamento_compra")%></span>
                                <span class="estilo_span">Número de Parcelas: <%=rsCompra.getString("numero_parcela")%></span>
                                <span class="estilo_span">Data Compra: <%=session.getAttribute("data_compra")%></span>
                                <span class="estilo_span">Valor Total: <%=rsCompra.getString("valor_compra")%></span>
                                <br/>
                            </div>
                        </div>
                        <div class="pst_btn_agendar mt-3">
                            <button onclick="window.print()" class="btn btn_agendar">Imprimir</button>
                        </div>
                    </div>
                </div>
<%
            }
        }
    }else{
%>
        <div>Realize uma compra para imprimir a nota fiscal!</div>
<%
    }
%>
    </body>
</html>

