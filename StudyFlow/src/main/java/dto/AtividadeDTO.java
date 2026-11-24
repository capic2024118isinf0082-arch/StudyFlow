package dto;

public class AtividadeDTO {

    private int id_atividade;
    private String titulo;
    private String descricao;
    private String data_entrega;
    private String prioridade;
    private String status;
    private int id_aluno;
    private int id_materia;

    // Getters e Setters
    public int getId_atividade() { return id_atividade; }
    public void setId_atividade(int id_atividade) { this.id_atividade = id_atividade; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getData_entrega() { return data_entrega; }
    public void setData_entrega(String data_entrega) { this.data_entrega = data_entrega; }

    public String getPrioridade() { return prioridade; }
    public void setPrioridade(String prioridade) { this.prioridade = prioridade; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public int getId_aluno() { return id_aluno; }
    public void setId_aluno(int id_aluno) { this.id_aluno = id_aluno; }

    public int getId_materia() { return id_materia; }
    public void setId_materia(int id_materia) { this.id_materia = id_materia; }
}