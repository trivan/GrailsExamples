
<%@ page import="test.trip.planer2.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<g:if test="${session.user}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		</g:if>

		<div id="list-entry" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			 <g:each in="${entryInstanceList}" status="i" var="entryInstance">
                <g:render template="entry" bean="${entryInstance}" var="entryInstance" />
            </g:each>

			<div class="pagination">
				<g:paginate total="${entryInstanceTotal}"  params="${flash}"/>
			</div>
		</div>
	</body>
</html>
