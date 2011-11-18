/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;

import br.ufms.facom.agendador.model.TipoDeCompromisso;

import br.ufms.facom.agendador.repository.TipoDeCompromissoRepository;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class TipoDeCompromissoController {

    private static Logger logger = Logger.getLogger(TipoDeCompromissoController.class);
    
    private Result result;
    private Validator validator;
    private TipoDeCompromissoRepository tipoDeCompromissoRepository;

    public TipoDeCompromissoController(Result result, Validator validator, TipoDeCompromissoRepository tipoDeCompromissoRepository) {
        this.result = result;
        this.validator = validator;
        this.tipoDeCompromissoRepository = tipoDeCompromissoRepository;
    }

    @Get @Path("/tipos-de-compromisso/novo")
    public void novo () {
    }

    @HasAJPATransaction @Post @Path("/tipos-de-compromisso")
    public void cadastrar(TipoDeCompromisso tipoDeCompromisso)
    {
        logger.debug("Cadastrando TipoDeCompromisso " + tipoDeCompromisso);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(TipoDeCompromissoController.class).novo();
        result.on(Exception.class).forwardTo(TipoDeCompromissoController.class).novo();
        
        tipoDeCompromissoRepository.add(tipoDeCompromisso);
        
        result.redirectTo(TipoDeCompromissoController.class).tiposDeCompromisso();
    }

    @Get @Path("/tipos-de-compromisso")
    public void tiposDeCompromisso () {
        List<TipoDeCompromisso> tiposDeCompromisso = tipoDeCompromissoRepository.getAll();
        result.include("tiposDeCompromisso", tiposDeCompromisso);
    }
    
    @HasAJPATransaction @Delete @Path("/tipo-de-compromisso/{tipoDeCompromisso.id}")
    public void remover(TipoDeCompromisso tipoDeCompromisso) {
        tipoDeCompromissoRepository.remove(tipoDeCompromisso);
        result.redirectTo(TipoDeCompromissoController.class).tiposDeCompromisso();
    }
}
