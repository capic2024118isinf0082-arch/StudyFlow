package dao;

import dto.AtividadeDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AtividadeDAO {

    // Variáveis de conexão e execução
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    // ============================================
    // MÉTODO CADASTRAR (o que já tínhamos)
    // ============================================
    public void cadastrarAtividade(AtividadeDTO objAtividadeDTO)
            throws ClassNotFoundException {

        String sql = "INSERT INTO Atividade "
                + "(titulo, descricao, data_entrega, prioridade, status, id_aluno, id_materia) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objAtividadeDTO.getTitulo());
            pstm.setString(2, objAtividadeDTO.getDescricao());
            pstm.setString(3, objAtividadeDTO.getData_entrega());
            pstm.setString(4, objAtividadeDTO.getPrioridade());
            pstm.setString(5, objAtividadeDTO.getStatus());
            pstm.setInt(6, objAtividadeDTO.getId_aluno());
            pstm.setInt(7, objAtividadeDTO.getId_materia());

            pstm.execute();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao cadastrar atividade: " + e.getMessage());
        }
    }

    // ============================================
    // MÉTODO LISTAR (novo — para a JSP de listagem)
    // ============================================
    public ArrayList<String[]> listarAtividades() throws ClassNotFoundException {

        ArrayList<String[]> lista = new ArrayList<>();

        String sql = "SELECT a.id_atividade, a.titulo, a.data_entrega, "
                + "a.prioridade, a.status, al.nome AS aluno, m.nome_materia "
                + "FROM Atividade a "
                + "INNER JOIN Aluno al ON al.id_aluno = a.id_aluno "
                + "INNER JOIN Materia m ON m.id_materia = a.id_materia "
                + "ORDER BY a.data_entrega ASC";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                String[] linha = new String[7];
                linha[0] = String.valueOf(rs.getInt("id_atividade"));
                linha[1] = rs.getString("titulo");
                linha[2] = rs.getString("aluno");
                linha[3] = rs.getString("nome_materia");
                linha[4] = rs.getString("data_entrega");
                linha[5] = rs.getString("prioridade");
                linha[6] = rs.getString("status");
                lista.add(linha);
            }

            rs.close();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao listar atividades: " + e.getMessage());
        }

        return lista;
    }

    // ============================================
    // MÉTODO CONCLUIR ATIVIDADE
    // ============================================
    public void concluirAtividade(int id_atividade) throws ClassNotFoundException {
        String sql = "UPDATE Atividade SET status = 'concluida' WHERE id_atividade = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id_atividade);
            pstm.execute();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao concluir atividade: " + e.getMessage());
        }
    }

    // ============================================
    // MÉTODO EXCLUIR ATIVIDADE
    // ============================================
    public void excluirAtividade(int id_atividade) throws ClassNotFoundException {
        String sql = "DELETE FROM Atividade WHERE id_atividade = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id_atividade);
            pstm.execute();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao excluir atividade: " + e.getMessage());
        }
    }

    // ============================================
    // MÉTODO BUSCAR POR ID (Read específico)
    // ============================================
    public AtividadeDTO buscarAtividade(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM Atividade WHERE id_atividade = ?";
        AtividadeDTO atividade = new AtividadeDTO();
        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                atividade.setId_atividade(rs.getInt("id_atividade"));
                atividade.setTitulo(rs.getString("titulo"));
                atividade.setDescricao(rs.getString("descricao"));
                atividade.setData_entrega(rs.getString("data_entrega"));
                atividade.setPrioridade(rs.getString("prioridade"));
                atividade.setStatus(rs.getString("status"));
                atividade.setId_aluno(rs.getInt("id_aluno"));
                atividade.setId_materia(rs.getInt("id_materia"));
            }
            rs.close();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao buscar atividade: " + e.getMessage());
        }
        return atividade;
    }

    // ============================================
    // MÉTODO ATUALIZAR (Update)
    // ============================================
    public void atualizarAtividade(AtividadeDTO objAtividadeDTO) throws ClassNotFoundException {
        String sql = "UPDATE Atividade SET titulo = ?, descricao = ?, data_entrega = ?, "
                + "prioridade = ?, id_aluno = ?, id_materia = ? WHERE id_atividade = ?";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objAtividadeDTO.getTitulo());
            pstm.setString(2, objAtividadeDTO.getDescricao());
            pstm.setString(3, objAtividadeDTO.getData_entrega());
            pstm.setString(4, objAtividadeDTO.getPrioridade());
            pstm.setInt(5, objAtividadeDTO.getId_aluno());
            pstm.setInt(6, objAtividadeDTO.getId_materia());
            pstm.setInt(7, objAtividadeDTO.getId_atividade());

            pstm.execute();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar atividade: " + e.getMessage());
        }
    }
}