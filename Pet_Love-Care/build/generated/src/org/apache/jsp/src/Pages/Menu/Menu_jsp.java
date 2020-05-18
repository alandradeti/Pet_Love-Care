package org.apache.jsp.src.Pages.Menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      Cliente.ClienteDAO cliente = null;
      synchronized (_jspx_page_context) {
        cliente = (Cliente.ClienteDAO) _jspx_page_context.getAttribute("cliente", PageContext.PAGE_SCOPE);
        if (cliente == null){
          cliente = new Cliente.ClienteDAO();
          _jspx_page_context.setAttribute("cliente", cliente, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');

    ResultSet rs = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"pt\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../../css/bootstrap.min.css\" type=\"text/css\"/>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/padrao.css\" type=\"text/css\"/>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Document</title>\r\n");
      out.write("        <!-- <script type=\"text/javascript\" src=\"../../../js/bootstrap.min.js\"></script>-->\r\n");
      out.write("        <!-- <script type=\"text/javascript\" src=\"../../../js/jquery.slim.min.js\"></script> -->\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../../jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/padrao.js\"></script>\r\n");
      out.write("        <script>\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#header_login\").load(\"../Login/Login.html\");\r\n");
      out.write("            });\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#header_cadastro\").load(\"../Cliente/Cliente.html\");\r\n");
      out.write("            });\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#header_vacina\").load(\"../Vacina/Vacina.html\");\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-light bg-light custom_navbar\">\r\n");
      out.write("        <img src=\"../../img/Logo/Logo-remove.png\" />\r\n");
      out.write("        <button class=\"navbar-toggler custom_icon\" type=\"button\" data-toggle=\"collapse\"\r\n");
      out.write("                data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\"\r\n");
      out.write("                aria-label=\"Toggle navigation\"><span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("        </button>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("            <ul class=\"navbar-nav mr-auto\">\r\n");
      out.write("                <li class=\"nav-item active\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"../Home/Home.jsp\">Home <span class=\"sr-only\">(current)</span></a>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");
  if (rs.next()) {
                        if (rs.getBoolean("Tipo_Cliente") == false) {
      out.write("\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"../Agendar/Agendar.jsp\">Agendar</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");
      }
                
      out.write("\r\n");
      out.write("                ");
      if (rs.getBoolean("Tipo_Cliente") == true) {
      out.write("\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("                        Veterinário\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <a class=\"nav-link\" href=\"../Veterinario/Consultar_Veterinario.jsp\">Consultar</a>\r\n");
      out.write("                        <a class=\"nav-link\" href=\"../Veterinario/Veterinario.html\">Cadastrar</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("                        Produtos\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../Home/Home.jsp\">Consultar</a>\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../Produtos/Produtos.html\">Cadastrar</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("                        Agendamento\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../Agendar/Consultar_Agendamento.html\">Consultar</a>\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../Agendar/Agendar.jsp\">Agendar</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"../Compras/Compras.html\">Compras</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("                        Pet\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../Pet/Consultar_Pet.html\">Consultar</a>\r\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../Pet/Pet.html\">Cadastrar</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"../Vacina/VacinaConsultar.jsp\">Vacina</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"../Carteira/Carteira.html\">Carteira</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");
      }
                
      out.write("\r\n");
      out.write("                ");
      if (rs.getBoolean("Tipo_Cliente") == false) {
      out.write("\r\n");
      out.write("                <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"../Pet/Pet.html\">Cadastrar Pet</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                ");
      }
                    }
                
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("            ");
  if (session.getAttribute("id_cliente") == null) {
      out.write("\r\n");
      out.write("            <a id=\"abrir_modal_login\" href=\"#\" class=\"login_cadastro mr-4\">\r\n");
      out.write("                <div class=\"balao ml-3\"><span class=\"latido_miado\">Au-Au</span></div>\r\n");
      out.write("                <i class=\"fas fa-dog\" style='font-size:26px;color: black;'></i> Login\r\n");
      out.write("            </a>\r\n");
      out.write("            <a id=\"abrir_modal_cadastro\" href=\"#\" class=\"login_cadastro\">\r\n");
      out.write("                <div class=\"balao ml-3\"><span class=\"latido_miado\">Meow</span></div>\r\n");
      out.write("                <i class=\"fas fa-cat\" style='font-size:26px;color: black;'></i> Cadastrar\r\n");
      out.write("            </a>\r\n");
      out.write("            ");
  } else { 
      out.write("\r\n");
      out.write("            <a id=\"abrir_modal_cadastro\" href=\"../Login/saidaLogin.jsp\" class=\"login_cadastro mr-4\">\r\n");
      out.write("                <div class=\"balao ml-3\"><span class=\"latido_miado\">Au-Au</span></div>\r\n");
      out.write("                <i class=\"fas fa-dog\" style='font-size:26px;color: black;'></i> Sair\r\n");
      out.write("            </a>\r\n");
      out.write("            ");
  }
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("    <div id=\"header_login\"></div>\r\n");
      out.write("    <div id=\"header_cadastro\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
