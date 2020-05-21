<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<%
    ResultSet rs = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
%>
<!DOCTYPE html>
<html lang="pt">

    <head>
        <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="../css/padrao.css" type="text/css"/>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- <script type="text/javascript" src="../../../js/bootstrap.min.js"></script>-->
        <!-- <script type="text/javascript" src="../../../js/jquery.slim.min.js"></script> -->
        <script type="text/javascript" src="../../jquery.min.js"></script>
        <script src="../js/padrao.js"></script>
        <script>
            $(function () {
                $("#header_login").load("../Login/Login.html");
            });
            $(function () {
                $("#header_cadastro").load("../Cliente/Cliente.html");
            });
            $(function () {
                $("#header_vacina").load("../Vacina/Vacina.html");
            });
        </script>
    </head>

    <nav class="navbar navbar-expand-lg navbar-light bg-light custom_navbar">
        <img src="../../img/Logo/Logo-remove.png" />
        <button class="navbar-toggler custom_icon" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="../Home/Home.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <%  if (rs.next()) {
                        if (rs.getBoolean("Tipo_Cliente") == false) {%>
                <li class="nav-item">
                    <a class="nav-link" href="../Agendar/Agendar.jsp">Agendar</a>
                </li>
                <%      }
                %>
                <%      if (rs.getBoolean("Tipo_Cliente") == true) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Veterinário
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="nav-link" href="../Veterinario/VeterinarioConsultar.jsp">Consultar</a>
                        <a class="nav-link" href="../Veterinario/Veterinario.html">Cadastrar</a>
                        <a class="nav-link" href="../Veterinario/Editar_Veterinario.jsp">Alterar</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Produtos
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../Home/Home.jsp">Consultar</a>
                        <a class="dropdown-item" href="../Produtos/Produtos.html">Cadastrar</a>
                        <a class="dropdown-item" href="../Home/Produto_editar.html">Alterar</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Agendamento
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../Agendar/Consultar_Agendamento.html">Consultar</a>
                        <a class="dropdown-item" href="../Agendar/Agendar.jsp">Agendar</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Pet
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../Pet/PetConsultar.jsp">Consultar</a>
                        <a class="dropdown-item" href="../Pet/Cadastrar_Pet.html">Cadastrar</a>
                        <a class="dropdown-item" href="../Pet/Editar_Pet.jsp">Alterar</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Clientes
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../Cliente/ClienteConsultar.jsp">Consultar</a>
                        <a class="dropdown-item" href="../Cliente/Editar_Cliente.jsp">Alterar</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Compras/Compras.html">Compras</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Vacina
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="nav-link" href="../Vacina/VacinaConsultar.jsp">Consultar</a>
                        <a class="dropdown-item" href="../Vacina/Editar_Vacina.jsp">Alterar</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Carteira/Carteira.html">Carteira</a>
                </li>
                <%      }
                %>
                <%      if (rs.getBoolean("Tipo_Cliente") == false) {%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Pet
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="nav-link" href="../Pet/PetConsultar.jsp">Consultar</a>
                        <a class="nav-link" href="../Pet/Cadastrar_Pet.html">Cadastrar</a>
                        <a class="dropdown-item" href="../Pet/Editar_Pet.jsp">Alterar</a>
                    </div>
                </li>
                <%      }
                    }
                %>
            </ul>
            <%  if (session.getAttribute("id_cliente") == null) {%>
            <a id="abrir_modal_login" href="#" class="login_cadastro mr-4">
                <div class="balao ml-3"><span class="latido_miado">Au-Au</span></div>
                <i class="fas fa-dog" style='font-size:26px;color: black;'></i> Login
            </a>
            <a id="abrir_modal_cadastro" href="#" class="login_cadastro">
                <div class="balao ml-3"><span class="latido_miado">Meow</span></div>
                <i class="fas fa-cat" style='font-size:26px;color: black;'></i> Cadastrar
            </a>
            <%  } else { %>
            <a id="abrir_modal_cadastro" href="../Login/saidaLogin.jsp" class="login_cadastro mr-4">
                <div class="balao ml-3"><span class="latido_miado">Au-Au</span></div>
                <i class="fas fa-dog" style='font-size:26px;color: black;'></i> Sair
            </a>
            <%  }%>

        </div>
    </nav>
    <div id="header_login"></div>
    <div id="header_cadastro"></div>


</html>