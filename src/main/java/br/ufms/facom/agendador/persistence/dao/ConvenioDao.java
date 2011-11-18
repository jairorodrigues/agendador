/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.Convenio;
import br.ufms.facom.agendador.repository.ConvenioRepository;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class ConvenioDao implements ConvenioRepository {

    private EntityManager em;

    public ConvenioDao(EntityManager em) {
        this.em = em;
    }
    
    @Override
    public void add(Convenio convenio) {
        em.persist(convenio);
    }

    @Override
    public void update(Convenio convenio) {
        em.merge(convenio);
    }

    @Override
    public void remove(Convenio convenio) {
        em.remove(load(convenio));
    }

    @Override
    public List<Convenio> getAll() {
        return em.createQuery("from Convenio c").getResultList();
    }

    @Override
    public Convenio get(Integer id) {
        return em.find(Convenio.class, id);
    }

    private Convenio load(Convenio convenio) {
        return get(convenio.getId());
    }
}
