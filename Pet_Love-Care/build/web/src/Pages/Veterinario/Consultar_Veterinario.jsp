<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Love Care</title>

  <link rel="stylesheet" href="../../../css/bootstrap.min.css">
  <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
  <link rel="stylesheet" href="../css/padrao.css">
  <link rel="stylesheet" href="./Veterinario.css" > 

  <script src="../../../js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="../../../js/jquery.min.js"></script>
  <script src="../js/padrao.js"></script>
  
  <script>
    $(function () {
      $("#headerDiv").load("../Menu/Menu.jsp");
    });
    $(function () {
        $("#header_veterinario").load("./Cadastrar_Veterinario.html");
    });
     $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
    });
    function setJsp() {
        var jsp = document.getElemtnById("jsp");
        jsp.value = rsVeterinario.getString("id_veterinario");
    };
  </script>
</head>

<body>
  <!-- Menu -->
  <div id="headerDiv"></div>
  <div class="background">
  <!-- FormulÃ¡rio -->
  <div class="card container mt-5 card_consulta">
    <button type="button" class="btn btn_cadastrar mt-2"
            data-toggle="modal" data-target="#modal_veterinario">
        <a class="btn_vacina" data-toggle="modal">
            <i class="fa fa-plus icone_plus"></i>
        </a>
    </button>
    <div class="text-center mt-4">
        <img src="../../img/Logo/veterinario_oculos.png" class="cabeca_gato">
      <h3 class="mt-2">Consultar veterinário</h3>
    </div>
      <form id="formPesquisarNomePet" method="POST" 
            action="Consultar_Veterinario.jsp" class="form-inline my-2 my-lg-0 mt-4">
          <div class="form-group col-6">
              <input type="text" name="nome_veterinario" id="nome_veterinario" 
                     class="form-control mr-sm-2 search"/>
              <button type="submit" 
                      class="btn btn-outline-success my-2 my-sm-0 btn_search" 
                      id="pesquisarVeterinario" name="pesquisarVeterinario">
                  <i class="fas fa-search"></i>
              </button> 
          </div>
      </form>
     <table class="table table-hover table-dark mt-4 responsive">
       <thead>
         <tr class="text-center">
           <th scope="col">ID</th>
           <th scope="col">Nome</th>
           <th scope="col">Telefone</th>
           <th scope="col">CPF</th>
           <th scope="col">Data de Nascimento</th>
           <th scope="col">Ações</th>
         </tr>
       </thead>
       <tbody>
           
        <%
            ResultSet rsVeterinario = veterinario.Consultar("SELECT * FROM TB_Veterinario");
            while(rsVeterinario.next()){
        %>
       <form id="formConsultarVeterinario">
                <tr class="text-center">
                  <th scope="row"><%=rsVeterinario.getString("id_veterinario")%></th>
                  <td><%=rsVeterinario.getString("nome_veterinario")%></td>
                  <td><%=rsVeterinario.getString("telefone_celular_veterinario")%></td>
                  <td><%=rsVeterinario.getString("cpf_veterinario")%></td>
                  <td><%=rsVeterinario.getString("data_nascimento_veterinario")%></td>
                  <td>
                    <div class="row btn_tabela_acoes">
                        <input type="hidden" id="id_veterinario" name="id_veterinario">
                        <a href="./Editar_Veterinario.jsp">
                          <button id="alterarVeterinario" name="alterarVeterinario" 
                                  class="btn btn-warning" >
                               <i class="fa fa-pen icone_plus"></i>
                          </button>
                        </a>
                        <input type="hidden" id="id_veterinario" name="id_veterinario">
                        <button class="btn btn-danger ml-2" id="excluirVeterinario" 
                                name="excluirVeterinario">
                            <i class="fa fa-trash icone_plus"></i>
                        </button> 
                    </div>
                  </td>  
                </tr>
                </form>
        <%
            }
        %> 
       </tbody>
     </table>
    </form>
   </div>
  </div>
    <div id="header_veterinario"></div>
</body>

</html>
