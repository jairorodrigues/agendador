/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.infra.persistence;

import br.com.caelum.vraptor.ioc.*;
import javax.persistence.*;

/**
 *
 * @author jairorrf
 */
@Component
public class EntityManagerProvider implements ComponentFactory<EntityManager>
{
    private EntityManager em;

    public EntityManagerProvider (EntityManagerFactory emf) {
        this.em = emf.createEntityManager();
    }

    @Override
    public EntityManager getInstance () {
        return this.em;
    }
}
