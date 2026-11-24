<%@ page import="dto.AtividadeDTO" %>
<%@ page import="dao.AtividadeDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastrando...</title>
</head>
<body>
<%
    try {
        AtividadeDTO objAtividadeDTO = new AtividadeDTO();
        objAtividadeDTO.setTitulo(request.getParameter("titulo"));
        objAtividadeDTO.setDescricao(request.getParameter("descricao"));
        objAtividadeDTO.setData_entrega(request.getParameter("data_entrega"));
        objAtividadeDTO.setPrioridade(request.getParameter("prioridade"));
        objAtividadeDTO.setStatus("pendente");
        objAtividadeDTO.setId_aluno(Integer.parseInt(request.getParameter("id_aluno")));
        objAtividadeDTO.setId_materia(Integer.parseInt(request.getParameter("id_materia")));

        AtividadeDAO objAtividadeDAO = new AtividadeDAO();
        objAtividadeDAO.cadastrarAtividade(objAtividadeDTO);

        out.println("<h2>✅ Atividade cadastrada com sucesso!</h2>");
        out.println("<a href='formAtividadeVIEW.html'>Cadastrar outra</a>");
    } catch (Exception e) {
        out.println("<h2>❌ Erro ao cadastrar: " + e.getMessage() + "</h2>");
    }
%>
</body>
</html>