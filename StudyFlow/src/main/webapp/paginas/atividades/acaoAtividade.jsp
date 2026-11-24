<%@ page import="dao.AtividadeDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String acao = request.getParameter("acao");
    String idStr = request.getParameter("id");

    if (idStr != null && !idStr.isEmpty()) {
        int id = Integer.parseInt(idStr);
        AtividadeDAO dao = new AtividadeDAO();

        if ("concluir".equals(acao)) {
            dao.concluirAtividade(id);
        } else if ("excluir".equals(acao)) {
            dao.excluirAtividade(id);
        }
    }

    // Redireciona de volta para a listagem
    response.sendRedirect("listarAtividadeVIEW.jsp");
%>