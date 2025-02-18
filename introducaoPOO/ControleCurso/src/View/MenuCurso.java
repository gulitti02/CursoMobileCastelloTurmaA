package View;

import java.util.Scanner;

import Controler.Curso;
import Model.Aluno;
import Model.Professor;

public class MenuCurso {
    //atributos
    private boolean continuar = true;
    private int operacao;
    Scanner sc = new Scanner(System.in);
public void menu(){
    // instanciar curso e professor
    Professor professor = new Professor("José Pereira", "123.456.", "15000.00");
    Curso curso = new Curso("Curso de Programação Java", professor);

    while(continuar) {
        System.out.println("==Sistema de gestão escolar==");
        System.out.println("1.cadastrar aluno no Curso");
        System.out.println("2.Informações do Curso");
        System.out.println("3.Status da Turma");
        System.out.println("4. Sair");
        System.out.println("Escola a opção desejada:");

        operacao = sc.nextInt();
        switch (operacao) {
            case 1:
            System.out.println("Informe o nome do aluno");
                String nomeAluno = sc.next();
                System.out.println("Informe o cpf do aluno");
                String cpfAluno = sc.next();
                System.out.println("Informe o n° do aluno");
                String matriculaAluno = sc.next();
                System.out.println("Informe a nota do aluno");
                Double notaAluno = sc.nextDouble();
                Aluno aluno = new Aluno("Espadoni", "123456789", matriculaAluno, notaAluno);
                break;
        case 2: 
            curso.exibirinformacoesCurso();
            break;
        case 3:

            break;
        case 4:
            System.out.println("Saindo...");
            continuar = false;
            break;
            default:
            System.out.println("informe uma Operação valida");
            
                break;
        }
    }
}
}
