<%@ page import="dto.MateriaDTO" %>
<%@ page import="dao.MateriaDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Matérias</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <div class="bg-blobs"><div class="blob blob-2"></div></div>
    <div class="app">
        <header class="app-header">
            <div class="brand">
                <div class="brand-icon" style="background: linear-gradient(135deg, #f59e0b, #ef4444);">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
                </div>
                <div><h1>Matérias</h1><p class="subtitle">Gerencie as disciplinas</p></div>
            </div>
            <a href="../../index.jsp" class="filter-btn" style="text-decoration:none;">🏠 Início</a>
        </header>

        <div style="margin-bottom: 15px; text-align: right;">
            <a href="formMateriaVIEW.jsp" class="btn-primary" style="text-decoration: none; padding: 8px 16px; font-size: 0.85rem;">➕ Nova Matéria</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Nome da Matéria</th>
                        <th>Professor(a)</th>
                        <th>Cor</th>
                        <th style="text-align: right;">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        MateriaDAO dao = new MateriaDAO();
                        ArrayList<MateriaDTO> materias = dao.listarMaterias();
                        if (materias.isEmpty()) {
                    %>
                        <tr><td colspan="4" style="text-align: center; padding: 30px;">Nenhuma matéria cadastrada.</td></tr>
                    <% } else {
                        for (MateriaDTO m : materias) {
                    %>
                        <tr>
                            <td style="font-weight: 500;"><%= m.getNome_materia() %></td>
                            <td><%= m.getProfessor() %></td>
                            <td>
                                <div style="width: 20px; height: 20px; border-radius: 50%; background-color: <%= m.getCor_hex() %>; border: 2px solid #fff; box-shadow: 0 0 0 1px #ccc;"></div>
                            </td>
                            <td style="text-align: right;">
                                <a href="excluirMateria.jsp?id=<%= m.getId_materia() %>"
                                   class="btn-acao btn-excluir" style="text-decoration: none;"
                                   onclick="return confirm('Excluir esta matéria apagará todas as atividades vinculadas a ela. Continuar?');">Excluir</a>
                            </td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>