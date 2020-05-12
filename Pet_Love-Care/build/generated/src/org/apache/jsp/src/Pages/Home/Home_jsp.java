package org.apache.jsp.src.Pages.Home;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <title>Pet Love Care</title>\r\n");
      out.write("\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"../../../css//bootstrap.min.css\" />\r\n");
      out.write("  <link rel=\"shortcut icon\" href=\"../../img/Icon/Logo-cabeca.png\" />\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"../css/padrao.css\" />\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"./home.css\" />\r\n");
      out.write("\r\n");
      out.write("  <script src=\"../../../js/jquery.slim.min.js\"></script>\r\n");
      out.write("  <script src=\"../../../js/bootstrap.min.js\"></script>\r\n");
      out.write("  <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script>\r\n");
      out.write("  <script src=\"../../../js/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/padrao.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  <script>\r\n");
      out.write("    $(function () {\r\n");
      out.write("      $(\"#headerDiv\").load(\"../Menu/Menu.jsp\");\r\n");
      out.write("    });\r\n");
      out.write("  </script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("  <!-- Menu -->\r\n");
      out.write("  <div id=\"headerDiv\"></div>\r\n");
      out.write("  \r\n");
      out.write("  ");
 if ((String) request.getAttribute("errorMessage") != null) { 
      out.write("\r\n");
      out.write("        <h3 style=\"color: red;\">");
      out.print((String) request.getAttribute("errorMessage"));
      out.write("</h3>\r\n");
      out.write("  ");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("  <!-- Carrosel -->\r\n");
      out.write("  <header>\r\n");
      out.write("      <div id=\"carouselExampleCaptions\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("      <ol class=\"carousel-indicators\">\r\n");
      out.write("        <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("        <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"1\"></li>\r\n");
      out.write("        <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"2\"></li>\r\n");
      out.write("        <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"3\"></li>\r\n");
      out.write("        <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"4\"></li>\r\n");
      out.write("      </ol>\r\n");
      out.write("      <div class=\"carousel-inner\">\r\n");
      out.write("        <div class=\"carousel-item active\">\r\n");
      out.write("          <img src=\"../../img/Anuncios/Anuncio_1.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"carousel-item\">\r\n");
      out.write("          <img src=\"../../img/Anuncios/Anuncio_2.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"carousel-item\">\r\n");
      out.write("          <img src=\"../../img/Anuncios/Anuncio_3.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"carousel-item\">\r\n");
      out.write("          <img src=\"../../img/Anuncios/Anuncio_4.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"carousel-item\">\r\n");
      out.write("          <img src=\"../../img/Anuncios/Anuncio_5.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <a class=\"carousel-control-prev\" href=\"#carouselExampleCaptions\" role=\"button\" data-slide=\"prev\">\r\n");
      out.write("        <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("        <span class=\"sr-only\">Previous</span>\r\n");
      out.write("      </a>\r\n");
      out.write("      <a class=\"carousel-control-next\" href=\"#carouselExampleCaptions\" role=\"button\" data-slide=\"next\">\r\n");
      out.write("        <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("        <span class=\"sr-only\">Next</span>\r\n");
      out.write("      </a>\r\n");
      out.write("    </div>\r\n");
      out.write("  </header>\r\n");
      out.write("\r\n");
      out.write("  <!-- Produtos -->\r\n");
      out.write("  <section class=\"background\">\r\n");
      out.write("    <h1 class=\"custom_titulo_produtos\">ConheÃ§am alguns de nossos produtos!</h1>\r\n");
      out.write("    <div class=\"row custom_body_produtos\">\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("            <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("            <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_1.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">RaÃ§Ã£o Hills</h5>\r\n");
      out.write("          <p class=\"card-text\">RaÃ§Ã£o Hills sabor carne, recomendada para cachorros de porte pequeno.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("          \r\n");
      out.write("          <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_2.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">Royal Canin</h5>\r\n");
      out.write("          <p class=\"card-text\">Royal Canin sabor carne, recomendada para cachorros de porte mÃ©dio e grande.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("         <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_3.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">RaÃ§Ã£o Golden</h5>\r\n");
      out.write("          <p class=\"card-text\">Golden sabor carne defumada, recomendada para cachorros de porte mÃ©dio.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("          <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_4.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">Antipugas Bravecto</h5>\r\n");
      out.write("          <p class=\"card-text\">Braveo antipugas, recomendado para cachorros de porte mÃ©dio e pequeno.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("          <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"row custom_body_produtos\">\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_5.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">Super SecÃ£o</h5>\r\n");
      out.write("          <p class=\"card-text\">Super SecÃ£o Citrus Tapete HigiÃªnico Petix para CÃ£es - 30 Unidades.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("        <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div> \r\n");
      out.write("        <img src=\"../../img/Produtos/produto_6.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">Arranhadores</h5>\r\n");
      out.write("          <p class=\"card-text\">Brinquedo Arranhador SÃ£o Pet Maxball para Gatos de qualquer idade.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("         <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_7.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">Areia</h5>\r\n");
      out.write("          <p class=\"card-text\">Areia HigiÃªnica Chalesco e Garfield com Cristais de SÃ­lica para Gatos - 2kg.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("         <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"card custom_card_produtos\" style=\"width: 18rem;\">\r\n");
      out.write("        <div class=\"aling_btn\">\r\n");
      out.write("         <button class=\"btn btn-danger mt-2\"><i class=\"fa fa-trash\"></i></button> \r\n");
      out.write("         <button class=\"btn btn-warning mt-2\"><i class=\"fa fa-pen\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"../../img/Produtos/produto_8.png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("        <div class=\"card-body\">\r\n");
      out.write("          <h5 class=\"card-title\">Antipugas</h5>\r\n");
      out.write("          <p class=\"card-text\">Antipugas para cÃ£es, recomendado para cachorros de porte mÃ©dio e grande.</p>\r\n");
      out.write("          <p class=\"card-text\">R$ 19,99</p>\r\n");
      out.write("         <div class=\"input-group mb-3 input_center\">\r\n");
      out.write("            <div class=\"input-group-prepend\">\r\n");
      out.write("              <button class=\"btn btn-dark\" \r\n");
      out.write("                      type=\"button\">+</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            <input type=\"text\" class=\"form-control col-2\" value=\"0\" aria-label=\"Example text with button addon\" aria-describedby=\"button-addon1\">\r\n");
      out.write("            <div class=\"input-group-append\">\r\n");
      out.write("              <button class=\"btn btn-dark\"\r\n");
      out.write("                      type=\"button\">-</button>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </section>\r\n");
      out.write("</body>\r\n");
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