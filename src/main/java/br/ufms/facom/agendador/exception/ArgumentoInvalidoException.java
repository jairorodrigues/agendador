/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.exception;

import br.com.caelum.vraptor.validator.annotation.ValidationException;

/**
 *
 * @author jairo
 */
@ValidationException public class ArgumentoInvalidoException extends ApplicationException {

    public ArgumentoInvalidoException(String string) {
        super(string);
    } 
    
}
