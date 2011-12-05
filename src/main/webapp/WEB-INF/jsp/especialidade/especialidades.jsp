
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h3 class="titulo-padrao2">Especialidades cadastradas</h3>
        <c:if test="${especialidades.size() == 0}">
            <p>
                Não ha especialidades cadastrados. &nbsp;&nbsp;
                <form action="<c:url value="/especialidade/novo"/>" method="GET">
                    <button id="button-newproject" type="submit">
                        + Cadastrar nova especialidade
                    </button>
                </form>
            </p>
        </c:if>
        <c:if test="${especialidades.size() > 0}">
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
                    <c:forEach var="especialidade" items="${especialidades}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${especialidade.id}</td>
                            <td>${especialidade.profissao.nome} <b>${especialidade.nome}</b></td>
                            <td>
                                <a style="margin-top:5px;" href="<c:url value="/especialidade/${especialidade.id}"/>" class="bt-editar">editar</a>
                                <form style="display:inline;" action="<c:url value="/especialidade/${especialidade.id}"/>" method="POST">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <span class="bt-remover">
                                        Remover a especialidade ${especialidade.nome}?
                                    </span>
                                </form>
                            </td>
                        </tr>
                        <c:set var="test" value="${!test}"/>
                    </c:forEach>
                </tbody>
            </table>
            <div class="botoes-tabela-rodape">
                <form action="<c:url value="/especialidade/novo"/>" method="GET">
                    <button id="button-newproject" type="submit">
                        + Cadastrar nova especialidade
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
