/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;
import br.ufms.facom.agendador.model.ProfissionalDaSaude;

import br.ufms.facom.agendador.repository.EspecialidadeRepository;
import br.ufms.facom.agendador.repository.ProfissionalDaSaudeRepository;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class ProfissionalDaSaudeController {

    private static Logger logger = Logger.getLogger(ProfissionalDaSaudeController.class);
    
    private Result result;
    private Validator validator;
    private ProfissionalDaSaudeRepository profissionalDaSaudeRepository;
    private EspecialidadeRepository especialidadeRepository;

    public ProfissionalDaSaudeController(Result result, Validator validator, ProfissionalDaSaudeRepository profissionalDaSaudeRepository, EspecialidadeRepository especialidadeRepository) {
        this.result = result;
        this.validator = validator;
        this.profissionalDaSaudeRepository = profissionalDaSaudeRepository;
        this.especialidadeRepository = especialidadeRepository;
    }

    @Get @Path("/profissional-da-saude/novo")
    public void novo () {
        result.include("especialidades", especialidadeRepository.getAll());
        result.include("profissionalDaSaude", new ProfissionalDaSaude());
    }

    @HasAJPATransaction @Post @Path("/profissionais-da-saude")
    public void cadastrar(ProfissionalDaSaude profissionalDaSaude)
    {
        logger.debug("Cadastrando profissionalDaSaude " + profissionalDaSaude);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(ProfissionalDaSaudeController.class).novo();
        result.on(Exception.class).redirectTo(ProfissionalDaSaudeController.class).novo();
        
        profissionalDaSaudeRepository.add(profissionalDaSaude);
        
        result.redirectTo(ProfissionalDaSaudeController.class).profissionais();
    }

    @Get @Path("/profissionais-da-saude")
    public void profissionais () {
        List<ProfissionalDaSaude> profissionaisDaSaude = profissionalDaSaudeRepository.getAll();
        result.include("profissionaisDaSaude", profissionaisDaSaude);
    }
    
    @Get @Path("/profissional-da-saude/{id}")
    public void get (Integer id) {
        result.include("especialidades", especialidadeRepository.getAll());
        result.include("profissionalDaSaude", profissionalDaSaudeRepository.get(id));
    }
    
    @HasAJPATransaction @Put @Path("/profissional-da-saude/{profissionalDaSaude.id}")
    public void atualizar (ProfissionalDaSaude profissionalDaSaude)
    {
        logger.debug("Atualizando profissionalDaSaude " + profissionalDaSaude);
        
        // Em caso de error volta ao formulár
        validator.onErrorForwardTo(ProfissionalDaSaudeController.class).novo();
        result.on(Exception.class).forwardTo(ProfissionalDaSaudeController.class).novo();
        
        profissionalDaSaudeRepository.update(profissionalDaSaude);
        
        result.redirectTo(ProfissionalDaSaudeController.class).profissionais();
    }
    
    @HasAJPATransaction @Delete @Path("/profissional-da-saude/{profissionalDaSaude.id}")
    public void delete (ProfissionalDaSaude profissionalDaSaude)
    {
        logger.debug("Deletando profissionalDaSaude #" + profissionalDaSaude.getId());
        
        profissionalDaSaudeRepository.remove(profissionalDaSaude);
        result.redirectTo(ProfissionalDaSaudeController.class).profissionais();
    }

}
