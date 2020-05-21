package org.apache.jsp.src.Pages.Pet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class PetConsultar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      Pet.PetDAO pet = null;
      synchronized (_jspx_page_context) {
        pet = (Pet.PetDAO) _jspx_page_context.getAttribute("pet", PageContext.PAGE_SCOPE);
        if (pet == null){
          pet = new Pet.PetDAO();
          _jspx_page_context.setAttribute("pet", pet, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');
      Cliente.ClienteDAO cliente = null;
      synchronized (_jspx_page_context) {
        cliente = (Cliente.ClienteDAO) _jspx_page_context.getAttribute("cliente", PageContext.PAGE_SCOPE);
        if (cliente == null){
          cliente = new Cliente.ClienteDAO();
          _jspx_page_context.setAttribute("cliente", cliente, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');

    ResultSet rs = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = 10");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Pet Love Care</title>\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../../css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../../img/Icon/Logo-cabeca.png\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/padrao.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./pet.css\" > \n");
      out.write("\n");
      out.write("        <script src=\"../../../js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script>\n");
      out.write("        <script src=\"../../../js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"../js/padrao.js\"></script>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            $(function () {\n");
      out.write("                $(\"#headerDiv\").load(\"../Menu/Menu.jsp\");\n");
      out.write("            });\n");
      out.write("            $(function () {\n");
      out.write("                $(\"#header_pet\").load(\"./Editar_Pet.html\");\n");
      out.write("            });\n");
      out.write("            $('#myModal').on('shown.bs.modal', function () {\n");
      out.write("                $('#myInput').trigger('focus')\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!-- Menu -->\n");
      out.write("        <div id=\"headerDiv\"></div>\n");
      out.write("        <div class=\"background\">\n");
      out.write("            <!-- Formulário -->\n");
      out.write("            <div class=\"card container mt-5 card_consulta\">\n");
      out.write("                <div class=\"text-center mt-4\">\n");
      out.write("                    <img src=\"../../img/Logo/Dog_2Cor.png\" class=\"cabeca_gato\">\n");
      out.write("                    <h3 class=\"mt-2\">Consultar Pet</h3>\n");
      out.write("                </div>\n");
      out.write("                <form id=\"formPesquisarNomePet\" method=\"POST\" action=\"PetConsultar.jsp\">\n");
      out.write("                    <div class=\"form-group col-6\">\n");
      out.write("                        <input type=\"text\" name=\"nome_pet\" id=\"nome_pet\" />\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-danger mt-2\" id=\"pesquisarPet\" name=\"pesquisarPet\">\n");
      out.write("                            <i class=\"fas fa-search\"></i>\n");
      out.write("                        </button> \n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("                <table id=\"tbPet\" class=\"table responsive table-hover table-dark mt-4\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr class=\"text-center\">\n");
      out.write("                            <th scope=\"col\">ID</th>\n");
      out.write("                            <th scope=\"col\">Espécie</th>\n");
      out.write("                            <th scope=\"col\">Nome</th>\n");
      out.write("                            <th scope=\"col\">Idade</th>\n");
      out.write("                            <th scope=\"col\">Porte</th>\n");
      out.write("                            <th scope=\"col\">Sexo</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            if (rs.getBoolean("Tipo_Cliente") == true){
                            if (request.getParameter("pesquisarPet") != null) {
                                ResultSet rsPetPesquisa = pet.Consultar("SELECT * FROM TB_Pet WHERE Nome_Pet = '" + request.getParameter("nome_pet") + "'");
                                if (rsPetPesquisa.isBeforeFirst() && !request.getParameter("nome_pet").isEmpty()) {
                                    while (rsPetPesquisa.next()) {
                        
      out.write("\n");
      out.write("                                        <tr class=\"text-center\">\n");
      out.write("                                            <th scope=\"row\">");
      out.print(rsPetPesquisa.getString("id_pet"));
      out.write("</th>\n");
      out.write("                                            <td id=\"especie_pet\">");
      out.print(rsPetPesquisa.getString("especie_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"nome_pet\">");
      out.print(rsPetPesquisa.getString("nome_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"idade_pet\">");
      out.print(rsPetPesquisa.getString("idade_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"porte_pet\">");
      out.print(rsPetPesquisa.getString("porte_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"sexo_pet\">");
      out.print(rsPetPesquisa.getString("sexo_pet"));
      out.write("</td>\n");
      out.write("                                            <td>\n");
      out.write("                                                <form id=\"formAlterarPet\" method=\"POST\" action=\"Editar_Pet.jsp\">  \n");
      out.write("                                                    <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPetPesquisa.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                    <button href=\"Editar_Pet.jsp\" id=\"alterarPet\" name=\"alterarPet\" class=\"btn btn-warning mt-2\">\n");
      out.write("                                                        <i class=\"fa fa-pen icone_plus\"></i>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </form>\n");
      out.write("                                                <form id=\"formExcluirDadosPet\">\n");
      out.write("                                                    <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPetPesquisa.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                    <button class=\"btn btn-danger mt-2\" id=\"excluiPet\" name=\"excluirPet\">\n");
      out.write("                                                        <i class=\"fa fa-trash icone_plus\"></i>\n");
      out.write("                                                    </button> \n");
      out.write("                                                </form>\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                        ");
          }
                                } else if (request.getParameter("nome_pet").isEmpty()) {
                                    ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet");
                                    while (rsPet.next()) {
                        
      out.write("\n");
      out.write("                                        <tr class=\"text-center\">\n");
      out.write("                                            <th scope=\"row\">");
      out.print(rsPet.getString("id_pet"));
      out.write("</th>\n");
      out.write("                                            <td id=\"especie_pet\">");
      out.print(rsPet.getString("especie_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"nome_pet\">");
      out.print(rsPet.getString("nome_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"idade_pet\">");
      out.print(rsPet.getString("idade_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"porte_pet\">");
      out.print(rsPet.getString("porte_pet"));
      out.write("</td>\n");
      out.write("                                            <td id=\"sexo_pet\">");
      out.print(rsPet.getString("sexo_pet"));
      out.write("</td>\n");
      out.write("                                            <td>\n");
      out.write("                                                <form id=\"formAlterarPet\" method=\"POST\" action=\"Editar_Pet.jsp\">  \n");
      out.write("                                                    <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                    <button href=\"Editar_Pet.jsp\" id=\"alterarPet\" name=\"alterarPet\" class=\"btn btn-warning mt-2\">\n");
      out.write("                                                        <i class=\"fa fa-pen icone_plus\"></i>\n");
      out.write("                                                    </button>\n");
      out.write("                                                </form>\n");
      out.write("                                                <form id=\"formExcluirDadosPet\">\n");
      out.write("                                                    <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                    <button class=\"btn btn-danger mt-2\" id=\"excluiPet\" name=\"excluirPet\">\n");
      out.write("                                                        <i class=\"fa fa-trash icone_plus\"></i>\n");
      out.write("                                                    </button> \n");
      out.write("                                                </form>\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                    ");

                                    }
                                } else {
                    
      out.write("\n");
      out.write("                                    <h1>Não Possui Registros</h1>\n");
      out.write("                    ");
          }
                        } else {
                            ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet");
                            while (rsPet.next()) {
                    
      out.write("\n");
      out.write("                                <tr class=\"text-center\">\n");
      out.write("                                    <th scope=\"row\">");
      out.print(rsPet.getString("id_pet"));
      out.write("</th>\n");
      out.write("                                    <td id=\"especie_pet\">");
      out.print(rsPet.getString("especie_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"nome_pet\">");
      out.print(rsPet.getString("nome_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"idade_pet\">");
      out.print(rsPet.getString("idade_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"porte_pet\">");
      out.print(rsPet.getString("porte_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"sexo_pet\">");
      out.print(rsPet.getString("sexo_pet"));
      out.write("</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form id=\"formAlterarPet\" method=\"POST\" action=\"Editar_Pet.jsp\">  \n");
      out.write("                                            <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                            <button href=\"Editar_Pet.jsp\" id=\"alterarPet\" name=\"alterarPet\" class=\"btn btn-warning mt-2\">\n");
      out.write("                                                <i class=\"fa fa-pen icone_plus\"></i>\n");
      out.write("                                            </button>\n");
      out.write("                                        </form>\n");
      out.write("                                        <form id=\"formExcluirDadosPet\">\n");
      out.write("                                            <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                            <button class=\"btn btn-danger mt-2\" id=\"excluiPet\" name=\"excluirPet\">\n");
      out.write("                                                <i class=\"fa fa-trash icone_plus\"></i>\n");
      out.write("                                            </button> \n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                    ");

                            }
                        }
                        }else{
                            if (request.getParameter("pesquisarPet") != null) {
                                ResultSet rsPetPesquisa = pet.Consultar("SELECT * FROM TB_Pet WHERE Nome_Pet = '" + request.getParameter("nome_pet") + "' AND Cliente_Id_Cliente = " + session.getAttribute("id_cliente"));
                                if (rsPetPesquisa.isBeforeFirst() && !request.getParameter("nome_pet").isEmpty()) {
                                    while (rsPetPesquisa.next()) {
                    
      out.write("\n");
      out.write("                                    <tr class=\"text-center\">\n");
      out.write("                                        <th scope=\"row\">");
      out.print(rsPetPesquisa.getString("id_pet"));
      out.write("</th>\n");
      out.write("                                        <td id=\"especie_pet\">");
      out.print(rsPetPesquisa.getString("especie_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"nome_pet\">");
      out.print(rsPetPesquisa.getString("nome_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"idade_pet\">");
      out.print(rsPetPesquisa.getString("idade_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"porte_pet\">");
      out.print(rsPetPesquisa.getString("porte_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"sexo_pet\">");
      out.print(rsPetPesquisa.getString("sexo_pet"));
      out.write("</td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <form id=\"formAlterarPet\" method=\"POST\" action=\"Editar_Pet.jsp\">  \n");
      out.write("                                                <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPetPesquisa.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                <button href=\"Editar_Pet.jsp\" id=\"alterarPet\" name=\"alterarPet\" class=\"btn btn-warning mt-2\">\n");
      out.write("                                                    <i class=\"fa fa-pen icone_plus\"></i>\n");
      out.write("                                                </button>\n");
      out.write("                                            </form>\n");
      out.write("                                            <form id=\"formExcluirDadosPet\">\n");
      out.write("                                                <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPetPesquisa.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                <button class=\"btn btn-danger mt-2\" id=\"excluiPet\" name=\"excluirPet\">\n");
      out.write("                                                    <i class=\"fa fa-trash icone_plus\"></i>\n");
      out.write("                                                </button> \n");
      out.write("                                            </form>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                        ");
          }
                                } else if (request.getParameter("nome_pet").isEmpty()) {
                                    ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet WHERE Cliente_id_Cliente = " + session.getAttribute("id_cliente"));
                                    while (rsPet.next()) {
                        
      out.write("\n");
      out.write("                                    <tr class=\"text-center\">\n");
      out.write("                                        <th scope=\"row\">");
      out.print(rsPet.getString("id_pet"));
      out.write("</th>\n");
      out.write("                                        <td id=\"especie_pet\">");
      out.print(rsPet.getString("especie_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"nome_pet\">");
      out.print(rsPet.getString("nome_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"idade_pet\">");
      out.print(rsPet.getString("idade_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"porte_pet\">");
      out.print(rsPet.getString("porte_pet"));
      out.write("</td>\n");
      out.write("                                        <td id=\"sexo_pet\">");
      out.print(rsPet.getString("sexo_pet"));
      out.write("</td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <form id=\"formAlterarPet\" method=\"POST\" action=\"Editar_Pet.jsp\">  \n");
      out.write("                                                <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                <button href=\"Editar_Pet.jsp\" id=\"alterarPet\" name=\"alterarPet\" class=\"btn btn-warning mt-2\">\n");
      out.write("                                                    <i class=\"fa fa-pen icone_plus\"></i>\n");
      out.write("                                                </button>\n");
      out.write("                                            </form>\n");
      out.write("                                            <form id=\"formExcluirDadosPet\">\n");
      out.write("                                                <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                                <button class=\"btn btn-danger mt-2\" id=\"excluiPet\" name=\"excluirPet\">\n");
      out.write("                                                    <i class=\"fa fa-trash icone_plus\"></i>\n");
      out.write("                                                </button> \n");
      out.write("                                            </form>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                        ");

                                    }
                                } else {
                        
      out.write("\n");
      out.write("                                    <h1>Não Possui Registros</h1>\n");
      out.write("                        ");
      }
                        } else {
                            ResultSet rsPet = pet.Consultar("SELECT * FROM TB_Pet WHERE Cliente_id_Cliente = " + session.getAttribute("id_cliente"));
                            while (rsPet.next()) {
                        
      out.write("\n");
      out.write("                                <tr class=\"text-center\">\n");
      out.write("                                    <th scope=\"row\">");
      out.print(rsPet.getString("id_pet"));
      out.write("</th>\n");
      out.write("                                    <td id=\"especie_pet\">");
      out.print(rsPet.getString("especie_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"nome_pet\">");
      out.print(rsPet.getString("nome_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"idade_pet\">");
      out.print(rsPet.getString("idade_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"porte_pet\">");
      out.print(rsPet.getString("porte_pet"));
      out.write("</td>\n");
      out.write("                                    <td id=\"sexo_pet\">");
      out.print(rsPet.getString("sexo_pet"));
      out.write("</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form id=\"formAlterarPet\" method=\"POST\" action=\"Editar_Pet.jsp\">  \n");
      out.write("                                            <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                            <button href=\"Editar_Pet.jsp\" id=\"alterarPet\" name=\"alterarPet\" class=\"btn btn-warning mt-2\">\n");
      out.write("                                                <i class=\"fa fa-pen icone_plus\"></i>\n");
      out.write("                                            </button>\n");
      out.write("                                        </form>\n");
      out.write("                                        <form id=\"formExcluirDadosPet\">\n");
      out.write("                                            <input type=\"hidden\" id=\"id_pet\" name=\"id_pet\" value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write("\">\n");
      out.write("                                            <button class=\"btn btn-danger mt-2\" id=\"excluiPet\" name=\"excluirPet\">\n");
      out.write("                                                <i class=\"fa fa-trash icone_plus\"></i>\n");
      out.write("                                            </button> \n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                        ");

                            }
                        }
                        }
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"header_pet\"></div>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!-- <td>\n");
      out.write("            <button type=\"button\" class=\"btn btn btn-warning mt-2\"\n");
      out.write("                data-toggle=\"modal\" data-target=\"#modal_pet\">\n");
      out.write("                <a data-toggle=\"modal\">\n");
      out.write("                <i class=\"fa fa-pen\"></i>\n");
      out.write("                </a>\n");
      out.write("            </button>\n");
      out.write("            <button class=\"btn btn-danger mt-2\">\n");
      out.write("                <i class=\"fa fa-trash\"></i>\n");
      out.write("            </button> \n");
      out.write("           </td>-->\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
