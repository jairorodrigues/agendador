/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;


import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author jairo
 */
@Entity
public class Especialidade implements Serializable {
    
    @Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
    private Integer id;
    
    private String nome;
    
    @ManyToOne
    private Profissao profissao;

    public Profissao getProfissao() {
        return profissao;
    }

    public void setProfissao(Profissao profissao) {
        this.profissao = profissao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}