/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

import br.ufms.facom.agendador.infra.annotation.HasAJPATransaction;
import br.ufms.facom.agendador.model.Convenio;

import br.ufms.facom.agendador.repository.ConvenioRepository;

import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author jairo
 */
@Resource
public class ConvenioController {

    private static Logger logger = Logger.getLogger(ConvenioController.class);
    
    private Result result;
    private Validator validator;
    private ConvenioRepository convenioRepository;

    public ConvenioController(Result result, Validator validator, ConvenioRepository convenioRepository) {
        this.result = result;
        this.validator = validator;
        this.convenioRepository = convenioRepository;
    }

    @Get @Path("/convenios/novo")
    public void novo () {
    }

    @HasAJPATransaction @Post @Path("/convenios")
    public void cadastrar(Convenio convenio)
    {
        logger.debug("Cadastrando convenio " + convenio);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(ConvenioController.class).novo();
        result.on(Exception.class).redirectTo(ConvenioController.class).novo();
        
        convenioRepository.add(convenio);
        
        result.redirectTo(ConvenioController.class).convenios();
    }

    @Get @Path("/convenios")
    public void convenios () {
        List<Convenio> convenios = convenioRepository.getAll();
        result.include("convenios", convenios);
    }
    
    @Get @Path("/convenio/{id}")
    public void get (Integer id) {
        result.include("convenio", convenioRepository.get(id));
    }
    
    @Get @Path("/convenio/{id}/edit")
    public void formEdit (Integer id) {
        result.include("convenio", convenioRepository.get(id));
    }
    
    @HasAJPATransaction @Put @Path("/convenio/{convenio.id}")
    public void atualizar (Convenio convenio)
    {
        logger.debug("Atualizando paciente " + convenio);
        
        // Em caso de error volta ao formulário
        validator.onErrorForwardTo(ConvenioController.class).novo();
        result.on(Exception.class).forwardTo(ConvenioController.class).novo();
        
        convenioRepository.update(convenio);
        
        result.redirectTo(ConvenioController.class).convenios();
    }
    
    @HasAJPATransaction @Delete @Path("/convenio/{convenio.id}")
    public void delete (Convenio convenio)
    {
        logger.debug("Deletando paciente #" + convenio.getId());
        
        convenioRepository.remove(convenio);
        
        result.redirectTo(ConvenioController.class).convenios();
    }

}
