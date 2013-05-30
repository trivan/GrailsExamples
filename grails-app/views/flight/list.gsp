
<%@ page import="test.trip.planer2.Flight" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flight.label', default: 'Flight')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flight" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-flight" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="flightNumber" title="${message(code: 'flight.flightNumber.label', default: 'Flight Number')}" />
					
						<th><g:message code="flight.airline.label" default="Airline" /></th>
					
						<g:sortableColumn property="departureDate" title="${message(code: 'flight.departureDate.label', default: 'Departure Date')}" />
					
						<th><g:message code="flight.departureAirport.label" default="Departure Airport" /></th>
					
						<g:sortableColumn property="arrivalDate" title="${message(code: 'flight.arrivalDate.label', default: 'Arrival Date')}" />
					
						<th><g:message code="flight.arrivalAirport.label" default="Arrival Airport" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flightInstanceList}" status="i" var="flightInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flightInstance.id}">${fieldValue(bean: flightInstance, field: "flightNumber")}</g:link></td>
					
						<td>${fieldValue(bean: flightInstance, field: "airline")}</td>
					
						<td><g:formatDate date="${flightInstance.departureDate}" /></td>
					
						<td>${fieldValue(bean: flightInstance, field: "departureAirport")}</td>
					
						<td><g:formatDate date="${flightInstance.arrivalDate}" /></td>
					
						<td>${fieldValue(bean: flightInstance, field: "arrivalAirport")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flightInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
