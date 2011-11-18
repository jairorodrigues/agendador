/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufms.facom.agendador.model;

/**
 *
 * @author jairo
 */
public enum Estado
{
    AC("Acre", "AC"), // Acre
    AL("Alagoas", "AL"), // Alagoas
    AP("Amapá", "AP"), // Amapá
    AM("Amazonas", "AM"), // Amazonas
    BA("Bahia", "BA"), // Bahia
    CE("Ceará", "CE"), // Ceará
    DF("Distrito Federal", "DF"), // Distrito Federal
    ES("Espírito Santo", "ES"), // Espírito Santo
    GO("Goiás", "GO"), // Goiás
    MA("Maranhão", "MA"), // Maranhão
    MT("Mato Grosso", "MT"), // Mato Grosso
    MS("Mato Grosso do Sul", "MS"), // Mato Grosso do Sul
    MG("Minas Gerais", "MG"), // Minas Gerais
    PA("Pará", "PA"), // Pará
    PB("Paraíba", "PB"), // Paraíba
    PR("Paraná", "PR"), // Paraná
    PE("Pernambuco", "PE"), // Pernambuco
    PI("Piauí", "PI"), // Piauí
    RR("Roraima", "RR"), // Roraima
    RO("Rondônia", "RO"), // Rondônia
    RJ("Rio de Janeiro", "RJ"), // Rio de Janeiro
    RN("Rio Grande do Norte", "RN"), // Rio Grande do Norte
    RS("Rio Grande do Sul", "RS"), // Rio Grande do Sul
    SC("SC", "SC"), // Santa Catarina
    SP("São Paulo", "SP"), // São Paulo
    SE("Sergipe", "SE"), // Sergipe
    TO("Tocantins", "TO"); // Tocantins
    private String nome;
    private String uf;

    private Estado(String nome, String uf) {
        this.nome = nome;
        this.uf = uf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }
}
