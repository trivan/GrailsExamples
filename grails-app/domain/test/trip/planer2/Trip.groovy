package test.trip.planer2

class Trip {
	  static constraints = {
	    name()
	  }
	  static hasMany = [flights:Flight]
	  String name
	  
	  String toString(){
	    name
	  }
}
