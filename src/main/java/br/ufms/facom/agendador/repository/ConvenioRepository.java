/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.Convenio;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface ConvenioRepository extends Repository<Convenio, Integer> {

    public List<Convenio> getAll();
    
}
