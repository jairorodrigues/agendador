/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.Especialidade;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface EspecialidadeRepository extends Repository<Especialidade, Integer> {

    public List<Especialidade> getAll();
    
}
