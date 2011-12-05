/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.persistence.dao;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.model.Convenio;
import br.ufms.facom.agendador.model.Paciente;
import br.ufms.facom.agendador.repository.PacienteRepository;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author jairo
 */
@Component
public class PacienteDao implements PacienteRepository {

    private EntityManager em;

    public PacienteDao(EntityManager em) {
        this.em = em;
    }
    
    @Override
    public void add(Paciente paciente) {
        em.persist(paciente);
    }

    @Override
    public void update(Paciente paciente) {
        em.merge(paciente);
    }

    @Override
    public void remove(Paciente paciente) {
        em.remove(get(paciente.getId()));
    }

    @Override
    public List<Paciente> getAll() {
        return em.createQuery("from Paciente p").getResultList();
    }

    @Override
    public Paciente get(Integer id) {
        return em.find(Paciente.class, id);
    }

    @Override
    public List<Convenio> getConvenios() {
        return em.createQuery("from Convenio c").getResultList();
    }
    
}
