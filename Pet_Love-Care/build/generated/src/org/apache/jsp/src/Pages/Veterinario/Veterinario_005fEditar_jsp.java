package org.apache.jsp.src.Pages.Veterinario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Veterinario_005fEditar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      Veterinario.VeterinarioDAO veterinario = null;
      synchronized (_jspx_page_context) {
        veterinario = (Veterinario.VeterinarioDAO) _jspx_page_context.getAttribute("veterinario", PageContext.PAGE_SCOPE);
        if (veterinario == null){
          veterinario = new Veterinario.VeterinarioDAO();
          _jspx_page_context.setAttribute("veterinario", veterinario, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\" />\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("        <title>Pet Love Care</title>\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../../css/bootstrap.min.css\" />\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../../img/Icon/Logo-cabeca.png\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/padrao.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"./Veterinario.css\" />\r\n");
      out.write("\r\n");
      out.write("        <script src=\"../../../js/jquery.slim.min.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/padrao.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- FormulÃ¡rio de login -->\r\n");
      out.write("        <div class=\"modal fade modal_veterinario\" id=\"modal_veterinario\">\r\n");
      out.write("            <div class=\"space_veterinario\">\r\n");
      out.write("                \r\n");
      out.write("                <button type=\"button\" \r\n");
      out.write("                        class=\"close close_modal_veterinario mr-2 mt-1\" \r\n");
      out.write("                        data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("                    <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("                </button>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"tela_veterinario\">  \r\n");
      out.write("                    <div class=\"centralizar\">\r\n");
      out.write("                        <img src=\"../../img/Logo/mulher_veterinaria.png\" \r\n");
      out.write("                             alt=\"icone\" class=\"tamanho_icone\"/>\r\n");
      out.write("                        <h4 class=\"mt-3\">Editar VeterinÃ¡rio</h4>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <input type=\"text\" class=\"form-control\" name=\"id_veterinario\" id=\"id_veterinario\" required />\r\n");
      out.write("                    ");

                        String iId_veterinario = request.getParameter("id_veterinario");
                        ResultSet rsVeterinario = veterinario.Consultar("SELECT * FROM TB_Veterinario WHERE Id_Veterinario = "+ iId_veterinario );
                        if(rsVeterinario.next()){
                    
      out.write("\r\n");
      out.write("                            <form id=\"formAlterarVeterinario\">\r\n");
      out.write("                                <label class=\"col-form-label mt-4 login_label\" name=\"id_veterinario\" id=\"id_veterinario\"></label>\r\n");
      out.write("                                <div class=\"col\">\r\n");
      out.write("                                    <div class=\"form-row\">\r\n");
      out.write("                                        <div class=\"form-group col-md-6\">\r\n");
      out.write("                                            <label class=\"col-form-label mt-4 login_label\">Nome Completo:</label>\r\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" \r\n");
      out.write("                                                   name=\"nome_veterinario\" id=\"nome_veterinario\" placeholder=\"Nome do veterinÃ¡rio\" value=\"");
      out.print(rsVeterinario.getString("nome_veterinario"));
      out.write("\" required />\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"form-group col-md-6\">\r\n");
      out.write("                                            <label class=\"col-form-label mt-4 login_label\">CPF:</label>\r\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" \r\n");
      out.write("                                                   name=\"cpf_veterinario\" id=\"cpf_veterinario\" placeholder=\"CPF do veterinÃ¡rio\" value=\"");
      out.print(rsVeterinario.getString("cpf_veterinario"));
      out.write("\" required />\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <div class=\"form-row\">\r\n");
      out.write("                                            <div class=\"form-group col-md-6\">\r\n");
      out.write("                                                <label class=\"col-form-label login_label\">EndereÃ§o:</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control\" name=\"endereco_veterinario\"\r\n");
      out.write("                                                       id=\"endereco_veterinario\" placeholder=\"Nome da rua\"  value=\"");
      out.print(rsVeterinario.getString("endereco_veterinario"));
      out.write("\" required />\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"form-group col-md-6\">\r\n");
      out.write("                                                <label class=\"col-form-label login_label\">Data de nascimento:</label>\r\n");
      out.write("                                                <input type=\"date\" class=\"form-control\" name=\"data_nascimento_veterinario\"\r\n");
      out.write("                                                       id=\"data_nascimento_veterinario\" value=\"");
      out.print(rsVeterinario.getString("data_nascimento_veterinario"));
      out.write("\" required />\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("                                        <div class=\"form-row\">\r\n");
      out.write("                                            <div class=\"form-group col-md-6\">\r\n");
      out.write("                                                <label class=\"col-form-label login_label\">RG:</label>\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control col-12\" \r\n");
      out.write("                                                       name=\"rg_veterinario\" id=\"rg_veterinario\" placeholder=\"RG do veterinÃ¡rio\" value=\"");
      out.print(rsVeterinario.getString("rg_veterinario"));
      out.write("\" required />\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                            <div class=\"form-group col-md-6\">\r\n");
      out.write("                                                <label class=\"col-form-label login_label\">Sexo:</label>\r\n");
      out.write("                                                <select class=\"form-control col-12\" name=\"sexo_veterinario\"  id=\"sexo_veterinario\" disabled>\r\n");
      out.write("                                                    <option value=\"");
      out.print(rsVeterinario.getString("sexo_veterinario"));
      out.write('"');
      out.write('>');
      out.print(rsVeterinario.getString("sexo_veterinario"));
      out.write("</option>\r\n");
      out.write("                                                </select>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"form-row\">\r\n");
      out.write("                                        <div class=\"form-group col-md-6\">\r\n");
      out.write("                                            <label class=\"col-form-label login_label\">Email:</label>\r\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" \r\n");
      out.write("                                                   name=\"email_veterinario\" id=\"email_veterinario\"  value=\"");
      out.print(rsVeterinario.getString("email_veterinario"));
      out.write("\" required />\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"form-group col-md-6\">\r\n");
      out.write("                                            <label class=\"col-form-label login_label\">Telefone Fixo:</label>\r\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" \r\n");
      out.write("                                                   name=\"telefone_fixo_veterinario\" id=\"telefone_fixo_veterinario\"  value=\"");
      out.print(rsVeterinario.getString("telefone_fixo_veterinario"));
      out.write("\"  required />\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"form-row\">\r\n");
      out.write("\r\n");
      out.write("                                        <div class=\"form-group col-md-6\">\r\n");
      out.write("                                            <label class=\"col-form-label login_label\">Telefone Celular:</label>\r\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" \r\n");
      out.write("                                                   name=\"telefone_celular_veterinario\" id=\"telefone_celular_veterinario\" value=\"");
      out.print(rsVeterinario.getString("telefone_celular_veterinario"));
      out.write("\"  required />\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"pst_btn_agendar\">\r\n");
      out.write("                                        <button class=\"btn btn_agendar mt-3 mb-3\">Editar</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </form>\r\n");
      out.write("                            \r\n");
      out.write("                    ");

                        }
                        else{
                            out.println("Nenhum registro");
                        }
                    
      out.write("\r\n");
      out.write("                    <div class=\"modal-dialog\">\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
