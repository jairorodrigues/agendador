
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${errors.size() > 0}">
        <div class="mensagem msg-erro">
            <string class="titulo">Campos inválidos</string>
            <c:forEach var="error" items="${errors}">
                * ${error.message} <br/>
            </c:forEach>
        </div>
    </c:when>
    <c:when test="${requestScope['javax.servlet.error.exception'] != null}">
        <script type="text/javascript">
            $.notifyBar({
                html: "${requestScope['javax.servlet.error.message']},
                cls: "ntfy-erro",
                delay: 3000,
                animationSpeed: "fast"
            });
        </script>
    </c:when>
</c:choose>