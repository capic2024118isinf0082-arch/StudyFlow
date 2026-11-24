<%@ page import="dto.MateriaDTO" %>
<%@ page import="dao.MateriaDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    try {
        MateriaDTO materia = new MateriaDTO();
        materia.setNome_materia(request.getParameter("nome_materia"));
        materia.setProfessor(request.getParameter("professor"));
        materia.setCor_hex(request.getParameter("cor_hex"));

        MateriaDAO dao = new MateriaDAO();
        dao.cadastrarMateria(materia);

        response.sendRedirect("formMateriaVIEW.jsp?sucesso=true");
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
%>