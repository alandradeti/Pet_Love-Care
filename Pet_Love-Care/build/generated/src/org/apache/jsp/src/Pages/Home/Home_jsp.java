package org.apache.jsp.src.Pages.Home;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

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
      Produto.ProdutoDAO produto = null;
      synchronized (_jspx_page_context) {
        produto = (Produto.ProdutoDAO) _jspx_page_context.getAttribute("produto", PageContext.PAGE_SCOPE);
        if (produto == null){
          produto = new Produto.ProdutoDAO();
          _jspx_page_context.setAttribute("produto", produto, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      Cliente.ClienteDAO cliente = null;
      synchronized (_jspx_page_context) {
        cliente = (Cliente.ClienteDAO) _jspx_page_context.getAttribute("cliente", PageContext.PAGE_SCOPE);
        if (cliente == null){
          cliente = new Cliente.ClienteDAO();
          _jspx_page_context.setAttribute("cliente", cliente, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"PT-BR\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Pet Love Care</title>\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../../../css//bootstrap.min.css\" />\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../../img/Icon/Logo-cabeca.png\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/padrao.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Home/home.css\" />\r\n");
      out.write("\r\n");
      out.write("        <script src=\"../../../js/jquery.slim.min.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a076d05399.js\"></script>\r\n");
      out.write("        <script src=\"../../../js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/padrao.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            $(function () {\r\n");
      out.write("                $(\"#headerDiv\").load(\"../Menu/Menu.jsp\");\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("            \r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Menu -->\r\n");
      out.write("        <div id=\"headerDiv\"></div>\r\n");
      out.write("\r\n");
      out.write("        ");
 if ((String) request.getAttribute("errorMessage") != null) {
      out.write("\r\n");
      out.write("        <h3 style=\"color: red;\">");
      out.print((String) request.getAttribute("errorMessage"));
      out.write("</h3>\r\n");
      out.write("        ");
 }
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Carrosel -->\r\n");
      out.write("        <header>\r\n");
      out.write("            <div id=\"carouselExampleCaptions\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("                <ol class=\"carousel-indicators\">\r\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"1\"></li>\r\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"2\"></li>\r\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"3\"></li>\r\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"4\"></li>\r\n");
      out.write("                </ol>\r\n");
      out.write("                <div class=\"carousel-inner\">\r\n");
      out.write("                    <div class=\"carousel-item active\">\r\n");
      out.write("                        <img src=\"../../img/Anuncios/Anuncio_1.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"carousel-item\">\r\n");
      out.write("                        <img src=\"../../img/Anuncios/Anuncio_2.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"carousel-item\">\r\n");
      out.write("                        <img src=\"../../img/Anuncios/Anuncio_3.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"carousel-item\">\r\n");
      out.write("                        <img src=\"../../img/Anuncios/Anuncio_4.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"carousel-item\">\r\n");
      out.write("                        <img src=\"../../img/Anuncios/Anuncio_5.jpg\" class=\"d-block w-100 custom_img_anuncios\" alt=\"...\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <a class=\"carousel-control-prev\" href=\"#carouselExampleCaptions\" role=\"button\" data-slide=\"prev\">\r\n");
      out.write("                    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("                    <span class=\"sr-only\">Previous</span>\r\n");
      out.write("                </a>\r\n");
      out.write("                <a class=\"carousel-control-next\" href=\"#carouselExampleCaptions\" role=\"button\" data-slide=\"next\">\r\n");
      out.write("                    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\r\n");
      out.write("                    <span class=\"sr-only\">Next</span>\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </header>\r\n");
      out.write("\r\n");
      out.write("        <!-- Produtos -->\r\n");
      out.write("        <section class=\"background_home\">\r\n");
      out.write("            <h1 class=\"custom_titulo_produtos\">Conheçam alguns de nossos produtos!</h1>\r\n");
      out.write("            <div class=\"row custom_body_produtos\">\r\n");
      out.write("                \r\n");
      out.write("                ");

                    ResultSet rsCliente = cliente.Consultar("SELECT Tipo_Cliente FROM TB_Cliente WHERE Id_Cliente = '" + session.getAttribute("id_cliente") + "'");
                    if(rsCliente.next()){
                        if (rsCliente.getBoolean("Tipo_Cliente") == false){
                            ResultSet rsProduto = produto.Consultar("SELECT * FROM TB_Produto");
                            while (rsProduto.next()) {
                
      out.write("\r\n");
      out.write("                                <div class=\"card custom_card_produtos\" style=\"width: 15rem;\">\r\n");
      out.write("                                  <div class=\"card-body\">\r\n");
      out.write("                                    <h5 class=\"card-title\" id=\"nome_produto\">");
      out.print(rsProduto.getString("nome_produto"));
      out.write("</h5>\r\n");
      out.write("                                    <img src=\"../../img/Produtos/produto_");
      out.print(rsProduto.getString("numero_imagem_produto"));
      out.write(".png\" class=\"card-img-top custom_img_produtos\" \r\n");
      out.write("                                         alt=\"...\">\r\n");
      out.write("                                        <span class=\"text_qtd\">Descrição: </span>\r\n");
      out.write("                                        <p class=\"card-text center_cliente\" id=\"descricao_produto\">");
      out.print(rsProduto.getString("descricao_produto"));
      out.write("</p>\r\n");
      out.write("                                        <form id=\"formAdicionarCarrinho\" method=\"GET\" name=\"formAdicionarCarrinho\" >  \r\n");
      out.write("                                            <p class=\"card-text center_cliente\" id=\"valor_produto\" >");
      out.print(rsProduto.getString("valor_produto"));
      out.write("</p>\r\n");
      out.write("                                            <span class=\"text_qtd\">Quantidade: </span>\r\n");
      out.write("                                            <div class=\"row centralizar_btn_cliente\">\r\n");
      out.write("                                                <input type=\"text\" class=\"form-control col-2\" id=\"quantidade_carrinho\" name=\"quantidade_carrinho\" aria-describedby=\"button-addon1\" required>\r\n");
      out.write("                                                <input type=\"hidden\" id=\"valor_produto\" name=\"valor_produto\" value=\"");
      out.print(rsProduto.getString("valor_produto"));
      out.write("\">  \r\n");
      out.write("                                                <input type=\"hidden\" id=\"nome_produto\" name=\"nome_produto\" value=\"");
      out.print(rsProduto.getString("nome_produto"));
      out.write("\">     \r\n");
      out.write("                                                <input type=\"hidden\" id=\"id_produto\" name=\"id_produto\" value=\"");
      out.print(rsProduto.getString("id_produto"));
      out.write("\">\r\n");
      out.write("                                                <input type=\"hidden\" id=\"id_cliente\" name=\"id_cliente\" value=\"");
      out.print(session.getAttribute("id_cliente"));
      out.write("\">\r\n");
      out.write("                                                <input type=\"hidden\" id=\"status_carrinho\" name=\"status_carrinho\" value=\"0\">\r\n");
      out.write("                                                <button type=\"button\" id=\"adicionaProduto\" name=\"adicionaProduto\" class=\"btn btn-warning btn_plus_cliente ml-1\">\r\n");
      out.write("                                                    <i class=\"fa fa-plus icone_plus\"></i>\r\n");
      out.write("                                                </button>\r\n");
      out.write("                                            </div>\r\n");
      out.write("                                        </form>\r\n");
      out.write("                                  </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                ");

                            }
                        }else{
                            ResultSet rsProduto = produto.Consultar("SELECT * FROM TB_Produto");
                            while (rsProduto.next()) {
                
      out.write("\r\n");
      out.write("                                <div class=\"card custom_card_produtos\" style=\"width: 15rem;\">\r\n");
      out.write("                                    <div class=\"card-body\">\r\n");
      out.write("                                        <form id=\"formAlterarProduto\" method=\"POST\" action=\"../Produtos/Produto_Editar.jsp\">  \r\n");
      out.write("                                                <input type=\"hidden\" id=\"id_produto\" name=\"id_produto\" value=\"");
      out.print(rsProduto.getString("id_produto"));
      out.write("\">\r\n");
      out.write("                                                <button type=\"submit\" class=\"btn btn-warning editar_produto\">\r\n");
      out.write("                                                    <i class=\"fa fa-pen icone_plus\"></i>\r\n");
      out.write("                                                </button>\r\n");
      out.write("                                        </form>\r\n");
      out.write("                                        <h5 class=\"card-title\" id=\"nome_produto\">");
      out.print(rsProduto.getString("nome_produto"));
      out.write("</h5>\r\n");
      out.write("                                        <img src=\"../../img/Produtos/produto_");
      out.print(rsProduto.getString("numero_imagem_produto"));
      out.write(".png\" class=\"card-img-top custom_img_produtos\" alt=\"...\">\r\n");
      out.write("                                        <span class=\"text_qtd\">Descrição: </span>\r\n");
      out.write("                                        <p class=\"card-text\" id=\"descricao_produto\">");
      out.print(rsProduto.getString("descricao_produto"));
      out.write("</p>\r\n");
      out.write("                                        <span class=\"text_qtd\">Quantidade em estoque: </span>\r\n");
      out.write("                                        <p class=\"card-text\" id=\"valor_produto\">");
      out.print(rsProduto.getString("valor_produto"));
      out.write("</p>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                ");

                            }
                        }
                    }
                
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
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
