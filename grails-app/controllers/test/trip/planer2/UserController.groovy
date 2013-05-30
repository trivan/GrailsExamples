package test.trip.planer2

import org.springframework.dao.DataIntegrityViolationException

class UserController {

	def scaffold = User

	def beforeInterceptor = [action:this.&auth,except:["login", "authenticate", "logout"]]

	def auth() {
		if(session.user) {
			if( !(session.user.role == "admin") ){
				flash.message = "You must be an administrator to perform that task."
				redirect(action:"login")
				return false
			}
		}
		else{
			flash.message = "You must be an administrator to perform that task."
			redirect(action:"login")
			return false
		}
	}

	def login = {}

	def authenticate = {
		  def user = User.findByLoginAndPassword(params.login, params.password)
		  if(user){
			session.user = user
			flash.message = "Hello ${user.name}!"
			redirect(controller:"entry", action:"list")
		  }else{
			flash.message = "Sorry, ${params.login}. Please try again."
			redirect(action:"login")
		  }
	}

	def logout = {
		  flash.message = "Goodbye ${session.user.name}"
		  session.user = null
		  redirect(controller:"entry", action:"list")
	}

    def show(Long id) {
		
		if(!session.user) {
			redirect(controller:"user", action:"login")
			return false
		}else{
	        def userInstance = User.get(id)
	        if (!userInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [userInstance: userInstance]
		}
    }
}
