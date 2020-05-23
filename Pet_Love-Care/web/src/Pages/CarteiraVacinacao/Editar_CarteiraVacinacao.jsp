<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css/bootstrap.min.css" />
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png" />
        <link rel="stylesheet" href="../css/padrao.css" />
        <link rel="stylesheet" href="./Veterinario.css" />

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
            <!-- FormulÃÂ¡rio -->
            <div class="card container mt-5 card_consulta">
                <form id="formExcluirDadosVeterinario">
                    <input type="hidden" id="id_carteira" name="id_carteira">
                    <button class="btn btn-danger mt-2 btn_excluir" id="excluirCarteira" name="excluirCarteira">
                        <i class="fa fa-trash"></i>
                    </button> 
                </form>
                <a class="btn_voltar" href="./Consultar_CarteiraVacinacao.html">
                    <i class="fas fa-arrow-left icone_plus"></i>
                </a>
                <div class="centralizar">
                    <img src="../../img/Logo/folha_azul.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Carteira</h4>
                </div>

                <form id="formCadastrarVacina">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="col-form-label login_label mt-3">Cachorro:</label>
                            <input
                                type="text"
                                class="form-control"
                                id="nome_cachorro_pet_vacina"  
                                name="nome_cachorro_pet_vacina" placeholder="Nome do cachorro.." required
                                />
                        </div>
                        <div class="form-group col-md-6">
                            <label class="col-form-label login_label mt-3">Data:</label>
                            <input type="date" class="form-control"
                                name="data_pet_vacina" 
                                id="data_pet_vacina" required />
                        </div>
                    </div>

                    <label class="col-form-label login_label">Nome Vacina:</label>
                    <input class="form-control" name="descricao_vacina"
                        id="descricao_vacina" placeholder="Descrição"
                        required >
                    <div class="centralizar_btn"> 
                        <button class="btn btn_login mt-4 centralizar_btn mb-3">Editar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
