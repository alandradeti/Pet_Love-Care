<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<%
    ResultSet rs = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/padrao.css" type="text/css"/>
    <link rel="stylesheet" href="../css/padrao.css" type="text/css">

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
          <a class="nav-link" href="../Home/Home.html">Home <span class="sr-only">(current)</span></a>
        </li>
        <%  if(rs.next()){
                if(rs.getBoolean("Tipo_Cliente") == false){%>
                    <li class="nav-item">
                      <a class="nav-link" href="../Agendar/Agendar.jsp">Agendar</a>
                    </li>
        <%      } %>
        <%
                if(rs.getBoolean("Tipo_Cliente") == true){%>
                    <li class="nav-item">
                      <a class="nav-link" href="../Veterinario/Veterinario.html">Veterinário</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../Produtos/Produtos.html">Cadastrar Produtos</a>
                    </li>
        <%      }%>
        <%      if(rs.getBoolean("Tipo_Cliente") == false){%>
                    <li class="nav-item">
                        <a class="nav-link" href="../Pet/Pet.html">Cadastrar Pet</a>
                    </li>
                    </ul>
        <%      } 
            }%>
            
        <%  if(session.getAttribute("id_cliente") == null){%>
                <a id="abrir_modal_login" href="#" class="login_cadastro mr-4">
                  <div class="balao ml-3"><span class="latido_miado">Au-Au</span></div>
                  <i class="fas fa-dog" style='font-size:26px;color: black;'></i> Login
                </a>
                <a id="abrir_modal_cadastro" href="#" class="login_cadastro">
                  <div class="balao ml-3"><span class="latido_miado">Meow</span></div>
                  <i class="fas fa-cat" style='font-size:26px;color: black;'></i> Cadastrar
                </a>
        <%  }else{ %>
                <a id="abrir_modal_cadastro" href="../Login/saidaLogin.jsp" class="login_cadastro mr-4">
                  <div class="balao ml-3"><span class="latido_miado">Au-Au</span></div>
                  <i class="fas fa-dog" style='font-size:26px;color: black;'></i> Sair
                </a>
        <%  } %>
        
    </div>
  </nav>
  <div id="header_login"></div>
  <div id="header_cadastro"></div>


</html>