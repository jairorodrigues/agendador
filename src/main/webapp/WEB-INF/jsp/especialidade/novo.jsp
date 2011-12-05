
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h2 class="titulo-formulario">Cadastrar nova especialidade</h2>
        <form action="<c:url value="/especialidades"/>" id="form-especialidade" class="formulario clearfix m-bottom20" method="POST">
            <div class="caixa-formulario clearfix">
                <fieldset class="fieldset-padrao">
                    <span class="legend-wrapper">
                        Informações
                    </span>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Profissão:</label>
                        <div class="ipt-wrapper">
                            <select name="especialidade.profissao.id" class="slct">
                                <c:forEach var="profissao" items="${profissoes}">
                                    <option value="${profissao.id}">
                                        ${profissao.nome}
                                    </option>
                                </c:forEach>
                            </select>
                            <p class="m-top10">
                              <a href="<c:url value="/profissoes/novo"/>" target="_blank">
                                Cadastrar uma nova profissão
                              </a>
                            </p>
                        </div>
                    </div>
                    <div class="caixa-input clearfix">
                        <label class="lb grid-3">Nome:</label>
                        <div class="ipt-wrapper">
                            <input name="especialidade.nome" class="ipt" type="text"/>
                        </div>
                    </div>
                </fieldset>
                <div class="caixa-buttons clearfix">
                    <button type="submit" class="button" style="margin-left:155px;">
                        Cadastrar a especialidade
                    </button>
                </div>
            </div>
        </form>

        <script type="text/javascript">
            
            $form = $("#form-especialidade");
    
            $form.validate({
                rules: {
                    'especialidade.nome': {required:true}
                },
                messages: {
                    'especialidade.nome': {required: "Campo requerido!"}
                }
            });
            
        </script>

    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->

