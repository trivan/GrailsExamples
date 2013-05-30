<%@ page import="test.trip.planer2.Airline" %>



<div class="fieldcontain ${hasErrors(bean: airlineInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="airline.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${airlineInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airlineInstance, field: 'iata', 'error')} ">
	<label for="iata">
		<g:message code="airline.iata.label" default="Iata" />
		
	</label>
	<g:textField name="iata" maxlength="3" value="${airlineInstance?.iata}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airlineInstance, field: 'frequentFlier', 'error')} ">
	<label for="frequentFlier">
		<g:message code="airline.frequentFlier.label" default="Frequent Flier" />
		
	</label>
	<g:textField name="frequentFlier" value="${airlineInstance?.frequentFlier}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: airlineInstance, field: 'flights', 'error')} ">
	<label for="flights">
		<g:message code="airline.flights.label" default="Flights" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${airlineInstance?.flights?}" var="f">
    <li><g:link controller="flight" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="flight" action="create" params="['airline.id': airlineInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'flight.label', default: 'Flight')])}</g:link>
</li>
</ul>

</div>

