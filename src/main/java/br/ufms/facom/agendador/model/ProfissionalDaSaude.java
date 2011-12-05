/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import javax.persistence.*;

/**
 *
 * @author jairo
 */
@Entity
public class ProfissionalDaSaude extends Funcionario {
    
    @ManyToOne
    private Especialidade especialidade;
    
    private String registroProfissional;

    public Especialidade getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(Especialidade especialidade) {
        this.especialidade = especialidade;
    }

    public String getRegistroProfissional() {
        return registroProfissional;
    }

    public void setRegistroProfissional(String registroProfissional) {
        this.registroProfissional = registroProfissional;
    }
}
