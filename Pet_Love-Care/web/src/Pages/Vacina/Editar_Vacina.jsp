<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./Vacina.css" />

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
                <button type="button" class="btn btn-danger btn_excluir mt-2">
                    <a><i class="fa fa-trash"></i></a>
                </button>
                <div class="text-center mt-4">
                    <img src="../../img/Logo/cachorro_dodoi.png" class="cabeca_gato">
                    <h3>Editar Vacina</h3>
                </div>
                <form>
                    <label class="col-form-label login_label">Nome</label>
                    <input
                        type="text"
                        class="form-control"
                        name="nome_vacina"
                        id="nome_vacina"
                        placeholder="Insira o nome da vacina"
                        required
                        />

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="col-form-label login_label mt-3">Quantidade</label>
                            <input
                                type="number"
                                class="form-control"
                                name="quantidade_estoque_vacina"
                                id="quantidade_estoque_vacina"
                                placeholder="Quantidade no estoque"
                                required
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label class="col-form-label login_label mt-3">Valor</label>
                            <input
                                type="text"
                                class="form-control"
                                name="valor_vacina"
                                id="valor_vacina"
                                placeholder="Preço R$ "
                                required
                                />
                        </div>
                    </div>

                    <label class="col-form-label login_label">Descrição</label>
                    <textarea
                        class="form-control"
                        name="descricao_vacina"
                        id="descricao_vacina"
                        placeholder="Descrição"
                        required
                        ></textarea>
                    <div class="centralizar_btn"> 
                        <button class="btn btn_login mt-4 centralizar_btn mb-3">
                            Cadastrar
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
