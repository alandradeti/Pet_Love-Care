<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="produto" class="Produto.ProdutoDAO"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./home.css" />

        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/post.js"></script>
        <script src="../js/ajax.min.js"></script>
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
            <!-- FormulÃÂÃÂ¡rio -->
            <div class="card container mt-5 card_consulta">
                <form id="formExcluirDadosProduto">
                    <input type="hidden" name="id_produto" id="id_produto" value="<%=request.getParameter("id_produto")%>" />
                    <button type="submit" class="btn btn-danger btn_excluir mt-2">
                        <a>
                            <i class="fa fa-trash"></i>
                        </a>
                    </button>
                </form>
                <a class="btn_voltar" href="../Home/Home.jsp">
                    <i class="fas fa-arrow-left icone_plus"></i>
                </a>
                <div class="centralizar">
                    <img src="../../img/Logo/produto_casa.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Produto</h4>
                </div>
                <%
                    if(request.getParameter("id_produto")!=null){
                        ResultSet rsProduto = produto.Consultar("SELECT * FROM TB_Produto WHERE Id_Produto = " + request.getParameter("id_produto"));
                        if(rsProduto.next()){
                %>
                        <form id="formAlterarDadosProduto">
                            <input type="hidden" name="id_produto" id="id_produto" value="<%=rsProduto.getString("id_produto")%>" />
                            <div class="col">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label mt-4 login_label">Nome do Produto:</label>
                                        <input type="text" class="form-control" name="nome_produto"
                                               id="nome_produto" placeholder="Insira o nome do produto" value="<%=rsProduto.getString("nome_produto")%>" required />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label mt-4 login_label">Valor do Produto:</label>
                                        <input type="text" class="form-control" name="valor_produto"
                                               id="valor_produto" placeholder="R$ " value="<%=rsProduto.getString("valor_produto")%>" required />
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label mt-4 login_label">Quantidade em estoque:</label>
                                        <input type="text" class="form-control" name="quantidade_estoque_produto"
                                               id="quantidade_estoque_produto"  
                                               placeholder="Quantidade de produtos em estoque" value="<%=rsProduto.getString("quantidade_estoque_produto")%>" required />
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label mt-4 login_label">Número da Imagem do produto:</label>
                                        <input type="text" class="form-control" name="numero_imagem_produto"
                                               id="numero_imagem_produto" 
                                               placeholder="Imagem produto" value="<%=rsProduto.getString("numero_imagem_produto")%>" required />
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="col-form-label mt-4 login_label">Descrição:</label>
                                        <input type="text" class="form-control" name="descricao_produto"
                                               id="descricao_produto" 
                                               placeholder="Descrição" value="<%=rsProduto.getString("descricao_produto")%>" required />
                                    </div>
                                </div>

                                <div class="pst_btn_agendar">
                                    <button class="btn btn_agendar mt-4 mb-3">Alterar</button>
                                </div>
                            </div>
                        </form>
                <%
                        }else{
                            out.println("Nenhum registro");
                        }
                    }
            %>
            </div>
        </div>
    </body>
</html>
<!--
         Menu 
        <div id="headerDiv"></div>
        <div class="background">
             FormulÃÂ¡rio 
            <div class="card container mt-5 card_consulta">
                <div class="centralizar">
                    <img src="../../img/Logo/produto_casa.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Produto</h4>
                </div>
                <form>
                    <div class="col">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="col-form-label mt-4 login_label">Nome do Produto:</label>
                                <input type="text" class="form-control" name="nome_produto"
                                       id="nome_produto" placeholder="Insira o nome do produto" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-form-label mt-4 login_label">Valor do Produto:</label>
                                <input type="text" class="form-control" name="valor_produto"
                                       id="valor_produto" placeholder="R$ " required />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="col-form-label mt-4 login_label">Quantidade do Produto:</label>
                                <input type="text" class="form-control" name="quantidade_produto"
                                       id="quantidade_produto" placeholder="Insira quantos produtos possuÃ­" required />
                            </div>
                            <div class="form-group col-md-6">
                                <label class="col-form-label mt-4 login_label">Quantidade em estoque:</label>
                                <input type="text" class="form-control" name="quantidade_estoque_produto"
                                       id="quantidade_estoque_produto" 
                                       placeholder="Quantidade de produtos em estoque" required />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="col-form-label mt-4 login_label">Imagem do Produto:</label>
                                <div class="warapper">
                                    <input type="file" accept="image/*" id="imagem_produto" 
                                           name="imagem_produto" onchange="preview_image(event)">
                                    <img id="imagem" class="tamanho_imagem"/>
                                </div>
                            </div>
                        </div>

                        <div class="centralizar">
                            <button class="btn btn_login mt-4 mb-3">Editar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>-->
