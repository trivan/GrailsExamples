<%@ page import="test.trip.planer2.Flight" %>

		<g:javascript library="jquery"/>
        <script type="text/javascript">
          function get(airportField,choice){
            var baseUrl = "${createLink(controller:'airport', action:'getJson')}"
            var url = baseUrl + "?iata=" + $("#departureAirportIata").val();
            if(choice == 2)
            	var url = baseUrl + "?iata=" + $("#arrivalAirportIata").val();

            /*new Ajax.Request(url, {
              method: 'get',
              asynchronous: true,
              onSuccess: function(req) {update(req.responseText, airportField)}                          
            })*/
            
            jQuery.ajax({type: "GET",  
                url: url, 
                success: function (data, textStatus) {update(data, airportField)}, 
                error: function (XMLHttpRequest, textStatus, errorThrown) {}})
          }
          
          function update(json, airportField){
            var airport = json;
            $("#"+airportField+"Iata").val(airport.iata + " - " + airport.name)

            if(airport.id == null) $("#" + airportField).val("-1") 
            else $("#" + airportField).val(airport.id)
          }
          
          /*function validate(){
            if( $F("departureAirport.id") == -1 ){
              alert("Please supply a valid Departure Airport")
              return false
            }
            if( $F("arrivalAirport.id") == -1 ){
              alert("Please supply a valid Arrival Airport")
              return false
            }
            return true
          }*/
          </script>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'flightNumber', 'error')} ">
	<label for="flightNumber">
		<g:message code="flight.flightNumber.label" default="Flight Number" />
		
	</label>
	<g:textField name="flightNumber" value="${flightInstance?.flightNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'airline', 'error')} required">
	<label for="airline">
		<g:message code="flight.airline.label" default="Airline" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="airline" name="airline.id" from="${test.trip.planer2.Airline.list()}" optionKey="id" required="" value="${flightInstance?.airline?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'departureDate', 'error')} required">
	<label for="departureDate">
		<g:message code="flight.departureDate.label" default="Departure Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="departureDate" precision="day"  value="${flightInstance?.departureDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'departureAirport', 'error')} required">
	<label for="departureAirport">
		<g:message code="flight.departureAirport.label" default="Departure Airport" />
		<span class="required-indicator">*</span>
	</label>

	<input type="hidden" id="departureAirport" name="departureAirport.id" value="-1"/>          
	<input type="text" name="departureAirportIata" id="departureAirportIata" size="40"/>
	<input type="button" value="Find" onClick="get('departureAirport',1)"/>  [Type an Airport IATA Code]
	
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="flight.arrivalDate.label" default="Arrival Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="arrivalDate" precision="day"  value="${flightInstance?.arrivalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'arrivalAirport', 'error')} required">
	<label for="arrivalAirport">
		<g:message code="flight.arrivalAirport.label" default="Arrival Airport" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="arrivalAirport" name="arrivalAirport.id" from="${test.trip.planer2.Airport.list()}" optionKey="id" required="" value="${flightInstance?.arrivalAirport?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flightInstance, field: 'trip', 'error')} required">
	<label for="trip">
		<g:message code="flight.trip.label" default="Trip" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="trip" name="trip.id" from="${test.trip.planer2.Trip.list()}" optionKey="id" required="" value="${flightInstance?.trip?.id}" class="many-to-one"/>
</div>

