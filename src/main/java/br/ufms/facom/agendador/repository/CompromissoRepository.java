/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.Compromisso;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface CompromissoRepository extends Repository<Compromisso, Integer>  {

    public List<Compromisso> getCompromissosDeHoje();

    public List<Compromisso> getProximos();
    
}
