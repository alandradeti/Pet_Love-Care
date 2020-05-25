<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        
        
        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/ajax.min.js"></script>
        <script src="../js/post.js"></script>
        <script src="../js/padrao.js"></script>
        <script src="../js/petUtils.js"></script>
        
        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
            function enable(){
                if(document.getElementById("tipo_pagamento_compra").value === 'Cartão'){
                   document.getElementById("numero_cartao").disabled = false;
                   document.getElementById("numero_seguranca_cartao").disabled = false;
                   document.getElementById("numero_parcela").disabled = false;
               }else{
                   document.getElementById("numero_cartao").disabled = true;
                   document.getElementById("numero_seguranca_cartao").disabled = true;
                   document.getElementById("numero_parcela").disabled = true;
               } 
            }
        </script>
    </head>

    <body>
        <!-- Menu -->
        <div id="headerDiv"></div>
        <div class="background">
            <!-- FormulÃÂ¡rio -->
            <div class="card container card_consulta">
                <a class="btn_voltar" href="./Compras.jsp">
                        <i class="fas fa-arrow-left icone_plus"></i>
                    </a>
                <div class="text-center mt-4">
                    <img src="../../img/Logo/cachorro_dodoi.png" class="cabeca_gato">
                    <h3>Pagamento</h3>
                </div>
                
<%                
                if(request.getParameter("valor_total_compra")!=null){
                    ResultSet rsCliente = cliente.Consultar("SELECT Id_Cliente,Nome_Cliente FROM tb_cliente WHERE Id_Cliente = " + session.getAttribute("id_cliente"));
                    if(rsCliente.next()){
%>                
                        <form id="formRealizarPagamento">
                            <label class="col-form-label login_label mt-3">Nome: <%=rsCliente.getString("nome_cliente")%></label>
                            <input type="hidden" name="data_compra" id="data_compra" value="" />
                            <input type="hidden" name="valor_compra" id="valor_compra" value="<%=request.getParameter("valor_total_compra")%>" />
                            <input type="hidden" class="form-control" name="id_cliente" id="id_cliente" value="<%=rsCliente.getString("id_cliente")%>"/>
                           
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Tipo de Pagamento:</label>
                                    <select onclick="enable()" name="tipo_pagamento_compra" id="tipo_pagamento_compra" class="form-control">
                                        <option value="Boleto">Boleto</option>
                                        <option value="Cartão">Cartão</option>
                                    </select>
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Número Cartão</label>
                                    <input
                                        type="text"
                                        class="form-control only-numbers"
                                        maxlength="16"
                                        name="numero_cartao"
                                        id="numero_cartao"
                                        disabled/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Número Segurança</label>
                                    <input
                                        type="text"
                                        class="form-control only-numbers"
                                        maxlength="3"
                                        placeholder="CVV"
                                        name="numero_seguranca_cartao"
                                        id="numero_seguranca_cartao"
                                        disabled/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label">Parcelas:</label>
                                    <select disabled name="numero_parcela" id="numero_parcela" class="form-control">
                                        <option value="1">1x À Vista</option>
                                        <option value="2">2x</option>
                                        <option value="3">3x</option>
                                        <option value="4">4x</option>
                                        <option value="5">5x</option>
                                    </select>
                                </div>
                            </div>
                            <label class="col-form-label login_label mt-3">Valor Total: <%=request.getParameter("valor_total_compra")%></label>
                            <div class="centralizar_btn"> 
                                <button class="btn btn_login mt-4 centralizar_btn mb-3">
                                    Confirmar Pagamento
                                </button>
                            </div>
                        </form>
                                
                                
                       <%
                }
                else{
                    out.println("Nenhum registro");
                }
            }
            %>
            </div>
        </div>
        <script>
            var currentDate = {
                day: new Date().getDate() > 9 ? new Date().getDate() : "0" + new Date().getDate(),
                month: (new Date().getMonth() + 1) > 9 ? (new Date().getMonth() + 1) : "0" + (new Date().getMonth() + 1),
                year: new Date().getFullYear(),
                formatted: function(){
                    return this.day + '/' + this.month + '/' + this.year;
                }
            };
            document.getElementById("data_compra").value = currentDate.formatted();
        </script>
    </body>
</html>
