/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

/**
 * @author jairo
 */
@Entity
public class Paciente extends Pessoa implements Serializable
{
    @OneToMany
    private List<Convenio> convenios;

    public List<Convenio> getConvenios() {
        return convenios;
    }

    public void setConvenios(List<Convenio> convenios) {
        this.convenios = convenios;
    }
}
