package Model;

public class Professor extends Pessoa {
    private String salario;

    public Professor(String nome, String cpf, String salario) {
        super(nome, cpf);
        this.salario = salario;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    @Override 
    public void exibirinformacoes () {
    super.exibirinformacoes();
    System.out.println("Slario: "+salario);
    


    }

}
