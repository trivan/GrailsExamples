
<%@ page import="test.trip.planer2.Airline" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'airline.label', default: 'Airline')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-airline" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-airline" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list airline">
			
				<g:if test="${airlineInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="airline.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${airlineInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airlineInstance?.iata}">
				<li class="fieldcontain">
					<span id="iata-label" class="property-label"><g:message code="airline.iata.label" default="Iata" /></span>
					
						<span class="property-value" aria-labelledby="iata-label"><g:fieldValue bean="${airlineInstance}" field="iata"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airlineInstance?.frequentFlier}">
				<li class="fieldcontain">
					<span id="frequentFlier-label" class="property-label"><g:message code="airline.frequentFlier.label" default="Frequent Flier" /></span>
					
						<span class="property-value" aria-labelledby="frequentFlier-label"><g:fieldValue bean="${airlineInstance}" field="frequentFlier"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${airlineInstance?.flights}">
				<li class="fieldcontain">
					<span id="flights-label" class="property-label"><g:message code="airline.flights.label" default="Flights" /></span>
					
						<g:each in="${airlineInstance.flights}" var="f">
						<span class="property-value" aria-labelledby="flights-label"><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${airlineInstance?.id}" />
					<g:link class="edit" action="edit" id="${airlineInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
