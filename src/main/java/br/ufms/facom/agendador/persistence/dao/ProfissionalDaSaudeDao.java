/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.ProfissionalDaSaude;
import br.ufms.facom.agendador.repository.ProfissionalDaSaudeRepository;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class ProfissionalDaSaudeDao implements ProfissionalDaSaudeRepository {

    private EntityManager em;

    public ProfissionalDaSaudeDao(EntityManager em) {
        this.em = em;
    }
    
    @Override
    public void add(ProfissionalDaSaude profissional) {
        em.persist(profissional);
    }

    @Override
    public void update(ProfissionalDaSaude profissional) {
        em.merge(profissional);
    }

    @Override
    public void remove(ProfissionalDaSaude profissional) {
        em.remove(load(profissional));
    }

    @Override
    public List<ProfissionalDaSaude> getAll() {
        return em.createQuery("from ProfissionalDaSaude p order by p.nome").getResultList();
    }

    @Override
    public ProfissionalDaSaude get(Integer id) {
        return em.find(ProfissionalDaSaude.class, id);
    }

    private ProfissionalDaSaude load(ProfissionalDaSaude profissional) {
        return get(profissional.getId());
    }
}
