
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Cadastrar novo convênio</h2>
        <form action="<c:url value="/convenios"/>" id="form-convenio" class="formulario clearfix m-bottom20" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome:</label>
                        <div class="ipt-wrapper">
                            <input name="convenio.nome" class="ipt" type="text"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Telefone:</label>
                        <div class="ipt-wrapper">
                            <input name="convenio.telefone" class="ipt" type="text"/>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Fax:</label>
                        <div class="ipt-wrapper">
                            <input name="convenio.fax" class="ipt" type="text""/>
                        </div>
                    </div>
                    <span class="divisor"></span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Observações:</label>
                        <div class="ipt-wrapper">
                            <textarea rows="6" cols="40" name="convenio.observacao" class="ipt"></textarea>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Cadastrar o convênio
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-convenio");
            
            $form.find("input[name='convenio.telefone']").mask("(99)9999-9999",{placeholder:"0"});
            $form.find("input[name='convenio.fax']").mask("(99)9999-9999",{placeholder:"0"});
            
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

