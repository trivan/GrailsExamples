<%@ page import="test.trip.planer2.Airport" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'airport.label', default: 'Airport')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-airport" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-airport" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${airportInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${airportInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form action="save" method="post" >
			  <div class="dialog">
			    <table>
			      <tbody>                                         
			        <tr class="prop">
			          <td valign="top" class="name"><label for="iata">Iata:</label></td>
			          <td valign="top" 
			              class="value ${hasErrors(bean:airport,field:'iata','errors')}">
			              <input type="text" 
			                     maxlength="3" 
			                     id="iata" 
			                     name="iata" 
			                     value="${fieldValue(bean:airport,field:'iata')}"/>
			          </td>
			        </tr> 
			        <tr class="prop">
			          <td valign="top" class="name"><label for="city">City:</label></td>
			          <td valign="top" 
			              class="value ${hasErrors(bean:airport,field:'city','errors')}">
			              <input type="text" 
			                     id="city" 
			                     name="city" 
			                     value="${fieldValue(bean:airport,field:'city')}"/>
			          </td>
			        </tr>                                                 
			      </tbody>
			    </table>
			  </div>
			  <div class="buttons">
			    <span class="button"><input class="save" type="submit" value="Create" /></span>
			  </div>
			</g:form>

		</div>
	</body>
</html>
