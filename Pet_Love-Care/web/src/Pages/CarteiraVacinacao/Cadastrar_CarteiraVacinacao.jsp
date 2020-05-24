<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Love Care</title>

  <link rel="stylesheet" href="../../../css//bootstrap.min.css">
  <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
  <link rel="stylesheet" href="../css/padrao.css">
  <link rel="stylesheet" href="./carteira.css" >
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">

  <script src="../../../js/jquery.slim.min.js"></script>
  <script src="../../../js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="../../../js/jquery.min.js"></script>
  <script src="../js/p…
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pet Love Care</title>

        <link rel="stylesheet" href="../../../css//bootstrap.min.css">
        <link rel="shortcut icon" href="../../img/Icon/Logo-cabeca.png">
        <link rel="stylesheet" href="../css/padrao.css">
        <link rel="stylesheet" href="./pet.css" >

        <script src="../../../js/jquery.slim.min.js"></script>
        <script src="../../../js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="../js/jquery.min.js"></script>
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
            <!-- Formulário -->
            <div class="card container mt-5 card_consulta">
                <a class="btn_voltar" href="./Consultar_CarteiraVacinacao.html">
                   <i class="fas fa-arrow-left icone_plus"></i>
                </a>
                <div class="text-center mt-4">
                    <img src="../../img/Logo/periquito.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Cadastrar Carteira</h4>
                </div>
                        <form id="formCadastrarDadosCarteiraVacinacao">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label mt-3">Cachorro:</label>
                                    <select name="id_pet" id="id_pet" class="form-control" required>
<%                                      ResultSet rsPet = pet.Consultar("SELECT Id_Pet,Nome_Pet FROM TB_Pet WHERE Cliente_Id_Cliente = '" + request.getParameter("id_cliente")+ "'");
                                        while (rsPet.next()) {
%>                                                    
                                            <option value="<%=rsPet.getString("id_pet")%>">-> ID(<%=rsPet.getString("id_pet")%>) - <%=rsPet.getString("nome_pet")%></option>      
<%                                                    
                                        }
%>                                        
                                    </select>

                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-form-label login_label mt-3">Data:</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="data_pet_vacina" 
                                        id="data_pet_vacina" required
                                        />
                                </div>
                            </div>

                            <label class="col-form-label login_label">Nome Vacina:</label>
                            <select name="id_vacina" id="id_vacina" class="form-control">
<%                        
                                ResultSet rsVacina = vacina.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina");
                                if(rsVacina.next()){
                                    do{
%>                                  
                                        <option value="<%=rsVacina.getString("id_vacina")%>"><%=rsVacina.getString("nome_vacina")%></option>
<%                                 }while (rsVacina.next());
                                }
%>                           
                            </select>
                            <div class="centralizar_btn mb-3"> 
                                <button class="btn btn_login mt-4 centralizar_btn">Cadastrar</button>
                            </div>
                        </form>
            </div>
        </div>
    </body>

</html>