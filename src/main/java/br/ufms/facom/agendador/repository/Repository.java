/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.repository;

/**
 *
 * @author jairo
 */
public interface Repository<T, T2> {

    T get(T2 id);
    
    void add(T t);

    void update(T t);

    void remove(T t);
    
}
