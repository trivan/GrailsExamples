package test.trip.planer2

import org.springframework.dao.DataIntegrityViolationException

class FlightController {

	def beforeInterceptor = [action:this.&auth, except:["index", "list"]]
	
	def auth() {
			if(!session.user) {
			  redirect(controller:"user", action:"login")
			  return false
			}
	}

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [flightInstanceList: Flight.list(params), flightInstanceTotal: Flight.count()]
    }

    def create() {
        [flightInstance: new Flight(params)]
    }

    def save() {
        def flightInstance = new Flight(params)
        if (!flightInstance.save(flush: true)) {
            render(view: "create", model: [flightInstance: flightInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])
        redirect(action: "show", id: flightInstance.id)
    }

    def show(Long id) {
        def flightInstance = Flight.get(id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
            redirect(action: "list")
            return
        }

        [flightInstance: flightInstance]
    }

    def edit(Long id) {
        def flightInstance = Flight.get(id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
            redirect(action: "list")
            return
        }

        [flightInstance: flightInstance]
    }

    def update(Long id, Long version) {
        def flightInstance = Flight.get(id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (flightInstance.version > version) {
                flightInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flight.label', default: 'Flight')] as Object[],
                          "Another user has updated this Flight while you were editing")
                render(view: "edit", model: [flightInstance: flightInstance])
                return
            }
        }

        flightInstance.properties = params

        if (!flightInstance.save(flush: true)) {
            render(view: "edit", model: [flightInstance: flightInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'flight.label', default: 'Flight'), flightInstance.id])
        redirect(action: "show", id: flightInstance.id)
    }

    def delete(Long id) {
        def flightInstance = Flight.get(id)
        if (!flightInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flight.label', default: 'Flight'), id])
            redirect(action: "list")
            return
        }

        try {
            flightInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flight.label', default: 'Flight'), id])
            redirect(action: "show", id: id)
        }
    }
}
