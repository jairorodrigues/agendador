
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h3 class="titulo-padrao2">Convênios</h3>
        <c:if test="${convenios.size() == 0}">
            <p>
                Não ha convênios cadastrados. &nbsp;&nbsp;
                <button type="button">
                    <a href="<c:url value="/convenios/novo"/>">
                        + Cadastrar novo convenio
                    </a>
                </button>
            </p>
        </c:if>
        <c:if test="${convenios.size() > 0}">
            <table class="tabela-padrao" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td style="width:25px;">ID</td>
                        <td>Nome</td>
                        <td>Telefone</td>
                        <td>Ações</td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="test" value="false"/>
                    <c:forEach var="convenio" items="${convenios}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${convenio.id}</td>
                            <td class="bold">${convenio.nome}</td>
                            <td>${convenio.telefone}</td>
                            <td>
                                <a style="margin-top:5px;" href="<c:url value="/convenio/${convenio.id}"/>" class="bt-editar">editar</a>
                                <form style="display:inline;" action="<c:url value="/convenio/${convenio.id}"/>" method="POST">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <span class="bt-remover">
                                        Remover o convenio ${convenio.nome}?
                                    </span>
                                </form>
                            </td>
                        </tr>
                        <c:set var="test" value="${!test}"/>
                    </c:forEach>
                </tbody>
            </table>
            <div class="botoes-tabela-rodape">
                <form action="<c:url value="/convenios/novo"/>" method="GET">
                    <button id="button-newproject" type="submit">
                        + Cadastrar novo convenio
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
