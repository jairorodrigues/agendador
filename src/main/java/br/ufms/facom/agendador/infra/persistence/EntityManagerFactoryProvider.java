/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.infra.persistence;

import br.com.caelum.vraptor.ioc.*;
import br.ufms.facom.agendador.infra.config.AppConfigProperties;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


/**
 *
 * @author jairorrf
 */
@Component
public class EntityManagerFactoryProvider implements ComponentFactory<EntityManagerFactory>
{
    private EntityManagerFactory factory;

    public EntityManagerFactoryProvider (AppConfigProperties config) {
        factory = Persistence.createEntityManagerFactory(config.getProperty("app.persistence.unit"));
    }

    @PreDestroy
    public void destroy() {
        factory.close();
    }

    @Override
    public EntityManagerFactory getInstance() {
        return factory;
    }
}