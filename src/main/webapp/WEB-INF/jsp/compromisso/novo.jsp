
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
                    'compromisso.paciente.id': {required:true},
                    'compromisso.tipo.id': {required:true},
                    'compromisso.data': {required:true},
                    'compromisso.horarioInicio': {required:true, horario:true},
                    'compromisso.horarioFim': {required:true, horario:true}
                },
                messages: {
                    'compromisso.paciente.id': {required:"Campo requerido!"},
                    'compromisso.tipo.id': {required:"Campo requerido!"},
                    'compromisso.data': {required:"Campo requerido!"},
                    'compromisso.horarioInicio': {required:"Campo requerido!"},
                    'compromisso.horarioFim': {required:"Campo requerido!"}
                }
            });
            
        </script>




    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

