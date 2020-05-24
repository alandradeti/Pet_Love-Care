<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>--%>
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
                        <h2 class="relatorio_titulo_hidden">Relatório de compras:</h2>
                        <span class="estilo_span">ID: 1</span>
                        <span class="estilo_span">Nome Cliente: Scarpim</span>
                        <span class="estilo_span">CPF Cliente: 12345678910</span>
                        <span class="estilo_span">Data Compra: 20/20/2020</span>
                        <span class="estilo_span">Preço: R$ 54.5</span>
                        <span class="estilo_span">Produto: Amendoim</span>
                        <span class="estilo_span">Quantidade: 10</span>
                        <span class="estilo_span">Preço final: 54.5</span>
                        <br/>
                    </div>
                </div>
                <div class="pst_btn_agendar mt-3">
                    <button onclick="window.print()" class="btn btn_agendar">Imprimir</button>
                </div>
            </div>
        </div>
    </body>
</html>

