
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Atualizar cadastro</h2>
        <form action="<c:url value="/convenio/${convenio.id}"/>" id="form-convenio" class="formulario clearfix m-bottom20" method="POST">
            
            <input type="hidden" name="_method" value="PUT"/>
            
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">ID</label>
                        <div class="ipt-wrapper">
                            <strong class="block m-top5">
                                ${convenio.id}
                            </strong>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome:</label>
                        <div class="ipt-wrapper">
                            <input name="convenio.nome" class="ipt" type="text" value="${convenio.nome}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Telefone:</label>
                        <div class="ipt-wrapper">
                            <input name="convenio.telefone" class="ipt" type="text" value="${convenio.telefone}"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Fax:</label>
                        <div class="ipt-wrapper">
                            <input name="convenio.fax" class="ipt" type="text" value="${convenio.fax}"/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Observações:</label>
                        <div class="ipt-wrapper">
                            <textarea rows="6" cols="40" name="convenio.observacao" class="ipt">${convenio.observacao}</textarea>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Atualizar cadastro do convênio
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-convenio");
            
            $form.find("input[name='convenio.telefone']").mask("(99)9999-9999",{placeholder:"0"});
            
            $form.validate({
                rules: {
                    'convenio.nome': {required:true},
                    'convenio.telefone': {required:true}
                },
                messages: {
                    'convenio.nome': {required: "Campo requerido"},
                    'convenio.telefone': {required: "Campo requerido"}
                }
            });
            
        </script>




    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

<agendador:rodape/>
