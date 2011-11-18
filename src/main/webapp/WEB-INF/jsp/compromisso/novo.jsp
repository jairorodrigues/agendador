
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">
        
        <agendador:message/>

        <h2 class="titulo-formulario">Cadastrar novo Compromisso</h2>
        <form id="form-paciente" class="formulario clearfix m-bottom20" action="<c:url value="/compromissos"/>" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações básicas
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Tipo do compromisso:</label>
                        <div class="ipt-wrapper">
                            <select name="compromisso.tipo.id" class="slct">
                                <c:forEach var="tipo" items="${tiposDeCompromisso}">
                                    <option value="${tipo.id}">
                                        ${tipo.nome}
                                    </option>
                                </c:forEach>
                            </select>
                            <p class="m-top10">
                              <a href="<c:url value="/tipos-de-compromisso/novo"/>" target="_blank">
                              Cadastrar um novo tipo de compromisso
                              </a>
                            </p>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Paciênte</label>
                        <div class="ipt-wrapper">
                            <select name="compromisso.paciente.id" class="slct">
                                <c:forEach var="paciente" items="${pacientes}">
                                    <option value="${paciente.id}">
                                        ${paciente.nome}
                                    </option>
                                </c:forEach>
                            </select>
                            <p class="m-top10">
                              <a href="<c:url value="/pacientes/novo"/>" target="_blank">
                                Cadastrar um novo paciênte
                              </a>
                            </p>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Data:</label>
                        <div class="ipt-wrapper">
                            <input name="compromisso.data" class="ipt ipt-data" type="text" size="10"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Início</label>
                        <div class="ipt-wrapper">
                            <input name="compromisso.horarioInicio" class="ipt" type="text" size="10"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Fim</label>
                        <div class="ipt-wrapper">
                            <input name="compromisso.horarioFim" class="ipt" type="text" size="10"/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Observações:</label>
                        <div class="ipt-wrapper">
                            <textarea rows="6" cols="40" name="compromisso.observacao" class="ipt"></textarea>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Cadastrar compromisso
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-paciente");
            
            $form.find("input[name='compromisso.horarioInicio']").mask("99:99",{placeholder:"0"});
            $form.find("input[name='compromisso.horarioFim']").mask("99:99",{placeholder:"0"});
            
            $form.validate({
                rules: {
                    'paciente.nome': "required",
                    'paciente.email': {email:true, required:true},
                    'paciente.telefone': {required:true, telefone:true},
                    'paciente.cpf': {cpf:true},
                    'paciente.rg': {required:true}
                },
                messages: {
                    'paciente.nome': "Campo requerido!",
                    'paciente.rg': {required:"Campo requerido!"},
                    'paciente.email': {email:"E-mail inválido", required:"Campo requerido!"},
                    'paciente.telefone': {required:"Campo requerido!"},
                    'paciente.endereco.cep': {required:"Campo requerido!"},
                    'paciente.endereco.logradouro': {required:"Campo requerido!"},
                    'paciente.endereco.bairro': {required:"Campo requerido!"},
                    'paciente.endereco.numero': {required:"Campo requerido!", integer:"Número inválido!"},
                    'paciente.endereco.cidade': {required:"Campo requerido!"}
                }
            });
            
        </script>




    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

