/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.TipoDeCompromisso;
import br.ufms.facom.agendador.repository.TipoDeCompromissoRepository;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class TipoDeCompromissoDao implements TipoDeCompromissoRepository {

    private EntityManager em;

    public TipoDeCompromissoDao(EntityManager em) {
        this.em = em;
    }
    
    @Override
    public void add(TipoDeCompromisso tipoDeCompromisso) {
        em.persist(tipoDeCompromisso);
    }

    @Override
    public void update(TipoDeCompromisso tipoDeCompromisso) {
        em.merge(tipoDeCompromisso);
    }

    @Override
    public void remove(TipoDeCompromisso tipoDeCompromisso) {
        em.remove(load(tipoDeCompromisso));
    }

    @Override
    public List<TipoDeCompromisso> getAll() {
        return em.createQuery("from TipoDeCompromisso t").getResultList();
    }

    @Override
    public TipoDeCompromisso get(Integer id) {
        return em.find(TipoDeCompromisso.class, id);
    }

    private TipoDeCompromisso load(TipoDeCompromisso tipoDeCompromisso) {
        return get(tipoDeCompromisso.getId());
    }
}
