package test.trip.planer2

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AirportController {

  def geocoderService
  def scaffold = Airport
  
  def beforeInterceptor = [action:this.&auth, except:["index", "list"]]
  
  def auth() {
		  if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		  }
  }

  def geocode = {
	  def result = geocoderService.geocodeAirport(params.iata)
	  render result as JSON
  }

  def getJson = {
    def airport = Airport.findByIata(params.iata)
    if(!airport){
      airport = new Airport(id:-1, iata:params.iata, name:"Not found")
    }  
    render airport as JSON
  }
  
  def save() {
	      def results = geocoderService.geocodeAirport(params.iata)
          def airportInstance = new Airport(params + results)
          if (!airportInstance.save(flush: true)) {
              render(view: "create", model: [airportInstance: airportInstance])
              return
          }
  
          flash.message = message(code: 'default.created.message', args: [message(code: 'airport.label', default: 'Airport'), airportInstance.id])
          redirect(action: "show", id: airportInstance.id)
  }
  
  def update(Long id, Long version) {
          def airportInstance = Airport.get(id)
          if (!airportInstance) {
              flash.message = message(code: 'default.not.found.message', args: [message(code: 'airport.label', default: 'Airport'), id])
              redirect(action: "list")
              return
          }
  
          if (version != null) {
              if (airportInstance.version > version) {
                  airportInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'airport.label', default: 'Airport')] as Object[],
                            "Another user has updated this Airport while you were editing")
                  render(view: "edit", model: [airportInstance: airportInstance])
                  return
              }
          }
  
		  def results = geocoderService.geocodeAirport(params.iata)
          airportInstance.properties = params + results
  
          if (!airportInstance.save(flush: true)) {
              render(view: "edit", model: [airportInstance: airportInstance])
              return
          }
  
          flash.message = message(code: 'default.updated.message', args: [message(code: 'airport.label', default: 'Airport'), airportInstance.id])
          redirect(action: "show", id: airportInstance.id)
  }

  def map = {
	  [airportList: Airport.list()]
  }

}
