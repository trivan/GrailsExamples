package test.trip.planer2
import org.springframework.dao.DataIntegrityViolationException

class LoginTagLib {
	def loginControl = {
		if(session.user){
		  out << "Hello ${session.user.name} "
		  out << "[${link(action:"logout", controller:"user"){"Logout"}}]"
		} else {
		  out << "[${link(action:"login", controller:"user"){"Login"}}]"
		}
	}
}
