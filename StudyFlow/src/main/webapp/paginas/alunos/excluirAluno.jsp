<%@ page import="dao.AlunoDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        AlunoDAO dao = new AlunoDAO();
        dao.excluirAluno(id);
        response.sendRedirect("listarAlunoVIEW.jsp");
    } catch (Exception e) {
        out.println("Erro ao excluir aluno: " + e.getMessage());
    }
%>