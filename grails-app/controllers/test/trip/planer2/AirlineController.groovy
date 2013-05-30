package test.trip.planer2

import org.springframework.dao.DataIntegrityViolationException

class AirlineController {
   def scaffold = Airline
   
   def beforeInterceptor = [action:this.&auth, except:["index", "list"]]
   
   def auth() {
		   if(!session.user) {
			 redirect(controller:"user", action:"login")
			 return false
		   }
   }
}
