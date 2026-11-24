<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.AlunoDTO" %>
<%@ page import="dto.MateriaDTO" %>
<%@ page import="dao.AlunoDAO" %>
<%@ page import="dao.MateriaDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Nova Atividade</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="conteudo">
    <h1>➕ Nova Atividade</h1>

    <form action="inserirAtividade.jsp" method="post">

        <div>
            <label>Título</label>
            <input type="text" name="titulo" required
                   placeholder="Ex: Lista de exercícios">
        </div>

        <div>
            <label>Descrição</label>
            <textarea name="descricao" placeholder="Detalhes da atividade"></textarea>
        </div>

        <div>
            <label>Data de entrega</label>
            <input type="date" name="data_entrega" required>
        </div>

        <div>
            <label>Prioridade</label>
            <select name="prioridade">
                <option value="baixa">🟢 Baixa</option>
                <option value="media" selected>🟡 Média</option>
                <option value="alta">🔴 Alta</option>
            </select>
        </div>

        <div>
            <label>Aluno</label>
            <select name="id_aluno" required>
                <option value="">-- Selecione o aluno --</option>
                <%
                    AlunoDAO alunoDAO = new AlunoDAO();
                    ArrayList<AlunoDTO> alunos = alunoDAO.listarAlunos();
                    for (AlunoDTO a : alunos) {
                %>
                    <option value="<%= a.getId_aluno() %>">
                        <%= a.getNome() %> — <%= a.getTurma() %>
                    </option>
                <% } %>
            </select>
        </div>

        <div>
            <label>Matéria</label>
            <select name="id_materia" required>
                <option value="">-- Selecione a matéria --</option>
                <%
                    MateriaDAO materiaDAO = new MateriaDAO();
                    ArrayList<MateriaDTO> materias = materiaDAO.listarMaterias();
                    for (MateriaDTO m : materias) {
                %>
                    <option value="<%= m.getId_materia() %>">
                        <%= m.getNome_materia() %> — <%= m.getProfessor() %>
                    </option>
                <% } %>
            </select>
        </div>

        <button type="submit">Cadastrar Atividade</button>
    </form>
</div>
</body>
</html>