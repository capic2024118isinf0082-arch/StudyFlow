package dto;

public class MateriaDTO {

    private int id_materia;
    private String nome_materia;
    private String professor;
    private String cor_hex;

    // ===== Getter e Setter: id_materia =====
    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    // ===== Getter e Setter: nome_materia =====
    public String getNome_materia() {
        return nome_materia;
    }

    public void setNome_materia(String nome_materia) {
        this.nome_materia = nome_materia;
    }

    // ===== Getter e Setter: professor =====
    public String getProfessor() {
        return professor;
    }

    public void setProfessor(String professor) {
        this.professor = professor;
    }

    // ===== Getter e Setter: cor_hex =====
    public String getCor_hex() {
        return cor_hex;
    }

    public void setCor_hex(String cor_hex) {
        this.cor_hex = cor_hex;
    }
}