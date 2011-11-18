
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Cadastrar novo Paciente</h2>
        <form id="form-paciente" class="formulario clearfix m-bottom20" action="<c:url value="/pacientes"/>" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações básicas
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.nome" class="ipt" type="text" value="${paciente.nome}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Rg:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.rg" class="ipt" type="text" value="${paciente.rg}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Cpf:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.cpf" class="ipt" type="text" value="${paciente.cpf}"/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">E-mail:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.email" class="ipt" type="text" value="${paciente.email}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Telefone:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.telefone" class="ipt" type="text" value="${paciente.telefone}">
                        </div>
                    </div>
                </fieldset>
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Convênios
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Selecione os convênios</label>
                        <div class="ipt-wrapper">
                            <c:if test="${convenios.size() > 0}">
                            <c:forEach var="convenio" items="${convenios}">
                                <label>
                                    <input type="checkbox" name="paciente.convenios[].id" value="${convenio.id}"/>
                                    ${convenio.nome}
                                </label>
                            </c:forEach>
                            </c:if>
                            <c:if test="${convenios.size() == 0}">
                                <p class="m-top10">
                                    Não possue convênios cadastrados.
                                    <a href="<c:url value="/convenios/novo"/>" target="_blank">
                                        Cadastrar um convênio
                                    </a>
                                </p>
                            </c:if>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Endereço
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">CEP:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.endereco.cep" class="ipt" type="text" value="${paciente.endereco.cep}"/>
                        </div>
                    </div>
                    <div class="caixa-input  clearfix">
                        <label class="lb grid-3">Logradouro:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.endereco.logradouro" class="ipt" type="text" value="${paciente.endereco.logradouro}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Número:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.endereco.numero" class="ipt" type="text" size="4" value="${paciente.endereco.numero}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Bairro:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.endereco.bairro" class="ipt" type="text" value="${paciente.endereco.bairro}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Complemento:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.endereco.complemento" class="ipt" type="text" value="${paciente.endereco.complemento}"/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Cidade:</label>
                        <div class="ipt-wrapper">
                            <input name="paciente.endereco.cidade" class="ipt" type="text" value="${paciente.endereco.cidade}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Estado:</label>
                        <div class="ipt-wrapper">
                            <select name="paciente.endereco.estado" class="slct">
                                <c:forEach var="estado" items="<%=br.ufms.facom.agendador.model.Estado.values()%>">
                                    <option value="${estado}" ${estado eq paciente.endereco.estado ? 'selected="selected"' : null}>
                                        ${estado.nome}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Cadastrar paciente
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-paciente");
            
            $form.find("input[name='paciente.telefone']").mask("(99)9999-9999",{placeholder:"0"});
            $form.find("input[name='paciente.cpf']").mask("999.999.999-99",{placeholder:"0"});
            // $form.find("input[name='paciente.rg']").mask("99.999.999-9",{placeholder:"0"});
            
            $form.validate({
                rules: {
                    'paciente.nome': "required",
                    'paciente.email': {email:true, required:true},
                    'paciente.telefone': {required:true, telefone:true},
                    'paciente.cpf': {cpf:true},
                    'paciente.rg': {required:true},
                    'paciente.endereco.cep': {required:true},
                    'paciente.endereco.logradouro': {required:true},
                    'paciente.endereco.bairro': {required:true},
                    'paciente.endereco.numero': {required:true, integer:true},
                    'paciente.endereco.cidade': {required:true}
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

