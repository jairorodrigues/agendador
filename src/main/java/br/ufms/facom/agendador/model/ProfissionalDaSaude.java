/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import javax.persistence.Entity;

/**
 *
 * @author jairo
 */
@Entity
public class ProfissionalDaSaude extends Funcionario {
    
    private Especializacao  especializacao;
    private String          registroProfissional;

    public Especializacao getEspecializacao() {
        return especializacao;
    }

    public void setEspecializacao(Especializacao especializacao) {
        this.especializacao = especializacao;
    }

    public String getRegistroProfissional() {
        return registroProfissional;
    }

    public void setRegistroProfissional(String registroProfissional) {
        this.registroProfissional = registroProfissional;
    }

}
