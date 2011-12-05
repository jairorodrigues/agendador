/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;

import br.ufms.facom.agendador.model.Profissao;

import br.ufms.facom.agendador.repository.ProfissaoRepository;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class ProfissaoController {

    private static Logger logger = Logger.getLogger(ProfissaoController.class);
    
    private Result result;
    private Validator validator;
    private ProfissaoRepository profissaoRepository;

    public ProfissaoController(Result result, Validator validator, ProfissaoRepository profissaoRepository) {
        this.result = result;
        this.validator = validator;
        this.profissaoRepository = profissaoRepository;
    }

    @Get @Path("/profissao/novo")
    public void novo () {
    }

    @HasAJPATransaction @Post @Path("/profissoes")
    public void cadastrar(Profissao profissao)
    {
        logger.debug("Cadastrando Profissao " + profissao);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(ProfissaoController.class).novo();
        result.on(Exception.class).redirectTo(ProfissaoController.class).novo();
        
        profissaoRepository.add(profissao);
        
        result.redirectTo(ProfissaoController.class).profissoes();
    }

    @Get @Path("/profissoes")
    public void profissoes () {
        List<Profissao> profissoes = profissaoRepository.getAll();
        result.include("profissoes", profissoes);
    }
    
    @Get @Path("/profissao/{id}")
    public void get (Integer id) {
        result.include("profissao", profissaoRepository.get(id));
    }
    
    @Get @Path("/profissao/{id}/edit")
    public void formEdit (Integer id) {
        result.include("profissao", profissaoRepository.get(id));
    }
    
    @HasAJPATransaction @Put @Path("/profissao/{profissao.id}")
    public void atualizar (Profissao profissao)
    {
        logger.debug("Atualizando profissao " + profissao);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(ProfissaoController.class).novo();
        result.on(Exception.class).forwardTo(ProfissaoController.class).novo();
        
        profissaoRepository.update(profissao);
        
        result.redirectTo(ProfissaoController.class).profissoes();
    }
    
    @HasAJPATransaction @Delete @Path("/profissao/{profissao.id}")
    public void delete (Profissao profissao)
    {
        logger.debug("Deletando profissao #" + profissao.getId());
        
        profissaoRepository.remove(profissao);
        
        result.redirectTo(ProfissaoController.class).profissoes();
    }

}
