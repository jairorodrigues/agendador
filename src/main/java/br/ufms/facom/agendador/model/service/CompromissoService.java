/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model.service;

import br.com.caelum.vraptor.ioc.Component;
import br.ufms.facom.agendador.exception.ApplicationException;
import br.ufms.facom.agendador.model.Compromisso;
import br.ufms.facom.agendador.model.Horario;
import br.ufms.facom.agendador.model.Intervalo;
import br.ufms.facom.agendador.model.Paciente;
import br.ufms.facom.agendador.model.ProfissionalDaSaude;
import br.ufms.facom.agendador.repository.CompromissoRepository;
import java.util.Date;
import java.util.List;

/**
 *
 * @author jairo
 */
@Component
public class CompromissoService {
    
    private CompromissoRepository repository;

    public CompromissoService(CompromissoRepository repository) {
        this.repository = repository;
    }
    
    public void verificar (Compromisso compromisso)
    {
        varificarSeOPacienteEstaLivre(compromisso.getPaciente(), compromisso.getData(), compromisso.getHorarioInicio(), compromisso.getHorarioFim());
        verificarSeOProfissionalEstaLive(compromisso.getProfissional(), compromisso.getData(), compromisso.getHorarioInicio(), compromisso.getHorarioFim());
    }

    private void verificarSeOProfissionalEstaLive (ProfissionalDaSaude profissional, Date data, String horarioInicio, String horarioFim) {
        
        List<Compromisso> compromissos = repository.getCompromissos(profissional, data);
        
        Intervalo intervaloCandidato = new Intervalo(new Horario(horarioInicio), new Horario(horarioFim));
        
        for (Compromisso compromisso : compromissos)
            if (compromisso.getIntervalo().sobrepoemOuEhSobreposto(intervaloCandidato))
                throw new ApplicationException("O profissional " + compromisso.getProfissional().getNome() + " já possui um compromisso agendado neste horário!");
    }

    private void varificarSeOPacienteEstaLivre(Paciente paciente, Date data, String horarioInicio, String horarioFim) {
        
        List<Compromisso> compromissos = repository.getCompromissos(paciente, data);
        
        Intervalo intervaloCandidato = new Intervalo(new Horario(horarioInicio), new Horario(horarioFim));
        
        for (Compromisso compromisso : compromissos)
            if (compromisso.getIntervalo().sobrepoemOuEhSobreposto(intervaloCandidato))
                throw new ApplicationException("O paciente " + compromisso.getPaciente().getNome() + " já possui um compromisso agendado neste horário!");
        
    }
}
