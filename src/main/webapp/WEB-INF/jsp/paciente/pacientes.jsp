
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h3 class="titulo-padrao2">Pacientes</h3>
        <c:if test="${pacientes.size() == 0}">
            <p>
                Não ha pacientes cadastrado. &nbsp;&nbsp;
                <button type="button">
                    <a href="<c:url value="/pacientes/novo"/>">
                        + Cadastrar novo paciente
                    </a>
                </button>
            </p>
        </c:if>
        <c:if test="${pacientes.size() > 0}">
            <table class="tabela-padrao" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td style="width:25px;">ID</td>
                        <td>Nome</td>
                        <td>Cpf</td>
                        <td>Telefone</td>
                        <td>E-mail</td>
                        <td>Ação</td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="test" value="false"/>
                    <c:forEach var="paciente" items="${pacientes}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${paciente.id}</td>
                            <td class="bold">${paciente.nome}</td>
                            <td>${paciente.cpf}</td>
                            <td>${paciente.telefone}</td>
                            <td>${paciente.email}</td>
                            <td>
                                <a style="margin-top:5px;" href="<c:url value="/paciente/${paciente.id}"/>" class="bt-editar">editar</a>
                                <form style="display:inline;" action="<c:url value="/paciente/${paciente.id}"/>" method="POST">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <span class="bt-remover">
                                        Remover o paciente ${paciente.nome}?
                                    </span>
                                </form>
                            </td>
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
                    <a href="<c:url value="/pacientes/novo"/>">
                        + Cadastrar novo paciente
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
