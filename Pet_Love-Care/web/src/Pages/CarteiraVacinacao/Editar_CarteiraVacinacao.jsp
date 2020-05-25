<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pet" class="Pet.PetDAO"/>
<jsp:useBean id="vacina" class="Vacina.VacinaDAO"/>
<jsp:useBean id="carteiraVacinacao" class="CarteiraVacinacao.CarteiraVacinacaoDAO"/>
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
        <script src="../js/petUtils.js"></script>
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
                <form id="formExcluirDadosCarteiraVacinacao">
                    <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=request.getParameter("id_carteira_vacinacao")%>">
                    <button class="btn btn-danger mt-2 btn_excluir" id="excluirCarteira" name="excluirCarteira">
                        <i class="fa fa-trash"></i>
                    </button> 
                </form>
                <a class="btn_voltar" href="./Consultar_CarteiraVacinacao.jsp">
                    <i class="fas fa-arrow-left icone_plus"></i>
                </a>
                <div class="centralizar">
                    <img src="../../img/Logo/folha_azul.png" 
                         alt="icone" class="tamanho_icone"/>
                    <h4 class="mt-3">Editar Carteira</h4>
                </div>
<%
                if(request.getParameter("id_carteira_vacinacao")!=null){
                ResultSet rsCarteiraVacinacao = carteiraVacinacao.Consultar("SELECT * FROM TB_Carteira_Vacinacao WHERE Id_Carteira_Vacinacao = " + request.getParameter("id_carteira_vacinacao"));
                    if(rsCarteiraVacinacao.next()){
%>
                <form id="formAlterarDadosCarteiraVacinacao">
                    <input type="hidden" id="id_carteira_vacinacao" name="id_carteira_vacinacao" value="<%=request.getParameter("id_carteira_vacinacao")%>">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="col-form-label login_label mt-3">Cachorro:</label>
                            <select name="id_pet" id="id_pet" class="form-control" required>
<%                              ResultSet rsPetPesquisa = pet.Consultar("SELECT Id_Pet,Nome_Pet FROM TB_Pet WHERE Id_Pet = " + rsCarteiraVacinacao.getInt("pet_id_pet"));
                                if(rsPetPesquisa.next()) {
%>                          
                                    <option value="<%=rsPetPesquisa.getString("id_pet")%>">-> ID(<%=rsPetPesquisa.getString("id_pet")%>) - <%=rsPetPesquisa.getString("nome_pet")%></option>
<%                              }  
                                ResultSet rsPet = pet.Consultar("SELECT Id_Pet,Nome_Pet FROM TB_Pet WHERE Cliente_Id_Cliente = '" + request.getParameter("id_cliente")+ "'");
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
                            <input type="text" class="form-control"
                                name="data_pet_vacina" 
                                id="data_pet_vacina" value="<%=rsCarteiraVacinacao.getString("data_pet_vacina")%>" required />
                        </div>
                    </div>

                    <label class="col-form-label login_label">Nome Vacina:</label>
                    <select name="id_vacina" id="id_vacina" class="form-control">
<%                      ResultSet rsVacinaPesquisa = vacina.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina WHERE Id_Vacina = " + rsCarteiraVacinacao.getInt("vacina_id_vacina"));
                        if(rsVacinaPesquisa .next()) {
%>                                  
                            <option value="<%=rsVacinaPesquisa.getString("id_vacina")%>"> -> <%=rsVacinaPesquisa.getString("nome_vacina")%></option>
<%                      }   
                        ResultSet rsVacina = vacina.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina");
                        if(rsVacina.next()){
                            do{
%>                                  
                                <option value="<%=rsVacina.getString("id_vacina")%>"><%=rsVacina.getString("nome_vacina")%></option>
<%                          }while (rsVacina.next());
                        }
%>                           
                    </select>
                    <div class="centralizar_btn"> 
                        <button class="btn btn_login mt-4 centralizar_btn mb-3">Editar</button>
                    </div>
                </form>
<%
                    }
                }
%>
            </div>
        </div>
    </body>
</html>
