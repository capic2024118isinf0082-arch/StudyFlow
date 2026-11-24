<%@ page import="dto.AtividadeDTO" %>
<%@ page import="dto.AlunoDTO" %>
<%@ page import="dto.MateriaDTO" %>
<%@ page import="dao.AtividadeDAO" %>
<%@ page import="dao.AlunoDAO" %>
<%@ page import="dao.MateriaDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String idStr = request.getParameter("id");
    AtividadeDTO atividade = new AtividadeDTO();

    if (idStr != null && !idStr.isEmpty()) {
        AtividadeDAO dao = new AtividadeDAO();
        atividade = dao.buscarAtividade(Integer.parseInt(idStr));
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Editar Atividade</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <div class="bg-blobs"><div class="blob blob-1"></div></div>
    <div class="app">
        <header class="app-header">
            <div class="brand">
                <div class="brand-icon" style="background: linear-gradient(135deg, #f59e0b, #ef4444);">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                </div>
                <div><h1>Editar Atividade</h1><p class="subtitle">Altere os dados da tarefa</p></div>
            </div>
            <a href="listarAtividadeVIEW.jsp" class="filter-btn" style="text-decoration:none;">⬅ Voltar</a>
        </header>

        <form action="salvarEdicaoAtividade.jsp" method="post" class="form-card">
            <!-- Campo oculto para enviar o ID -->
            <input type="hidden" name="id_atividade" value="<%= atividade.getId_atividade() %>">

            <div class="field">
                <label>Título</label>
                <input type="text" name="titulo" value="<%= atividade.getTitulo() %>" required>
            </div>
            <div class="field">
                <label>Descrição</label>
                <textarea name="descricao"><%= atividade.getDescricao() != null ? atividade.getDescricao() : "" %></textarea>
            </div>
            <div class="form-row">
                <div class="field">
                    <label>Data de entrega</label>
                    <input type="date" name="data_entrega" value="<%= atividade.getData_entrega() %>" required>
                </div>
                <div class="field">
                    <label>Prioridade</label>
                    <select name="prioridade">
                        <option value="baixa" <%= atividade.getPrioridade().equals("baixa") ? "selected" : "" %>>🟢 Baixa</option>
                        <option value="media" <%= atividade.getPrioridade().equals("media") ? "selected" : "" %>>🟡 Média</option>
                        <option value="alta" <%= atividade.getPrioridade().equals("alta") ? "selected" : "" %>>🔴 Alta</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="field">
                    <label>Aluno</label>
                    <select name="id_aluno" required>
                        <%
                            AlunoDAO alunoDAO = new AlunoDAO();
                            ArrayList<AlunoDTO> alunos = alunoDAO.listarAlunos();
                            for (AlunoDTO a : alunos) {
                                String sel = (a.getId_aluno() == atividade.getId_aluno()) ? "selected" : "";
                        %>
                            <option value="<%= a.getId_aluno() %>" <%= sel %>><%= a.getNome() %></option>
                        <% } %>
                    </select>
                </div>
                <div class="field">
                    <label>Matéria</label>
                    <select name="id_materia" required>
                        <%
                            MateriaDAO materiaDAO = new MateriaDAO();
                            ArrayList<MateriaDTO> materias = materiaDAO.listarMaterias();
                            for (MateriaDTO m : materias) {
                                String sel = (m.getId_materia() == atividade.getId_materia()) ? "selected" : "";
                        %>
                            <option value="<%= m.getId_materia() %>" <%= sel %>><%= m.getNome_materia() %></option>
                        <% } %>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn-primary" style="width: 100%; margin-top: 15px;">Salvar Alterações</button>
        </form>
    </div>
</body>
