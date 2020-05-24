<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="produto" class="Produto.ProdutoDAO"/>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<!DOCTYPE html>
<html lang="PT-BR">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css//bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="../Home/home.css" />

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

        <% if ((String) request.getAttribute("errorMessage") != null) {%>
        <h3 style="color: red;"><%=(String) request.getAttribute("errorMessage")%></h3>
        <% }%>

        <!-- Carrosel -->
        <header>
            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../../img/Anuncios/Anuncio_1.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../../img/Anuncios/Anuncio_2.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../../img/Anuncios/Anuncio_3.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../../img/Anuncios/Anuncio_4.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../../img/Anuncios/Anuncio_5.jpg" class="d-block w-100 custom_img_anuncios" alt="...">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>

        <!-- Produtos -->
        <section class="background_home">
            <h1 class="custom_titulo_produtos">Conheçam alguns de nossos produtos!</h1>
            <div class="row custom_body_produtos">
                
                <%
                    ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                    if(rsCliente.next()){
                        if (rsCliente.getBoolean("Tipo_Cliente") == false){
                            ResultSet rsProduto = produto.Consultar("SELECT * FROM TB_Produto");
                            while (rsProduto.next()) {
                %>
                                <div class="card custom_card_produtos" style="width: 15rem;">
                                  <div class="card-body">
                                    <h5 class="card-title" id="nome_produto"><%=rsProduto.getString("nome_produto")%></h5>
                                    <img src="../../img/Produtos/produto_<%=rsProduto.getString("numero_imagem_produto")%>.png" class="card-img-top custom_img_produtos" 
                                         alt="...">
                                        <span class="text_qtd">Descrição: </span>
                                        <p class="card-text center_cliente" id="descricao_produto"><%=rsProduto.getString("descricao_produto")%></p>
                                        <form id="formAdicionarCarrinho" method="POST" name="formAdicionarCarrinho" action="../Compras/CarrinhoCompras.jsp">  
                                            <p class="card-text center_cliente" id="valor_produto" ><%=rsProduto.getString("valor_produto")%></p>
                                            <span class="text_qtd">Quantidade: </span>
                                            <div class="row centralizar_btn_cliente">
                                                <input type="text" class="form-control col-2" id="quantidade_carrinho" name="quantidade_carrinho" aria-describedby="button-addon1" required>
                                                <input type="hidden" id="valor_produto" name="valor_produto" value="<%=rsProduto.getString("valor_produto")%>">  
                                                <input type="hidden" id="nome_produto" name="nome_produto" value="<%=rsProduto.getString("nome_produto")%>">     
                                                <input type="hidden" id="id_produto" name="id_produto" value="<%=rsProduto.getString("id_produto")%>">
                                                <input type="hidden" id="id_cliente" name="id_cliente" value="<%=session.getAttribute("id_cliente")%>">
                                                <input type="hidden" id="status_carrinho" name="status_carrinho" value="0">
                                                <button id="adicionaProduto" name="adicionaProduto" class="btn btn-warning btn_plus_cliente ml-1">
                                                    <i class="fa fa-plus icone_plus"></i>
                                                </button>
                                            </div>
                                        </form>
                                  </div>
                                </div>
                <%
                            }
                        }else{
                            ResultSet rsProduto = produto.Consultar("SELECT * FROM TB_Produto");
                            while (rsProduto.next()) {
                %>
                                <div class="card custom_card_produtos" style="width: 15rem;">
                                    <div class="card-body">
                                        <form id="formAlterarProduto" method="POST" action="../Produtos/Produto_Editar.jsp">  
                                                <input type="hidden" id="id_produto" name="id_produto" value="<%=rsProduto.getString("id_produto")%>">
                                                <button type="submit" class="btn btn-warning editar_produto">
                                                    <i class="fa fa-pen icone_plus"></i>
                                                </button>
                                        </form>
                                        <h5 class="card-title" id="nome_produto"><%=rsProduto.getString("nome_produto")%></h5>
                                        <img src="../../img/Produtos/produto_<%=rsProduto.getString("numero_imagem_produto")%>.png" class="card-img-top custom_img_produtos" alt="...">
                                        <span class="text_qtd">Descrição: </span>
                                        <p class="card-text" id="descricao_produto"><%=rsProduto.getString("descricao_produto")%></p>
                                        <span class="text_qtd">Quantidade em estoque: </span>
                                        <p class="card-text" id="valor_produto"><%=rsProduto.getString("valor_produto")%></p>
                                    </div>
                                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
        </section>
        
    </body>

</html>