<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="veterinario" class="Veterinario.VeterinarioDAO"/>
<!DOCTYPE html>
<html lang="en">

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
      $("#header_veterinario").load("./Veterinario_Editar.jsp");
    });
    $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').trigger('focus');
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
    <div class="text-center mt-4">
        <img src="../../img/Logo/veterinario_oculos.png" class="cabeca_gato">
      <h3 class="mt-2">Consultar veterinário</h3>
    </div>
      
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
                      <button data-toggle="modal" data-target="#modal_veterinario" class="btn btn btn-warning mt-2" name="alterarVeterinario" id="alterarVeterinario">
                          <a data-toggle="modal">
                        <i class="fa fa-pen"></i>
                       </a>
                   </button>
                   <button class="btn btn-danger mt-2">
                       <i class="fa fa-trash"></i>
                   </button> 
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
