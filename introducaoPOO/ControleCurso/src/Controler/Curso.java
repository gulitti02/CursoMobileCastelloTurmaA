package Controler;

import java.util.ArrayList;
import java.util.List;

import Model.Aluno;
import Model.Professor;

public class Curso {
    // atributos
private String nomeCurso;
private Professor Professor;
private List<Aluno> alunos;
    // construtor
public Curso(String nomeCurso, Professor professor) {
    this.nomeCurso = nomeCurso;
    Professor = professor;
   alunos = new ArrayList<>();
    
}
    // metodos
    // adicionar aluno
    public void adicionarAluno(Aluno aluno){
        alunos.add(aluno);
    }
// exibir informações curso
public void exibirinformacoesCurso(){
    System.out.println("Nome do Curso: "+nomeCurso);
    System.out.println("Nome Professor: "+Professor.getNome());
        int contador = 0;
        for (Aluno aluno : alunos) {
            contador++;
            System.out.println(contador+". "+aluno.getNome());

        
        
        }
        System.out.println("===========================");
}

}
