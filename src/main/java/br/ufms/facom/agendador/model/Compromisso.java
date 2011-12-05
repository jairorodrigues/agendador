/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import br.ufms.facom.agendador.exception.ArgumentoInvalidoException;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author jairo
 */
@Entity
public class Compromisso implements Serializable
{
    @Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
    private Long id;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date data;
    
    private String horarioInicio;
    
    private String horarioFim;
    
    @ManyToOne
    private TipoDeCompromisso tipo;
    
    private String observacao;
    
    @ManyToOne
    private Paciente paciente;
    
    @ManyToOne
    private ProfissionalDaSaude profissional;

    public ProfissionalDaSaude getProfissional() {
        return profissional;
    }

    public void setProfissional(ProfissionalDaSaude profissional) {
        this.profissional = profissional;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    } 

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getHorarioFim() {
        return horarioFim;
    }

    public void setHorarioInicio(String horarioInicio) {
        this.horarioInicio = new Horario(horarioInicio).toString();
        
        verificarConsistencia();
    }
    
    public void setHorarioFim(String horarioFim) {
        this.horarioFim = new Horario(horarioFim).toString();
        
        verificarConsistencia();
    }

    public String getHorarioInicio() {
        return horarioInicio;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public TipoDeCompromisso getTipo() {
        return tipo;
    }

    public void setTipo(TipoDeCompromisso tipo) {
        this.tipo = tipo;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Compromisso other = (Compromisso) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 73 * hash + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }

    @Override
    public String toString() {
        return "Compromisso{" + "data=" + data + ", tipo=" + tipo + "}";
    }

    private void verificarConsistencia() {
        verificarConsistenciaDoHorarioDeInicioEFim();
    }

    private void verificarConsistenciaDoHorarioDeInicioEFim() {
        
        if (horarioInicio == null || horarioFim == null) return;
        
        if (!(new Horario(horarioInicio).venAntesDe(new Horario(horarioFim))))
            throw new ArgumentoInvalidoException("Intervalo de horário inválido!");
    }

    public Intervalo getIntervalo() {
        return new Intervalo(new Horario(horarioInicio), new Horario(horarioFim));
    }
}
