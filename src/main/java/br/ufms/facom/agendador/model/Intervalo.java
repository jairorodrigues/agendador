/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

/**
 *
 * @author jairo
 */
public class Intervalo {
    
    private Horario inicio;
    private Horario fim;

    public Intervalo(Horario inicio, Horario fim) {
        this.inicio = inicio;
        this.fim = fim;
    }

    public Horario getFim() {
        return fim;
    }

    public Horario getInicio() {
        return inicio;
    }
    
    public boolean contem (Horario horario) {
        return (inicio.venAntesDe(horario) && horario.venAntesDe(fim));
    }

    public boolean sobrepoemOuEhSobreposto (Intervalo outroIntervalo) {
        return (this.contem(outroIntervalo.inicio) || this.contem(outroIntervalo.fim)) ||
                (outroIntervalo.contem(this.inicio) || outroIntervalo.contem(this.fim));
    }
    
}
