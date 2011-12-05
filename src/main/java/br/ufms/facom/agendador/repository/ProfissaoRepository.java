/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.Profissao;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface ProfissaoRepository extends Repository<Profissao, Integer> {

    public List<Profissao> getAll();
    
}
