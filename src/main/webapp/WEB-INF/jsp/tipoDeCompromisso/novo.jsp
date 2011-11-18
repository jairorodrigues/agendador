
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Cadastrar novo tipo de compromisso</h2>
        <form action="<c:url value="/tipos-de-compromisso"/>" id="form-form-tipo-de-compromisso" class="formulario clearfix m-bottom20" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome do tipo:</label>
                        <div class="ipt-wrapper">
                            <input name="tipoDeCompromisso.nome" class="ipt" type="text"/>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Cadastrar o tipo
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-tipo-de-compromisso");
            
            $form.validate({
                rules: {
                    'tipoDeCompromisso.nome': {required:true}
                },
                messages: {
                    'tipoDeCompromisso.nome': {required: "Campo requerido"}
                }
            });
            
        </script>

    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

