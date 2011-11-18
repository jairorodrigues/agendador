/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.controller;

import br.com.caelum.vraptor.*;

/**
 *
 * @author jairo
 */
@Resource
public class IndexController {
    
    private Result result;

    public IndexController(Result result) {
        this.result = result;
    }
    
    @Get @Path("/")
    private void index () {
        result.redirectTo(CompromissoController.class).compromissos();
        return;
    }
    
}
