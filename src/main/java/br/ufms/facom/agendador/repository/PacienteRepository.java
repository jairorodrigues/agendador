/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.Convenio;
import br.ufms.facom.agendador.model.Paciente;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface PacienteRepository extends Repository<Paciente, Integer> {

    public List<Paciente> getAll();
    
    public List<Convenio> getConvenios ();
    
}
