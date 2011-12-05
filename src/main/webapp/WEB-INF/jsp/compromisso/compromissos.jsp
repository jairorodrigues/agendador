
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h3 class="titulo-padrao2">Compromissos hoje</h3>
        <c:if test="${compromissosDeHoje.size() == 0}">
            <p>
                Não há compromissos hoje. &nbsp;&nbsp;
                <form action="<c:url value="/compromissos/novo"/>" method="GET">
                    <button type="submit" class="button">
                        + Cadastrar novo compromisso
                    </button>
                </form>
            </p>
        </c:if>
        <c:if test="${compromissosDeHoje.size() > 0}">
            <table class="tabela-padrao" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td style="width:25px;">ID</td>
                        <td>Nome</td>
                        <td>Profissional</td>
                        <td>Horario</td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="test" value="false"/>
                    <c:forEach var="compromisso" items="${compromissosDeHoje}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${compromisso.id}</td>
                            <td class="bold">
                                <form action="<c:url value="/compromisso/${compromisso.id}"/>" method="POST">
                                    ${compromisso.tipo} com ${compromisso.paciente.nome} &nbsp;&nbsp;&nbsp;
                                </form>
                            </td>
                            <td>
                                ${compromisso.profissional.especialidade.profissao.nome}
                                ${compromisso.profissional.nome}
                            </td>
                            <td><b>${compromisso.horarioInicio} às ${compromisso.horarioFim}</b></td>
                        </tr>
                        <c:set var="test" value="${!test}"/>
                    </c:forEach>
                </tbody>
            </table>
            <!--
            <div class="paginas">
                <a class="pagina">1</a>
                <a class="pagina">2</a>
                <a class="pagina">3</a>
                <a class="pagina">4</a>
                <a class="pagina pagina-ativa">5</a>
                <a class="pagina">6</a>
                <a class="pagina">7</a>
            </div>
            !-->
            <div class="botoes-tabela-rodape">
                <button id="button-newproject" type="button">
                    <a href="<c:url value="/compromissos/novo"/>">
                        + Cadastrar novo compromisso
                    </a>
                </button>
            </div>

            <script type="text/javascript">
                $('.bt-remover').click(function () {
                    if (confirm($(this).html().trim())) {
                        $(this).parent().submit();
                    }
                });
            </script>
        </c:if>
        
        <div class="spacer"></div>
        <div class="divisord"></div>
        <div class="spacer"></div>
            
        <h3 class="titulo-padrao2">Próximos compromissos</h3>
        <c:if test="${proximosCompromissos.size() == 0}">
            <p>
                Não há proximo Compromissos. &nbsp;&nbsp;
                <form action="<c:url value="/compromissos/novo"/>" method="GET">
                    <button type="submit" class="button">
                        + Cadastrar novo compromisso
                    </button>
                </form>
            </p>
        </c:if>
        <c:if test="${proximosCompromissos.size() > 0}">
            <table class="tabela-padrao" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td style="width:25px;">ID</td>
                        <td>Nome</td>
                        <td>Profissional</td>
                        <td>Data</td>
                        <td>Horario</td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="test" value="false"/>
                    <c:forEach var="compromisso" items="${proximosCompromissos}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${compromisso.id}</td>
                            <td class="bold">
                                <form action="<c:url value="/compromisso/${compromisso.id}"/>" method="POST">
                                    ${compromisso.tipo} com ${compromisso.paciente.nome} &nbsp;&nbsp;&nbsp;
                                </form>
                            </td>
                            <td>
                                ${compromisso.profissional.especialidade.profissao.nome}
                                ${compromisso.profissional.nome}
                            </td>
                            <td><fmt:formatDate value="${compromisso.data}" pattern="dd/MM/yyyy"/></td>
                            <td>${compromisso.horarioInicio} às ${compromisso.horarioFim}</td>
                        </tr>
                        <c:set var="test" value="${!test}"/>
                    </c:forEach>
                </tbody>
            </table>
            <!--
            <div class="paginas">
                <a class="pagina">1</a>
                <a class="pagina">2</a>
                <a class="pagina">3</a>
                <a class="pagina">4</a>
                <a class="pagina pagina-ativa">5</a>
                <a class="pagina">6</a>
                <a class="pagina">7</a>
            </div>
            !-->
            <div class="botoes-tabela-rodape">
                <button id="button-newproject" type="button">
                    <a href="<c:url value="/compromissos/novo"/>">
                        + Cadastrar novo compromisso
                    </a>
                </button>
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
