/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;

import br.ufms.facom.agendador.model.Especialidade;

import br.ufms.facom.agendador.repository.EspecialidadeRepository;
import br.ufms.facom.agendador.repository.ProfissaoRepository;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class EspecialidadeController {

    private static Logger logger = Logger.getLogger(EspecialidadeController.class);
    
    private Result result;
    private Validator validator;
    private EspecialidadeRepository especialidadeRepository;
    private ProfissaoRepository profissaoRepository;

    public EspecialidadeController(Result result, Validator validator, EspecialidadeRepository especialidadeRepository, ProfissaoRepository profissaoRepository) {
        this.result = result;
        this.validator = validator;
        this.especialidadeRepository = especialidadeRepository;
        this.profissaoRepository = profissaoRepository;
    } 

    @Get @Path("/especialidade/novo")
    public void novo () {
        result.include("profissoes", profissaoRepository.getAll());
    }

    @HasAJPATransaction @Post @Path("/especialidades")
    public void cadastrar(Especialidade especialidade)
    {
        logger.debug("Cadastrando Especialidade " + especialidade);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(EspecialidadeController.class).novo();
        result.on(Exception.class).redirectTo(EspecialidadeController.class).novo();
        
        especialidadeRepository.add(especialidade);
        
        result.redirectTo(EspecialidadeController.class).especialidades();
    }

    @Get @Path("/especialidades")
    public void especialidades () {
        List<Especialidade> especialidades = especialidadeRepository.getAll();
        result.include("especialidades", especialidades);
    }
    
    @Get @Path("/especialidade/{id}")
    public void get (Integer id) {
        result.include("profissoes", profissaoRepository.getAll());
        result.include("especialidade", especialidadeRepository.get(id));
    }
    
    @HasAJPATransaction @Put @Path("/especialidade/{especialidade.id}")
    public void atualizar (Especialidade especialidade)
    {
        logger.debug("Atualizando especialidade " + especialidade);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(EspecialidadeController.class).novo();
        result.on(Exception.class).forwardTo(EspecialidadeController.class).novo();
        
        especialidadeRepository.update(especialidade);
        
        result.redirectTo(EspecialidadeController.class).especialidades();
    }
    
    @HasAJPATransaction @Delete @Path("/especialidade/{especialidade.id}")
    public void delete (Especialidade especialidade)
    {
        logger.debug("Deletando especialidade #" + especialidade.getId());
        
        especialidadeRepository.remove(especialidade);
        
        result.redirectTo(EspecialidadeController.class).especialidades();
    }

}
