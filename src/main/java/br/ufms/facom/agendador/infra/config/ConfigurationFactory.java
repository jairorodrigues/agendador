/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.infra.config;

import br.com.caelum.vraptor.ioc.*;
import java.io.*;
import java.util.Properties;
import javax.servlet.ServletContext;
import br.ufms.facom.agendador.infra.exception.TecnicalException;


/**
 *
 * @author jairorrf
 */
@Component
public class ConfigurationFactory implements ComponentFactory<AppConfigProperties>
{
    private AppConfigProperties properties;

    public ConfigurationFactory (ServletContext context)
    {  
        File file = new File(context.getRealPath("/WEB-INF/classes/META-INF") + "/appconfig.properties");      
        FileInputStream fis = null;
        
        properties = new AppConfigProperties();
        
        try
        {  
            fis = new FileInputStream(file); 
            properties.load(fis);    
            fis.close();  
        }  
        catch (IOException ex)
        {
            throw new TecnicalException("Problemas na leitura do arquivo de configuração(appconfig.properties)", ex);
        }  
    }

    @Override
    public AppConfigProperties getInstance() {
        return properties;
    }

}