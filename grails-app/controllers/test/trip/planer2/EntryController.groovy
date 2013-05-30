package test.trip.planer2

import org.springframework.dao.DataIntegrityViolationException

class EntryController {
	def scaffold = Entry
	
	def beforeInterceptor = [action:this.&auth, except:["index", "list", "show"]]

	def auth() {
		if(!session.user) {
		  redirect(controller:"user", action:"login")
		  return false
		}
	}

	def edit = {
		def entryInstance = Entry.get( params.id )

		//limit editing to the original author
		if( !(session.user.login == entryInstance.author.login) ){
		  flash.message = "Sorry, you can only edit your own entries."
		  redirect(action:list)
		}

		if(!entryInstance) {
			flash.message = "Entry not found with id ${params.id}"
			redirect(action:list)
		}
		else {
			return [ entryInstanceList : entryInstance ]
		}
	}

	/**
	 * note url
	 * "/blog/jsmith" replace for "/entry/list/jsmith"
	 * http://localhost:8080/test.trip.planer2/blog/jsmith/Testing-with-Groovy
	 */
    def list(Integer max) {

    if(!params.max) params.max = 10
      flash.id = params.id
      if(!params.id) params.id = "No User Supplied"
      flash.title = params.title
      if(!params.title) params.title = ""

      def author = User.findByLogin(params.id)
      def entryList
      def entryCount
      if(author){
        def query = { 
          and{
            eq('author', author) 
            like("title", params.title.decodeUnderscore() + '%')
          }
        }  
        entryList = Entry.createCriteria().list(params, query)        
        entryCount = Entry.createCriteria().count(query)
      }else{
        entryList = Entry.list( params )
        entryCount = Entry.count()
      }
      
      [ entryInstanceList:entryList, entryInstanceTotal:entryCount  ]
    }
}
