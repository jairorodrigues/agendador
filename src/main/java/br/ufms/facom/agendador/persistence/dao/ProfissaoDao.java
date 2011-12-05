/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.Profissao;
import br.ufms.facom.agendador.repository.ProfissaoRepository;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class ProfissaoDao implements ProfissaoRepository {

    private EntityManager em;

    public ProfissaoDao(EntityManager em) {
        this.em = em;
    }
    
    @Override
    public void add(Profissao profissao) {
        em.persist(profissao);
    }

    @Override
    public void update(Profissao profissao) {
        em.merge(profissao);
    }

    @Override
    public void remove(Profissao profissao) {
        em.remove(load(profissao));
    }

    @Override
    public List<Profissao> getAll() {
        return em.createQuery("from Profissao p").getResultList();
    }

    @Override
    public Profissao get(Integer id) {
        return em.find(Profissao.class, id);
    }

    private Profissao load(Profissao profissao) {
        return get(profissao.getId());
    }
}
