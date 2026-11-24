<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Novo Aluno</title>
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
                <div><h1>Novo Aluno</h1><p class="subtitle">Cadastre um aluno no sistema</p></div>
            </div>
            <a href="../../index.jsp" class="filter-btn" style="text-decoration:none;">🏠 Início</a>
        </header>

        <form action="inserirAluno.jsp" method="post" class="form-card">
            <div class="field">
                <label>Nome Completo</label>
                <input type="text" name="nome" placeholder="Ex: Ana Souza" required>
            </div>
            <div class="field">
                <label>E-mail</label>
                <input type="email" name="email" placeholder="Ex: ana@email.com" required>
            </div>
            <div class="field">
                <label>Turma</label>
                <input type="text" name="turma" placeholder="Ex: 3º Ano A" required>
            </div>
            <button type="submit" class="btn-primary" style="margin-top: 10px; width: 100%;">Cadastrar Aluno</button>
        </form>
    </div>
</body>
</html>