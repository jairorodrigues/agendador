/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

import br.ufms.facom.agendador.model.ProfissionalDaSaude;
import java.util.List;

/**
 *
 * @author jairo
 */
public interface ProfissionalDaSaudeRepository extends Repository<ProfissionalDaSaude, Integer> {

    public List<ProfissionalDaSaude> getAll();
    
}
