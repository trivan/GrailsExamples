<%@ page import="test.trip.planer2.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="user.role.label" default="Role" />
		
	</label>
	<g:select name="role" from="${userInstance.constraints.role.inList}" value="${userInstance?.role}" valueMessagePrefix="user.role" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'entries', 'error')} ">
	<label for="entries">
		<g:message code="user.entries.label" default="Entries" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.entries?}" var="e">
    <li><g:link controller="entry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="entry" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'entry.label', default: 'Entry')])}</g:link>
</li>
</ul>

</div>

