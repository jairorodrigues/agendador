/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.exception;

/**
 *
 * @author jairorrf
 */
public class ApplicationException extends RuntimeException {

    public ApplicationException(Throwable thrwbl) {
        super(thrwbl);
    }

    public ApplicationException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }

    public ApplicationException(String string) {
        super(string);
    }

    public ApplicationException() {
    }
}
