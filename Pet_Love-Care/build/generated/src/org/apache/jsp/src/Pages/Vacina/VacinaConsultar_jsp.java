package org.apache.jsp.src.Pages.Vacina;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class VacinaConsultar_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      Vacina.VacinaDAO vacina = null;
      synchronized (_jspx_page_context) {
        vacina = (Vacina.VacinaDAO) _jspx_page_context.getAttribute("vacina", PageContext.PAGE_SCOPE);
        if (vacina == null){
          vacina = new Vacina.VacinaDAO();
          _jspx_page_context.setAttribute("vacina", vacina, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Pet Love Care</title>\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../../css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../../img/Icon/Logo-cabeca.png\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/padrao.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"./Vacina.css\" > \r\n");
      out.write("      \r\n");
      out.write("        <script src=\"../js/ajax.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/post.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/jquery.slim.min.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/padrao.js\"></script>\r\n");
      out.write("        \r\n");
      out.write("        <script>\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#headerDiv\").load(\"../Menu/Menu.jsp\");\r\n");
      out.write("            });\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#header_vacina\").load(\"./Cadastrar_Vacina.html\");\r\n");
      out.write("            });\r\n");
      out.write("            $('#myModal').on('shown.bs.modal', function () {\r\n");
      out.write("                $('#myInput').trigger('focus')\r\n");
      out.write("            });\r\n");
      out.write("            \r\n");
      out.write("            $(function () {\r\n");
      out.write("    $('excluirVacina').on('click', function () {\r\n");
      out.write("        var Status = $(this).val();\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            url: '../Vacina/ExcluirVacina.jsp',\r\n");
      out.write("            data: {\r\n");
      out.write("                text: $(\"input[name=id_vacina]\").val(),\r\n");
      out.write("                Status: Status\r\n");
      out.write("            },\r\n");
      out.write("            type : 'POST'\r\n");
      out.write("        });\r\n");
      out.write("    });\r\n");
      out.write("});\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Menu -->\r\n");
      out.write("        <div id=\"headerDiv\"></div>\r\n");
      out.write("        <div class=\"background\">\r\n");
      out.write("            <!-- FormulÃ¡rio -->\r\n");
      out.write("            <div class=\"card container mt-5 card_consulta\">\r\n");
      out.write("                <button type=\"button\" class=\"btn btn_cadastrar_vacinas mt-2\"\r\n");
      out.write("                        data-toggle=\"modal\" data-target=\"#modal_vacina\">\r\n");
      out.write("                    <a class=\"btn_vacina\" data-toggle=\"modal\">\r\n");
      out.write("                        <i class=\"fa fa-plus icone_plus\"></i>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </button>\r\n");
      out.write("                <div class=\"text-center mt-4\">\r\n");
      out.write("                    <img src=\"../../img/Logo/Vacina_pata.png\" class=\"cabeca_gato\">\r\n");
      out.write("                    <h3 class=\"mt-2\">Vacinas disponíveis</h3>\r\n");
      out.write("                </div>\r\n");
      out.write("                <form id=\"formPesquisarNomeVacina\" method=\"POST\" action=\"VacinaConsultar.jsp\">\r\n");
      out.write("                    <div class=\"form-group col-6\">\r\n");
      out.write("\r\n");
      out.write("                        <input type=\"text\" name=\"nome_vacina\" id=\"nome_vacina\" />\r\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-danger mt-2\" id=\"pesquisarVacina\" name=\"pesquisarVacina\">\r\n");
      out.write("                            <i class=\"fas fa-search\"></i>\r\n");
      out.write("                        </button> \r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("\r\n");
      out.write("                <table id=\"tbVacina\" class=\"table table-hover table-dark mt-4 responsive\">\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr class=\"text-center\">\r\n");
      out.write("                            <th scope=\"col\">ID</th>\r\n");
      out.write("                            <th scope=\"col\">Nome</th>\r\n");
      out.write("                            <th scope=\"col\">Valor</th>\r\n");
      out.write("                            <th scope=\"col\">Descrição</th>\r\n");
      out.write("                            <th scope=\"col\">Ações</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        ");

                            if (request.getParameter("pesquisarVacina") != null) {
                                ResultSet rsVacinaPesquisa = vacina.Consultar("SELECT * FROM TB_Vacina WHERE Nome_Vacina = '" + request.getParameter("nome_vacina") + "'");
                                if (rsVacinaPesquisa.isBeforeFirst() && !request.getParameter("nome_vacina").isEmpty()) {
                                    while (rsVacinaPesquisa.next()) {
                        
      out.write("\r\n");
      out.write("                                        <tr class=\"text-center\">\r\n");
      out.write("                                            <th scope=\"row\">");
      out.print(rsVacinaPesquisa.getString("id_vacina"));
      out.write("</th>\r\n");
      out.write("                                            <td id=\"nome_vacina\">");
      out.print(rsVacinaPesquisa.getString("nome_vacina"));
      out.write("</td>\r\n");
      out.write("                                            <td id=\"valor_vacina\">");
      out.print(rsVacinaPesquisa.getString("valor_vacina"));
      out.write("</td>\r\n");
      out.write("                                            <td id=\"descricao_vacina\">");
      out.print(rsVacinaPesquisa.getString("descricao_vacina"));
      out.write("</td>\r\n");
      out.write("                                            <td>\r\n");
      out.write("                                                <form id=\"formAlterarVacina\" method=\"POST\" action=\"Editar_Vacina.jsp\">  \r\n");
      out.write("                                                    <input type=\"hidden\" id=\"id_vacina\" name=\"id_vacina\" value=\"");
      out.print(rsVacinaPesquisa.getString("id_vacina"));
      out.write("\">\r\n");
      out.write("                                                    <button href=\"Editar_Vacina.jsp\" id=\"alterarVacina\" name=\"alterarVacina\" class=\"btn btn-warning mt-2\">\r\n");
      out.write("                                                        <i class=\"fa fa-pen icone_plus\"></i>\r\n");
      out.write("                                                    </button>\r\n");
      out.write("                                                </form>\r\n");
      out.write("                                                <form id=\"formExcluirDadosVacina\">\r\n");
      out.write("                                                    <input type=\"hidden\" id=\"id_vacina\" name=\"id_vacina\" value=\"");
      out.print(rsVacinaPesquisa.getString("id_vacina"));
      out.write("\">\r\n");
      out.write("                                                    <button class=\"btn btn-danger mt-2\" id=\"excluirVacina\" name=\"excluirVacina\">\r\n");
      out.write("                                                        <i class=\"fa fa-trash icone_plus\"></i>\r\n");
      out.write("                                                    </button> \r\n");
      out.write("                                                </form>\r\n");
      out.write("                                            </td>\r\n");
      out.write("                                        </tr>\r\n");
      out.write("                        ");
          }
                                } else if (request.getParameter("nome_vacina").isEmpty()) {
                                    ResultSet rsVacina = vacina.Consultar("SELECT * FROM TB_Vacina");
                                    while (rsVacina.next()) {
                        
      out.write("\r\n");
      out.write("                                        <tr class=\"text-center\">\r\n");
      out.write("                                            <th scope=\"row\">");
      out.print(rsVacina.getString("id_vacina"));
      out.write("</th>\r\n");
      out.write("                                            <td id=\"nome_vacina\">");
      out.print(rsVacina.getString("nome_vacina"));
      out.write("</td>\r\n");
      out.write("                                            <td id=\"valor_vacina\">");
      out.print(rsVacina.getString("valor_vacina"));
      out.write("</td>\r\n");
      out.write("                                            <td id=\"descricao_vacina\">");
      out.print(rsVacina.getString("descricao_vacina"));
      out.write("</td>\r\n");
      out.write("                                            <td>\r\n");
      out.write("                                                <form id=\"formAlterarVacina\" method=\"POST\" action=\"Editar_Vacina.jsp\">  \r\n");
      out.write("                                                    <input type=\"hidden\" id=\"id_vacina\" name=\"id_vacina\" value=\"");
      out.print(rsVacina.getString("id_vacina"));
      out.write("\">\r\n");
      out.write("                                                    <button href=\"Editar_Vacina.jsp\" id=\"alteraVacina\" name=\"alteraVacina\" class=\"btn btn-warning mt-2\">\r\n");
      out.write("                                                        <i class=\"fa fa-pen icone_plus\"></i>\r\n");
      out.write("                                                    </button>\r\n");
      out.write("                                                </form>\r\n");
      out.write("                                                    <form id=\"formExcluirDadosVacina\">\r\n");
      out.write("                                                    <input type=\"hidden\" id=\"id_vacina\" name=\"id_vacina\" value=\"");
      out.print(rsVacina.getString("id_vacina"));
      out.write("\">\r\n");
      out.write("                                                    <button class=\"btn btn-danger mt-2\" id=\"excluirVacina\" name=\"excluirVacina\">\r\n");
      out.write("                                                        <i class=\"fa fa-trash icone_plus\"></i>\r\n");
      out.write("                                                    </button> \r\n");
      out.write("                                                </form>\r\n");
      out.write("                                            </td>\r\n");
      out.write("                                        </tr>\r\n");
      out.write("                    ");

                                    }
                                } else {
                    
      out.write("\r\n");
      out.write("                                    <h1>Não Possui Registros</h1>\r\n");
      out.write("                    ");
          }
                        } else {
                            ResultSet rsVacina = vacina.Consultar("SELECT * FROM TB_Vacina");
                            while (rsVacina.next()) {
                    
      out.write("\r\n");
      out.write("                                <tr class=\"text-center\">\r\n");
      out.write("                                    <th scope=\"row\">");
      out.print(rsVacina.getString("id_vacina"));
      out.write("</th>\r\n");
      out.write("                                    <td id=\"nome_vacina\">");
      out.print(rsVacina.getString("nome_vacina"));
      out.write("</td>\r\n");
      out.write("                                    <td id=\"valor_vacina\">");
      out.print(rsVacina.getString("valor_vacina"));
      out.write("</td>\r\n");
      out.write("                                    <td id=\"descricao_vacina\">");
      out.print(rsVacina.getString("descricao_vacina"));
      out.write("</td>\r\n");
      out.write("                                    <td>\r\n");
      out.write("                                        <form id=\"formAlterarVacina\" method=\"POST\" action=\"Editar_Vacina.jsp\">  \r\n");
      out.write("                                            <input type=\"hidden\" id=\"id_vacina\" name=\"id_vacina\" value=\"");
      out.print(rsVacina.getString("id_vacina"));
      out.write("\">\r\n");
      out.write("                                            <button href=\"Editar_Vacina.jsp\" id=\"alteraVacina\" name=\"alteraVacina\" class=\"btn btn-warning mt-2\">\r\n");
      out.write("                                                <i class=\"fa fa-pen icone_plus\"></i>\r\n");
      out.write("                                            </button>\r\n");
      out.write("                                        </form>\r\n");
      out.write("                                        <form id=\"formExcluirDadosVacina\">\r\n");
      out.write("                                            <input type=\"hidden\" id=\"id_vacina\" name=\"id_vacina\" value=\"");
      out.print(rsVacina.getString("id_vacina"));
      out.write("\">\r\n");
      out.write("                                            <button class=\"btn btn-danger mt-2\" id=\"excluirVacina\" name=\"excluirVacina\">\r\n");
      out.write("                                                <i class=\"fa fa-trash icone_plus\"></i>\r\n");
      out.write("                                            </button> \r\n");
      out.write("                                        </form>\r\n");
      out.write("                                    </td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                    ");

                            }
                        }
                    
      out.write("\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div id=\"header_vacina\"></div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
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
