<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>grey-ui</title>

        <link rel="stylesheet" href="<c:url value="/css/main.css"/>" />
        <link rel="stylesheet" href="<c:url value="/css/start/jquery-ui-1.8.16.custom.css"/>" />
        
        <script type="text/javascript" src="<c:url value="/javascript/jquery.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/javascript/jquery-ui-1.8.16.custom.min.js"/>"></script>
        
        <script type="text/javascript">
        $(document).ready(function () {
            
            $('input.ipt-data').datepicker({dateFormat: 'dd/mm/yy',  
              changeMonth: true,  
              changeYear: true    
            });
            
        });
        </script>
        
    </head>
    <body>
    
    <div id="cabecalho">
    	<div class="container-21 clearfix">
            <div class="grid-21 clearfix">
            	<h1 class="titulo-pagina">agendador</h1>
                <div class="menu-principal">
                    <a class="item" href="<c:url value="/"/>">Página inicial</a>
                    <a class="item" href="<c:url value="/compromissos"/>">Agenda</a>
                    <a class="item" href="<c:url value="/pacientes"/>">Pacientes</a>                    
                    <a class="item" href="<c:url value="/convenios"/>">Convenios</a>
                    <a class="item" href="<c:url value="/profissionais-da-saude"/>">Profissionais</a>
                    <a class="item" href="<c:url value="/profissoes"/>">Profissões</a>
                    <a class="item" href="<c:url value="/especialidades"/>">Especialidades</a>
                </div>
                <div class="caixa-usuario">
                    <a href="<c:url value="/minhas-informacoes"/>">Minhas informações</a> | <a href="<c:url value="/logout"/>">sair</a>
                </div>
            </div>
        </div>
    </div>