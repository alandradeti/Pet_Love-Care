<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css//bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="../Home/home.css" />

        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../../../js/jquery.min.js"></script>
        <script src="../js/padrao.js"></script>


        <script>
            $(function () {
                $("#headerDiv").load("../Menu/Menu.jsp");
            });
            $(function () {
                $("#header_produtos").load("./Produto_editar.html");
            });
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
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
        <section class="background">
            <h1 class="custom_titulo_produtos">Conheçam alguns de nossos produtos!</h1>
            <div class="row custom_body_produtos">
                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 

                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal">
                                <i class="fa fa-pen"></i>
                            </a>
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_1.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Ração Hills</h5>
                        <p class="card-text" id="descricao_produto">Ração Hills sabor carne, recomendada para cachorros de porte pequeno.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>

                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto"
                                   name="quantidade_produto"
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a> 
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_2.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Royal Canin</h5>
                        <p class="card-text" id="descricao_produto">Royal Canin sabor carne, recomendada para cachorros de porte médio e grande.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto" name="quantidade_produto"
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a> 
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_3.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Ração Golden</h5>
                        <p class="card-text" id="descricao_produto" >Golden sabor carne defumada, recomendada para cachorros de porte médio.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto" name="quantidade_produto" 
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a>
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_4.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Antipugas Bravecto</h5>
                        <p class="card-text" id="descricao_produto">Braveo antipugas, recomendado para cachorros de porte médio e pequeno.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto" name="quantidade_produto"
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row custom_body_produtos">
                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a>
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_5.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Super Secão</h5>
                        <p class="card-text" id="descricao_produto">Super Secão Citrus Tapete Higiênico Petix para Cães - 30 Unidades.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto" name="quantidade_produto" 
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a> 
                        </button>
                    </div> 
                    <img src="../../img/Produtos/produto_6.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Arranhadores</h5>
                        <p class="card-text" id="descricao_produto">Brinquedo Arranhador SÃ£o Pet Maxball para Gatos de qualquer idade.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto"
                                   name="quantidade_produto" 
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a> 
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_7.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Areia</h5>
                        <p class="card-text" id="descricao_produto">Areia HigiÃªnica Chalesco e Garfield com Cristais de SÃ­lica para Gatos - 2kg.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto" name="quantidade_produto"
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card custom_card_produtos" style="width: 18rem;">
                    <div class="aling_btn">
                        <button class="btn btn-danger mt-2"><i class="fa fa-trash"></i></button> 
                        <button type="button" class="btn btn-warning mt-2"
                                data-toggle="modal" data-target="#modal_edit_produtos">
                            <a class="btn_vacina" data-toggle="modal"><i class="fa fa-pen"></i></a>
                        </button>
                    </div>
                    <img src="../../img/Produtos/produto_8.png" class="card-img-top custom_img_produtos" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="nome_produto">Antipugas</h5>
                        <p class="card-text" id="descricao_produto">Antipugas para cÃ£es, recomendado para cachorros de porte mÃ©dio e grande.</p>
                        <p class="card-text" id="valor_produto">R$ 19,99</p>
                        <div class="input-group mb-3 input_center">
                            <div class="input-group-prepend">
                                <button class="btn btn-dark" 
                                        type="button">+</button>
                            </div>
                            <input type="text" class="form-control col-2" 
                                   id="quantidade_produto" name="quantidade_produto" 
                                   aria-describedby="button-addon1">
                            <div class="input-group-append">
                                <button class="btn btn-dark"
                                        type="button">-</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
     <div id="header_produtos"></div>
    </body>

</html>