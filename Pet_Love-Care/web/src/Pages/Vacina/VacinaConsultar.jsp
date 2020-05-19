<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Love Care</title>

  <link rel="stylesheet" href="../../../css/bootstrap.min.css">
  <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
  <link rel="stylesheet" href="../css/padrao.css">
  <link rel="stylesheet" href="./Vacina.css" > 


  <script src="../../../js/jquery.slim.min.js"></script>
  <script src="../../../js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="../../../js/jquery.min.js"></script>
  <script src="../js/padrao.js"></script>
  <script>
    $(function () {
      $("#headerDiv").load("../Menu/Menu.jsp");
    });
    $(function () {
      $("#header_vacina").load("./Cadastrar_Vacina.html");
    });
    $(function () {
      $("#header_editar_vacina").load("./Editar_Vacina.html");
    });
    $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').trigger('focus')
    });
  </script>
</head>

<body>
  <!-- Menu -->
  <div id="headerDiv"></div>
  <div class="background">
  <!-- FormulÃ¡rio -->
  <div class="card container mt-5 card_consulta">
      <button type="button" class="btn btn-success btn_cadastrar_vacinas mt-2">
          <a class="btn_vacina" href="../Vacina/Cadastrar_Vacina.html">
        <i class="fa fa-plus icone_plus"></i>
        </a>
      </button>
    <div class="text-center mt-4">
        <img src="../../img/Logo/Vacina_pata.png" class="cabeca_gato">
      <h3 class="mt-2">Vacinas disponíveis</h3>
    </div>
     <table id="tbVacina" class="table table-hover table-dark mt-4 responsive">
       <thead>
         <tr class="text-center">
           <th scope="col">ID</th>
           <th scope="col">Nome</th>
           <th scope="col">Valor</th>
           <th scope="col">Descrição</th>
           <th scope="col">Ações</th>
         </tr>
       </thead>
       <tbody>
<<<<<<< HEAD:Pet_Love-Care/web/src/Pages/Vacina/Constultar_Vacina.html
         <tr class="text-center">
           <th scope="row">1</th>
           <td>Legal</td>
           <td>0</td>
           <td>0</td>
           <td>Vacina legal</td>
           <td>
            <button type="button" class="btn btn-warning mt-2">
                <a href="Editar_Vacina.html">
                 <i class="fa fa-pen icone_plus"></i>
                </a>
            </button>
           </td>
         </tr>
=======
         <%
            ResultSet rsVacina = vacina.Consultar("SELECT * FROM TB_Vacina");
            while(rsVacina.next()){
         %>
                    <tr class="text-center">
                      <th scope="row" id="id_vacina"><%=rsVacina.getString("id_vacina")%></th>
                      <td id="nome_vacina"><%=rsVacina.getString("nome_vacina")%></td>
                      <td id="valor_vacina"><%=rsVacina.getString("valor_vacina")%></td>
                      <td id="descricao_vacina"><%=rsVacina.getString("descricao_vacina")%></td>
                      <td>
                       <button class="btn btn-warning mt-2">
                           <i class="fa fa-pen"></i>
                       </button>
                       <button class="btn btn-danger mt-2">
                           <i class="fa fa-trash"></i>
                       </button> 
                      </td>
                    </tr>
        <%
            }
        %> 
>>>>>>> Dev:Pet_Love-Care/web/src/Pages/Vacina/VacinaConsultar.jsp
       </tbody>
     </table>
   </div>
  </div>
  
</body>

</html>
