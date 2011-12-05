/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import br.ufms.facom.agendador.exception.ArgumentoInvalidoException;

/**
 *
 * @author jairo
 */
public final class Horario {
    
    private String valor;

    public Horario(String valor) {
        setValor(valor);
    }

    public String getValor() {
        return valor;
    }
    
    public boolean venAntesDe (Horario horario2) {
        
        Integer hora1 = Integer.parseInt(valor.substring(0, 2));
        Integer minuto1 = Integer.parseInt(valor.substring(3));
        
        Integer hora2 = Integer.parseInt(horario2.valor.substring(0, 2));
        Integer minuto2 = Integer.parseInt(horario2.valor.substring(3));
        
        return (hora1 < hora2 || (hora1 == hora2 && minuto1 < minuto2));
    }

    private void setValor(String v)
    {
        if (!v.matches("^([0-1][0-9]|[2][0-3])(:([0-5][0-9])){1,2}$"))
            throw new ArgumentoInvalidoException("Horário inválido");
        
        this.valor = v;
    }
    
    @Override
    public String toString() {
        return valor;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Horario other = (Horario) obj;
        if ((this.valor == null) ? (other.valor != null) : !this.valor.equals(other.valor)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + (this.valor != null ? this.valor.hashCode() : 0);
        return hash;
    }
}
