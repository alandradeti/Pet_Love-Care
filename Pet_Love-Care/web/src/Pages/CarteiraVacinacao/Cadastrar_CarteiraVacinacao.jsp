<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
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

    </head>

    <body>
        <!-- Menu -->
        <div id="headerDiv"></div>
        <div class="modal fade modal_vacina" id="modal_carteira">
            <div class="space_vacina">
                <button type="button" class="close close_modal_vacina mr-2 mt-1" 
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="tela_vacina">  
                    <div class="centralizar">
                        <img src="../../img/Logo/periquito.png" 
                             alt="icone" class="tamanho_icone"/>
                        <h4 class="mt-3">Cadastrar Carteira</h4>
                    </div>
                    <form id="formCadastrarCarteiraVacinacao">
                        <input type="text" name="data_inicial_agendamento" id="data_inicial_agendamento"  placeholder="Data" value="<%=request.getParameter("id_cliente")%>"/>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="col-form-label login_label mt-3">Cachorro:</label>
                                <select name="id_pet" id="id_pet" class="form-control" required>
                                        <%
                                            ResultSet rsPet = pet.Consultar("SELECT Id_Pet,Nome_Pet,Cliente_Id_Cliente FROM TB_Pet WHERE Cliente_Id_Cliente = '" + request.getParameter("id_cliente")+ "'");
                                            while (rsPet.next()) {
                                        %>
                                                <option value="<%=rsPet.getString("id_pet")%>"><%=rsPet.getString("nome_pet")%></option>      
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
                            <%      }while (rsVacina.next());
                                }
                            %>
                        </select>
                        <div class="centralizar_btn"> 
                            <button class="btn btn_login mt-4 centralizar_btn">Cadastrar</button>
                        </div>
                    </form>
                    <div class="modal-dialog">

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>