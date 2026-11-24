package dao;

import dto.AlunoDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AlunoDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    // ============================================
    // MÉTODO CADASTRAR
    // ============================================
    public void cadastrarAluno(AlunoDTO objAlunoDTO) throws ClassNotFoundException {

        String sql = "INSERT INTO Aluno (nome, email, turma) VALUES (?, ?, ?)";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objAlunoDTO.getNome());
            pstm.setString(2, objAlunoDTO.getEmail());
            pstm.setString(3, objAlunoDTO.getTurma());

            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
            System.out.println("Erro ao cadastrar aluno: " + e.getMessage());
        }
    }

    // ============================================
    // MÉTODO LISTAR (para preencher o <select>)
    // ============================================
    public ArrayList<AlunoDTO> listarAlunos() throws ClassNotFoundException {

        ArrayList<AlunoDTO> lista = new ArrayList<>();
        String sql = "SELECT * FROM Aluno ORDER BY nome ASC";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                AlunoDTO aluno = new AlunoDTO();
                aluno.setId_aluno(rs.getInt("id_aluno"));
                aluno.setNome(rs.getString("nome"));
                aluno.setEmail(rs.getString("email"));
                aluno.setTurma(rs.getString("turma"));
                lista.add(aluno);
            }

            rs.close();
            pstm.close();
        } catch (SQLException e) {
            System.out.println("Erro ao listar alunos: " + e.getMessage());
        }

        return lista;
    }

    public void excluirAluno(int id_aluno) throws ClassNotFoundException {
        String sql = "DELETE FROM Aluno WHERE id_aluno = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id_aluno);
            pstm.execute();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao excluir aluno: " + e.getMessage());
        }
    }
}