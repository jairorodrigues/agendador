/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.TipoDeCompromisso;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface TipoDeCompromissoRepository extends Repository<TipoDeCompromisso, Integer>  {
    
    public List<TipoDeCompromisso> getAll();
    
}
