
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="agendador" tagdir="/WEB-INF/tags" %>

<agendador:cabecalho/>

<div id="corpo" class="container-21 clearfix">
    <div class="grid-21 clearfix">

        <h3 class="titulo-padrao2">Profissionais</h3>
        <c:if test="${profissionaisDaSaude.size() == 0}">
            <p>
                Não há profissionais cadastrador. &nbsp;&nbsp;
                <button type="button">
                    <a href="<c:url value="/profissional-da-saude/novo"/>">
                        + Cadastrar novo profissional
                    </a>
                </button>
            </p>
        </c:if>
        <c:if test="${profissionaisDaSaude.size() > 0}">
            <table class="tabela-padrao" width="100%" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td style="width:25px;">ID</td>
                        <td>Nome</td>
                        <td>Num. Registro</td>
                        <td>Telefone</td>
                        <td>E-mail</td>
                        <td>Ação</td>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="test" value="false"/>
                    <c:forEach var="profissional" items="${profissionaisDaSaude}">
                        <tr${test ? ' class="alterna"' :  ''}>
                            <td>${profissional.id}</td>
                            <td>
                                <b>${profissional.nome}</b> - ${profissional.especialidade.profissao.nome} ${profissional.especialidade.nome}
                            </td>
                            <td>${profissional.registroProfissional}</td>
                            <td>${profissional.telefone}</td>
                            <td>${profissional.email}</td>
                            <td>
                                <a style="margin-top:5px;" href="<c:url value="/profissional-da-saude/${profissional.id}"/>" class="bt-editar">editar</a>
                                <form style="display:inline;" action="<c:url value="/profissional-da-saude/${profissional.id}"/>" method="POST">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <span class="bt-remover">
                                        Remover o paciente ${profissional.nome}?
                                    </span>
                                </form>
                            </td>
                        </tr>
                        <c:set var="test" value="${!test}"/>
                    </c:forEach>
                </tbody>
            </table>
                    
            <div class="botoes-tabela-rodape">
                <button id="button-newproject" type="button">
                    <a href="<c:url value="/profissional-da-saude/novo"/>">
                        + Cadastrar novo profissional
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
