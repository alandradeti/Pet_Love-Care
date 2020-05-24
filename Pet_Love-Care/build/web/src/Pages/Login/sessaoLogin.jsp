<%@page language="java" import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cliente" class="Cliente.ClienteDAO"/>
<%
    String sEmailCliente = request.getParameter("email_cliente");    
    String sSenhaCliente = request.getParameter("senha_cliente");
    String sDataCompra = request.getParameter("data_compra");
    
    ResultSet rs = cliente.Consultar("SELECT "
                                        + "Email_Cliente,"
                                        + "Senha_Cliente,"
                                        + "Id_Cliente "
                                    + "FROM "
                                        + "TB_Cliente"
                                    + " WHERE "
                                        + "Email_Cliente = '" + sEmailCliente+ "' "
                                    + "AND "
                                        + "Senha_cliente = '" + sSenhaCliente + "'");
    if (rs.next()) {
        session.setAttribute("data_compra", sDataCompra);
        session.setAttribute("email_cliente", sEmailCliente);
        session.setAttribute("id_cliente", rs.getInt("Id_Cliente"));
        response.sendRedirect("../Home/Home.jsp");
    } else {
        request.setAttribute("errorMessage", "Email ou Senha inválidos!");
        request.getRequestDispatcher("../Home/Home.jsp").forward(request, response);
    }
%>   

