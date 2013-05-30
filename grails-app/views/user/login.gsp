<%@ page import="test.trip.planer2.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.login.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-user" class="content scaffold-create" role="main">

			<h1>Login</h1>
			<g:if test="${flash.message}">
			     <div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:form action="authenticate" method="post" >
			        <div class="dialog">
			          <table>
			            <tbody>            
			              <tr class="prop">
			                <td class="name">
			                  <label for="login">Login:</label>
			                </td>
			                <td>
			                  <input type="text" id="login" name="login"/>
			                </td>
			              </tr> 
			          
			              <tr class="prop">
			                <td class="name">
			                  <label for="password">Password:</label>
			                </td>
			                <td>
			                  <input type="password" id="password" name="password"/>
			                </td>
			              </tr> 
			            </tbody>
			          </table>
			        </div>
			        <div class="buttons">
			          <span class="button">
			            <input class="save" type="submit" value="Login" />
			          </span>
			        </div>
			</g:form>

		</div>
	</body>
</html>
