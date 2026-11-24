<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.AtividadeDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>StudyFlow · Minhas Atividades</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <div class="bg-blobs">
        <div class="blob blob-1"></div>
        <div class="blob blob-2"></div>
    </div>

    <div class="app">
        <header class="app-header">
            <div class="brand">
                <div class="brand-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 5a2 2 0 0 1 2-2h11a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V5Z"/><path d="M8 7h7M8 11h7M8 15h4"/></svg>
                </div>
                <div>
                    <h1>Minhas Atividades</h1>
                    <p class="subtitle">Acompanhe suas tarefas escolares</p>
                </div>
            </div>
            <a href="../../index.jsp" class="filter-btn" style="text-decoration:none;">🏠 Início</a>
        </header>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Atividade</th>
                        <th>Aluno</th>
                        <th>Matéria</th>
                        <th>Entrega</th>
                        <th>Prioridade</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        AtividadeDAO dao = new AtividadeDAO();
                        ArrayList<String[]> atividades = dao.listarAtividades();

                        if (atividades.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="6" style="text-align: center; padding: 40px; color: var(--text-muted);">
                                Nenhuma atividade cadastrada ainda. ✨
                            </td>
                        </tr>
                    <%
                        } else {
                            for (String[] a : atividades) {
                    %>
                        <tr style="<%= a[6].equals("concluida") ? "opacity: 0.6;" : "" %>">
                            <td style="<%= a[6].equals("concluida") ? "text-decoration: line-through;" : "" %> font-weight: 500;">
                                <%= a[1] %>
                            </td>
                            <td><%= a[2] %></td>
                            <td><%= a[3] %></td>
                            <td><%= a[4] %></td>
                            <td><span class="badge <%= a[5] %>"><%= a[5].toUpperCase() %></span></td>
                            <<!-- Substitua a célula de status por esta: -->
                             <td>
                                 <% if(a[6].equals("concluida")) { %>
                                     <span style="color: #10b981; font-weight: 600;">✅ Concluída</span>
                                 <% } else { %>
                                     <span style="color: #f59e0b; font-weight: 600;">⏳ Pendente</span>
                                 <% } %>
                             </td>
                             <td style="text-align: right;">
                                 <% if(a[6].equals("pendente")) { %>
                                     <a href="acaoAtividade.jsp?acao=concluir&id=<%= a[0] %>"
                                        class="btn-link" style="color: #10b981;">Concluir</a>
                                 <% } %>
                                 <a href="acaoAtividade.jsp?acao=excluir&id=<%= a[0] %>"
                                    class="btn-link" style="color: #ef4444; margin-left: 10px;"
                                    onclick="return confirm('Tem certeza que deseja excluir?');">Excluir</a>
                             </td>
                             <td style="text-align: right;">
                                 <!-- Novo botão de Editar -->
                                 <a href="editarAtividadeVIEW.jsp?id=<%= a[0] %>" class="btn-acao btn-editar" style="text-decoration: none;">Editar</a>

                                 <% if(a[6].equals("pendente")) { %>
                                     <button class="btn-acao btn-concluir" onclick="concluirAtividade(<%= a[0] %>)">Concluir</button>
                                 <% } %>
                                 <button class="btn-acao btn-excluir" onclick="excluirAtividade(<%= a[0] %>)">Excluir</button>
                             </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>