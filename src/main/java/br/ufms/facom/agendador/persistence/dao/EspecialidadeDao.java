/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.Especialidade;
import br.ufms.facom.agendador.repository.EspecialidadeRepository;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class EspecialidadeDao implements EspecialidadeRepository {

    private EntityManager em;

    public EspecialidadeDao(EntityManager em) {
        this.em = em;
    }
    
    @Override
    public void add(Especialidade especialidade) {
        em.persist(especialidade);
    }

    @Override
    public void update(Especialidade especialidade) {
        em.merge(especialidade);
    }

    @Override
    public void remove(Especialidade especialidade) {
        em.remove(load(especialidade));
    }

    @Override
    public List<Especialidade> getAll() {
        return em.createQuery("from Especialidade e order by e.profissao.nome").getResultList();
    }

    @Override
    public Especialidade get(Integer id) {
        return em.find(Especialidade.class, id);
    }

    private Especialidade load(Especialidade especialidade) {
        return get(especialidade.getId());
    }
}
