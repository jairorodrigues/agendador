/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author jairo
 */
@Embeddable
public class Endereco implements Serializable
{
    private String logradouro;
    private String bairro;
    private String complemento;
    private Integer numero;
    private String cep;
    private String cidade;
    private Estado estado;

    
    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    @Override
    public String toString()
    {
        String addr = logradouro + ", " + numero;
        
        if (complemento != null && !complemento.isEmpty())
            addr += " - " + complemento;
        
        addr += " - " + bairro;
        addr += " / " + cidade;
        addr += ", " + estado.getUf();
        
        return addr;
    }
    
    
}
