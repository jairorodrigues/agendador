/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.infra.interceptor;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import org.apache.log4j.Logger;


/**
 * Interceptador de requisição interessado no controla da transação JPA(begin, commit/roolback)
 * Interceptará qualquer requisição que estiver anotada com HasAJPATransaction
 * 
 * @author jairo
 */
@Intercepts
public class JPATransactionInterceptor implements Interceptor {

    private Logger logger = Logger.getLogger(JPATransactionInterceptor.class);
    
    private EntityManager em;

    public JPATransactionInterceptor(EntityManager em) {
        this.em = em;
    }
    
    
    /**
     * O método responde se o interceptador interceptara a requisição.
     * Retornara verdadeiro quando o método estiver anotado com HasAJPATransaction
     */
    @Override public boolean accepts(ResourceMethod rm) {
        
        logger.debug("HasAJPATransaction? " + rm.containsAnnotation(HasAJPATransaction.class));
        
        return rm.containsAnnotation(HasAJPATransaction.class);
    }


    @Override public void intercept(InterceptorStack is, ResourceMethod rm, Object o) throws InterceptionException
    {
        EntityTransaction tx = em.getTransaction();
        logger.debug("begin transaction");
        tx.begin();
            
        try {
            
            is.next(rm, o);
            
            if (tx.isActive()) {
                logger.debug("commit transaction");
                tx.commit();
            }
            
        } catch (Exception ex) {
            if (tx.isActive()) {
                logger.debug("rollback transaction");
                tx.rollback();
            }
        }
    }
}
