/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.infra.annotation;

import java.lang.annotation.*;

/**
 *
 * @author jairo
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface HasAJPATransaction {}
