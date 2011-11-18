/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * @author jairo
 */
@Entity
public class Funcionario extends Pessoa implements Serializable
{
    private String login;
    private String senha;
    
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
