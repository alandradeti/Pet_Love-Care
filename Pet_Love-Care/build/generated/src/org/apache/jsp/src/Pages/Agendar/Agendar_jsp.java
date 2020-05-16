package org.apache.jsp.src.Pages.Agendar;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Agendar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      Agendamento.AgendamentoDAO agendamento = null;
      synchronized (_jspx_page_context) {
        agendamento = (Agendamento.AgendamentoDAO) _jspx_page_context.getAttribute("agendamento", PageContext.PAGE_SCOPE);
        if (agendamento == null){
          agendamento = new Agendamento.AgendamentoDAO();
          _jspx_page_context.setAttribute("agendamento", agendamento, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      Agendamento.AgendamentoDAO vacina = null;
      synchronized (_jspx_page_context) {
        vacina = (Agendamento.AgendamentoDAO) _jspx_page_context.getAttribute("vacina", PageContext.PAGE_SCOPE);
        if (vacina == null){
          vacina = new Agendamento.AgendamentoDAO();
          _jspx_page_context.setAttribute("vacina", vacina, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      Veterinario.VeterinarioDAO veterinario = null;
      synchronized (_jspx_page_context) {
        veterinario = (Veterinario.VeterinarioDAO) _jspx_page_context.getAttribute("veterinario", PageContext.PAGE_SCOPE);
        if (veterinario == null){
          veterinario = new Veterinario.VeterinarioDAO();
          _jspx_page_context.setAttribute("veterinario", veterinario, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      Pet.PetDAO pet = null;
      synchronized (_jspx_page_context) {
        pet = (Pet.PetDAO) _jspx_page_context.getAttribute("pet", PageContext.PAGE_SCOPE);
        if (pet == null){
          pet = new Pet.PetDAO();
          _jspx_page_context.setAttribute("pet", pet, PageContext.PAGE_SCOPE);
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
      out.write("        <link rel=\"stylesheet\" href=\"../../../css//bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../../img/Icon/Logo-cabeca.png\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/padrao.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"./agendar.css\" >\r\n");
      out.write("\r\n");
      out.write("        <script src=\"../../../js/jquery.slim.min.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/padrao.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#headerDiv\").load(\"../Menu/Menu.html\");\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Menu -->\r\n");
      out.write("        <div id=\"headerDiv\"></div>\r\n");
      out.write("        <div class=\"background\">\r\n");
      out.write("            <!-- FormulÃ¡rio -->\r\n");
      out.write("            <div class=\"card container mt-5 card_consulta\">\r\n");
      out.write("                <div class=\"text-center mt-4\">\r\n");
      out.write("                    <img src=\"../../img/Logo/Gato-cabeca.png\" class=\"cabeca_gato\">\r\n");
      out.write("                    <h3>Agende uma consulta</h3>\r\n");
      out.write("                </div>\r\n");
      out.write("                <form id=\"formCadastrarAgendamento\" action=\"IncluirAgendamento.jsp\">\r\n");
      out.write("                    <div class=\"col\">\r\n");
      out.write("                        <div class=\"form-row\">\r\n");
      out.write("                            <div class=\"form-group col-md-6\">\r\n");
      out.write("                                <label class=\"col-form-label login_label\">Tipo de Agendamento:</label>\r\n");
      out.write("                                <select name=\"tipo_agendamento\" id=\"tipo_agendamento\" class=\"form-control\" required>\r\n");
      out.write("                                    <option>Selecione</option>\r\n");
      out.write("                                    <option value=\"Consulta\">Consulta</option>\r\n");
      out.write("                                    <option value=\"Vacina\">Vacina</option>\r\n");
      out.write("                                    <option value=\"Banho e Tosa\">Banho e Tosa</option>\r\n");
      out.write("                                </select>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group col-md-6\">\r\n");
      out.write("                                <label class=\"col-form-label login_label\">Horário:</label>\r\n");
      out.write("                                <input type=\"time\" class=\"form-control\" name=\"horario_agendamento\" \r\n");
      out.write("                                       id=\"horario_agendamento\" placeholder=\"Insira um horário\" required />\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <div class=\"form-row\">\r\n");
      out.write("                                <div class=\"form-group col-md-6\">\r\n");
      out.write("                                    <label class=\"col-form-label login_label\">Data:</label>\r\n");
      out.write("                                    <input type=\"date\" class=\"form-control col-12\" name=\"data_agendamento\"\r\n");
      out.write("                                           id=\"data_agendamento\" placeholder=\"Data para consulta\" required />\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"form-group col-md-6\">\r\n");
      out.write("                                    <label class=\"col-form-label login_label\">Vacina:</label>\r\n");
      out.write("                                    <select name=\"id_vacina\" id=\"id_vacina\" class=\"form-control\">\r\n");
      out.write("                                        \r\n");
      out.write("                                        ");

                                            ResultSet rsVacina = agendamento.Consultar("SELECT Id_Vacina,Nome_Vacina FROM TB_Vacina");
                                            if(rsVacina.next()){
                                                do{
                                        
      out.write("      \r\n");
      out.write("                                                    <option value=\"");
      out.print(rsVacina.getString("id_vacina"));
      out.write('"');
      out.write('>');
      out.print(rsVacina.getString("nome_vacina"));
      out.write("</option>\r\n");
      out.write("                                        ");
      }while (rsVacina.next());
                                            }else{
                                        
      out.write(" \r\n");
      out.write("                                                <option value=\"\"></option>\r\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\r\n");
      out.write("                                    </select>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"form-row\">\r\n");
      out.write("                                <div class=\"form-group col-md-6\">\r\n");
      out.write("                                    <label class=\"col-form-label login_label\">Pet:</label>\r\n");
      out.write("                                    <select name=\"id_pet\" id=\"id_pet\" class=\"form-control\" required>\r\n");
      out.write("                                        ");

                                            ResultSet rsPet = pet.Consultar("SELECT Id_Pet,Nome_Pet FROM TB_Pet WHERE Cliente_Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                                            while (rsPet.next()) {
                                        
      out.write("\r\n");
      out.write("                                                <option value=\"");
      out.print(rsPet.getString("id_pet"));
      out.write('"');
      out.write('>');
      out.print(rsPet.getString("nome_pet"));
      out.write("</option>\r\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\r\n");
      out.write("                                    </select>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"form-group col-md-6\">\r\n");
      out.write("                                    <label class=\"col-form-label login_label\">Veterinário:</label>\r\n");
      out.write("                                    <select name=\"id_veterinario\" id=\"id_veterinario\" class=\"form-control\" required>\r\n");
      out.write("                                        ");

                                            ResultSet rsVeterinario = veterinario.Consultar("SELECT Id_Veterinario,Nome_Veterinario FROM TB_Veterinario");
                                            while (rsVeterinario.next()) {
                                        
      out.write("\r\n");
      out.write("                                                <option value=\"");
      out.print(rsVeterinario.getString("id_veterinario"));
      out.write('"');
      out.write('>');
      out.print(rsVeterinario.getString("nome_veterinario"));
      out.write("</option>\r\n");
      out.write("                                        ");

                                            }
                                        
      out.write("\r\n");
      out.write("                                    </select>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"pst_btn_agendar\">\r\n");
      out.write("                                <button class=\"btn btn_agendar mt-4 \">Agendar</button>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
