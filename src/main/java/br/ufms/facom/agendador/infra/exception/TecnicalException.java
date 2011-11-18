/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.infra.exception;

import br.ufms.facom.agendador.exception.ApplicationException;

/**
 *
 * @author jairorrf
 */
public class TecnicalException extends ApplicationException {

    public TecnicalException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }

    public TecnicalException(Throwable thrwbl) {
        super(thrwbl);
    }
}
