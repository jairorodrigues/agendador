/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.exception.ApplicationException;
import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;
import br.ufms.facom.agendador.model.Compromisso;
import br.ufms.facom.agendador.model.service.CompromissoService;
import br.ufms.facom.agendador.repository.CompromissoRepository;
import br.ufms.facom.agendador.repository.PacienteRepository;
import br.ufms.facom.agendador.repository.ProfissionalDaSaudeRepository;
import br.ufms.facom.agendador.repository.TipoDeCompromissoRepository;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class CompromissoController {

    private static Logger logger = Logger.getLogger(CompromissoController.class);
    
    private Result result;
    private Validator validator;
    private CompromissoRepository compromissoRepository;
    private PacienteRepository pacienteRepository;
    private TipoDeCompromissoRepository tipoDeCompromissoRepository;
    private ProfissionalDaSaudeRepository profissionalDaSaudeRepository;
    private CompromissoService compromissoService;

    public CompromissoController(Result result, Validator validator, CompromissoRepository compromissoRepository, PacienteRepository pacienteRepository, TipoDeCompromissoRepository tipoDeCompromissoRepository, ProfissionalDaSaudeRepository profissionalDaSaudeRepository, CompromissoService compromissoService) {
        this.result = result;
        this.validator = validator;
        this.compromissoRepository = compromissoRepository;
        this.pacienteRepository = pacienteRepository;
        this.tipoDeCompromissoRepository = tipoDeCompromissoRepository;
        this.profissionalDaSaudeRepository = profissionalDaSaudeRepository;
        this.compromissoService = compromissoService;
    }

    @Get @Path("/compromissos")
    public void compromissos () {
        result.include("compromissosDeHoje", compromissoRepository.getCompromissosDeHoje())
              .include("proximosCompromissos", compromissoRepository.getProximos());
    }
    
    @Get @Path("/compromissos/novo")
    public void novo () {
        result.include("tiposDeCompromisso", tipoDeCompromissoRepository.getAll());
        result.include("profissionais", profissionalDaSaudeRepository.getAll());
        result.include("pacientes", pacienteRepository.getAll());
    }
    
    @HasAJPATransaction @Post @Path("/compromissos")
    public void cadastrar (Compromisso compromisso) {
        
        logger.debug("Cadastrando Compromisso " + compromisso);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(CompromissoController.class).novo();
        result.on(ApplicationException.class).forwardTo(CompromissoController.class).novo();
        result.on(Exception.class).forwardTo(CompromissoController.class).novo();

        compromissoService.verificar(compromisso);
        compromissoRepository.add(compromisso);
        
        result.redirectTo(CompromissoController.class).compromissos();
    }
    
    @HasAJPATransaction @Delete @Path("/compromisso/{compromisso.id}")
    public void remover (Compromisso compromisso) {
        
        compromissoRepository.remove(compromisso);
        
        result.redirectTo(CompromissoController.class).compromissos();
    }
}
