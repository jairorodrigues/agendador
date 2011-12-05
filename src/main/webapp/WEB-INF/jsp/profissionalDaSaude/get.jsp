
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Cadastrar novo Profissional</h2>
        <form id="form-profissionalDaSaude" class="formulario clearfix m-bottom20" action="<c:url value="/profissional-da-saude/${profissionalDaSaude.id}"/>" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações básicas
                    </span>
                    
                    <input type="hidden" name="_method" value="PUT"/>
                    
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.nome" class="ipt" type="text" value="${profissionalDaSaude.nome}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Rg:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.rg" class="ipt" type="text" value="${profissionalDaSaude.rg}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Cpf:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.cpf" class="ipt" type="text" value="${profissionalDaSaude.cpf}"/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">E-mail:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.email" class="ipt" type="text" value="${profissionalDaSaude.email}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Telefone:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.telefone" class="ipt" type="text" value="${profissionalDaSaude.telefone}">
                        </div>
                    </div>
                </fieldset>
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Especialidade
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Selecione a especialidade</label>
                        <div class="ipt-wrapper">
                            <c:if test="${especialidades.size() > 0}">
                                <select class="slct" name="profissionalDaSaude.especialidade.id">
                                <c:forEach var="especialidade" items="${especialidades}">
                                    <option value="${especialidade.id}" ${especialidade.id eq profissionalDaSaude.especialidade.id ? 'selected="selected"' : ''}>
                                        ${especialidade.profissao.nome} ${especialidade.nome}
                                    </option>
                                </c:forEach>
                                </select>
                            </c:if>
                            <c:if test="${especialidades.size() == 0}">
                                <p class="m-top10">
                                    Não possue especialidades cadastradas
                                    <a href="<c:url value="/especialidade/novo"/>" target="_blank">
                                        Cadastrar uma especialidade
                                    </a>
                                </p>
                            </c:if>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Num. do Registro</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.registroProfissional" class="ipt" type="text" value="${profissionalDaSaude.registroProfissional}">
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
                            <input name="profissionalDaSaude.endereco.cep" class="ipt" type="text" value="${profissionalDaSaude.endereco.cep}"/>
                        </div>
                    </div>
                    <div class="caixa-input  clearfix">
                        <label class="lb grid-3">Logradouro:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.endereco.logradouro" class="ipt" type="text" value="${profissionalDaSaude.endereco.logradouro}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Número:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.endereco.numero" class="ipt" type="text" size="4" value="${profissionalDaSaude.endereco.numero}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Bairro:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.endereco.bairro" class="ipt" type="text" value="${profissionalDaSaude.endereco.bairro}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Complemento:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.endereco.complemento" class="ipt" type="text" value="${profissionalDaSaude.endereco.complemento}"/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Cidade:</label>
                        <div class="ipt-wrapper">
                            <input name="profissionalDaSaude.endereco.cidade" class="ipt" type="text" value="${profissionalDaSaude.endereco.cidade}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Estado:</label>
                        <div class="ipt-wrapper">
                            <select name="profissionalDaSaude.endereco.estado" class="slct">
                                <c:forEach var="estado" items="<%=br.ufms.facom.agendador.model.Estado.values()%>">
                                    <option value="${estado}" ${estado eq profissionalDaSaude.endereco.estado ? 'selected="selected"' : null}>
                                        ${estado.nome}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Cadastrar profissional
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-profissionalDaSaude");
            
            $form.find("input[name='profissionalDaSaude.telefone']").mask("(99)9999-9999",{placeholder:"0"});
            $form.find("input[name='profissionalDaSaude.cpf']").mask("999.999.999-99",{placeholder:"0"});
            // $form.find("input[name='profissionalDaSaude.rg']").mask("99.999.999-9",{placeholder:"0"});
            
            $form.validate({
                rules: {
                    'profissionalDaSaude.nome': "required",
                    'profissionalDaSaude.email': {email:true, required:true},
                    'profissionalDaSaude.telefone': {required:true, telefone:true},
                    'profissionalDaSaude.cpf': {cpf:true},
                    'profissionalDaSaude.rg': {required:true},
                    'profissionalDaSaude.especialidade.id': {required:true},
                    'profissionalDaSaude.registroProfissional': {required:true},
                    'profissionalDaSaude.endereco.cep': {required:true},
                    'profissionalDaSaude.endereco.logradouro': {required:true},
                    'profissionalDaSaude.endereco.bairro': {required:true},
                    'profissionalDaSaude.endereco.numero': {required:true, integer:true},
                    'profissionalDaSaude.endereco.cidade': {required:true}
                },
                messages: {
                    'profissionalDaSaude.nome': "Campo requerido!",
                    'profissionalDaSaude.rg': {required:"Campo requerido!"},
                    'profissionalDaSaude.email': {email:"E-mail inválido", required:"Campo requerido!"},
                    'profissionalDaSaude.telefone': {required:"Campo requerido!"},
                    'profissionalDaSaude.especialidade.id': {required:"Campo requerido!"},
                    'profissionalDaSaude.registroProfissional': {required:"Campo requerido!"},
                    'profissionalDaSaude.endereco.cep': {required:"Campo requerido!"},
                    'profissionalDaSaude.endereco.logradouro': {required:"Campo requerido!"},
                    'profissionalDaSaude.endereco.bairro': {required:"Campo requerido!"},
                    'profissionalDaSaude.endereco.numero': {required:"Campo requerido!", integer:"Número inválido!"},
                    'profissionalDaSaude.endereco.cidade': {required:"Campo requerido!"}
                }
            });
            
        </script>




    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

