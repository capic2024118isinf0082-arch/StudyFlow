package dao;

import dto.MateriaDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MateriaDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    // ============================================
    // MÉTODO CADASTRAR
    // ============================================
    public void cadastrarMateria(MateriaDTO objMateriaDTO) throws ClassNotFoundException {

        String sql = "INSERT INTO Materia (nome_materia, professor, cor_hex) VALUES (?, ?, ?)";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objMateriaDTO.getNome_materia());
            pstm.setString(2, objMateriaDTO.getProfessor());
            pstm.setString(3, objMateriaDTO.getCor_hex());

            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
            System.out.println("Erro ao cadastrar matéria: " + e.getMessage());
        }
    }

    // ============================================
    // MÉTODO LISTAR (para preencher o <select>)
    // ============================================
    public ArrayList<MateriaDTO> listarMaterias() throws ClassNotFoundException {

        ArrayList<MateriaDTO> lista = new ArrayList<>();
        String sql = "SELECT * FROM Materia ORDER BY nome_materia ASC";

        con = new ConexaoDAO().conexaoBD();

        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();

            while (rs.next()) {
                MateriaDTO materia = new MateriaDTO();
                materia.setId_materia(rs.getInt("id_materia"));
                materia.setNome_materia(rs.getString("nome_materia"));
                materia.setProfessor(rs.getString("professor"));
                materia.setCor_hex(rs.getString("cor_hex"));
                lista.add(materia);
            }

            rs.close();
            pstm.close();
        } catch (SQLException e) {
            System.out.println("Erro ao listar matérias: " + e.getMessage());
        }

        return lista;
    }

    public void excluirMateria(int id_materia) throws ClassNotFoundException {
        String sql = "DELETE FROM Materia WHERE id_materia = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id_materia);
            pstm.execute();
            pstm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Erro ao excluir matéria: " + e.getMessage());
        }
    }
}