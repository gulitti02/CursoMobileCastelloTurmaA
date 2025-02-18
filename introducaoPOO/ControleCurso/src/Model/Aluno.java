package Model;

public class Aluno extends Pessoa {
    // atributos (encapsulamento)
    private String matricula;
    private Double nota;
    public Aluno(String nome, String cpf, String matricula, Double nota) {
        super(nome, cpf);
        this.matricula = matricula;
        this.nota = nota;
    } 
    //getters and setteres
    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    public Double getNota() {
        return nota;
    }
    public void setNota(Double nota) {
        this.nota = nota;
    }
    
    @Override
    public void exibirinformacoes () {
        super.exibirinformacoes();
        System.out.println("Matricula: "+matricula);
        System.out.println("Nota: "+nota);
    }

}
