package dto;

public class AlunoDTO {

    private int id_aluno;
    private String nome;
    private String email;
    private String turma;

    // ===== Getter e Setter: id_aluno =====
    public int getId_aluno() {
        return id_aluno;
    }

    public void setId_aluno(int id_aluno) {
        this.id_aluno = id_aluno;
    }

    // ===== Getter e Setter: nome =====
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    // ===== Getter e Setter: email =====
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // ===== Getter e Setter: turma =====
    public String getTurma() {
        return turma;
    }

    public void setTurma(String turma) {
        this.turma = turma;
    }
}