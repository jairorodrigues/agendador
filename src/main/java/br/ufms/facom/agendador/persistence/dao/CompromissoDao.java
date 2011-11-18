/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.Compromisso;
import br.ufms.facom.agendador.repository.CompromissoRepository;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class CompromissoDao implements CompromissoRepository {
    
    private EntityManager em;

    public CompromissoDao(EntityManager em) {
        this.em = em;
    }
 

    @Override
    public List<Compromisso> getCompromissosDeHoje() {
        
        return em.createQuery("from Compromisso c where c.data=:hoje")
                .setParameter("hoje", new Date())
                .getResultList();
    }

    @Override
    public List<Compromisso> getProximos() {
        return em.createQuery("from Compromisso c where c.data > :hoje")
                .setParameter("hoje", new Date())
                .getResultList();
    }

    @Override
    public Compromisso get(Integer id) {
        return em.find(Compromisso.class, id);
    }

    @Override
    public void add(Compromisso c) {
        em.persist(c);
    }

    @Override
    public void update(Compromisso c) {
        em.merge(c);
    }

    @Override
    public void remove(Compromisso c) {
        em.remove(c);
    }
    
}
