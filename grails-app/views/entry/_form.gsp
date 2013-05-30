<%@ page import="test.trip.planer2.Entry" %>



<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="entry.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${entryInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'summary', 'error')} ">
	<label for="summary">
		<g:message code="entry.summary.label" default="Summary" />
		
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="1000" value="${entryInstance?.summary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="entry.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${test.trip.planer2.User.list()}" optionKey="id" required="" value="${entryInstance?.author?.id}" class="many-to-one"/>
</div>

