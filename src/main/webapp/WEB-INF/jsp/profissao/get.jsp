
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Atualizar profissão "${profissao.nome}"</h2>
        <form action="<c:url value="/profissao/${profissao.id}"/>" id="form-profissao" class="formulario clearfix m-bottom20" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações
                    </span>
                    
                    <input name="_method" value="PUT" type="hidden"/>

                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome:</label>
                        <div class="ipt-wrapper">
                            <input name="profissao.nome" value="${profissao.nome}" class="ipt" type="text"/>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Atualizar profissão
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            $("#form-profissao").validate({
                rules: {
                    'profissao.nome': {required:true}
                },
                messages: {
                    'profissao.nome': {required: "Campo requerido!"}
                }
            });
        </script>




    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

<agendador:rodape/>
