<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("email_cliente") != null && session.getAttribute("id_cliente") != null){
        session.removeAttribute("email_cliente");
        session.removeAttribute("id_cliente");
        session.invalidate(); 
    }
    response.sendRedirect("../Home/Home.jsp");
%>

