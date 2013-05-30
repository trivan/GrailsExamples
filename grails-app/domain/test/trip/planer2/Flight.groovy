package test.trip.planer2

class Flight {

	 static constraints = {
	    flightNumber()
	    airline()
	    departureDate()
	    departureAirport()
	    arrivalDate()
	    arrivalAirport()
	  }
	  
	  static belongsTo = [trip:Trip, airline:Airline]
	  String flightNumber
	  Date departureDate
	  Airport departureAirport
	  Date arrivalDate
	  Airport arrivalAirport
}
