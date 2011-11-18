
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h3 class="titulo-padrao2">Tipos de compromisso</h3>
        <c:if test="${tiposDeCompromisso.size() == 0}">
            <p>
                Não ha tipos de compromisso cadastrados. &nbsp;&nbsp;
                <button type="button">
                    <a href="<c:url value="/tipos-de-compromisso/novo"/>">
                        + Cadastrar novo tipo
                    </a>
                </button>
            </p>
        </c:if>
        <c:if test="${tiposDeCompromisso.size() > 0}">
            <table class="tabela-padrao" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td style="width:25px;">ID</td>
                        <td>Nome</td>
                        <td>Ações</td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="test" value="false"/>
                    <c:forEach var="tipo" items="${tiposDeCompromisso}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${tipo.id}</td>
                            <td class="bold">${tipo.nome}</td>
                            <td>
                                <!-- <a style="margin-top:5px;" href="<c:url value="/tipos-de-compromisso/${tipo.id}"/>" class="bt-editar">editar</a>
                                 !-->
                                <form style="display:inline;" action="<c:url value="/tipo-de-compromisso/${tipo.id}"/>" method="POST">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <span class="bt-remover">
                                        Remover o tipo ${tipo.nome}?
                                    </span>
                                </form>
                            </td>
                        </tr>
                        <c:set var="test" value="${!test}"/>
                    </c:forEach>
                </tbody>
            </table>
            <div class="botoes-tabela-rodape">
                <form action="<c:url value="/tipos-de-compromisso/novo"/>" method="GET">
                    <button id="button-newproject" type="submit">
                        + Cadastrar novo tipo
                    </button>
                </form>
            </div>

            <script type="text/javascript">
                $('.bt-remover').click(function () {
                    if (confirm($(this).html().trim())) {
                        $(this).parent().submit();
                    }
                });
            </script>
        </c:if>


    </div><!-- fim corpo !-->
</div><!-- fim corpo !-->
