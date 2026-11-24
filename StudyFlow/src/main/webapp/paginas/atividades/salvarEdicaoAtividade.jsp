<%@ page import="dto.AtividadeDTO" %>
<%@ page import="dao.AtividadeDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    try {
        AtividadeDTO atividade = new AtividadeDTO();
        atividade.setId_atividade(Integer.parseInt(request.getParameter("id_atividade")));
        atividade.setTitulo(request.getParameter("titulo"));
        atividade.setDescricao(request.getParameter("descricao"));
        atividade.setData_entrega(request.getParameter("data_entrega"));
        atividade.setPrioridade(request.getParameter("prioridade"));
        atividade.setId_aluno(Integer.parseInt(request.getParameter("id_aluno")));
        atividade.setId_materia(Integer.parseInt(request.getParameter("id_materia")));

        AtividadeDAO dao = new AtividadeDAO();
        dao.atualizarAtividade(atividade);

        // Redireciona de volta para a listagem
        response.sendRedirect("listarAtividadeVIEW.jsp");
    } catch (Exception e) {
        out.println("Erro ao atualizar: " + e.getMessage());
    }
%>