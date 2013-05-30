package test.trip.planer2

class Airline {

	  static constraints = {
	    name()
	    iata(maxSize:3)
	    frequentFlier()
	  }
	
	  static hasMany = [flights:Flight]
	  String name
	  String iata
	  String frequentFlier
	  
	  String toString(){
	    "${iata} - ${name}"
	  }
}
