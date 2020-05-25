<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="carrinho" class="Compra.CarrinhoDAO"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Love Care</title>

  <link rel="stylesheet" href="../../../css//bootstrap.min.css">
  <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
  <link rel="stylesheet" href="../css/padrao.css">
  <link rel="stylesheet" href="./compras.css" >

  <script src="../../../js/jquery.slim.min.js"></script>
  <script src="../../../js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="../../../js/jquery.min.js"></script>
  <script src="../js/padrao.js"></script>
  <script src="../js/post.js"></script>
  <script src="../js/ajax.min.js"></script>
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
        <div class="text-center mt-4">
            <img src="../../img/Logo/Mao_sacola.png" class="cabeca_gato">
          <h3 class="mb-3">Lista de Compras</h3>
        </div>
           <table id="myTable" class="table responsive">
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Produto</th>
                <th scope="col">Quantidade</th>
                <th scope="col">Preço Total</th>
                <th scope="col">Remover</th>
              </tr>
            </thead>
            <tbody>
<%
                ResultSet rsCarrinho = carrinho.Consultar("SELECT * FROM TB_Carrinho WHERE Cliente_Id_Cliente = " + session.getAttribute("id_cliente") + " AND Status_Carrinho = 0");
                if(rsCarrinho.isBeforeFirst()){
                    while (rsCarrinho.next()) {
%>
                            <tr class="text-center">
                            
                            <td scope="row"><%=rsCarrinho.getString("produto_id_produto")%></th>
<%                          ResultSet rsNomeProduto = carrinho.Consultar("SELECT Nome_produto FROM TB_Produto WHERE Id_Produto = " + rsCarrinho.getString("produto_id_produto"));
                            if(rsNomeProduto.next()){
%>
                                <td><%=rsNomeProduto.getString("nome_produto")%></td>
<%                          }
%>                            
                            <td><%=rsCarrinho.getInt("quantidade_carrinho")%></td>
                            <td><%=rsCarrinho.getFloat("preco_carrinho")%></td>
                            <td>
                                <form id="formExcluirProdutoCarrinho" method="POST" action="ExcluirCarrinho.jsp">  
                                    <input type="hidden" id="id_carrinho" name="id_carrinho" value="<%=rsCarrinho.getString("id_carrinho")%>">
                                    <button type="submit" id="excluirProdutoCarrinho" name="excluirProdutoCarrinho" class="btn btn-danger btn_comprar">
                                        <i class="fa fa-trash icone_plus"></i>
                                    </button>
                                </form>
                            </td>
                        </tr> 
                        <input type="hidden" class="soma" id="soma>" name="soma" value="<%=rsCarrinho.getFloat("preco_carrinho")%>">  
<%                             
                    }
                }else{
%>
                    <div>Carrinho vazio!</div>
<%
                }
%>              
            </tbody>
          </table>
          
            <form id="formRealizaPagamento" method="POST" action="Pagamento.jsp">
              <label id="valorTotal" class="col-form-label login_label mt-3"></label>
              <input type="hidden" id="valor_total_compra" name="valor_total_compra">
              <button class="btn btn-warning">
                  <i class="fas fa-shopping-cart"></i>
                  <b>Pagar</b>
              </button>
            </form>
            <br/>
        </div>
      </div>
    </div>
</body>
<script>
    var inputs = document.getElementsByClassName("soma");
    var soma = 0;
    for(let i = 0; i < inputs.length; i++){
        soma += parseFloat(inputs[i].value);
    }
    document.getElementById("valorTotal").innerHTML = "Valor total: R$ " + soma;
    document.getElementById('valor_total_compra').value = soma;
</script>
</html>

