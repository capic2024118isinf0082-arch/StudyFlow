<%@ page import="dto.AlunoDTO" %>
<%@ page import="dao.AlunoDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    try {
        AlunoDTO aluno = new AlunoDTO();
        aluno.setNome(request.getParameter("nome"));
        aluno.setEmail(request.getParameter("email"));
        aluno.setTurma(request.getParameter("turma"));

        AlunoDAO dao = new AlunoDAO();
        dao.cadastrarAluno(aluno);

        response.sendRedirect("formAlunoVIEW.jsp?sucesso=true");
    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
    }
%>