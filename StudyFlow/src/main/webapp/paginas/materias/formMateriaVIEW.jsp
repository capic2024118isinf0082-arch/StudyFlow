<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Nova Matéria</title>
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
                <div><h1>Nova Matéria</h1><p class="subtitle">Adicione uma disciplina</p></div>
            </div>
            <a href="../../index.jsp" class="filter-btn" style="text-decoration:none;">🏠 Início</a>
        </header>

        <form action="inserirMateria.jsp" method="post" class="form-card">
            <div class="field">
                <label>Nome da Matéria</label>
                <input type="text" name="nome_materia" placeholder="Ex: Matemática" required>
            </div>
            <div class="field">
                <label>Professor(a)</label>
                <input type="text" name="professor" placeholder="Ex: Prof. Ricardo">
            </div>
            <div class="field">
                <label>Cor (Hexadecimal)</label>
                <input type="color" name="cor_hex" value="#7c3aed" style="height: 45px; padding: 4px;">
            </div>
            <button type="submit" class="btn-primary" style="margin-top: 10px; width: 100%;">Cadastrar Matéria</button>
        </form>
    </div>
</body>
</html>