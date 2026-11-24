<%@ page import="dao.MateriaDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        MateriaDAO dao = new MateriaDAO();
        dao.excluirMateria(id);
        response.sendRedirect("listarMateriaVIEW.jsp");
    } catch (Exception e) {
        out.println("Erro ao excluir matéria: " + e.getMessage());
    }
%>