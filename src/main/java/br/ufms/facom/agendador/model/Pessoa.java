/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import br.ufms.facom.agendador.exception.ArgumentoInvalidoException;
import java.io.Serializable;
import javax.persistence.*;
import org.apache.commons.validator.EmailValidator;

/**
 * 
 * @author jairo
 */
@Entity
public class Pessoa implements Serializable
{
    @Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
    private Integer id;
    
    private String nome;
    
    private String telefone;
    private String email;
    
    @Embedded
    private Endereco endereco;
    
    private String cpf;
    private String rg;

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Pessoa() {
        endereco = new Endereco();
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        
        if (!EmailValidator.getInstance().isValid(email))
            throw new ArgumentoInvalidoException("E-mail inválido!");
        
        this.email = email;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
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

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pessoa other = (Pessoa) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }

    @Override
    public String toString() {
        return "Pessoa{" + "id=" + id + ", nome=" + nome + ", telefone=" + telefone + ", email=" + email + ", endereco=" + endereco + ", cpf=" + cpf + ", rg=" + rg + '}';
    }
}
