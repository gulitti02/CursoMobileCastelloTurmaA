package Model;

public abstract class Pessoa {

    // atributos (escapsulamento = proteção de dados ele privara atributo d calsse que usamos a palavra 'private')
    
    private String nome; 
    private String cpf;
    
    // métodos
    // construtor

    public Pessoa (String nome, String cpf) {

        this.nome = nome;
        this.cpf = cpf;

    }
    // getter ( pegar )  and setter ( colocar, modificr )  

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }


    // exibiroperações
    public void exibirinformacoes(){
        System.out.println("Nome: "+nome);
        System.out.println("Cpf: "+cpf);
    }
}
