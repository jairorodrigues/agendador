/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;
import br.ufms.facom.agendador.model.Paciente;

import br.ufms.facom.agendador.repository.PacienteRepository;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class PacienteController {

    private static Logger logger = Logger.getLogger(PacienteController.class);
    
    private Result result;
    private Validator validator;
    private PacienteRepository pacienteRepository;

    public PacienteController(Result result, Validator validator, PacienteRepository pacienteRepository) {
        this.result = result;
        this.validator = validator;
        this.pacienteRepository = pacienteRepository;
    }

    @Get @Path("/pacientes/novo")
    public void novo () {
        result.include("convenios", pacienteRepository.getConvenios());
        result.include("paciente", new Paciente());
    }

    @HasAJPATransaction @Post @Path("/pacientes")
    public void cadastrar(Paciente paciente)
    {
        logger.debug("Cadastrando paciente " + paciente);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(PacienteController.class).novo();
        result.on(Exception.class).forwardTo(PacienteController.class).novo();
        
        pacienteRepository.add(paciente);
        
        result.redirectTo(PacienteController.class).pacientes();
    }

    @Get @Path("/pacientes")
    public void pacientes () {
        List<Paciente> pacientes = pacienteRepository.getAll();
        result.include("pacientes", pacientes);
    }
    
    @Get @Path("/paciente/{id}")
    public void get (Integer id) {
        result.include("convenios", pacienteRepository.getConvenios());
        result.include("paciente", pacienteRepository.get(id));
    }
    
    @HasAJPATransaction @Put @Path("/paciente/{paciente.id}")
    public void atualizar (Paciente paciente)
    {
        logger.debug("Atualizando paciente " + paciente);
        
        // Em caso de error volta ao formulár
        validator.onErrorForwardTo(PacienteController.class).novo();
        result.on(Exception.class).forwardTo(PacienteController.class).novo();
        
        pacienteRepository.update(paciente);
        
        result.redirectTo(PacienteController.class).pacientes();
    }
    
    @HasAJPATransaction @Delete @Path("/paciente/{paciente.id}")
    public void delete (Paciente paciente)
    {
        logger.debug("Deletando paciente #" + paciente.getId());
        
        pacienteRepository.remove(paciente);
        result.redirectTo(PacienteController.class).pacientes();
    }

}
