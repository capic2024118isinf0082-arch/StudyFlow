<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Início</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="bg-blobs">
        <div class="blob blob-1"></div>
        <div class="blob blob-2"></div>
        <div class="blob blob-3"></div>
    </div>

    <div class="app" style="text-align: center;">
        <header class="app-header" style="flex-direction: column;">
            <div class="brand-icon" style="margin: 0 auto 15px;">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 5a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V5Z"/><path d="M8 7h7M8 11h7M8 15h4"/></svg>
            </div>
            <h1>StudyFlow</h1>
            <p class="subtitle">Bem-vindo ao seu organizador escolar</p>
        </header>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 30px;">
            <!-- Coluna de Atividades -->
            <div style="display: flex; flex-direction: column; gap: 10px;">
                <h3 style="color: var(--text-muted); font-size: 0.9rem; text-align: left; margin-bottom: 5px;">Atividades</h3>
                <a href="paginas/atividades/listarAtividadeVIEW.jsp" class="btn-primary" style="text-decoration: none;">📋 Ver Tarefas</a>
                <a href="paginas/atividades/formAtividadeVIEW.jsp" class="filter-btn" style="text-decoration: none; background: var(--surface-solid); border: 1px solid var(--border);">➕ Nova Tarefa</a>
            </div>

            <!-- Coluna de Cadastros Base -->
            <div style="display: flex; flex-direction: column; gap: 10px;">
                <h3 style="color: var(--text-muted); font-size: 0.9rem; text-align: left; margin-bottom: 5px;">Cadastros Base</h3>
                <a href="paginas/alunos/listarAlunoVIEW.jsp" class="filter-btn" style="text-decoration: none; background: var(--surface-solid); border: 1px solid var(--border);">👥 Alunos</a>
                <a href="paginas/materias/listarMateriaVIEW.jsp" class="filter-btn" style="text-decoration: none; background: var(--surface-solid); border: 1px solid var(--border);">📚 Matérias</a>
            </div>
        </div>
    </div>
</body>
</html>