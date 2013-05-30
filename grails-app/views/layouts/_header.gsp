<div id="header">

  <g:if test="${session.user}">
     <div class="nav-header">
            <ul>
                <li><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link controller="trip">Trip</g:link></li>
                <li><g:link controller="airline">Airline</g:link></li>
                <li><g:link controller="airport">Airport</g:link></li>
                <li><g:link controller="flight">Flight</g:link></li>
            </ul>
     </div>
  </g:if>

  <p><g:link class="header-main" controller="entry">Blogito</g:link></p>
  <p class="header-sub">A tiny little blog</p>

  <div id="loginHeader">
    <g:loginControl />
  </div>

</div>