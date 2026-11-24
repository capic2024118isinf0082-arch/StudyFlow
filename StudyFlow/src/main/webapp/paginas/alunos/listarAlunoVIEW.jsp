<%@ page import="dto.AlunoDTO" %>
<%@ page import="dao.AlunoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Alunos</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <div class="bg-blobs"><div class="blob blob-1"></div></div>
    <div class="app">
        <header class="app-header">
            <div class="brand">
                <div class="brand-icon" style="background: linear-gradient(135deg, #3b82f6, #8b5cf6);">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 12a5 5 0 1 0 0-10 5 5 0 0 0 0 10Zm0 2c-5.33 0-8 2.67-8 8h16c0-5.33-2.67-8-8-8Z"/></svg>
                </div>
                <div><h1>Alunos</h1><p class="subtitle">Gerencie os estudantes</p></div>
            </div>
            <a href="../../index.jsp" class="filter-btn" style="text-decoration:none;">🏠 Início</a>
        </header>

        <div style="margin-bottom: 15px; text-align: right;">
            <a href="formAlunoVIEW.jsp" class="btn-primary" style="text-decoration: none; padding: 8px 16px; font-size: 0.85rem;">➕ Novo Aluno</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Turma</th>
                        <th style="text-align: right;">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        AlunoDAO dao = new AlunoDAO();
                        ArrayList<AlunoDTO> alunos = dao.listarAlunos();
                        if (alunos.isEmpty()) {
                    %>
                        <tr><td colspan="4" style="text-align: center; padding: 30px;">Nenhum aluno cadastrado.</td></tr>
                    <% } else {
                        for (AlunoDTO a : alunos) {
                    %>
                        <tr>
                            <td style="font-weight: 500;"><%= a.getNome() %></td>
                            <td><%= a.getEmail() %></td>
                            <td><%= a.getTurma() %></td>
                            <td style="text-align: right;">
                                <a href="excluirAluno.jsp?id=<%= a.getId_aluno() %>"
                                   class="btn-acao btn-excluir" style="text-decoration: none;"
                                   onclick="return confirm('Excluir este aluno apagará todas as atividades dele. Continuar?');">Excluir</a>
                            </td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>